@implementation NISession

+ (BOOL)isSupported
{
  BOOL v2;
  void *v3;
  void *v4;

  if (+[NIPlatformInfo supportsUWB](NIPlatformInfo, "supportsUWB"))
    return 1;
  +[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    +[NISession _queryAndCacheCapabilities](NISession, "_queryAndCacheCapabilities");
  +[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[NISession _supportedPlatform:](NISession, "_supportedPlatform:", v4);

  return v2;
}

+ (NSDictionary)cachedPlatformCapabilities
{
  return (NSDictionary *)(id)_cachedPlatformCapabilities;
}

+ (void)setCachedPlatformCapabilities:(id)a3
{
  objc_storeStrong((id *)&_cachedPlatformCapabilities, a3);
}

- (int64_t)motionState
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__NISession_motionState__block_invoke;
  v5[3] = &unk_1E4362190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__NISession_motionState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (id)_initAndConnectToServerWithOptions:(unint64_t)a3
{
  NISession *v4;
  NISession *v5;
  uint64_t v6;
  NSUUID *internalID;
  os_log_t v8;
  OS_os_log *log;
  NISessionVisionContext *v10;
  NISessionVisionContext *visionContext;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NIExportedObjectForwarder *v15;
  NIExportedObjectForwarder *exportedObjectForwarder;
  NIServerConnection *v17;
  NIServerConnection *connection;
  dispatch_semaphore_t v19;
  OS_dispatch_semaphore *discoveryTokenSemaphore;
  NIServerConnection *v21;
  uint64_t v22;
  NIServerConnection *v23;
  NSObject *v24;
  NSUUID *v25;
  void *v26;
  _QWORD v28[4];
  NISession *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;
  uint8_t buf[4];
  NSUUID *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)NISession;
  v4 = -[NISession init](&v35, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_connectionOptions = a3;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    internalID = v5->_internalID;
    v5->_internalID = (NSUUID *)v6;

    atomic_store(0, (unsigned __int8 *)&v5->_readyForCallbacks);
    v5->_startTime = 0.0;
    v5->_duration = 0.0;
    v5->_updatedNearbyObjects = 0;
    v8 = os_log_create("com.apple.NearbyInteraction", "NISession");
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;

    v10 = objc_alloc_init(NISessionVisionContext);
    visionContext = v5->_visionContext;
    v5->_visionContext = v10;

    -[NISession setInternalState:](v5, "setInternalState:", 0);
    -[NISession setInvalidationError:](v5, "setInvalidationError:", 0);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.NearbyInteraction", v12);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v5->_delegateQueue, MEMORY[0x1E0C80D38]);
    v15 = -[NIExportedObjectForwarder initWithExportedObject:]([NIExportedObjectForwarder alloc], "initWithExportedObject:", v5);
    exportedObjectForwarder = v5->_exportedObjectForwarder;
    v5->_exportedObjectForwarder = v15;

    atomic_store(a3 & 1, (unsigned __int8 *)&v5->_isObserverSession);
    v17 = -[NIServerConnection initWithSessionID:queue:exportedObject:options:]([NIServerConnection alloc], "initWithSessionID:queue:exportedObject:options:", v5->_internalID, v5->_queue, v5->_exportedObjectForwarder, a3);
    connection = v5->_connection;
    v5->_connection = v17;

    v19 = dispatch_semaphore_create(0);
    discoveryTokenSemaphore = v5->_discoveryTokenSemaphore;
    v5->_discoveryTokenSemaphore = (OS_dispatch_semaphore *)v19;

    objc_initWeak(&location, v5);
    v21 = v5->_connection;
    v22 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __48__NISession__initAndConnectToServerWithOptions___block_invoke;
    v32[3] = &unk_1E43621B8;
    objc_copyWeak(&v33, &location);
    -[NIServerConnection setInterruptionHandler:](v21, "setInterruptionHandler:", v32);
    v23 = v5->_connection;
    v30[0] = v22;
    v30[1] = 3221225472;
    v30[2] = __48__NISession__initAndConnectToServerWithOptions___block_invoke_2;
    v30[3] = &unk_1E43621B8;
    objc_copyWeak(&v31, &location);
    -[NIServerConnection setInvalidationHandler:](v23, "setInvalidationHandler:", v30);
    -[NIServerConnection resume](v5->_connection, "resume");
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      v24 = v5->_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v5->_internalID;
        *(_DWORD *)buf = 138412290;
        v37 = v25;
        _os_log_impl(&dword_1A0337000, v24, OS_LOG_TYPE_DEFAULT, "NISession init [%@]", buf, 0xCu);
      }
    }
    -[NISession _remoteObject](v5, "_remoteObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v22;
    v28[1] = 3221225472;
    v28[2] = __48__NISession__initAndConnectToServerWithOptions___block_invoke_504;
    v28[3] = &unk_1E43621E0;
    v29 = v5;
    objc_msgSend(v26, "activate:", v28);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __48__NISession__initAndConnectToServerWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serverConnectionInterrupted");

}

void __48__NISession__initAndConnectToServerWithOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serverConnectionInvalidated");

}

void __48__NISession__initAndConnectToServerWithOptions___block_invoke_504(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v6, "_handleActivationError:", v5);
  else
    objc_msgSend(v6, "_handleActivationSuccess:", v7);

}

+ (BOOL)_supportedPlatform:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("SupportedPlatform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (void)_queryAndCacheCapabilities
{
  void *v2;
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = dispatch_semaphore_create(0);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __39__NISession__queryAndCacheCapabilities__block_invoke;
  v10 = &unk_1E4362208;
  v12 = &v13;
  v5 = v4;
  v11 = v5;
  objc_msgSend(v3, "queryDeviceCapabilities:", &v7);
  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  objc_msgSend(v2, "invalidate", v7, v8, v9, v10);
  +[NISession setCachedPlatformCapabilities:](NISession, "setCachedPlatformCapabilities:", v14[5]);

  _Block_object_dispose(&v13, 8);
}

void __39__NISession__queryAndCacheCapabilities__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_osLogNearbyObjectUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *log;
  float *v12;
  float v13;
  float32x4_t v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  ++self->_objectUpdateLogging.totalUpdates;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __38__NISession__osLogNearbyObjectUpdate___block_invoke;
  v15[3] = &unk_1E4362230;
  v15[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);
  if (self->_lastObjectUpdateLogTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    v8 = v7;
    if (v7 < 5.0)
      goto LABEL_13;
  }
  else
  {
    v8 = 0.0;
  }
  objc_storeStrong((id *)&self->_lastObjectUpdateLogTime, v5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("DelegateProxy: nearbyObjectUpdates [last %0.1f s]. Updates %d, objects %d, w/dist %d, w/HA %d."), *(_QWORD *)&v8, self->_objectUpdateLogging.totalUpdates, self->_objectUpdateLogging.totalObjects, self->_objectUpdateLogging.objectsWithDistance, self->_objectUpdateLogging.objectsWithHorizontalAngle);
  v10 = v9;
  if (self->_objectUpdateLogging.objectsWithDistance >= 1)
    objc_msgSend(v9, "appendFormat:", CFSTR(" Distance: first %0.2f m, last %0.2f m, min %0.2f m, max %0.2f m."), self->_objectUpdateLogging.firstDistance, self->_objectUpdateLogging.lastDistance, self->_objectUpdateLogging.minDistance, self->_objectUpdateLogging.maxDistance);
  if (self->_objectUpdateLogging.objectsWithHorizontalAngle >= 1)
    objc_msgSend(v10, "appendFormat:", CFSTR(" HA: first %0.1f deg, last %0.1f deg."), self->_objectUpdateLogging.firstHorizontalAngleRad * 57.2957795, self->_objectUpdateLogging.lastHorizontalAngleRad * 57.2957795);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v17 = v10;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }
  }
  v12 = &NINearbyObjectDistanceNotAvailable;
  v13 = NINearbyObjectAngleNotAvailable;
  *(_QWORD *)&self->_objectUpdateLogging.totalUpdates = 0;
  *(_QWORD *)&self->_objectUpdateLogging.objectsWithDistance = 0;
  v14 = vld1q_dup_f32(v12);
  *(float32x4_t *)&self->_objectUpdateLogging.firstDistance = v14;
  self->_objectUpdateLogging.firstHorizontalAngleRad = v13;
  self->_objectUpdateLogging.lastHorizontalAngleRad = v13;

LABEL_13:
}

void __38__NISession__osLogNearbyObjectUpdate___block_invoke(uint64_t a1, void *a2)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float *v7;
  float v8;
  float v10;
  float v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "distance");
  v4 = v3;
  objc_msgSend(v14, "horizontalAngle");
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 212);
  v6 = NINearbyObjectDistanceNotAvailable;
  if (v4 != NINearbyObjectDistanceNotAvailable)
  {
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 216);
    *(float *)(*(_QWORD *)(a1 + 32) + 228) = v4;
    v7 = *(float **)(a1 + 32);
    if (v7[56] == v6)
    {
      v7[56] = v4;
      v7 = *(float **)(a1 + 32);
    }
    v8 = v7[58];
    if (v8 == v6 || v8 > v4)
    {
      v7[58] = v4;
      v7 = *(float **)(a1 + 32);
    }
    v10 = v7[59];
    if (v10 == v6 || v10 < v4)
      v7[59] = v4;
  }
  v12 = NINearbyObjectAngleNotAvailable;
  if (v5 != NINearbyObjectAngleNotAvailable)
  {
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 220);
    *(float *)(*(_QWORD *)(a1 + 32) + 244) = v5;
    v13 = *(_QWORD *)(a1 + 32);
    if (*(float *)(v13 + 240) == v12)
      *(float *)(v13 + 240) = v5;
  }

}

- (void)_logTime
{
  double v3;
  double v4;
  double startTime;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  startTime = self->_startTime;
  if (startTime != 0.0)
  {
    self->_duration = v4 - startTime + self->_duration;
    AnalyticsSendEventLazy();
  }
  self->_startTime = v4;
}

id __21__NISession__logTime__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 104));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_logDurationAndSubmit:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  if (self->_startTime != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_duration = self->_duration + v5 - self->_startTime;
    self->_startTime = 0.0;
  }
  if (v3)
    AnalyticsSendEventLazy();
}

id __35__NISession__logDurationAndSubmit___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 104));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_submitErrorMetric:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  id v10;
  __CFString *v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(v4, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v7)
          v7 = &stru_1E4363DF8;
      }
    }
    else
    {
      v7 = &stru_1E4363DF8;
    }
    v10 = v4;
    v11 = v7;
    v9 = v7;
    AnalyticsSendEventLazy();

  }
}

id __32__NISession__submitErrorMetric___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("domain");
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*v2, "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("string");
  v5 = *(_QWORD *)(a1 + 40);
  v9[1] = v4;
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDelegate:(id)delegate
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = delegate;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__NISession_setDelegate___block_invoke;
  block[3] = &unk_1E43622A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

id __25__NISession_setDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v5 = 134283521;
      v6 = v3;
      _os_log_impl(&dword_1A0337000, v2, OS_LOG_TYPE_DEFAULT, "Set delegate: %{private}p", (uint8_t *)&v5, 0xCu);
    }
  }
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 256), *(id *)(a1 + 40));
}

- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue
{
  NSObject *v5;
  NSObject *queue;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  NSObject *v10;

  v5 = delegateQueue;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 509, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegateQueue"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__NISession_setDelegateQueue___block_invoke;
  block[3] = &unk_1E43622A8;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

void __30__NISession_setDelegateQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 134283521;
      v5 = v3;
      _os_log_impl(&dword_1A0337000, v2, OS_LOG_TYPE_DEFAULT, "Set delegate queue: %{private}p", (uint8_t *)&v4, 0xCu);
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

+ (id)deviceCapabilities
{
  return -[NIDeviceCapabilities initWithFineRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:]([NIDeviceCapabilities alloc], "initWithFineRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:", +[NIPlatformInfo supportsUWB](NIPlatformInfo, "supportsUWB"), +[NIPlatformInfo supportsAoA](NIPlatformInfo, "supportsAoA"), +[NIPlatformInfo supportsNBAMMS](NIPlatformInfo, "supportsNBAMMS"), +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture"));
}

- (NIConfiguration)configuration
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__NISession_configuration__block_invoke;
  v5[3] = &unk_1E4362190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NIConfiguration *)v3;
}

