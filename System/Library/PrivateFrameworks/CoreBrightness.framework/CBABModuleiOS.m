@implementation CBABModuleiOS

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  if ((-[NSMutableArray containsObject:](self->_frontALSServiceClients, "containsObject:", a4) & 1) != 0
    || (-[NSMutableArray containsObject:](self->_otherServiceClients, "containsObject:", a4) & 1) != 0)
  {
    if (self->_AABC)
      (*(void (**)(void *, __IOHIDServiceClient *, __IOHIDEvent *))(*(_QWORD *)self->_AABC + 48))(self->_AABC, a4, a3);
  }
  else if ((-[NSMutableArray containsObject:](self->_rearALSServiceClients, "containsObject:", a4) & 1) != 0)
  {
    -[AABRear handleHIDEvent:from:](self->_AABRear, "handleHIDEvent:from:", a3, a4);
  }
  return 1;
}

uint64_t __29__CBABModuleiOS_setupAABRear__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
      return objc_msgSend(*(id *)(result + 32), "sendNotificationForKey:withValue:", a2, a3);
  }
  return result;
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (id)copyPropertyForKey:(id)a3
{
  return -[CBABModuleiOS copyPropertyInternalForKey:](self, "copyPropertyInternalForKey:", a3);
}

- (id)copyPropertyInternalForKey:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  id v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("StatusInfo")) & 1) != 0)
  {
    v6 = +[CBStatusInfoHelper copyStatusInfoFor:](CBStatusInfoHelper, "copyStatusInfoFor:", self);
    if (v6)
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("CBABModuleiOS"), 0);

  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("BLControlAlsSupported")) & 1) != 0)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_AABC != 0);
  }
  else if (self->_AABC)
  {
    v7 = (id)objc_msgSend((id)(*(uint64_t (**)(void *, id, _QWORD))(*(_QWORD *)self->_AABC + 112))(self->_AABC, a3, 0), "copy");
  }
  if (!v7)
    v7 = -[CBALSTelemetry copyPropertyForKey:](self->_alsTelemetry, "copyPropertyForKey:", a3);
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)a3, (uint64_t)v7);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ result=%@", v10, 0x16u);
  }
  return v7;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  char v5;

  v5 = 0;
  if (self->_AABC)
  {
    (*(void (**)(void *, id, id, _QWORD))(*(_QWORD *)self->_AABC + 120))(self->_AABC, a4, a3, 0);
    v5 = 1;
  }
  -[AABRear setProperty:forKey:](self->_AABRear, "setProperty:forKey:", a3, a4);
  -[CBALSTelemetry setProperty:forKey:](self->_alsTelemetry, "setProperty:forKey:", a3, a4);
  return v5 & 1;
}

