@implementation CBAnalyticsManager

+ (id)sharedInstance
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  SEL v10;
  id v11;
  uint64_t *v12;
  dispatch_once_t *v13;

  v11 = a1;
  v10 = a2;
  objc_sync_enter(a1);
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __36__CBAnalyticsManager_sharedInstance__block_invoke;
  v8 = &unk_1E68E9E60;
  v9 = v11;
  v13 = &sharedInstance_onceToken_2;
  v12 = &v4;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(v13, v12);
  objc_sync_exit(a1);
  return (id)sharedInstance__sharedObject_2;
}

uint64_t __36__CBAnalyticsManager_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_super v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1;
  v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___CBAnalyticsManager;
  result = objc_msgSend(objc_msgSendSuper2(&v2, sel_alloc), "init");
  sharedInstance__sharedObject_2 = result;
  return result;
}

- (CBAnalyticsManager)init
{
  os_log_t v2;
  dispatch_queue_t v3;
  id v4;
  id v5;
  uint64_t inited;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *log;
  os_log_type_t type;
  NSObject *v15;
  id v16;
  uint8_t v17[7];
  char v18;
  NSObject *v19;
  uint8_t v20[15];
  char v21;
  NSObject *v22;
  objc_super v23;
  SEL v24;
  id v25;
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = self;
  v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)CBAnalyticsManager;
  v25 = -[CBAnalyticsManager init](&v23, sel_init);
  if (!v25)
    return (CBAnalyticsManager *)v25;
  v2 = os_log_create("com.apple.CoreBrightness.CBAnalyticsManager", "default");
  *((_QWORD *)v25 + 1) = v2;
  if (!*((_QWORD *)v25 + 1))
  {
    v22 = 0;
    v15 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v22 = v15;
    v21 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      log = v22;
      type = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create log handle", v20, 2u);
    }
  }
  v3 = dispatch_queue_create("com.apple.CoreBrightness.CBAnalyticsManager", 0);
  *((_QWORD *)v25 + 2) = v3;
  if (*((_QWORD *)v25 + 2))
  {
    v16 = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:](CBPreferencesHandler, "copyPreferenceForAllUsersForKey:", CFSTR("CoreAnalyticsTimestamps"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v16);
    else
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v25 + 4) = v4;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v25 + 5) = v5;
    *((_BYTE *)v25 + 48) = 1;
    if (*((_QWORD *)v25 + 1))
    {
      v8 = *((_QWORD *)v25 + 1);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v8 = inited;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v27, *((_QWORD *)v25 + 4));
      _os_log_debug_impl(&dword_1B5291000, v8, OS_LOG_TYPE_DEBUG, "Init with timestamps {{%@}}", v27, 0xCu);
    }
    return (CBAnalyticsManager *)v25;
  }
  v19 = 0;
  if (*((_QWORD *)v25 + 1))
  {
    v12 = *((_QWORD *)v25 + 1);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v11 = init_default_corebrightness_log();
    v12 = v11;
  }
  v19 = v12;
  v18 = 16;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v9 = v19;
    v10 = v18;
    __os_log_helper_16_0_0(v17);
    _os_log_error_impl(&dword_1B5291000, v9, v10, "failed to create dispatch queue", v17, 2u);
  }

  v25 = 0;
  return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAnalyticsManager *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }
  if (v4->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  if (v4->_reportTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v4->_reportTimer);
    dispatch_release((dispatch_object_t)v4->_reportTimer);
    v4->_reportTimer = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBAnalyticsManager;
  -[CBAnalyticsManager dealloc](&v2, sel_dealloc);
}

- (void)storeTimestamp:(id)a3 forEventName:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_timestamps, "setObject:forKey:", a3, a4);
  +[CBPreferencesHandler storePreferenceForAllUsersForKey:andValue:](CBPreferencesHandler, "storePreferenceForAllUsersForKey:andValue:", CFSTR("CoreAnalyticsTimestamps"), self->_timestamps);
}

+ (BOOL)handleColorSample:(id)a3
{
  return -[CBAnalyticsManager handleColorSampleInternal:](+[CBAnalyticsManager sharedInstance](CBAnalyticsManager, "sharedInstance"), "handleColorSampleInternal:", a3);
}