void __26__NISession_configuration__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (NIDiscoveryToken)discoveryToken
{
  NSObject *queue;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *discoveryTokenSemaphore;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__NISession_discoveryToken__block_invoke;
  block[3] = &unk_1E4362190;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(queue, block);
  v5 = (void *)v16[5];
  if (!v5)
  {
    v6 = self->_queue;
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __27__NISession_discoveryToken__block_invoke_2;
    v13[3] = &unk_1E43622D0;
    v13[4] = self;
    dispatch_sync(v6, v13);
    discoveryTokenSemaphore = self->_discoveryTokenSemaphore;
    v8 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(discoveryTokenSemaphore, v8);
    v9 = self->_queue;
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __27__NISession_discoveryToken__block_invoke_3;
    v12[3] = &unk_1E4362190;
    v12[4] = self;
    v12[5] = &v15;
    dispatch_sync(v9, v12);
    if (!v16[5]
      && +[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[NISession discoveryToken].cold.1();
    }
    v5 = (void *)v16[5];
  }
  v10 = v5;
  _Block_object_dispose(&v15, 8);

  return (NIDiscoveryToken *)v10;
}

void __27__NISession_discoveryToken__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

void __27__NISession_discoveryToken__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "generateDiscoveryToken");

}

void __27__NISession_discoveryToken__block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

- (BOOL)_isInternalClient
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NISession activationResponse](self, "activationResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("InternalClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
      v4 = 1;
  }

  return v4;
}

- (NISession)init
{
  return (NISession *)-[NISession _initAndConnectToServerWithOptions:](self, "_initAndConnectToServerWithOptions:", 0);
}

- (void)runWithConfiguration:(NIConfiguration *)configuration
{
  NIConfiguration *v5;
  NSObject *queue;
  void *v7;
  NIConfiguration *v8;
  _QWORD block[5];
  NIConfiguration *v10;

  v5 = configuration;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__NISession_runWithConfiguration___block_invoke;
  block[3] = &unk_1E43622A8;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

void __34__NISession_runWithConfiguration___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[9];
  int v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "internalState");
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      if ((v2 - 1) > 7)
        v5 = CFSTR("Activating");
      else
        v5 = off_1E4362978[v2 - 1];
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v20 = v4;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      v7 = v3;
      _os_log_impl(&dword_1A0337000, v7, OS_LOG_TYPE_DEFAULT, "Client: runWithConfiguration [%@]. State: %@. Config: %@.", buf, 0x20u);

    }
  }
  v8 = MEMORY[0x1E0C809B0];
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80));
  v17[5] = v8;
  v17[6] = 3221225472;
  v17[7] = __34__NISession_runWithConfiguration___block_invoke_540;
  v17[8] = &__block_descriptor_36_e19___NSDictionary_8__0l;
  v18 = v2;
  AnalyticsSendEventLazy();
  switch(v2)
  {
    case 0:
    case 1:
    case 4:
    case 5:
      goto LABEL_8;
    case 2:
    case 3:
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isEqual:", *(_QWORD *)(a1 + 40)))
        goto LABEL_10;
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "setInternalState:", 2);
      v9 = objc_msgSend(*(id *)(a1 + 40), "copy");
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v9;

      objc_msgSend(*(id *)(a1 + 32), "_logTime");
      objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __34__NISession_runWithConfiguration___block_invoke_544;
      v17[3] = &unk_1E4362318;
      v17[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v11, "runWithConfiguration:reply:", v12, v17);

      break;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "_reinterruptSessionWithCachedInterruption");
      return;
    case 7:
    case 8:
      objc_msgSend(*(id *)(a1 + 32), "invalidationError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 32);
      if (v14)
        objc_msgSend(v15, "invalidationError");
      else
        objc_msgSend(v15, "_getSessionFailureError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_notifyDidInvalidateWithError:", v16);
      return;
    default:
LABEL_10:
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0337000, v13, OS_LOG_TYPE_DEFAULT, "Not runnable", buf, 2u);
        }
      }
      break;
  }
}

id __34__NISession_runWithConfiguration___block_invoke_540(uint64_t a1)
{
  unsigned int v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("state");
  v1 = *(_DWORD *)(a1 + 32) - 1;
  if (v1 > 7)
    v2 = CFSTR("Activating");
  else
    v2 = off_1E4362978[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __34__NISession_runWithConfiguration___block_invoke_544(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (v3)
    objc_msgSend(v4, "_handleRunSessionError:", v3);
  else
    objc_msgSend(v4, "_handleRunSessionSuccess");

}

- (void)pause
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__NISession_pause__block_invoke;
  block[3] = &unk_1E43622D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __18__NISession_pause__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  const __CFString *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "internalState");
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      if ((v2 - 1) > 7)
        v5 = CFSTR("Activating");
      else
        v5 = off_1E4362978[v2 - 1];
      *(_DWORD *)buf = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      v6 = v3;
      _os_log_impl(&dword_1A0337000, v6, OS_LOG_TYPE_DEFAULT, "Client: pause [%@]. State: %@.", buf, 0x16u);

    }
  }
  if ((v2 - 2) < 2)
  {
    v10 = *(void **)(a1 + 32);
    v9 = (id *)(a1 + 32);
    objc_msgSend(v10, "setInternalState:", 4);
    objc_msgSend(*v9, "_pauseInternalARSessionIfNeeded");
    objc_msgSend(*v9, "_remoteObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __18__NISession_pause__block_invoke_546;
    v13[3] = &unk_1E4362318;
    v13[4] = *v9;
    objc_msgSend(v11, "pause:", v13);

  }
  else if ((v2 - 7) >= 2)
  {
    if (v2 == 6)
      objc_msgSend(*(id *)(a1 + 32), "_reinterruptSessionWithCachedInterruption");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidationError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "invalidationError");
    else
      objc_msgSend(v8, "_getSessionFailureError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_notifyDidInvalidateWithError:", v12);
  }
}

void __18__NISession_pause__block_invoke_546(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (v3)
    objc_msgSend(v4, "_handlePauseSessionError:", v3);
  else
    objc_msgSend(v4, "_handlePauseSessionSuccess");

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__NISession_invalidate__block_invoke;
  block[3] = &unk_1E43622D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __23__NISession_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  uint64_t v4;
  unsigned int v5;
  const __CFString *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD **)(a1 + 32);
      v4 = v3[2];
      v5 = objc_msgSend(v3, "internalState") - 1;
      if (v5 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_1E4362978[v5];
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1A0337000, v2, OS_LOG_TYPE_DEFAULT, "Client: invalidate [%@]. State: %@.", (uint8_t *)&v8, 0x16u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateInternal");
}

- (void)dealloc
{
  NSObject *log;
  NSUUID *internalID;
  objc_super v5;
  uint8_t buf[4];
  NSUUID *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      *(_DWORD *)buf = 138412290;
      v7 = internalID;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "Client: dealloc [%@]", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NISession;
  -[NISession dealloc](&v5, sel_dealloc);
}

- (void)setARSession:(ARSession *)session
{
  ARSession *v4;
  NSObject *log;
  NSObject *queue;
  ARSession *v7;
  _QWORD v8[5];
  ARSession *v9;
  uint8_t buf[16];

  v4 = session;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "setARSession", buf, 2u);
    }
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __26__NISession_setARSession___block_invoke;
  v8[3] = &unk_1E43622A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(queue, v8);

}

uint64_t __26__NISession_setARSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setARSessionInternal:", *(_QWORD *)(a1 + 40));
}

- (void)_setARSessionInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *log;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v4, "state") == 1)
  {
    objc_msgSend(v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NISession _handleARSession:willRunWithConfiguration:](self, "_handleARSession:willRunWithConfiguration:", v4, v5);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NISessionVisionContext arSession](self->_visionContext, "arSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "state") == 2)
    {
      v7 = objc_msgSend(v4, "state");

      if (v7 != 2)
      {
        if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "_setARSessionInternal: ARSession was interrupted, new ARSession created in uninterrupted state.", v10, 2u);
          }
        }
        -[NISession _handleARSessionInterruptionEnded](self, "_handleARSessionInterruptionEnded");
      }
    }
    else
    {

    }
  }
  -[NISessionVisionContext setArSession:](self->_visionContext, "setArSession:", v4);
  -[NISessionVisionContext arSession](self->_visionContext, "arSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_addObserver:", self);

}

- (simd_float4x4)worldTransformForObject:(NINearbyObject *)object
{
  NINearbyObject *v4;
  NSObject *queue;
  NINearbyObject *v6;
  simd_float4 v7;
  simd_float4 v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4 v12;
  simd_float4 v13;
  simd_float4 v14;
  _QWORD block[5];
  NINearbyObject *v16;
  uint64_t *v17;
  uint64_t v18;
  simd_float4 *v19;
  uint64_t v20;
  __n128 (*v21)(uint64_t, uint64_t);
  uint64_t (*v22)();
  void *v23;
  simd_float4x4 v24;
  simd_float4x4 result;

  v4 = object;
  v18 = 0;
  v19 = (simd_float4 *)&v18;
  v20 = 0x7012000000;
  v21 = __Block_byref_object_copy__550;
  v22 = __Block_byref_object_dispose__551;
  v23 = &unk_1A03722FB;
  v24 = NINearbyObjectWorldTransformNotAvailable;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NISession_worldTransformForObject___block_invoke;
  block[3] = &unk_1E4362340;
  block[4] = self;
  v16 = v4;
  v17 = &v18;
  v6 = v4;
  dispatch_sync(queue, block);
  v13 = v19[5];
  v14 = v19[6];
  v11 = v19[3];
  v12 = v19[4];

  _Block_object_dispose(&v18, 8);
  v7 = v11;
  v8 = v12;
  v9 = v13;
  v10 = v14;
  result.columns[3] = v10;
  result.columns[2] = v9;
  result.columns[1] = v8;
  result.columns[0] = v7;
  return result;
}

uint32x4_t __37__NISession_worldTransformForObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint32x4_t result;
  void *v5;
  void *v6;
  uint64_t v7;
  float32x4_t v8;
  uint64_t v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  if (v2)
  {
    objc_msgSend(v2, "latestARFrame");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "latestARFrame");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "camera");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "trackingState");

      if (v7 == 2)
      {
        objc_msgSend(*(id *)(a1 + 40), "worldPosition");
        result = (uint32x4_t)vceqq_f32(v8, (float32x4_t)NINearbyObjectWorldPositionNotAvailable);
        result.i32[3] = result.i32[2];
        result.i32[0] = vminvq_u32(result);
        if ((result.i32[0] & 0x80000000) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "worldPosition");
          result.i32[3] = 1.0;
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          *(_OWORD *)(v9 + 48) = xmmword_1A036EEA0;
          *(_OWORD *)(v9 + 64) = xmmword_1A036EEB0;
          *(_OWORD *)(v9 + 80) = xmmword_1A036EFB0;
          *(uint32x4_t *)(v9 + 96) = result;
        }
      }
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NISession *v4;
  char v5;

  v4 = (NISession *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
      v5 = 1;
    else
      v5 = -[NSUUID isEqual:](self->_internalID, "isEqual:", v4->_internalID);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_internalID, "hash");
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  NSObject *queue;
  id v14;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@"), v5, self->_internalID);

  +[NISession deviceCapabilities](NISession, "deviceCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v18[5];
  if (objc_msgSend(v6, "supportsPreciseDistanceMeasurement"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR(", preciseDistance: %@"), v8);
  v9 = (void *)v18[5];
  if (objc_msgSend(v6, "supportsDirectionMeasurement"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v9, "appendFormat:", CFSTR(", direction: %@"), v10);
  v11 = (void *)v18[5];
  if (objc_msgSend(v6, "supportsCameraAssistance"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v11, "appendFormat:", CFSTR(", cameraAssistance: %@"), v12);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__NISession_description__block_invoke;
  block[3] = &unk_1E4362190;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(queue, block);
  objc_msgSend((id)v18[5], "appendString:", CFSTR(">"));
  v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return (NSString *)v14;
}

void __24__NISession_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "descriptionInternal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR(", Token: %@"), v5);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(v3 + 40), "descriptionInternal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", Config: %@"), v6);

}