- (CBABModuleiOS)initWithDisplayModule:(id)a3 andQueue:(id)a4
{
  os_log_t v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  CBDisplayModuleiOS *v8;
  CBALSTelemetry *v9;
  uint64_t v10;
  CBALSTelemetry *alsTelemetry;
  CBAgregateSettingsProvider *v12;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *logHandle;
  NSObject *v18;
  os_log_type_t v19;
  NSObject *v20;
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t);
  void *v28;
  CBABModuleiOS *v29;
  uint8_t v30[7];
  char v31;
  NSObject *v32;
  uint8_t v33[7];
  char v34;
  NSObject *v35;
  objc_super v36;
  uint8_t v37[15];
  char v38;
  NSObject *v39;
  id v40;
  id v41;
  SEL v42;
  CBABModuleiOS *v43;

  v43 = self;
  v42 = a2;
  v41 = a3;
  v40 = a4;
  if (!a3 || !v40)
  {
    v39 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v39 = inited;
    v38 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v39;
      type = v38;
      __os_log_helper_16_0_0(v37);
      _os_log_error_impl(&dword_1B5291000, log, type, "invalid arguments", v37, 2u);
    }
    return 0;
  }
  v36.receiver = v43;
  v36.super_class = (Class)CBABModuleiOS;
  v43 = -[CBModule initWithQueue:](&v36, sel_initWithQueue_, v40);
  if (!v43)
    return v43;
  v4 = os_log_create("com.apple.CoreBrightness.CBABModuleiOS", "default");
  v43->super._logHandle = (OS_os_log *)v4;
  if (!v43->super._logHandle)
  {
    v35 = 0;
    v20 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v35 = v20;
    v34 = 16;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v18 = v35;
      v19 = v34;
      __os_log_helper_16_0_0(v33);
      _os_log_error_impl(&dword_1B5291000, v18, v19, "failed to create log handle", v33, 2u);
    }
  }
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43->_frontALSServiceClients = v5;
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43->_rearALSServiceClients = v6;
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43->_otherServiceClients = v7;
  if (v43->_frontALSServiceClients && v43->_rearALSServiceClients && v43->_otherServiceClients)
  {
    v8 = (CBDisplayModuleiOS *)v41;
    v43->_display = v8;
    v9 = [CBALSTelemetry alloc];
    v10 = -[CBALSTelemetry initWithQueue:](v9, "initWithQueue:", v40);
    v43->_alsTelemetry = (CBALSTelemetry *)v10;
    alsTelemetry = v43->_alsTelemetry;
    v24 = MEMORY[0x1E0C809B0];
    v25 = -1073741824;
    v26 = 0;
    v27 = __48__CBABModuleiOS_initWithDisplayModule_andQueue___block_invoke;
    v28 = &unk_1E68E9F38;
    v29 = v43;
    -[CBModule registerNotificationBlock:](alsTelemetry, "registerNotificationBlock:", &v24);
    v12 = +[CBAgregateSettingsProvider sharedInstance](CBAgregateSettingsProvider, "sharedInstance");
    v43->_settingsProvider = (CBAdaptiveAutoBrightnessSettingsProvider *)v12;
    return v43;
  }
  v32 = 0;
  if (v43->super._logHandle)
  {
    logHandle = v43->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v16 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v16 = init_default_corebrightness_log();
    logHandle = v16;
  }
  v32 = logHandle;
  v31 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    v14 = v32;
    v15 = v31;
    __os_log_helper_16_0_0(v30);
    _os_log_error_impl(&dword_1B5291000, v14, v15, "failed to instantiate service containers", v30, 2u);
  }

  v43 = 0;
  return 0;
}

uint64_t __48__CBABModuleiOS_initWithDisplayModule_andQueue___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
      return objc_msgSend(*(id *)(result + 32), "sendNotificationForKey:withValue:", a2, a3);
  }
  return result;
}