- (BOOL)handleColorSampleInternal:(id)a3
{
  NSObject *queue;
  char v5;
  uint64_t block;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  CBAnalyticsManager *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  id v19;
  SEL v20;
  CBAnalyticsManager *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x20000000;
  v17 = 32;
  v18 = 0;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __48__CBAnalyticsManager_handleColorSampleInternal___block_invoke;
  v10 = &unk_1E68EA1A0;
  v11 = a3;
  v12 = v21;
  v13 = &v14;
  dispatch_sync(queue, &block);
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v5 & 1;
}

uint64_t __48__CBAnalyticsManager_handleColorSampleInternal___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 32))
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 40), "setObject:forKey:", *(_QWORD *)(result + 32), objc_msgSend(*(id *)(result + 40), "stringForType:", objc_msgSend(*(id *)(result + 32), "type")));
    if (!*(_QWORD *)(*(_QWORD *)(v1 + 40) + 24))
      result = objc_msgSend(*(id *)(v1 + 40), "startReporting");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)logAllColorSamples
{
  uint64_t v2;
  CBAnalyticsManager *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  uint64_t inited;
  NSObject *logHandle;
  _QWORD __b[8];
  uint64_t v13;
  os_log_type_t v14;
  os_log_t v15;
  SEL v16;
  CBAnalyticsManager *v17;
  _BYTE v18[128];
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = self;
  v16 = a2;
  v15 = 0;
  if (self->_logHandle)
  {
    logHandle = v17->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v15 = logHandle;
  v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)v17->samples);
    _os_log_debug_impl(&dword_1B5291000, v15, v14, "Send ALS color samples %@", v19, 0xCu);
  }
  memset(__b, 0, sizeof(__b));
  obj = (id)-[NSMutableDictionary allKeys](v17->samples, "allKeys");
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v13 = 0;
      v13 = *(_QWORD *)(__b[1] + 8 * v6);
      v3 = v17;
      v2 = -[NSMutableDictionary objectForKey:](v17->samples, "objectForKey:", v13);
      -[CBAnalyticsManager logColorSample:withType:](v3, "logColorSample:withType:", v2, v13);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
        if (!v7)
          break;
      }
    }
  }
}

- (void)logColorSample:(id)a3 withType:(id)a4
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *context;
  uint64_t v14;
  _QWORD v18[10];
  _QWORD v19[11];

  v19[10] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v14 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("Front")) & 1) != 0)
  {
    v14 = -[NSMutableDictionary objectForKey:](self->samples, "objectForKey:", CFSTR("Rear"));
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("Rear")) & 1) != 0
         || (objc_msgSend(a4, "isEqualToString:", CFSTR("Merged")) & 1) != 0)
  {
    v14 = -[NSMutableDictionary objectForKey:](self->samples, "objectForKey:", CFSTR("Front"));
  }
  v18[0] = CFSTR("Location");
  v19[0] = a4;
  v18[1] = CFSTR("Lux");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "lux");
  v19[1] = objc_msgSend(v6, "numberWithDouble:");
  v18[2] = CFSTR("CCT");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "CCT");
  v19[2] = objc_msgSend(v7, "numberWithDouble:");
  v18[3] = CFSTR("x");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "xy");
  v19[3] = objc_msgSend(v8, "numberWithDouble:", v4);
  v18[4] = CFSTR("y");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "xy");
  v19[4] = objc_msgSend(v9, "numberWithDouble:", v5);
  v18[5] = CFSTR("ColorBin");
  v19[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "colorBin"));
  v18[6] = CFSTR("ColorDeltaE");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "colorDeltaEWith:", v14);
  v19[6] = objc_msgSend(v10, "numberWithDouble:");
  v18[7] = CFSTR("CCTDifference");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "CCTDifferenceWith:", v14);
  v19[7] = objc_msgSend(v11, "numberWithDouble:");
  v18[8] = CFSTR("LuxDifference");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "LuxDifferenceWith:", v14);
  v19[8] = objc_msgSend(v12, "numberWithDouble:");
  v18[9] = CFSTR("Mode");
  v19[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "mode"));
  -[CBAnalyticsManager sendEventLazy:andDict:](self, "sendEventLazy:andDict:", CFSTR("com.apple.corebrightness.extdisplay.als.colorsample"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 10));
  objc_autoreleasePoolPop(context);
}