- (void)setConfigurationForTesting:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NISession_setConfigurationForTesting___block_invoke;
  block[3] = &unk_1E43622A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __40__NISession_setConfigurationForTesting___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (id)getInternalIdentifier
{
  return self->_internalID;
}

- (id)getInternalLogObject
{
  return self->_log;
}

- (id)getInternalConnectionQueue
{
  return self->_queue;
}

- (void)_serverConnectionInvalidated
{
  int v3;
  NSObject *log;
  NSUUID *internalID;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[NISession internalState](self, "internalState");
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if ((v3 - 1) > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_1E4362978[v3 - 1];
      *(_DWORD *)v9 = 138412546;
      *(_QWORD *)&v9[4] = internalID;
      *(_WORD *)&v9[12] = 2112;
      *(_QWORD *)&v9[14] = v6;
      v7 = log;
      _os_log_impl(&dword_1A0337000, v7, OS_LOG_TYPE_DEFAULT, "Server connection invalidated [%@]. State: %@.", v9, 0x16u);

    }
  }
  -[NISession setInternalState:](self, "setInternalState:", 8, *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
  if (v3 != 7)
  {
    -[NISession _getSessionFailureError](self, "_getSessionFailureError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NISession _notifyDidInvalidateWithError:](self, "_notifyDidInvalidateWithError:", v8);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
}

- (void)_serverConnectionInterrupted
{
  OS_os_log *v3;
  NSUUID *internalID;
  unsigned int v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  NSUUID *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v5 = -[NISession internalState](self, "internalState") - 1;
      if (v5 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_1E4362978[v5];
      *(_DWORD *)buf = 138412546;
      v13 = internalID;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A0337000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Server connection interrupted [%@]. State: %@.", buf, 0x16u);
    }

  }
  v7 = *MEMORY[0x1E0CB2D80];
  v10[0] = *MEMORY[0x1E0CB2D68];
  v10[1] = v7;
  v11[0] = CFSTR("The session token has been invalidated. This session cannot be restarted.");
  v11[1] = CFSTR("Create a new session and exchange token again.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NIErrorWithCodeAndUserInfo(-5887, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v9);
}

- (id)_remoteObject
{
  return -[NIServerConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (id)_synchronousRemoteObject
{
  return -[NIServerConnection synchronousRemoteObjectProxy](self->_connection, "synchronousRemoteObjectProxy");
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6;
  NSObject *log;
  _QWORD *v8;
  _QWORD v9[6];
  _QWORD v10[6];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109379;
      v12 = a4;
      v13 = 2113;
      v14 = v6;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: removed objects with reason: %d. Objects: %{private}@", buf, 0x12u);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[NISession _pauseInternalARSessionIfNeeded](self, "_pauseInternalARSessionIfNeeded");
    -[NISession setInternalState:](self, "setInternalState:", 5);
  }
  if (a4 == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__NISession_didRemoveNearbyObjects_withReason___block_invoke_2;
    v9[3] = &unk_1E43622A8;
    v8 = v9;
    v9[4] = self;
    v9[5] = v6;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v9, sel_session_didRemoveNearbyObjects_withReason_);
    goto LABEL_11;
  }
  if (!a4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__NISession_didRemoveNearbyObjects_withReason___block_invoke;
    v10[3] = &unk_1E43622A8;
    v8 = v10;
    v10[4] = self;
    v10[5] = v6;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v10, sel_session_didRemoveNearbyObjects_withReason_);
LABEL_11:

  }
  AnalyticsSendEventLazy();

}

void __47__NISession_didRemoveNearbyObjects_withReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didRemoveNearbyObjects:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

void __47__NISession_didRemoveNearbyObjects_withReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didRemoveNearbyObjects:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

}

id __47__NISession_didRemoveNearbyObjects_withReason___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("reason");
  UWBTrackingStopReasonInternalToString(*(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *log;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  NISession *v19;
  id v20;
  uint8_t buf[4];
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __36__NISession_didUpdateNearbyObjects___block_invoke;
  v18 = &unk_1E43622A8;
  v19 = self;
  v5 = v4;
  v20 = v5;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", &v15, sel_session_didUpdateNearbyObjects_);
  self->_updatedNearbyObjects = 1;
  -[NISession _osLogNearbyObjectUpdate:](self, "_osLogNearbyObjectUpdate:", v5, v15, v16, v17, v18, v19);
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "resetARSession");

  if (v7)
  {
    -[NISessionVisionContext arSession](self->_visionContext, "arSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NISessionVisionContext arSession](self->_visionContext, "arSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "state");

    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v22 = v8 != 0;
        v23 = 1024;
        v24 = v10 == 1;
        _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: reset ARSession (Exists: %d. Running: %d)", buf, 0xEu);
      }
    }
    if (v8 && v10 == 1)
    {
      -[NISessionVisionContext arSession](self->_visionContext, "arSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NISessionVisionContext arSession](self->_visionContext, "arSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "runWithConfiguration:options:", v14, 15);

    }
  }

}

void __36__NISession_didUpdateNearbyObjects___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didUpdateNearbyObjects:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[NISession uwbSessionDidFailWithError:].cold.1();
  }
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[NISession uwbSessionDidInvalidateWithError:].cold.1();
  }
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  OS_os_log *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  vector<UWBSessionInterruptionBookkeeping, std::allocator<UWBSessionInterruptionBookkeeping>> *p_interruptions;
  unint64_t *begin;
  __CFString *v13;
  UWBSessionInterruptionBookkeeping *end;
  UWBSessionInterruptionBookkeeping *value;
  UWBSessionInterruptionBookkeeping *v16;
  UWBSessionInterruptionBookkeeping *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  UWBSessionInterruptionBookkeeping *v24;
  __CFString *v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NISession internalState](self, "internalState") - 1;
      if (v8 > 7)
        v9 = CFSTR("Activating");
      else
        v9 = off_1E4362978[v8];
      UWBSessionInterruptionReasonInternalToString(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v27 = v9;
      v28 = 2113;
      v29 = v10;
      v30 = 2048;
      v31 = a4;
      _os_log_impl(&dword_1A0337000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "DelegateProxy: suspension reason started. State: %{private}@. Reason: %{private}@. Timestamp: %f", buf, 0x20u);

    }
  }
  begin = (unint64_t *)self->_interruptions.__begin_;
  p_interruptions = &self->_interruptions;
  if (begin == (unint64_t *)self->_interruptions.__end_)
  {
    v13 = &stru_1E4363DF8;
    end = self->_interruptions.__begin_;
  }
  else
  {
    UWBSessionInterruptionReasonInternalToString(*begin);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    end = self->_interruptions.__end_;
  }
  value = self->_interruptions.__end_cap_.__value_;
  if (end >= value)
  {
    v17 = p_interruptions->__begin_;
    v18 = (end - p_interruptions->__begin_) >> 4;
    v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 60)
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    v20 = value - v17;
    if (v20 >> 3 > v19)
      v19 = v20 >> 3;
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0)
      v21 = 0xFFFFFFFFFFFFFFFLL;
    else
      v21 = v19;
    if (v21)
    {
      v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UWBSessionInterruptionBookkeeping>>((uint64_t)&self->_interruptions.__end_cap_, v21);
      v17 = self->_interruptions.__begin_;
      end = self->_interruptions.__end_;
    }
    else
    {
      v22 = 0;
    }
    v23 = &v22[16 * v18];
    v24 = (UWBSessionInterruptionBookkeeping *)&v22[16 * v21];
    *(_QWORD *)v23 = a3;
    *((double *)v23 + 1) = a4;
    v16 = (UWBSessionInterruptionBookkeeping *)(v23 + 16);
    if (end != v17)
    {
      do
      {
        *((_OWORD *)v23 - 1) = *((_OWORD *)end - 1);
        v23 -= 16;
        end = (UWBSessionInterruptionBookkeeping *)((char *)end - 16);
      }
      while (end != v17);
      v17 = p_interruptions->__begin_;
    }
    self->_interruptions.__begin_ = (UWBSessionInterruptionBookkeeping *)v23;
    self->_interruptions.__end_ = v16;
    self->_interruptions.__end_cap_.__value_ = v24;
    if (v17)
      operator delete(v17);
  }
  else
  {
    *(_QWORD *)end = a3;
    *((double *)end + 1) = a4;
    v16 = (UWBSessionInterruptionBookkeeping *)((char *)end + 16);
  }
  self->_interruptions.__end_ = v16;
  v25 = v13;
  AnalyticsSendEventLazy();
  -[NISession _interruptSessionWithInternalReason:cachedInterruption:](self, "_interruptSessionWithInternalReason:cachedInterruption:", a3, 0);

}

id __55__NISession_uwbSessionInterruptedWithReason_timestamp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("reason");
  UWBSessionInterruptionReasonInternalToString(*(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("reinterrupted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = CFSTR("previousReason");
  v4 = *(_QWORD *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  OS_os_log *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  UWBSessionInterruptionBookkeeping *begin;
  UWBSessionInterruptionBookkeeping *end;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  UWBSessionInterruptionBookkeeping *v16;
  int64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *log;
  NSUUID *internalID;
  uint64_t v22;
  _QWORD v23[6];
  BOOL v24;
  _QWORD v25[12];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NISession internalState](self, "internalState") - 1;
      if (v8 > 7)
        v9 = CFSTR("Activating");
      else
        v9 = off_1E4362978[v8];
      UWBSessionInterruptionReasonInternalToString(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v27 = (void *)v9;
      v28 = 2113;
      v29 = v10;
      v30 = 2048;
      v31 = a4;
      _os_log_impl(&dword_1A0337000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "DelegateProxy: suspension reason ended. State: %{private}@. Reason: %{private}@. Timestamp: %f", buf, 0x20u);

    }
  }
  begin = self->_interruptions.__begin_;
  end = self->_interruptions.__end_;
  if (begin == end)
  {
LABEL_12:
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[NISession uwbSessionInterruptionReasonEnded:timestamp:].cold.1();
    }
  }
  else
  {
    v13 = 0;
    while (*(_QWORD *)((char *)begin + v13) != a3)
    {
      v13 += 16;
      if ((UWBSessionInterruptionBookkeeping *)((char *)begin + v13) == end)
        goto LABEL_12;
    }
    v14 = (char *)begin + v13;
    v15 = *(_QWORD *)((char *)begin + v13 + 8);
    v16 = (UWBSessionInterruptionBookkeeping *)((char *)begin + v13 + 16);
    v17 = end - v16;
    if (end != v16)
    {
      memmove((char *)begin + v13, v16, end - v16);
      begin = self->_interruptions.__begin_;
    }
    self->_interruptions.__end_ = (UWBSessionInterruptionBookkeeping *)&v14[v17];
    v18 = begin == (UWBSessionInterruptionBookkeeping *)&v14[v17];
    v19 = MEMORY[0x1E0C809B0];
    v25[5] = MEMORY[0x1E0C809B0];
    v25[6] = 3221225472;
    v25[7] = __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke;
    v25[8] = &__block_descriptor_56_e19___NSDictionary_8__0l;
    v25[9] = a3;
    *(double *)&v25[10] = a4;
    v25[11] = v15;
    AnalyticsSendEventLazy();
    if (v18)
    {
      -[NISession setInternalState:](self, "setInternalState:", 5);
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          internalID = self->_internalID;
          *(_DWORD *)buf = 138412290;
          v27 = internalID;
          _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "Delegate: notify suspension ended [%@]", buf, 0xCu);
        }
      }
      v25[0] = v19;
      v25[1] = 3221225472;
      v25[2] = __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke_589;
      v25[3] = &unk_1E43622D0;
      v25[4] = self;
      -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v25, sel_sessionSuspensionEnded_);
    }
    if ((unint64_t)(a3 - 1) > 6)
      v22 = 0;
    else
      v22 = qword_1A036EF78[a3 - 1];
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke_2;
    v23[3] = &unk_1E43623D0;
    v23[4] = self;
    v23[5] = v22;
    v24 = v18;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v23, sel_session_suspensionReasonEnded_isNoLongerSuspended_);
  }
}