- (void)dealloc
{
  void *AABC;
  objc_super v3;
  SEL v4;
  CBABModuleiOS *v5;

  v5 = self;
  v4 = a2;
  if (self->_AABC)
  {
    (*(void (**)(void *, OS_dispatch_queue *))(*(_QWORD *)v5->_AABC + 104))(v5->_AABC, v5->super._queue);
    (*(void (**)(void *, __Display *))(*(_QWORD *)v5->_AABC + 72))(v5->_AABC, -[CBDisplayModuleiOS displayInternal](v5->_display, "displayInternal"));
    (*(void (**)(void *, _QWORD))(*(_QWORD *)v5->_AABC + 56))(v5->_AABC, 0);
    AABC = v5->_AABC;
    if (AABC)
      (*(void (**)(void *))(*(_QWORD *)AABC + 40))(AABC);
    v5->_AABC = 0;
  }
  if (v5->_AABRear)

  v5->_frontALSServiceClients = 0;
  v5->_rearALSServiceClients = 0;

  v5->_otherServiceClients = 0;
  -[CBALSTelemetry stop](v5->_alsTelemetry, "stop");

  v5->_alsTelemetry = 0;
  v5->_boltsProvider = 0;
  v3.receiver = v5;
  v3.super_class = (Class)CBABModuleiOS;
  -[CBModule dealloc](&v3, sel_dealloc);
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  AAB::UpdateCurveStrategy *v3;
  const __CFAllocator *v4;
  const __CFAllocator *v5;
  CBAdaptiveAutoBrightnessSettingsProvider *settingsProvider;
  NSMutableArray *otherServiceClients;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v19[15];
  os_log_type_t v20;
  os_log_t oslog;
  id v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void *v27;
  CBABModuleiOS *v28;
  uint64_t v29;
  int v30;
  int v31;
  void (*v32)(uint64_t);
  void *v33;
  CBABModuleiOS *v34;
  uint8_t v35[7];
  os_log_type_t v36;
  NSObject *v37;
  const __CFAllocator *v38;
  io_registry_entry_t MatchingService;
  CFDictionaryRef v40;
  id RegistryID;
  CBALSNode *v42;
  IOHIDServiceClientRef v43;
  SEL v44;
  CBABModuleiOS *v45;
  uint8_t v46[24];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v45 = self;
  v44 = a2;
  v43 = a3;
  if (IOHIDServiceClientConformsTo(a3, 0xFF00u, 4u))
  {
    v42 = -[CBALSNode initWithALSServiceClient:]([CBALSNode alloc], "initWithALSServiceClient:", v43);
    if (-[CBALSNode placement](v42, "placement") == 2)
    {
      -[CBABModuleiOS setupAABRear](v45, "setupAABRear");
      -[AABRear addHIDServiceClient:](v45->_AABRear, "addHIDServiceClient:", v43);
      -[NSMutableArray addObject:](v45->_rearALSServiceClients, "addObject:", v43);
    }
    else if (-[NSMutableArray count](v45->_frontALSServiceClients, "count") || v45->_AABC)
    {
      if (v45->_AABC)
        (*(void (**)(void *, IOHIDServiceClientRef))(*(_QWORD *)v45->_AABC + 80))(v45->_AABC, v43);
    }
    else
    {
      RegistryID = (id)IOHIDServiceClientGetRegistryID(v43);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = IORegistryEntryIDMatching(objc_msgSend(RegistryID, "unsignedLongLongValue"));
        if (v40)
        {
          MatchingService = 0;
          MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v40);
          if (MatchingService)
          {
            if (!v45->_AABC)
            {
              v38 = 0;
              -[CBABModuleiOS updateCurveStrategy:withSettingsProvider:](v45, "updateCurveStrategy:withSettingsProvider:", &v38, v45->_settingsProvider);
              if (v38)
              {
                v45->_AABC = AABC::alloc((AABC *)*MEMORY[0x1E0C9AE00], v38, v3);
              }
              else
              {
                v37 = 0;
                if (v45->super._logHandle)
                {
                  logHandle = v45->super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    inited = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    inited = init_default_corebrightness_log();
                  logHandle = inited;
                }
                v37 = logHandle;
                v36 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
                {
                  log = v37;
                  type = v36;
                  __os_log_helper_16_0_0(v35);
                  _os_log_impl(&dword_1B5291000, log, type, "AABC initialisation: failed to get strategy from setting provider, use default update curve strategy.", v35, 2u);
                }
                v45->_AABC = AABC::alloc((AABC *)*MEMORY[0x1E0C9AE00], v4);
              }
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              settingsProvider = v45->_settingsProvider;
              v29 = MEMORY[0x1E0C809B0];
              v30 = -1073741824;
              v31 = 0;
              v32 = __37__CBABModuleiOS_addHIDServiceClient___block_invoke;
              v33 = &unk_1E68E9E60;
              v34 = v45;
              -[CBAdaptiveAutoBrightnessSettingsProvider registerAutoBrightnessSettingsUpdateHandler:](settingsProvider, "registerAutoBrightnessSettingsUpdateHandler:", &v29);
            }
            if (!v45->_AABC)
              v45->_AABC = AABC::alloc((AABC *)*MEMORY[0x1E0C9AE00], v5);
            if (v45->_AABC)
            {
              AABC::open((AABC *)v45->_AABC, MatchingService, 1, (void (*)(void *, const __CFString *, const void *))AABCCallback, v45);
              (*(void (**)(void *, __Display *))(*(_QWORD *)v45->_AABC + 64))(v45->_AABC, -[CBDisplayModuleiOS displayInternal](v45->_display, "displayInternal"));
              (*(void (**)(void *, OS_dispatch_queue *))(*(_QWORD *)v45->_AABC + 96))(v45->_AABC, v45->super._queue);
              (*(void (**)(void *, IOHIDServiceClientRef))(*(_QWORD *)v45->_AABC + 80))(v45->_AABC, v43);
              otherServiceClients = v45->_otherServiceClients;
              v23 = MEMORY[0x1E0C809B0];
              v24 = -1073741824;
              v25 = 0;
              v26 = __37__CBABModuleiOS_addHIDServiceClient___block_invoke_12;
              v27 = &unk_1E68EA068;
              v28 = v45;
              -[NSMutableArray enumerateObjectsUsingBlock:](otherServiceClients, "enumerateObjectsUsingBlock:", &v23);
            }
            v22 = -[CBAPEndpoint initWithServiceName:role:]([CBAPEndpoint alloc], "initWithServiceName:role:", CFSTR("cbroot-service"), CFSTR("DCP"));
            -[CBABModuleiOS setupAABRear](v45, "setupAABRear");
            if (v22)
            {
              NSLog(CFSTR("CBAPEndpoint registering with AABC"));
              if (v45->_AABC)
                AABC::registerEndpoint((id *)v45->_AABC, (CBAPEndpoint *)v22);

            }
            else
            {
              NSLog(CFSTR("CBAPEndpoint init failed"));
            }
            if (v45->_AABC)
            {
              oslog = 0;
              if (v45->super._logHandle)
              {
                v14 = v45->super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v13 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v13 = init_default_corebrightness_log();
                v14 = v13;
              }
              oslog = v14;
              v20 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                v11 = oslog;
                v12 = v20;
                __os_log_helper_16_0_0(v19);
                _os_log_debug_impl(&dword_1B5291000, v11, v12, "ALS service for internal display ready", v19, 2u);
              }
              -[CBABModuleiOS sendNotificationForKey:withValue:](v45, "sendNotificationForKey:withValue:", CFSTR("ALSServiceReady"), 0);
            }
          }
        }
      }
    }
    if (-[CBALSNode placement](v42, "placement") != 2)
      -[NSMutableArray addObject:](v45->_frontALSServiceClients, "addObject:", v43);
    if (-[CBALSTelemetry setALSService:](v45->_alsTelemetry, "setALSService:", v43))
      -[CBALSTelemetry start](v45->_alsTelemetry, "start");

    if (v45->super._logHandle)
    {
      v10 = v45->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v9 = init_default_corebrightness_log();
      v10 = v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v46, (uint64_t)v45->_frontALSServiceClients, (uint64_t)v45->_rearALSServiceClients);
      _os_log_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEFAULT, "Als service clients Front: %{public}@ \n Rear: %{public}@", v46, 0x16u);
    }
  }
  else
  {
    if (v45->_AABC)
      (*(void (**)(void *, IOHIDServiceClientRef))(*(_QWORD *)v45->_AABC + 80))(v45->_AABC, v43);
    -[NSMutableArray addObject:](v45->_otherServiceClients, "addObject:", v43);
  }
  return 1;
}