+ (void)sendEventOnceADayLazy:(id)a3 andDict:(id)a4
{
  -[CBAnalyticsManager sendEventOnceADayLazyInternal:andDict:](+[CBAnalyticsManager sharedInstance](CBAnalyticsManager, "sharedInstance"), "sendEventOnceADayLazyInternal:andDict:", a3, a4);
}

- (void)sendEventOnceADayLazyInternal:(id)a3 andDict:(id)a4
{
  NSObject *queue;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  CBAnalyticsManager *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  SEL v15;
  CBAnalyticsManager *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __60__CBAnalyticsManager_sendEventOnceADayLazyInternal_andDict___block_invoke;
  v9 = &unk_1E68EA150;
  v10 = v16;
  v11 = a3;
  v12 = a4;
  dispatch_sync(queue, &block);
}

void __60__CBAnalyticsManager_sendEventOnceADayLazyInternal_andDict___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t inited;
  NSObject *v4;
  uint8_t v6[32];
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isFirstEventToday:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEFAULT, "Event {%@} has been already sent today {{%@}}", v7, 0x16u);
    }
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v1 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v1 = init_default_corebrightness_log();
      v2 = v1;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      _os_log_impl(&dword_1B5291000, v2, OS_LOG_TYPE_DEFAULT, "First event today {%@} -> send event {{%@}}", v6, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "sendEventLazy:andDict:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

- (void)sendEventLazy:(id)a3 andDict:(id)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, (uint64_t)a3, (uint64_t)a4);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Send event %@ {{%@}}", v8, 0x16u);
  }
  AnalyticsSendEventLazy();
}

uint64_t __44__CBAnalyticsManager_sendEventLazy_andDict___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (void)startReporting
{
  dispatch_source_t v2;
  NSObject *reportTimer;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t handler;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  CBAnalyticsManager *v13;
  uint64_t v14;
  uint8_t v15[7];
  os_log_type_t v16;
  NSObject *v17;
  SEL v18;
  CBAnalyticsManager *v19;

  v19 = self;
  v18 = a2;
  if (self->_userActive)
  {
    v17 = 0;
    if (v19->_logHandle)
    {
      logHandle = v19->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v17 = logHandle;
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v17;
      type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1B5291000, log, type, "Start CoreAnalytics reporting", v15, 2u);
    }
    v14 = 1000000000;
    if (!v19->_reportTimer)
    {
      v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v19->_queue);
      v19->_reportTimer = (OS_dispatch_source *)v2;
    }
    if (v19->_reportTimer)
    {
      reportTimer = v19->_reportTimer;
      handler = MEMORY[0x1E0C809B0];
      v9 = -1073741824;
      v10 = 0;
      v11 = __36__CBAnalyticsManager_startReporting__block_invoke;
      v12 = &unk_1E68E9E60;
      v13 = v19;
      dispatch_source_set_event_handler(reportTimer, &handler);
      dispatch_source_set_timer((dispatch_source_t)v19->_reportTimer, v14, v14, 0xC8uLL);
      dispatch_resume((dispatch_object_t)v19->_reportTimer);
    }
  }
}

uint64_t __36__CBAnalyticsManager_startReporting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAllColorSamples", a1, a1);
}

+ (void)stopReporting:(unint64_t)a3
{
  -[CBAnalyticsManager stopReportingInternal:](+[CBAnalyticsManager sharedInstance](CBAnalyticsManager, "sharedInstance"), "stopReportingInternal:", a3);
}

- (void)setUserActive:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CBAnalyticsManager *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  CBAnalyticsManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __36__CBAnalyticsManager_setUserActive___block_invoke;
  v8 = &unk_1E68EA240;
  v9 = v13;
  v10 = a3;
  dispatch_sync(queue, &v4);
}