id __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("reason");
  UWBSessionInterruptionReasonInternalToString(*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("duration");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40) - *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke_589(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "sessionSuspensionEnded:", *(_QWORD *)(a1 + 32));

}

void __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:suspensionReasonEnded:isNoLongerSuspended:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v5;
  NSObject *log;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v9 = v5;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: updated token %{private}@", buf, 0xCu);
    }
  }
  objc_storeStrong((id *)&self->_discoveryToken, a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__NISession_didUpdateLocalDiscoveryToken___block_invoke;
  v7[3] = &unk_1E43622D0;
  v7[4] = self;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, sel_sessionDidUpdateDiscoveryToken_);

}

void __42__NISession_didUpdateLocalDiscoveryToken___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "sessionDidUpdateDiscoveryToken:", *(_QWORD *)(a1 + 32));

}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__NISession_didReceiveRangingAuthRecommendation_forObject___block_invoke;
  v8[3] = &unk_1E43623F8;
  v8[4] = self;
  v10 = a3;
  v7 = v6;
  v9 = v7;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v8, sel_session_didReceiveRangingAuthRecommendation_forObject_);

}

void __59__NISession_didReceiveRangingAuthRecommendation_forObject___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didReceiveRangingAuthRecommendation:forObject:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4;
  NSObject *log;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v10 = v4;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: discovered object: %{private}@", buf, 0xCu);
    }
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__NISession_didDiscoverNearbyObject___block_invoke;
  v7[3] = &unk_1E43622A8;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, sel_session_didDiscoverNearbyObject_);

}

void __37__NISession_didDiscoverNearbyObject___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didDiscoverNearbyObject:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *log;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478339;
      v20 = v9;
      v21 = 2113;
      v22 = v10;
      v23 = 2113;
      v24 = v8;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: updated region %{private}@ (previous: %{private}@). Object: %{private}@", buf, 0x20u);
    }
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__NISession_object_didUpdateRegion_previousRegion___block_invoke;
  v15[3] = &unk_1E4362420;
  v15[4] = self;
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v15, sel_session_object_didUpdateRegion_previousRegion_);

}

void __51__NISession_object_didUpdateRegion_previousRegion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  objc_msgSend(WeakRetained, "session:object:didUpdateRegion:previousRegion:", a1[4], a1[5], a1[6], a1[7]);

}

- (void)didUpdateMotionState:(int64_t)a3
{
  _QWORD v5[6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_motionState = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__NISession_didUpdateMotionState___block_invoke;
  v5[3] = &unk_1E4362448;
  v5[4] = self;
  v5[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v5, sel_session_didUpdateLocalMotionState_);
}

void __34__NISession_didUpdateMotionState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didUpdateLocalMotionState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__NISession_didUpdateHomeDeviceUWBRangingAvailability___block_invoke;
  v5[3] = &unk_1E4362470;
  v5[4] = self;
  v6 = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v5, sel_session_didUpdateHomeDeviceUWBRangingAvailability_);
}

void __55__NISession_didUpdateHomeDeviceUWBRangingAvailability___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didUpdateHomeDeviceUWBRangingAvailability:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)relayDCKMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__NISession_relayDCKMessage___block_invoke;
  v6[3] = &unk_1E43622A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v6, sel_session_relayDCKMessage_);

}

void __29__NISession_relayDCKMessage___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:relayDCKMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__NISession_didUpdateHealthStatus___block_invoke;
  v3[3] = &unk_1E4362448;
  v3[4] = self;
  v3[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v3, sel_session_didUpdateHealthStatus_);
}

void __35__NISession_didUpdateHealthStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didUpdateHealthStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__NISession_didProcessAcwgM1MsgWithResponse_error___block_invoke;
  v10[3] = &unk_1E4362498;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v10, sel_session_didProcessAcwgM1MsgWithResponse_error_);

}

void __51__NISession_didProcessAcwgM1MsgWithResponse_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  objc_msgSend(WeakRetained, "session:didProcessAcwgM1MsgWithResponse:error:", a1[4], a1[5], a1[6]);

}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__NISession_didProcessAcwgM3MsgWithResponse_error___block_invoke;
  v10[3] = &unk_1E4362498;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v10, sel_session_didProcessAcwgM3MsgWithResponse_error_);

}

void __51__NISession_didProcessAcwgM3MsgWithResponse_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  objc_msgSend(WeakRetained, "session:didProcessAcwgM3MsgWithResponse:error:", a1[4], a1[5], a1[6]);

}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__NISession_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error___block_invoke;
  v10[3] = &unk_1E4362498;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v10, sel_session_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_);

}

void __76__NISession_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  objc_msgSend(WeakRetained, "session:didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:", a1[4], a1[5], a1[6]);

}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  _QWORD v4[6];
  unsigned int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__NISession_requestAcwgRangingSessionSuspend_withSuspendTriggerReason___block_invoke;
  v4[3] = &unk_1E43624C0;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v4, sel_session_requestAcwgRangingSessionSuspend_withSuspendTriggerReason_);
}

void __71__NISession_requestAcwgRangingSessionSuspend_withSuspendTriggerReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:requestAcwgRangingSessionSuspend:withSuspendTriggerReason:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)didStartAcwgRanging:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__NISession_didStartAcwgRanging___block_invoke;
  v3[3] = &unk_1E4362448;
  v3[4] = self;
  v3[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v3, sel_session_didStartAcwgRanging_);
}

void __33__NISession_didStartAcwgRanging___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didStartAcwgRanging:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__NISession_didSuspendAcwgRanging___block_invoke;
  v3[3] = &unk_1E4362448;
  v3[4] = self;
  v3[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v3, sel_session_didSuspendAcwgRanging_);
}

void __35__NISession_didSuspendAcwgRanging___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didSuspendAcwgRanging:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unsigned int v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__NISession_didPrefetchAcwgUrsk_error___block_invoke;
  v8[3] = &unk_1E43624E8;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v8, sel_session_didPrefetchAcwgUrsk_error_);

}

void __39__NISession_didPrefetchAcwgUrsk_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didPrefetchAcwgUrsk:error:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v15 = v6;
      v16 = 2113;
      v17 = v7;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: generated shareable config: %{private}@. Object: %{private}@", buf, 0x16u);
    }
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__NISession_didGenerateShareableConfigurationData_forObject___block_invoke;
  v11[3] = &unk_1E4362498;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v11, sel_session_didGenerateShareableConfigurationData_forObject_);

}

void __61__NISession_didGenerateShareableConfigurationData_forObject___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  objc_msgSend(WeakRetained, "session:didGenerateShareableConfigurationData:forObject:", a1[4], a1[5], a1[6]);

}

- (void)systemDidUpdateState:(id)a3
{
  id v4;
  NSObject *log;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v10 = v4;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: system updated state: %{private}@", buf, 0xCu);
    }
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__NISession_systemDidUpdateState___block_invoke;
  v7[3] = &unk_1E43622A8;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, sel_systemConfigurator_didUpdateState_);

}

void __34__NISession_systemDidUpdateState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "systemConfigurator:didUpdateState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  _BOOL4 v4;
  NSString *v6;
  NSObject *log;
  Class v8;
  _QWORD v9[6];
  BOOL v10;
  uint8_t buf[4];
  _BOOL4 v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a4;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174915;
      v12 = v4;
      v13 = 2113;
      v14 = v6;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: system updated resource usage limit exceeded: %{private}d. Configuration type: %{private}@", buf, 0x12u);
    }
  }
  v8 = NSClassFromString(v6);
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __91__NISession_systemDidUpdateResourceUsageLimitExceeded_forSessionConfigurationTypeWithName___block_invoke;
    v9[3] = &unk_1E4362510;
    v10 = v4;
    v9[4] = self;
    v9[5] = v8;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v9, sel_systemConfigurator_didUpdateResourceUsageLimitExceeded_forSessionConfigurationType_);
  }

}

void __91__NISession_systemDidUpdateResourceUsageLimitExceeded_forSessionConfigurationTypeWithName___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "systemConfigurator:didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *log;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "convergence");
  v9 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "insufficientSignalStrength"))
    objc_msgSend(v9, "addObject:", CFSTR("insufficientSignalStrength"));
  if (objc_msgSend(v6, "insufficientHorizontalSweep"))
    objc_msgSend(v9, "addObject:", CFSTR("insufficientHorizontalSweep"));
  if (objc_msgSend(v6, "insufficientVerticalSweep"))
    objc_msgSend(v9, "addObject:", CFSTR("insufficientVerticalSweep"));
  if (objc_msgSend(v6, "insufficientMovement"))
    objc_msgSend(v9, "addObject:", CFSTR("insufficientMovement"));
  if (objc_msgSend(v6, "insufficientLighting"))
    objc_msgSend(v9, "addObject:", CFSTR("insufficientLighting"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109635;
      v24 = v8;
      v25 = 2113;
      v26 = v7;
      v27 = 2113;
      v28 = v9;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: algorithm convergence status: %d. Object: %{private}@. Reasons: %{private}@", buf, 0x1Cu);
    }
  }
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47__NISession_didUpdateAlgorithmState_forObject___block_invoke;
  v19[3] = &unk_1E4362538;
  v19[4] = self;
  v22 = v8;
  v12 = v9;
  v20 = v12;
  v13 = v7;
  v21 = v13;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v19, sel_session_didUpdateAlgorithmConvergence_forObject_);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __47__NISession_didUpdateAlgorithmState_forObject___block_invoke_2;
  v16[3] = &unk_1E4362498;
  v16[4] = self;
  v14 = v6;
  v17 = v14;
  v15 = v13;
  v18 = v15;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v16, sel_session_didUpdateAlgorithmState_forObject_);

}

void __47__NISession_didUpdateAlgorithmState_forObject___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NIAlgorithmConvergence *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  v2 = a1[4];
  v3 = -[NIAlgorithmConvergence initWithStatus:andReasons:]([NIAlgorithmConvergence alloc], "initWithStatus:andReasons:", a1[7], a1[5]);
  objc_msgSend(WeakRetained, "session:didUpdateAlgorithmConvergence:forObject:", v2, v3, a1[6]);

}

void __47__NISession_didUpdateAlgorithmState_forObject___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  objc_msgSend(WeakRetained, "session:didUpdateAlgorithmState:forObject:", a1[4], a1[5], a1[6]);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__NISession_session_didUpdateFrame___block_invoke;
  v8[3] = &unk_1E43622A8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __36__NISession_session_didUpdateFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleARSessionDidUpdateFrame:", *(_QWORD *)(a1 + 40));
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__NISession_session_didFailWithError___block_invoke;
  v8[3] = &unk_1E43622A8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __38__NISession_session_didFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleARSessionDidFailWithError:", *(_QWORD *)(a1 + 40));
}