void __37__CBABModuleiOS_addHIDServiceClient___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __37__CBABModuleiOS_addHIDServiceClient___block_invoke_2;
  v7 = &unk_1E68E9E60;
  v8 = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, &block);
}

void __37__CBABModuleiOS_addHIDServiceClient___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v8;
  uint64_t v9;
  AAB::PreferenceUpdateCurveStrategy *v10;
  uint8_t v12[7];
  os_log_type_t v13;
  NSObject *v14;
  uint8_t v15[15];
  os_log_type_t v16;
  NSObject *v17;
  _QWORD v18[3];

  v18[2] = a1;
  v18[1] = a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v18[0] = 0;
    objc_msgSend(*(id *)(a1 + 32), "updateCurveStrategy:withSettingsProvider:", v18, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    if (v18[0])
    {
      (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 32) + 24))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v18[0]);
    }
    else
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v10 = (AAB::PreferenceUpdateCurveStrategy *)operator new();
      *(_QWORD *)v10 = 0;
      AAB::PreferenceUpdateCurveStrategy::PreferenceUpdateCurveStrategy(v10);
      (*(void (**)(uint64_t, AAB::PreferenceUpdateCurveStrategy *))(*(_QWORD *)v9 + 24))(v9, v10);
      v17 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
      {
        v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v8 = inited;
      }
      v17 = v8;
      v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        log = v17;
        type = v16;
        __os_log_helper_16_0_0(v15);
        _os_log_impl(&dword_1B5291000, log, type, "[Update curve strategy] Use the preference based strategy.", v15, 2u);
      }
    }
  }
  else
  {
    v14 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v3 = init_default_corebrightness_log();
      v4 = v3;
    }
    v14 = v4;
    v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v1 = v14;
      v2 = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_impl(&dword_1B5291000, v1, v2, "[Update curve strategy] failed to update curve strategy. AABC has not been initialized yet.", v12, 2u);
    }
  }
}