void __36__CBAnalyticsManager_setUserActive___block_invoke(uint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t inited;
  NSObject *v6;
  uint8_t v8[7];
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  os_log_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = a1;
  v13 = a1;
  v12 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v6 = inited;
  }
  v12 = v6;
  v11 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v15, *(_BYTE *)(a1 + 40) & 1, *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 1);
    _os_log_impl(&dword_1B5291000, v12, v11, "CBAnalyticsManager setUserActive=%d _userActive=%d", v15, 0xEu);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 1) != (*(_BYTE *)(a1 + 40) & 1))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = *(_BYTE *)(a1 + 40) & 1;
    if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
      {
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
          objc_msgSend(*(id *)(a1 + 32), "startReporting");
      }
    }
    else if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    {
      v10 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
      {
        v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v3 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v3 = init_default_corebrightness_log();
        v4 = v3;
      }
      v10 = v4;
      v9 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v1 = v10;
        v2 = v9;
        __os_log_helper_16_0_0(v8);
        _os_log_impl(&dword_1B5291000, v1, v2, "User is inactive -> Stop CoreAnalytics reporting", v8, 2u);
      }
      dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 24));
      dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    }
  }
}

- (void)stopReportingInternal:(unint64_t)a3
{
  NSObject *queue;
  uint64_t block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CBAnalyticsManager *v9;
  unint64_t v10;
  unint64_t v11;
  SEL v12;
  CBAnalyticsManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __44__CBAnalyticsManager_stopReportingInternal___block_invoke;
  v8 = &unk_1E68EA3D8;
  v9 = v13;
  v10 = a3;
  dispatch_sync(queue, &block);
}

void __44__CBAnalyticsManager_stopReportingInternal___block_invoke(uint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t inited;
  NSObject *v6;
  uint8_t v8[7];
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  os_log_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = a1;
  v13 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 32), "stringForType:", *(_QWORD *)(a1 + 40)));
  v12 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v6 = inited;
  }
  v12 = v6;
  v11 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v15, objc_msgSend(*(id *)(a1 + 32), "stringForType:", *(_QWORD *)(a1 + 40)));
    _os_log_debug_impl(&dword_1B5291000, v12, v11, "%@ sensor removed from reported samples.", v15, 0xCu);
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v10 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v3 = init_default_corebrightness_log();
      v4 = v3;
    }
    v10 = v4;
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v1 = v10;
      v2 = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_impl(&dword_1B5291000, v1, v2, "No ALS sample -> Stop CoreAnalytics reporting", v8, 2u);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 24));
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
}

- (BOOL)isFirstEventToday:(id)a3
{
  uint64_t v4;
  id v5;
  char v6;

  v6 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v4 = -[NSMutableDictionary objectForKey:](self->_timestamps, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[CBAnalyticsManager isSameDay:asDay:](self, "isSameDay:asDay:", v5, v4))
    {
      v6 = 1;
    }
    else
    {
      v6 = 0;
      -[CBAnalyticsManager storeTimestamp:forEventName:](self, "storeTimestamp:forEventName:", v5, a3);
    }
  }
  else
  {
    -[CBAnalyticsManager storeTimestamp:forEventName:](self, "storeTimestamp:forEventName:", v5, a3);
  }

  return v6 & 1;
}

- (BOOL)isSameDay:(id)a3 asDay:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_msgSend(v11, "components:fromDate:", 28, a3);
  v9 = (void *)objc_msgSend(v11, "components:fromDate:", 28, a4);
  v7 = objc_msgSend(v10, "day");
  v8 = 0;
  if (v7 == objc_msgSend(v9, "day"))
  {
    v6 = objc_msgSend(v10, "month");
    v8 = 0;
    if (v6 == objc_msgSend(v9, "month"))
    {
      v5 = objc_msgSend(v10, "year");
      return v5 == objc_msgSend(v9, "year");
    }
  }
  return v8;
}

- (id)stringForType:(unint64_t)a3
{
  const __CFString *v4;

  v4 = CFSTR("Unknown");
  switch(a3)
  {
    case 1uLL:
      return CFSTR("Front");
    case 2uLL:
      return CFSTR("Rear");
    case 3uLL:
      return CFSTR("Merged");
  }
  return (id)v4;
}

@end