- (void)sessionWasInterrupted:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NISession_sessionWasInterrupted___block_invoke;
  block[3] = &unk_1E43622D0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__NISession_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleARSessionWasInterrupted");
}

- (void)sessionInterruptionEnded:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NISession_sessionInterruptionEnded___block_invoke;
  block[3] = &unk_1E43622D0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__NISession_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleARSessionInterruptionEnded");
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__NISession_session_didChangeState___block_invoke;
  v5[3] = &unk_1E4362448;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

uint64_t __36__NISession_session_didChangeState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleARSessionDidChangeState:", *(_QWORD *)(a1 + 40));
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NISession_session_willRunWithConfiguration___block_invoke;
  block[3] = &unk_1E4362498;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __46__NISession_session_willRunWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleARSession:willRunWithConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;

  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__NISession_sessionShouldAttemptRelocalization_completion___block_invoke;
  block[3] = &unk_1E4362560;
  block[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __59__NISession_sessionShouldAttemptRelocalization_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A0337000, v2, OS_LOG_TYPE_DEFAULT, "Called with sessionShouldAttemptRelocalization", v4, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_handleARSessionDidUpdateFrame:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NIVisionInput *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  NIVisionInput *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  v26 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") == 3)
  {
    -[NISessionVisionContext setLatestARFrame:](self->_visionContext, "setLatestARFrame:", v26);
    objc_msgSend(v26, "camera");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NISession niVisionInputTrackingStateFromARTRackingState:](self, "niVisionInputTrackingStateFromARTRackingState:", objc_msgSend(v4, "trackingState"));

    objc_msgSend(v26, "worldTrackingState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v26, "worldTrackingState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "majorRelocalization");

      objc_msgSend(v26, "worldTrackingState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "minorRelocalization");

    }
    else
    {
      v9 = 0;
    }
    v10 = [NIVisionInput alloc];
    objc_msgSend(v26, "timestamp");
    v12 = v11;
    objc_msgSend(v26, "camera");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transform");
    v24 = v15;
    v25 = v14;
    v22 = v17;
    v23 = v16;
    objc_msgSend(v26, "lightEstimate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NISession lightEstimateFromARLightEstimate:](self, "lightEstimateFromARLightEstimate:", v18);
    v20 = -[NIVisionInput initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:](v10, "initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:", v5, v6, v9, v12, v25, v24, v23, v22, v19);

    -[NISession _remoteObject](self, "_remoteObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "processVisionInput:", v20);

  }
}

- (void)_handleARSessionDidFailWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[NISession _handleARSessionDidFailWithError:].cold.1();
  }
  -[NISession _remoteObject](self, "_remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arSessionDidFailWithError:", v4);

}

- (void)_handleARSessionWasInterrupted
{
  NSObject *log;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "ARSession: interrupted", v5, 2u);
    }
  }
  -[NISession _remoteObject](self, "_remoteObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arSessionWasInterrupted");

}

- (void)_handleARSessionInterruptionEnded
{
  NSObject *log;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "ARSession: interruption ended", v5, 2u);
    }
  }
  -[NISession _remoteObject](self, "_remoteObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arSessionInterruptionEnded");

}

- (void)_handleARSessionDidChangeState:(unint64_t)a3
{
  NSObject *log;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "ARSession: changed state: %d", (uint8_t *)v6, 8u);
    }
  }
  -[NISessionVisionContext setArSessionState:](self->_visionContext, "setArSessionState:", a3);
}

- (void)_handleARSession:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[NISession _isValidARSession:andConfiguration:](self, "_isValidARSession:andConfiguration:", v6, v7))
  {
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[NISession _handleARSession:willRunWithConfiguration:].cold.1();
    }
    -[NISession _remoteObject](self, "_remoteObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arSessionWillRunWithInvalidConfiguration");

  }
}

- (void)_configureAndRunInternalARSession
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A0337000, v0, v1, "External ARSession provided but camera assistance requested in server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__NISession__configureAndRunInternalARSession__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Invalid camera assistance configuration.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_invalidateSessionAndNotifyError:", v4);

}

- (BOOL)_isValidARSession:(id)a3 andConfiguration:(id)a4
{
  id v6;
  id v7;
  NISessionVisionContext *visionContext;
  void *v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  const char *v13;
  NSObject *log;
  const char *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  OS_os_log *v20;
  int v21;
  const char *v22;
  void *v23;
  BOOL v24;
  _QWORD v25[5];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
  {
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      v12 = 0;
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v15 = "_isValidARSession returning NO: session is nil";
LABEL_32:
      _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
LABEL_33:
    v12 = 0;
    goto LABEL_34;
  }
  visionContext = self->_visionContext;
  if (!visionContext
    || !-[NISessionVisionContext isARSessionInClientProcess](visionContext, "isARSessionInClientProcess"))
  {
    __assert_rtn("-[NISession _isValidARSession:andConfiguration:]", "NISession.mm", 1541, "_visionContext && _visionContext.isARSessionInClientProcess");
  }
  if (-[NISessionVisionContext isARSessionInternal](self->_visionContext, "isARSessionInternal"))
  {
    -[NISessionVisionContext arSession](self->_visionContext, "arSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __48__NISession__isValidARSession_andConfiguration___block_invoke;
    v25[3] = &unk_1E4362588;
    v25[4] = self;
    -[NISession sessionShouldAttemptRelocalization:completion:](self, "sessionShouldAttemptRelocalization:completion:", v9, v25);

    goto LABEL_6;
  }
  objc_msgSend(v6, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      goto LABEL_28;
    v17 = self->_log;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v18 = "_isValidARSession returning NO: session.delegate is nil";
    goto LABEL_27;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v16, "sessionShouldAttemptRelocalization:", v6))
  {
    if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      goto LABEL_28;
    v17 = self->_log;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v18 = "_isValidARSession returning NO: attempting relocalization is not disabled";
LABEL_27:
    _os_log_impl(&dword_1A0337000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
LABEL_28:

    goto LABEL_33;
  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v20 = self->_log;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v16, "sessionShouldAttemptRelocalization:", v6);
      v22 = "NO";
      if (v21)
        v22 = "YES";
      *(_DWORD *)buf = 136315138;
      v27 = v22;
      _os_log_impl(&dword_1A0337000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "_isValidARSession got %s from sessionShouldAttemptRelocalization", buf, 0xCu);
    }

  }
LABEL_6:
  if (!v7)
  {
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      v12 = 0;
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v15 = "_isValidARSession returning NO: configuration is nil";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    if (objc_msgSend(v10, "worldAlignment"))
    {
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        v11 = self->_log;
        v12 = 0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v13 = "_isValidARSession returning NO: world alignment is not gravity";
LABEL_50:
          _os_log_impl(&dword_1A0337000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
          goto LABEL_51;
        }
        goto LABEL_52;
      }
    }
    else
    {
      objc_msgSend(v10, "initialWorldMap");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (v24)
      {
        if (!objc_msgSend(v10, "isCollaborationEnabled"))
        {
          v12 = 1;
          goto LABEL_52;
        }
        if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
          goto LABEL_51;
        v11 = self->_log;
        v12 = 0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v13 = "_isValidARSession returning NO: collaboration is not disabled";
          goto LABEL_50;
        }
        goto LABEL_52;
      }
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        v11 = self->_log;
        v12 = 0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v13 = "_isValidARSession returning NO: initial world map is non-nil";
          goto LABEL_50;
        }
LABEL_52:

        goto LABEL_34;
      }
    }
LABEL_51:
    v12 = 0;
    goto LABEL_52;
  }
  if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    goto LABEL_33;
  log = self->_log;
  v12 = 0;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v15 = "_isValidARSession returning NO: configuration is not ARWorldTrackingConfiguration";
    goto LABEL_32;
  }
LABEL_34:

  return v12;
}

void __48__NISession__isValidARSession_andConfiguration___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (a2)
  {
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1A0337000, v3, OS_LOG_TYPE_DEFAULT, "_isValidARSession invalidating session: attempting relocalization is not disabled in internal session", v5, 2u);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arSessionWillRunWithInvalidConfiguration");

  }
}

- (void)_pauseInternalARSessionIfNeeded
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISessionVisionContext isARSessionInternal](self->_visionContext, "isARSessionInternal"))
  {
    if (-[NISessionVisionContext isARSessionInClientProcess](self->_visionContext, "isARSessionInClientProcess"))
    {
      -[NISessionVisionContext arSession](self->_visionContext, "arSession");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pause");

    }
  }
}

- (void)_invalidateInternalARSessionIfNeeded
{
  void *v3;
  void *v4;
  NISessionVisionContext *visionContext;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISessionVisionContext isARSessionInternal](self->_visionContext, "isARSessionInternal"))
  {
    if (-[NISessionVisionContext isARSessionInClientProcess](self->_visionContext, "isARSessionInClientProcess"))
    {
      -[NISessionVisionContext arSession](self->_visionContext, "arSession");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pause");

      -[NISessionVisionContext arSession](self->_visionContext, "arSession");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_removeObserver:", self);

      visionContext = self->_visionContext;
      self->_visionContext = 0;

    }
  }
}

- (int64_t)niVisionInputTrackingStateFromARTRackingState:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (double)lightEstimateFromARLightEstimate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ambientIntensity");
    v6 = v5;
  }
  else
  {
    v6 = *(double *)&NIARLightEstimateNotAvailable;
  }

  return v6;
}

- (void)_invalidateSessionAndNotifyError:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _notifyDidInvalidateWithError:](self, "_notifyDidInvalidateWithError:", v4);
  -[NISession _invalidateInternal](self, "_invalidateInternal");

}

- (void)_interruptSessionWithInternalReason:(int64_t)a3 cachedInterruption:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  uint64_t v8;
  NSObject *log;
  NSUUID *internalID;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[5];
  uint8_t buf[4];
  NSUUID *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = -[NISession internalState](self, "internalState");
  v8 = MEMORY[0x1E0C809B0];
  if (v7 != 6 || v4)
  {
    -[NISession setInternalState:](self, "setInternalState:", 6);
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        internalID = self->_internalID;
        *(_DWORD *)buf = 138412290;
        v15 = internalID;
        _os_log_impl(&dword_1A0337000, log, OS_LOG_TYPE_DEFAULT, "Delegate: notify suspension started [%@]", buf, 0xCu);
      }
    }
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __68__NISession__interruptSessionWithInternalReason_cachedInterruption___block_invoke;
    v13[3] = &unk_1E43622D0;
    v13[4] = self;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v13, sel_sessionWasSuspended_);
  }
  if ((unint64_t)(a3 - 1) > 6)
    v11 = 0;
  else
    v11 = qword_1A036EF78[a3 - 1];
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __68__NISession__interruptSessionWithInternalReason_cachedInterruption___block_invoke_2;
  v12[3] = &unk_1E4362448;
  v12[4] = self;
  v12[5] = v11;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v12, sel_session_suspendedWithReason_);
}

void __68__NISession__interruptSessionWithInternalReason_cachedInterruption___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "sessionWasSuspended:", *(_QWORD *)(a1 + 32));

}

void __68__NISession__interruptSessionWithInternalReason_cachedInterruption___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:suspendedWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_reinterruptSessionWithCachedInterruption
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A0337000, v0, v1, "No cached suspensions found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_invalidateInternal
{
  unsigned int v3;
  NSObject *log;
  NSUUID *internalID;
  const __CFString *v6;
  NSObject *v7;
  NIConfiguration *currentConfiguration;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[NISession internalState](self, "internalState");
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if (v3 - 1 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_1E4362978[v3 - 1];
      v9 = 138412546;
      v10 = internalID;
      v11 = 2112;
      v12 = v6;
      v7 = log;
      _os_log_impl(&dword_1A0337000, v7, OS_LOG_TYPE_DEFAULT, "invalidateInternal [%@]. State: %@.", (uint8_t *)&v9, 0x16u);

    }
  }
  if (v3 <= 6)
  {
    -[NISession _logDurationAndSubmit:](self, "_logDurationAndSubmit:", self->_updatedNearbyObjects);
    -[NISession setInternalState:](self, "setInternalState:", 7);
    -[NIServerConnection invalidate](self->_connection, "invalidate");
    currentConfiguration = self->_currentConfiguration;
    self->_currentConfiguration = 0;

    -[NISession _invalidateInternalARSessionIfNeeded](self, "_invalidateInternalARSessionIfNeeded");
  }
}