uint64_t __37__CBABModuleiOS_addHIDServiceClient___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 32) + 80))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), a2);
}

- (void)updateCurveStrategy:(UpdateCurveStrategy *)a3 withSettingsProvider:(id)a4
{
  uint64_t updated;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  AAB::UpdateCurveStrategy *v9;
  AAB::UpdateCurveStrategy *v10;
  CBHybridUpdateCurveStrategy *v11;
  AAB::UpdateCurveStrategy *v12;
  CBHybridUpdateCurveStrategy *v13;
  AAB::PreferenceUpdateCurveStrategy *v14;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v17[7];
  os_log_type_t v18;
  NSObject *v19;
  UpdateCurveStrategy *v20;
  os_log_type_t v21;
  os_log_t v22;
  unint64_t v23;
  id v24;
  UpdateCurveStrategy **v25;
  SEL v26;
  CBABModuleiOS *v27;
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  if (a4)
  {
    v23 = objc_msgSend(v24, "aabUpdateStrategyType");
    v22 = 0;
    if (v27->super._logHandle)
    {
      logHandle = v27->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v22 = logHandle;
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      updated = aabUpdateStrategyTypeToString(v23);
      __os_log_helper_16_2_1_8_66((uint64_t)v28, updated);
      _os_log_impl(&dword_1B5291000, v22, v21, "Use CBAABUpdateStrategyType = %{public}@", v28, 0xCu);
    }
    if (v23)
    {
      if (!v27->_boltsProvider)
        v27->_boltsProvider = -[CBBOLTSProvider initWithQueue:]([CBBOLTSProvider alloc], "initWithQueue:", v27->super._queue);
      v20 = 0;
      v20 = -[CBBOLTSProvider newBOLTSModule](v27->_boltsProvider, "newBOLTSModule");
      if (v20)
      {
        switch(v23)
        {
          case 1uLL:
            *v25 = v20;
            break;
          case 2uLL:
            v13 = (CBHybridUpdateCurveStrategy *)operator new();
            v12 = (AAB::UpdateCurveStrategy *)operator new();
            *(_QWORD *)v12 = 0;
            AAB::PreferenceUpdateCurveStrategy::PreferenceUpdateCurveStrategy(v12);
            CBHybridUpdateCurveStrategy::CBHybridUpdateCurveStrategy(v13, v12, (AAB::UpdateCurveStrategy *)v20);
            *v25 = (UpdateCurveStrategy *)v13;
            break;
          case 3uLL:
            v11 = (CBHybridUpdateCurveStrategy *)operator new();
            v9 = (AAB::UpdateCurveStrategy *)v20;
            v10 = (AAB::UpdateCurveStrategy *)operator new();
            *(_QWORD *)v10 = 0;
            AAB::PreferenceUpdateCurveStrategy::PreferenceUpdateCurveStrategy(v10);
            CBHybridUpdateCurveStrategy::CBHybridUpdateCurveStrategy(v11, v9, v10);
            *v25 = (UpdateCurveStrategy *)v11;
            break;
          default:
            *v25 = 0;
            break;
        }
      }
      else
      {
        v19 = 0;
        if (v27->super._logHandle)
        {
          v8 = v27->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v7 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v7 = init_default_corebrightness_log();
          v8 = v7;
        }
        v19 = v8;
        v18 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v5 = v19;
          v6 = v18;
          __os_log_helper_16_0_0(v17);
          _os_log_impl(&dword_1B5291000, v5, v6, "BOLTS initialisation failed.", v17, 2u);
        }
      }
    }
    else
    {
      v14 = (AAB::PreferenceUpdateCurveStrategy *)operator new();
      *(_QWORD *)v14 = 0;
      AAB::PreferenceUpdateCurveStrategy::PreferenceUpdateCurveStrategy(v14);
      *v25 = (UpdateCurveStrategy *)v14;
    }
  }
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  if (self->_AABC)
    (*(void (**)(void *, __IOHIDServiceClient *))(*(_QWORD *)self->_AABC + 88))(self->_AABC, a3);
  -[AABRear removeHIDServiceClient:](self->_AABRear, "removeHIDServiceClient:", a3);
  -[NSMutableArray removeObject:](self->_frontALSServiceClients, "removeObject:", a3);
  -[NSMutableArray removeObject:](self->_rearALSServiceClients, "removeObject:", a3);
  -[NSMutableArray removeObject:](self->_otherServiceClients, "removeObject:", a3);
  return 1;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)stop
{
  -[AABRear stop](self->_AABRear, "stop");
  -[CBModule unregisterNotificationBlock](self->_AABRear, "unregisterNotificationBlock");
}

- (id)newGrimaldiFactory:(int)a3
{
  CBGrimaldiSamplingStrategySingleSample *v4;
  CBGrimaldiFactory *v5;

  v5 = objc_alloc_init(CBGrimaldiFactory);
  if (a3 == 1)
    v4 = objc_alloc_init(CBGrimaldiSamplingStrategySingleSample);
  else
    v4 = objc_alloc_init(CBGrimaldiSamplingStrategyLegacy);
  -[CBGrimaldiFactory setSamplingStrategy:](v5, "setSamplingStrategy:", v4);

  return v5;
}

- (void)setupAABRear
{
  AABRear *AABRear;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  CBABModuleiOS *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  CBABModuleiOS *v18;
  uint8_t v19[15];
  os_log_type_t v20;
  NSObject *v21;
  id v22;
  SEL v23;
  CBABModuleiOS *v24;
  uint64_t *v25;
  dispatch_once_t *v26;

  v24 = self;
  v23 = a2;
  if (!self->_AABRear)
  {
    v22 = 0;
    v22 = -[CBABModuleiOS newGrimaldiFactory:](v24, "newGrimaldiFactory:", -[CBBacklightNode grimaldiSamplingStrategy](-[CBDisplayModuleiOS backlightParams](v24->_display, "backlightParams"), "grimaldiSamplingStrategy"));
    v24->_AABRear = -[AABRear initWithQueue:andGrimaldiFactory:]([AABRear alloc], "initWithQueue:andGrimaldiFactory:", v24->super._queue, v22);

    if (v24->_AABRear)
    {
      v21 = 0;
      if (v24->super._logHandle)
      {
        logHandle = v24->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v21 = logHandle;
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        log = v21;
        type = v20;
        __os_log_helper_16_0_0(v19);
        _os_log_impl(&dword_1B5291000, log, type, "Rear AAB has been initialized.", v19, 2u);
      }
      AABRear = v24->_AABRear;
      v13 = MEMORY[0x1E0C809B0];
      v14 = -1073741824;
      v15 = 0;
      v16 = __29__CBABModuleiOS_setupAABRear__block_invoke;
      v17 = &unk_1E68E9F38;
      v18 = v24;
      -[CBModule registerNotificationBlock:](AABRear, "registerNotificationBlock:", &v13, log);
    }
  }
  if (v24->_AABRear && v24->_AABC)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __29__CBABModuleiOS_setupAABRear__block_invoke_2;
    v11 = &unk_1E68E9E60;
    v12 = v24;
    v26 = &-[CBABModuleiOS setupAABRear]::onceToken;
    v25 = &v7;
    if (-[CBABModuleiOS setupAABRear]::onceToken != -1)
      dispatch_once(v26, v25);
  }
}

uint64_t __29__CBABModuleiOS_setupAABRear__block_invoke_2(uint64_t a1)
{
  return AABC::initAABRear(*(AABC **)(*(_QWORD *)(a1 + 32) + 32), *(AABRear **)(*(_QWORD *)(a1 + 32) + 48));
}

- (BOOL)shouldMitigateHarmony:(__IOHIDServiceClient *)a3
{
  BOOL v4;
  BOOL v5;

  v4 = 0;
  if (self->_AABC)
  {
    v5 = AABC::getALSSensorTypeFromService((id *)self->_AABC, a3) == 8;
    return (v5 | (AABC::getALSSensorTypeFromService((id *)self->_AABC, a3) == 9)) != 0;
  }
  return v4;
}

- (id)copyIdentifiers
{
  SEL v3;
  CBABModuleiOS *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("TrustedLux"), CFSTR("Lux"), CFSTR("BLControlAlsSupported"), CFSTR("ALSUserPreference"), CFSTR("EcoMode"), CFSTR("ALSCurveInfo"), CFSTR("EventTimestampFirstALSSample"), CFSTR("SemanticAmbientLightLevel"), 0);
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  if (self->_AABC)
    AABC::handleAODStateUpdate((uint64_t)self->_AABC, a3, a5, a4);
  return 1;
}

@end