- (void)_handleActivationError:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSUUID *internalID;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7)
        v8 = CFSTR("Activating");
      else
        v8 = off_1E4362978[v7];
      v9 = 138412802;
      v10 = internalID;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1A0337000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Activation error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)_handleActivationSuccess:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSUUID *internalID;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7)
        v8 = CFSTR("Activating");
      else
        v8 = off_1E4362978[v7];
      v9 = 138412802;
      v10 = internalID;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1A0337000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Activation success [%@]. State: %@. Response: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[NISession internalState](self, "internalState"))
    -[NISession setInternalState:](self, "setInternalState:", 1);
  if (!v4)
    __assert_rtn("-[NISession _handleActivationSuccess:]", "NISession.mm", 1740, "activationResponse != nil");
  -[NISession setActivationResponse:](self, "setActivationResponse:", v4);

}

- (void)_handleRunSessionError:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSUUID *internalID;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7)
        v8 = CFSTR("Activating");
      else
        v8 = off_1E4362978[v7];
      v9 = 138412802;
      v10 = internalID;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1A0337000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Run session error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)_handleRunSessionSuccess
{
  OS_os_log *v3;
  NSUUID *internalID;
  unsigned int v5;
  const __CFString *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  NSUUID *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v5 = -[NISession internalState](self, "internalState") - 1;
      if (v5 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_1E4362978[v5];
      *(_DWORD *)buf = 138412546;
      v9 = internalID;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1A0337000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Run session succeeded [%@]. State: %@", buf, 0x16u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") == 2)
  {
    -[NISession setInternalState:](self, "setInternalState:", 3);
    if (-[NIConfiguration _internalIsCameraAssistanceEnabled](self->_currentConfiguration, "_internalIsCameraAssistanceEnabled"))
    {
      -[NISession _configureAndRunInternalARSession](self, "_configureAndRunInternalARSession");
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__NISession__handleRunSessionSuccess__block_invoke;
    v7[3] = &unk_1E43622D0;
    v7[4] = self;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, sel_sessionDidStartRunning_);
  }
}

void __37__NISession__handleRunSessionSuccess__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "sessionDidStartRunning:", *(_QWORD *)(a1 + 32));

}

- (void)_handlePauseSessionError:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSUUID *internalID;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7)
        v8 = CFSTR("Activating");
      else
        v8 = off_1E4362978[v7];
      v9 = 138412802;
      v10 = internalID;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1A0337000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Pause session error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)_handlePauseSessionSuccess
{
  OS_os_log *v3;
  NSUUID *internalID;
  unsigned int v5;
  const __CFString *v6;
  int v7;
  NSUUID *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v5 = -[NISession internalState](self, "internalState") - 1;
      if (v5 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_1E4362978[v5];
      v7 = 138412546;
      v8 = internalID;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1A0337000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Pause session success [%@]. State: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") == 4)
  {
    -[NISession setInternalState:](self, "setInternalState:", 5);
    -[NISession _logDurationAndSubmit:](self, "_logDurationAndSubmit:", 0);
  }
}

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4
{
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:evenIfNotRunning:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:evenIfNotRunning:", a3, a4, 0);
}

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4 evenIfNotRunning:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id WeakRetained;
  OS_dispatch_queue *delegateQueue;
  NSObject *v13;
  dispatch_block_t block;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  v10 = atomic_load((unsigned __int8 *)&self->_readyForCallbacks);
  if ((v10 & 1) != 0 || v5)
  {
    block = v8;
    if (a4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        goto LABEL_10;
      }
      delegateQueue = self->_delegateQueue;

      v9 = block;
      if (delegateQueue)
      {
        v13 = self->_delegateQueue;
LABEL_8:
        dispatch_async(v13, block);
LABEL_10:
        v9 = block;
      }
    }
    else
    {
      v13 = self->_delegateQueue;
      if (v13)
        goto LABEL_8;
    }
  }

}

- (id)_verifyError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  OS_os_log *v11;
  void *v12;
  uint8_t buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  if ((unint64_t)(v5 + 5889) < 8)
  {
    v6 = objc_msgSend(v4, "code");
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NIErrorWithCodeAndUserInfo(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_6;
  }
  if ((unint64_t)(v5 + 10017) < 2)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NIErrorWithCodeAndUserInfo(-5887, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid error code blocked from being sent to NISessionDelegate.  Error: %@"), v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NISession _verifyError:].cold.1(v12, buf, (os_log_t)v11);
    }

  }
  NIErrorWithCodeAndUserInfo(-5887, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v9;
}

- (void)_notifyDidInvalidateWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  NISession *v12;
  id v13;

  v4 = a3;
  if (-[NISession _isInternalClient](self, "_isInternalClient"))
  {
    v5 = v4;
  }
  else
  {
    -[NISession _verifyError:](self, "_verifyError:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[NISession _notifyDidInvalidateWithError:].cold.1();
  }
  -[NISession setInvalidationError:](self, "setInvalidationError:", v6);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__NISession__notifyDidInvalidateWithError___block_invoke;
  v11 = &unk_1E43622A8;
  v12 = self;
  v7 = v6;
  v13 = v7;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", &v8, sel_session_didInvalidateWithError_);
  -[NISession _submitErrorMetric:](self, "_submitErrorMetric:", v4, v8, v9, v10, v11, v12);

}

void __43__NISession__notifyDidInvalidateWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_getSessionFailureError
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CB2D68];
  v6[0] = CFSTR("This session object is invalidated. Dispose of it and create a new one instead.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NIErrorWithCodeAndUserInfo(-5887, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)self->_delegateQueue;
}

- (int)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(int)a3
{
  self->_internalState = a3;
}

- (NSError)invalidationError
{
  return (NSError *)objc_getProperty(self, a2, 272, 1);
}

- (void)setInvalidationError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSDictionary)activationResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void)setActivationResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NIInternalSessionDelegate)internalDelegate
{
  return (NIInternalSessionDelegate *)objc_loadWeakRetained((id *)&self->_internalDelegate);
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalDelegate, a3);
}

- (void).cxx_destruct
{
  UWBSessionInterruptionBookkeeping *begin;

  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_activationResponse, 0);
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastObjectUpdateLogTime, 0);
  objc_storeStrong((id *)&self->_visionContext, 0);
  objc_storeStrong((id *)&self->_systemEventNotifier, 0);
  objc_storeStrong((id *)&self->_findingNotifier, 0);
  objc_storeStrong((id *)&self->_devicePresenceNotifier, 0);
  objc_storeStrong((id *)&self->_acwgEventNotifier, 0);
  objc_storeStrong((id *)&self->_carKeyEventNotifier, 0);
  objc_storeStrong((id *)&self->_discoveryToken, 0);
  objc_storeStrong((id *)&self->_log, 0);
  begin = self->_interruptions.__begin_;
  if (begin)
  {
    self->_interruptions.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_discoveryTokenSemaphore, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_exportedObjectForwarder, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_internalID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  float *v2;
  float32x4_t v3;

  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 27) = 0;
  v2 = &NINearbyObjectDistanceNotAvailable;
  v3 = vld1q_dup_f32(v2);
  *((float32x4_t *)self + 14) = v3;
  v3.f32[0] = NINearbyObjectAngleNotAvailable;
  *((float *)self + 60) = NINearbyObjectAngleNotAvailable;
  *((_DWORD *)self + 61) = v3.i32[0];
  return self;
}

+ (NIInternalDeviceCapability)internalDeviceCapabilities
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  +[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    +[NISession _queryAndCacheCapabilities](NISession, "_queryAndCacheCapabilities");
  +[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UWBSupportedPlatform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  +[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("WifiSupportedPlatform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  +[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("UWBSupportedPlatformPDOA"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  +[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("UWBSupportedPlatformSyntheticAperture"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  +[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("UWBSupportedPlatformExtendedDistance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  return (NIInternalDeviceCapability *)-[NIDeviceCapabilities initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:]([NIDeviceCapabilities alloc], "initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:", v5, v8, v11, v17, v14);
}

- (void)_addObject:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1950, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("discoveryToken"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__NISession_Internal___addObject___block_invoke;
  block[3] = &unk_1E43622A8;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

void __34__NISession_Internal___addObject___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__NISession_Internal___addObject___block_invoke_2;
  v4[3] = &unk_1E4362318;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_addObject:reply:", v3, v4);

}

void __34__NISession_Internal___addObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__NISession_Internal___addObject___block_invoke_3;
    v6[3] = &unk_1E43622A8;
    v6[4] = v5;
    v7 = v3;
    objc_msgSend(v5, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v6, sel_session_didFailWithError_);

  }
}

void __34__NISession_Internal___addObject___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_removeObject:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1964, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("discoveryToken"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NISession_Internal___removeObject___block_invoke;
  block[3] = &unk_1E43622A8;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

void __37__NISession_Internal___removeObject___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__NISession_Internal___removeObject___block_invoke_2;
  v4[3] = &unk_1E4362318;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_removeObject:reply:", v3, v4);

}

void __37__NISession_Internal___removeObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__NISession_Internal___removeObject___block_invoke_3;
    v6[3] = &unk_1E43622A8;
    v6[4] = v5;
    v7 = v3;
    objc_msgSend(v5, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v6, sel_session_didFailWithError_);

  }
}

void __37__NISession_Internal___removeObject___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "session:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_addRegionPredicate:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1978, CFSTR("_addRegionPredicate is deprecated"));

}

- (void)_removeRegionPredicate:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1982, CFSTR("_removeRegionPredicate is deprecated"));

}

+ (id)observerSession
{
  return -[NISession _initAndConnectToServerWithOptions:]([NISession alloc], "_initAndConnectToServerWithOptions:", 1);
}

- (BOOL)isPreciseRangingAllowed
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__NISession_Internal__isPreciseRangingAllowed__block_invoke;
  v5[3] = &unk_1E43625D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __46__NISession_Internal__isPreciseRangingAllowed__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "_synchronousRemoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__NISession_Internal__isPreciseRangingAllowed__block_invoke_2;
  v3[3] = &unk_1E43625B0;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "isPreciseRangingAllowed:", v3);

}

void __46__NISession_Internal__isPreciseRangingAllowed__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateSessionAndNotifyError:", v5);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)isExtendedDistanceMeasurementAllowed
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__NISession_Internal__isExtendedDistanceMeasurementAllowed__block_invoke;
  v5[3] = &unk_1E43625D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__NISession_Internal__isExtendedDistanceMeasurementAllowed__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "_synchronousRemoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__NISession_Internal__isExtendedDistanceMeasurementAllowed__block_invoke_2;
  v3[3] = &unk_1E43625B0;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "isExtendedDistanceMeasurementAllowed:", v3);

}

void __59__NISession_Internal__isExtendedDistanceMeasurementAllowed__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateSessionAndNotifyError:", v5);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke;
  v6[3] = &unk_1E4362628;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_sync(queue, v6);
}

void __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke_2;
  v6[3] = &unk_1E4362600;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:reply:", v5, v3, v4, v6);

}

void __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "_invalidateSessionAndNotifyError:", v6);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke_3;
    v8[3] = &unk_1E4362498;
    v8[4] = v7;
    v9 = v5;
    v10 = 0;
    objc_msgSend(v7, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v8, sel_session_didProcessBluetoothHostTimeSyncWithResponse_error_);

  }
}

void __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke_3(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  objc_msgSend(WeakRetained, "session:didProcessBluetoothHostTimeSyncWithResponse:error:", a1[4], a1[5], a1[6]);

}

- (void)processDCKMessage:(id)a3 responseCallback:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  void *v12;
  NSObject *delegateQueue;
  id v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  _QWORD v20[4];
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dckMessage"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseCallback"));

LABEL_3:
  if (objc_msgSend(v7, "length"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_2;
    block[3] = &unk_1E4362788;
    block[4] = self;
    v18 = v7;
    v19 = v9;
    v11 = v9;
    dispatch_sync(queue, block);

    v12 = v18;
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke;
    v20[3] = &unk_1E4362710;
    v21 = v9;
    v14 = v9;
    dispatch_async(delegateQueue, v20);
    v12 = v21;
  }

}

void __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Received a nil or 0 length DCK message.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19889, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_3;
  v4[3] = &unk_1E4362760;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "processDCKMessage:reply:", v3, v4);

}

void __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 264);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_4;
  block[3] = &unk_1E4362738;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4
{
  -[NISession processBluetoothEventWithType:btcClockTicks:eventCounter:](self, "processBluetoothEventWithType:btcClockTicks:eventCounter:");
}

- (id)deleteURSKs
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__NISession_CarKey__deleteURSKs__block_invoke;
  v5[3] = &unk_1E43625D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__NISession_CarKey__deleteURSKs__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_synchronousRemoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__NISession_CarKey__deleteURSKs__block_invoke_2;
  v3[3] = &unk_1E43627B0;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "deleteURSKs:", v3);

}

void __32__NISession_CarKey__deleteURSKs__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__NISession_CarKey___setDebugURSK_transactionIdentifier___block_invoke;
    block[3] = &unk_1E43627D8;
    block[4] = self;
    v16 = a4;
    v14 = v6;
    v15 = &v17;
    dispatch_sync(queue, block);
    v9 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Given nil URSK.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19886, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void __57__NISession_CarKey___setDebugURSK_transactionIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_synchronousRemoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned int *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__NISession_CarKey___setDebugURSK_transactionIdentifier___block_invoke_2;
  v5[3] = &unk_1E43627B0;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_setDebugURSK:transactionIdentifier:reply:", v4, v3, v5);

}

void __57__NISession_CarKey___setDebugURSK_transactionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isRangingLimitExceeded
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__NISession_CarKey__isRangingLimitExceeded__block_invoke;
  v5[3] = &unk_1E43625D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__NISession_CarKey__isRangingLimitExceeded__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "_synchronousRemoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NISession_CarKey__isRangingLimitExceeded__block_invoke_2;
  v3[3] = &unk_1E43625B0;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "isRangingLimitExceeded:", v3);

}

void __43__NISession_CarKey__isRangingLimitExceeded__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateSessionAndNotifyError:", v5);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (NICarKeyEventNotifier)carKeyEventNotifier
{
  NICarKeyEventNotifier *carKeyEventNotifier;
  NICarKeyEventNotifier *v4;
  NICarKeyEventNotifier *v5;

  carKeyEventNotifier = self->_carKeyEventNotifier;
  if (!carKeyEventNotifier)
  {
    v4 = -[NICarKeyEventNotifier initWithParentSession:]([NICarKeyEventNotifier alloc], "initWithParentSession:", self);
    v5 = self->_carKeyEventNotifier;
    self->_carKeyEventNotifier = v4;

    carKeyEventNotifier = self->_carKeyEventNotifier;
  }
  return carKeyEventNotifier;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NISession_CarKey_Project___setURSKTTL___block_invoke;
  block[3] = &unk_1E4362800;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__NISession_CarKey_Project___setURSKTTL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_synchronousRemoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__NISession_CarKey_Project___setURSKTTL___block_invoke_2;
  v4[3] = &unk_1E43627B0;
  v3 = *(_QWORD *)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_setURSKTTL:reply:", v3, v4);

}

void __41__NISession_CarKey_Project___setURSKTTL___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NIAcwgEventNotifier)acwgEventNotifier
{
  NIAcwgEventNotifier *acwgEventNotifier;
  NIAcwgEventNotifier *v4;
  NIAcwgEventNotifier *v5;

  acwgEventNotifier = self->_acwgEventNotifier;
  if (!acwgEventNotifier)
  {
    v4 = -[NIAcwgEventNotifier initWithParentSession:]([NIAcwgEventNotifier alloc], "initWithParentSession:", self);
    v5 = self->_acwgEventNotifier;
    self->_acwgEventNotifier = v4;

    acwgEventNotifier = self->_acwgEventNotifier;
  }
  return acwgEventNotifier;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v7;
  NSObject *queue;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int64_t v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("m1Msg"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__NISession_Acwg__processAcwgM1Msg_withSessionTriggerReason___block_invoke;
  block[3] = &unk_1E4362828;
  block[4] = self;
  v12 = v7;
  v13 = a4;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __61__NISession_Acwg__processAcwgM1Msg_withSessionTriggerReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processAcwgM1Msg:withSessionTriggerReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)processAcwgM3Msg:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("m3Msg"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NISession_Acwg__processAcwgM3Msg___block_invoke;
  block[3] = &unk_1E43622A8;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

void __36__NISession_Acwg__processAcwgM3Msg___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processAcwgM3Msg:", *(_QWORD *)(a1 + 40));

}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  NSObject *queue;
  _QWORD block[6];
  unsigned int v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NISession_Acwg__suspendAcwgRanging_withSuspendTriggerReason___block_invoke;
  block[3] = &unk_1E43624C0;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_sync(queue, block);
}

void __63__NISession_Acwg__suspendAcwgRanging_withSuspendTriggerReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspendAcwgRanging:withSuspendTriggerReason:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  NSObject *queue;
  _QWORD block[6];
  unsigned int v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__NISession_Acwg__processAcwgRangingSessionResumeRequestMsg_withResumeTriggerReason___block_invoke;
  block[3] = &unk_1E43624C0;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_sync(queue, block);
}

void __85__NISession_Acwg__processAcwgRangingSessionResumeRequestMsg_withResumeTriggerReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  unsigned int v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__NISession_Acwg__prefetchAcwgUrsk___block_invoke;
  v4[3] = &unk_1E4362850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

void __36__NISession_Acwg__prefetchAcwgUrsk___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prefetchAcwgUrsk:", *(unsigned int *)(a1 + 40));

}

- (void)updateResponderDeviceIdentifier:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2366, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceIdentifier"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v7[2](v7, 1, 0);

}

- (void)processVisionInput:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NISession_Vision__processVisionInput___block_invoke;
  block[3] = &unk_1E43622A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __40__NISession_Vision__processVisionInput___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processVisionInput:", *(_QWORD *)(a1 + 40));

}

- (NIDevicePresenceNotifier)devicePresenceNotifier
{
  NIDevicePresenceNotifier *devicePresenceNotifier;
  NIDevicePresenceNotifier *v4;
  NIDevicePresenceNotifier *v5;

  devicePresenceNotifier = self->_devicePresenceNotifier;
  if (!devicePresenceNotifier)
  {
    v4 = -[NIDevicePresenceNotifier initWithParentSession:]([NIDevicePresenceNotifier alloc], "initWithParentSession:", self);
    v5 = self->_devicePresenceNotifier;
    self->_devicePresenceNotifier = v4;

    devicePresenceNotifier = self->_devicePresenceNotifier;
  }
  return devicePresenceNotifier;
}

+ (id)generateBluetoothDeviceTokenWithPublicAddress:(id)a3 IRK:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NIDiscoveryToken *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NISession.mm"), 2427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IRK"));

  }
  if (objc_msgSend(v8, "length") != 16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NISession.mm"), 2428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[IRK length] == NIDiscoveryTokenIRKLengthBytes"));

  }
  v16[0] = &unk_1E4370378;
  v16[1] = &unk_1E4370390;
  v17[0] = v8;
  v17[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1A1AF8054](v9, 8, 0);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NISession.mm"), 2434, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenData"));

  }
  v11 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", v10);

  return v11;
}

+ (id)generateFindingDiscoveryToken
{
  void *v2;
  void *v3;

  NSRandomData();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NIDiscoveryToken generateFindingTokenWithIRK:](NIDiscoveryToken, "generateFindingTokenWithIRK:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)generateFindingDiscoveryTokenWithSharedSecret:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 16)
  {
    +[NIDiscoveryToken generateFindingTokenWithIRK:](NIDiscoveryToken, "generateFindingTokenWithIRK:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)generateFindingDiscoveryTokenWithIdentityResolvingKey:(id)a3
{
  +[NISession generateFindingDiscoveryTokenWithSharedSecret:](NISession, "generateFindingDiscoveryTokenWithSharedSecret:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NIFindingNotifier)findingNotifier
{
  NIFindingNotifier *findingNotifier;
  NIFindingNotifier *v4;
  NIFindingNotifier *v5;

  findingNotifier = self->_findingNotifier;
  if (!findingNotifier)
  {
    v4 = -[NIFindingNotifier initWithParentSession:]([NIFindingNotifier alloc], "initWithParentSession:", self);
    v5 = self->_findingNotifier;
    self->_findingNotifier = v4;

    findingNotifier = self->_findingNotifier;
  }
  return findingNotifier;
}

- (void)_provideTruthTag:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NISession_Perf___provideTruthTag___block_invoke;
  block[3] = &unk_1E43622A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __36__NISession_Perf___provideTruthTag___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_provideTruthTag:", *(_QWORD *)(a1 + 40));

}

- (NISystemEventNotifier)systemEventNotifier
{
  NISystemEventNotifier *systemEventNotifier;
  NISystemEventNotifier *v4;
  NISystemEventNotifier *v5;

  systemEventNotifier = self->_systemEventNotifier;
  if (!systemEventNotifier)
  {
    v4 = -[NISystemEventNotifier initWithParentSession:]([NISystemEventNotifier alloc], "initWithParentSession:", self);
    v5 = self->_systemEventNotifier;
    self->_systemEventNotifier = v4;

    systemEventNotifier = self->_systemEventNotifier;
  }
  return systemEventNotifier;
}

+ (id)_localDeviceLogger
{
  if (+[NISession(LocalDeviceInteraction) _localDeviceLogger]::onceToken != -1)
    dispatch_once(&+[NISession(LocalDeviceInteraction) _localDeviceLogger]::onceToken, &__block_literal_global_1);
  return (id)+[NISession(LocalDeviceInteraction) _localDeviceLogger]::logger;
}

void __55__NISession_LocalDeviceInteraction___localDeviceLogger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NearbyInteraction", "LocalDeviceInteraction");
  v1 = (void *)+[NISession(LocalDeviceInteraction) _localDeviceLogger]::logger;
  +[NISession(LocalDeviceInteraction) _localDeviceLogger]::logger = (uint64_t)v0;

}

+ (void)setAsyncLocalDeviceInteractableDiscoveryTokens:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "copy");
  +[NISession _localDeviceLogger](NISession, "_localDeviceLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1A0337000, v9, OS_LOG_TYPE_DEFAULT, "setAsyncLocalDeviceInteractableDiscoveryTokens:completion: with %d tokens", buf, 8u);
    }

  }
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__NISession_LocalDeviceInteraction__setAsyncLocalDeviceInteractableDiscoveryTokens_completion___block_invoke;
  v15[3] = &unk_1E4362A20;
  v12 = v8;
  v16 = v12;
  v13 = v6;
  v18 = v13;
  v14 = v10;
  v17 = v14;
  objc_msgSend(v11, "setLocalDeviceInteractableDiscoveryTokens:reply:", v7, v15);

}

void __95__NISession_LocalDeviceInteraction__setAsyncLocalDeviceInteractableDiscoveryTokens_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A0337000, v4, OS_LOG_TYPE_DEFAULT, "setAsyncLocalDeviceInteractableDiscoveryTokens:completion replied error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

+ (void)getAsyncInteractableDiscoveryTokens:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[16];

  v3 = a3;
  +[NISession _localDeviceLogger](NISession, "_localDeviceLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0337000, v4, OS_LOG_TYPE_DEFAULT, "getAsyncInteractableDiscoveryTokens:", buf, 2u);
  }
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__NISession_LocalDeviceInteraction__getAsyncInteractableDiscoveryTokens___block_invoke;
  v10[3] = &unk_1E4362A48;
  v7 = v4;
  v11 = v7;
  v8 = v3;
  v13 = v8;
  v9 = v5;
  v12 = v9;
  objc_msgSend(v6, "getInteractableDiscoveryTokens:", v10);

}

void __73__NISession_LocalDeviceInteraction__getAsyncInteractableDiscoveryTokens___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v7 = *(id *)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = objc_msgSend(v5, "count");
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1A0337000, v7, OS_LOG_TYPE_DEFAULT, "getAsyncInteractableDiscoveryTokens: replied %d tokens. Server error: %@", (uint8_t *)v9, 0x12u);
    }

  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

+ (void)getAsyncActivelyInteractingDiscoveryTokens:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[16];

  v3 = a3;
  +[NISession _localDeviceLogger](NISession, "_localDeviceLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0337000, v4, OS_LOG_TYPE_DEFAULT, "getAsyncActivelyInteractingDiscoveryTokens:", buf, 2u);
  }
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__NISession_LocalDeviceInteraction__getAsyncActivelyInteractingDiscoveryTokens___block_invoke;
  v10[3] = &unk_1E4362A48;
  v7 = v4;
  v11 = v7;
  v8 = v3;
  v13 = v8;
  v9 = v5;
  v12 = v9;
  objc_msgSend(v6, "getActivelyInteractingDiscoveryTokens:", v10);

}

void __80__NISession_LocalDeviceInteraction__getAsyncActivelyInteractingDiscoveryTokens___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v7 = *(id *)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = objc_msgSend(v5, "count");
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1A0337000, v7, OS_LOG_TYPE_DEFAULT, "getAsyncActivelyInteractingDiscoveryTokens: replied %d tokens. Server error: %@", (uint8_t *)v9, 0x12u);
    }

  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

+ (id)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t v30[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v4 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(v5, "copy");
  +[NISession _localDeviceLogger](NISession, "_localDeviceLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = "YES";
  else
    v8 = "NO";
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1A0337000, v9, OS_LOG_TYPE_DEFAULT, "setLocalDeviceCanInteract:%s with %d tokens", buf, 0x12u);
    }

  }
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__1;
  v38 = __Block_byref_object_dispose__1;
  v39 = 0;
  v12 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__NISession_LocalDeviceInteraction__setLocalDeviceCanInteract_withDiscoveryTokens___block_invoke;
  v22[3] = &unk_1E4362958;
  v24 = &v26;
  v25 = buf;
  v13 = v12;
  v23 = v13;
  objc_msgSend(v11, "setLocalDeviceCanInteract:withDiscoveryTokens:reply:", v4, v6, v22);
  v14 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v13, v14);
  objc_msgSend(v10, "invalidate");
  if (!*((_BYTE *)v27 + 24))
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("Server did not reply.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v17;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v30 = 136315394;
    v31 = v8;
    v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_1A0337000, v7, OS_LOG_TYPE_DEFAULT, "setLocalDeviceCanInteract:%s return error: %@", v30, 0x16u);
  }
  v20 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v26, 8);

  return v20;
}

void __83__NISession_LocalDeviceInteraction__setLocalDeviceCanInteract_withDiscoveryTokens___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)setLocalDeviceDebugParameters:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  __int128 *p_buf;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t v26[4];
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  +[NISession _localDeviceLogger](NISession, "_localDeviceLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1A0337000, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceDebugParameters:%@", (uint8_t *)&buf, 0xCu);
  }
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v34 = 0;
  v8 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__NISession_LocalDeviceInteraction__setLocalDeviceDebugParameters___block_invoke;
  v18[3] = &unk_1E4362958;
  v20 = &v22;
  p_buf = &buf;
  v9 = v8;
  v19 = v9;
  objc_msgSend(v7, "setLocalDeviceDebugParameters:reply:", v4, v18);
  v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v10);
  objc_msgSend(v6, "invalidate");
  if (!*((_BYTE *)v23 + 24))
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Server did not reply.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v13;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v26 = 138412290;
    v27 = v15;
    _os_log_impl(&dword_1A0337000, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceDebugParameters return error: %@", v26, 0xCu);
  }
  v16 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __67__NISession_LocalDeviceInteraction__setLocalDeviceDebugParameters___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)setLocalDeviceInteractableDiscoveryTokens:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t v27[4];
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  +[NISession _localDeviceLogger](NISession, "_localDeviceLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1A0337000, v6, OS_LOG_TYPE_DEFAULT, "setLocalDeviceInteractableDiscoveryTokens with %d tokens", buf, 8u);
    }

  }
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  *(_QWORD *)buf = 0;
  v32 = buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  v36 = 0;
  v9 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__NISession_LocalDeviceInteraction__setLocalDeviceInteractableDiscoveryTokens___block_invoke;
  v19[3] = &unk_1E4362958;
  v21 = &v23;
  v22 = buf;
  v10 = v9;
  v20 = v10;
  objc_msgSend(v8, "setLocalDeviceInteractableDiscoveryTokens:reply:", v4, v19);
  v11 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v10, v11);
  objc_msgSend(v7, "invalidate");
  if (!*((_BYTE *)v24 + 24))
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("Server did not reply.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v32 + 5);
    *((_QWORD *)v32 + 5) = v14;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *((_QWORD *)v32 + 5);
    *(_DWORD *)v27 = 138412290;
    v28 = v16;
    _os_log_impl(&dword_1A0337000, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceInteractableDiscoveryTokens return error: %@", v27, 0xCu);
  }
  v17 = *((id *)v32 + 5);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v23, 8);

  return v17;
}

void __79__NISession_LocalDeviceInteraction__setLocalDeviceInteractableDiscoveryTokens___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (NSArray)interactableDiscoveryTokens
{
  NSObject *v2;
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  NSObject *v22;
  uint64_t *v23;
  uint8_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t v42[4];
  int v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  +[NISession _localDeviceLogger](NISession, "_localDeviceLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0337000, v2, OS_LOG_TYPE_DEFAULT, "interactableDiscoveryTokens", buf, 2u);
  }
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  *(_QWORD *)buf = 0;
  v33 = buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v5 = dispatch_semaphore_create(0);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __64__NISession_LocalDeviceInteraction__interactableDiscoveryTokens__block_invoke;
  v21 = &unk_1E4362A70;
  v23 = &v38;
  v24 = buf;
  v25 = &v26;
  v6 = v5;
  v22 = v6;
  objc_msgSend(v4, "getInteractableDiscoveryTokens:", &v18);
  v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  objc_msgSend(v3, "invalidate", v18, v19, v20, v21);
  if (!*((_BYTE *)v39 + 24))
  {
    v8 = (void *)*((_QWORD *)v33 + 5);
    *((_QWORD *)v33 + 5) = 0;

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    v47[0] = CFSTR("Server did not reply.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v27[5];
    v27[5] = v11;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v13 = v2;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(*((id *)v33 + 5), "count");
      v15 = v27[5];
      *(_DWORD *)v42 = 67109378;
      v43 = v14;
      v44 = 2112;
      v45 = v15;
      _os_log_impl(&dword_1A0337000, v13, OS_LOG_TYPE_DEFAULT, "interactableDiscoveryTokens return %d tokens. Server error: %@", v42, 0x12u);
    }

  }
  v16 = *((id *)v33 + 5);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v38, 8);
  return (NSArray *)v16;
}

void __64__NISession_LocalDeviceInteraction__interactableDiscoveryTokens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (NSArray)activelyInteractingDiscoveryTokens
{
  NSObject *v2;
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  NSObject *v22;
  uint64_t *v23;
  uint8_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t v42[4];
  int v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  +[NISession _localDeviceLogger](NISession, "_localDeviceLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0337000, v2, OS_LOG_TYPE_DEFAULT, "activelyInteractingDiscoveryTokens", buf, 2u);
  }
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  *(_QWORD *)buf = 0;
  v33 = buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v5 = dispatch_semaphore_create(0);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __71__NISession_LocalDeviceInteraction__activelyInteractingDiscoveryTokens__block_invoke;
  v21 = &unk_1E4362A70;
  v23 = &v38;
  v24 = buf;
  v25 = &v26;
  v6 = v5;
  v22 = v6;
  objc_msgSend(v4, "getActivelyInteractingDiscoveryTokens:", &v18);
  v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  objc_msgSend(v3, "invalidate", v18, v19, v20, v21);
  if (!*((_BYTE *)v39 + 24))
  {
    v8 = (void *)*((_QWORD *)v33 + 5);
    *((_QWORD *)v33 + 5) = 0;

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    v47[0] = CFSTR("Server did not reply.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v27[5];
    v27[5] = v11;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v13 = v2;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(*((id *)v33 + 5), "count");
      v15 = v27[5];
      *(_DWORD *)v42 = 67109378;
      v43 = v14;
      v44 = 2112;
      v45 = v15;
      _os_log_impl(&dword_1A0337000, v13, OS_LOG_TYPE_DEFAULT, "activelyInteractingDiscoveryTokens return %d tokens. Server error: %@", v42, 0x12u);
    }

  }
  v16 = *((id *)v33 + 5);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v38, 8);
  return (NSArray *)v16;
}

void __71__NISession_LocalDeviceInteraction__activelyInteractingDiscoveryTokens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)localDevicePrintableState
{
  NSObject *v2;
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint8_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t v40[4];
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  +[NISession _localDeviceLogger](NISession, "_localDeviceLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0337000, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState", buf, 2u);
  }
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v5 = dispatch_semaphore_create(0);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __62__NISession_LocalDeviceInteraction__localDevicePrintableState__block_invoke;
  v19 = &unk_1E4362A98;
  v21 = &v36;
  v22 = buf;
  v23 = &v24;
  v6 = v5;
  v20 = v6;
  objc_msgSend(v4, "getLocalDevicePrintableState:", &v16);
  v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  objc_msgSend(v3, "invalidate", v16, v17, v18, v19);
  if (!*((_BYTE *)v37 + 24))
  {
    v8 = (void *)*((_QWORD *)v31 + 5);
    *((_QWORD *)v31 + 5) = 0;

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    v43[0] = CFSTR("Server did not reply.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v25[5];
    v25[5] = v11;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v25[5];
    *(_DWORD *)v40 = 138412290;
    v41 = v13;
    _os_log_impl(&dword_1A0337000, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState error: %@", v40, 0xCu);
  }
  v14 = *((id *)v31 + 5);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v36, 8);
  return v14;
}

void __62__NISession_LocalDeviceInteraction__localDevicePrintableState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)discoveryToken
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A0337000, v0, v1, "DiscoveryToken getter returning nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)uwbSessionDidFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1A0337000, v0, v1, "DelegateProxy: session failed with error: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)uwbSessionDidInvalidateWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1A0337000, v0, v1, "DelegateProxy: session invalidated with error: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)uwbSessionInterruptionReasonEnded:timestamp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A0337000, v0, v1, "Suspension end does not match any stored suspensions.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleARSessionDidFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1A0337000, v0, v1, "ARSession: failed with error: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleARSession:willRunWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1A0337000, v0, v1, "ARSession: running with invalid config: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_verifyError:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A0337000, log, OS_LOG_TYPE_ERROR, "%{private}@", buf, 0xCu);

}

- (void)_notifyDidInvalidateWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1A0337000, v1, OS_LOG_TYPE_ERROR, "Delegate: notify invalidation: %@. Sanitized: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
