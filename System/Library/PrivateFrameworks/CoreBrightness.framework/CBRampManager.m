@implementation CBRampManager

- (CBRampManager)init
{
  os_log_t v2;
  NSMutableDictionary *v3;
  unint64_t v4;
  unint64_t v5;
  CBFrameLink *v6;
  mach_timebase_info info;
  id v9;
  objc_super v10;
  SEL v11;
  CBRampManager *v12;

  v12 = self;
  v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)CBRampManager;
  v12 = -[CBRampManager init](&v10, sel_init);
  if (v12)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s.%s"), "com.apple.CoreBrightness", objc_msgSend(+[CBRampManager className](CBRampManager, "className"), "cStringUsingEncoding:"));
    v2 = os_log_create((const char *)objc_msgSend(v9, "cStringUsingEncoding:", 1), "default");
    v12->_logHandle = (OS_os_log *)v2;

    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12->_ramps = v3;
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v5) = info.denom;
    LODWORD(v4) = info.numer;
    v12->_sMachTimebaseFactor = (double)v4 / (double)v5 * 0.000000001;
    v6 = objc_alloc_init(CBFrameLink);
    v12->_frameLink = v6;
    if (v12->_frameLink)
      v12->_enableFrameSynchronisation = 1;
    v12->_liveUpdates = 1;
  }
  return v12;
}

- (CBRampManager)initWithDisplayId:(unint64_t)a3
{
  uint64_t v3;
  os_log_t v4;
  NSMutableDictionary *v5;
  unint64_t v6;
  unint64_t v7;
  id v9;
  mach_timebase_info info;
  id v11;
  objc_super v12;
  unint64_t v13;
  SEL v14;
  CBRampManager *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CBRampManager;
  v15 = -[CBRampManager init](&v12, sel_init);
  if (v15)
  {
    v15->_displayId = v13;
    v11 = 0;
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v3 = objc_msgSend(+[CBRampManager className](CBRampManager, "className"), "cStringUsingEncoding:");
    v11 = (id)objc_msgSend(v9, "initWithFormat:", CFSTR("%s.%s.%lu"), "com.apple.CoreBrightness", v3, v15->_displayId);
    v4 = os_log_create((const char *)objc_msgSend(v11, "cStringUsingEncoding:", 1), "default");
    v15->_logHandle = (OS_os_log *)v4;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15->_ramps = v5;
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v7) = info.denom;
    LODWORD(v6) = info.numer;
    v15->_sMachTimebaseFactor = (double)v6 / (double)v7 * 0.000000001;
    v15->_enableFrameSynchronisation = 1;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBRampManager *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)

  if (v4->_clockHandler)
    _Block_release(v4->_clockHandler);
  if (v4->_rampDoneCallback)
    _Block_release(v4->_rampDoneCallback);
  if (v4->_frameLink)

  if (v4->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBRampManager;
  -[CBRampManager dealloc](&v2, sel_dealloc);
}

- (void)activate
{
  CBFrameLink *frameLink;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  CBRampManager *v8;
  SEL v9;
  CBRampManager *v10;

  v10 = self;
  v9 = a2;
  if (self->_enableFrameSynchronisation && v10->_frameLink)
  {
    frameLink = v10->_frameLink;
    v3 = MEMORY[0x1E0C809B0];
    v4 = -1073741824;
    v5 = 0;
    v6 = __25__CBRampManager_activate__block_invoke;
    v7 = &unk_1E68EB240;
    v8 = v10;
    -[CBFrameLink setFrameNotificationBlock:](frameLink, "setFrameNotificationBlock:", &v3);
    -[CBFrameLink scheduleWithDispatchQueue:](v10->_frameLink, "scheduleWithDispatchQueue:", v10->_queue);
  }
  v10->_activated = 1;
  -[CBRampManager reevaluateClocking](v10, "reevaluateClocking");
}

uint64_t __25__CBRampManager_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRampsForTimestamp:", (double)mach_absolute_time() * *(double *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)cancel
{
  -[CBRampManager removeAllRamps](self, "removeAllRamps");
  if (self->_enableFrameSynchronisation)
    -[CBFrameLink invalidate](self->_frameLink, "invalidate");
  self->_activated = 0;
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (self->_queue)
  {
    dispatch_release((dispatch_object_t)self->_queue);
    self->_queue = 0;
  }
  if (a3)
  {
    self->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)self->_queue);
    -[CBFrameLink scheduleWithDispatchQueue:](self->_frameLink, "scheduleWithDispatchQueue:", a3);
  }
}

- (void)reevaluateClocking
{
  NSMutableDictionary *ramps;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t, uint64_t, void *);
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  float *v10;
  int v11;
  int v12;
  int v13;
  SEL v14;
  CBRampManager *v15;

  v15 = self;
  v14 = a2;
  v9 = 0;
  v10 = (float *)&v9;
  v11 = 0x20000000;
  v12 = 32;
  v13 = 0;
  if (self->_activated)
  {
    ramps = v15->_ramps;
    v3 = MEMORY[0x1E0C809B0];
    v4 = -1073741824;
    v5 = 0;
    v6 = __35__CBRampManager_reevaluateClocking__block_invoke;
    v7 = &unk_1E68EB268;
    v8 = &v9;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](ramps, "enumerateKeysAndObjectsUsingBlock:", &v3);
    if (v10[6] != v15->_requiredFrequency)
    {
      v15->_requiredFrequency = v10[6];
      -[CBRampManager enableClocking](v15, "enableClocking");
    }
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __35__CBRampManager_reevaluateClocking__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  float v4;
  int v5;

  objc_msgSend(a3, "frequency");
  result = a1;
  if (v4 > *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    result = objc_msgSend(a3, "frequency");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  }
  return result;
}

- (void)insertRamp:(id)a3 identifier:(id)a4
{
  -[CBRampManager insertRamp:identifier:reevaluate:](self, "insertRamp:identifier:reevaluate:", a3, a4, 1, a4, a3, a2, self);
}

- (void)insertRamp:(id)a3 identifier:(id)a4 reevaluate:(BOOL)a5
{
  uint64_t inited;
  NSObject *logHandle;
  BOOL v7;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a5;
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v11, (uint64_t)a4, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Insert ramp: %@ | %@", v11, 0x16u);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_ramps, "setObject:forKeyedSubscript:", a3, a4);
  if (v7)
    -[CBRampManager reevaluateClocking](self, "reevaluateClocking");
}

- (void)startRamps
{
  -[CBRampManager reevaluateClocking](self, "reevaluateClocking", a2, self);
}

- (id)insertNewRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7 progressCallback:(id)a8
{
  return -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](self, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 1, a7, a8, *(double *)&a3, *(double *)&a4, *(double *)&a5, *(double *)&a6, a8, a7, __PAIR64__(LODWORD(a5), LODWORD(a6)), __PAIR64__(LODWORD(a3), LODWORD(a4)), a2, self);
}

- (id)insertNewRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 startRamp:(BOOL)a7 identifier:(id)a8 progressCallback:(id)a9
{
  CBRamp *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CBRamp *v15;
  BOOL v18;

  v18 = a7;
  v9 = [CBRamp alloc];
  *(float *)&v10 = a3;
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  *(float *)&v13 = a6;
  v15 = -[CBRamp initWithOrigin:target:length:frequency:identifier:](v9, "initWithOrigin:target:length:frequency:identifier:", a8, v10, v11, v12, v13);
  -[CBRamp setRampProgressCallback:](v15, "setRampProgressCallback:", a9);
  -[CBRampManager insertRamp:identifier:reevaluate:](self, "insertRamp:identifier:reevaluate:", v15, a8, v18);

  return v15;
}

- (id)insertNewLinearRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7
{
  return -[CBRampManager insertNewLinearRampOrigin:target:length:frequency:startRamp:identifier:](self, "insertNewLinearRampOrigin:target:length:frequency:startRamp:identifier:", 1, a7, *(double *)&a3, *(double *)&a4, *(double *)&a5, *(double *)&a6);
}

- (id)insertNewLinearRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 startRamp:(BOOL)a7 identifier:(id)a8
{
  id v9;
  BOOL v11;

  v11 = a7;
  v9 = +[CBRamp newLinearRampWithWithOrigin:target:length:frequency:identifier:](CBRamp, "newLinearRampWithWithOrigin:target:length:frequency:identifier:", a8, *(double *)&a3, *(double *)&a4, *(double *)&a5, *(double *)&a6);
  -[CBRampManager insertRamp:identifier:reevaluate:](self, "insertRamp:identifier:reevaluate:", v9, a8, v11);

  return v9;
}

- (void)removeRampWithIdentifier:(id)a3
{
  NSObject *queue;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CBRampManager *v11;
  os_log_type_t v12;
  os_log_t v13;
  id v14;
  SEL v15;
  CBRampManager *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = 0;
  if (self->_logHandle)
  {
    logHandle = v16->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v13 = logHandle;
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, -[NSMutableDictionary objectForKey:](v16->_ramps, "objectForKey:", v14), (uint64_t)v14);
    _os_log_impl(&dword_1B5291000, v13, v12, "Remove ramp: %@ | %@", v17, 0x16u);
  }
  -[NSMutableDictionary removeObjectForKey:](v16->_ramps, "removeObjectForKey:", v14);
  if (-[NSMutableDictionary count](v16->_ramps, "count"))
  {
    queue = v16->_queue;
    block = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __42__CBRampManager_removeRampWithIdentifier___block_invoke;
    v10 = &unk_1E68E9E60;
    v11 = v16;
    dispatch_async(queue, &block);
  }
  else
  {
    v16->_requiredFrequency = 0.0;
    -[CBRampManager disableClocking](v16, "disableClocking");
  }
}

uint64_t __42__CBRampManager_removeRampWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reevaluateClocking", a1, a1);
}

- (void)removeAllRamps
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v5, -[NSMutableDictionary count](self->_ramps, "count"));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Stop all ramps (%lu ongoing)", v5, 0xCu);
  }
  -[NSMutableDictionary removeAllObjects](self->_ramps, "removeAllObjects");
  self->_requiredFrequency = 0.0;
  -[CBRampManager disableClocking](self, "disableClocking");
}

- (BOOL)hasRampRunningForIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_ramps, "objectForKey:", a3) != 0;
}

- (BOOL)hasAnyActiveRamp
{
  return -[NSMutableDictionary count](self->_ramps, "count", a2, self) != 0;
}

- (void)enableClocking
{
  double v2;

  if (self->_liveUpdates)
  {
    if (self->_enableFrameSynchronisation)
    {
      *(float *)&v2 = self->_requiredFrequency;
      -[CBFrameLink setPreferredFramesPerSecond:](self->_frameLink, "setPreferredFramesPerSecond:", v2);
      -[CBFrameLink resume](self->_frameLink, "resume");
    }
    else
    {
      -[CBRampManager setTimer](self, "setTimer");
    }
  }
  else
  {
    -[CBRampManager generateRamp](self, "generateRamp");
  }
}

- (void)disableClocking
{
  if (self->_enableFrameSynchronisation)
    -[CBFrameLink pause](self->_frameLink, "pause");
  else
    -[CBRampManager stopTimer](self, "stopTimer");
}

- (void)setTimer
{
  float v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  CBRampManager *v12;
  dispatch_block_t aBlock;
  uint64_t handler;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  OS_dispatch_source *v19;
  os_log_type_t v20;
  os_log_t v21;
  OS_dispatch_source *clockTimer;
  float v23;
  SEL v24;
  CBRampManager *v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = self;
  v24 = a2;
  if (!self->_queue)
    __assert_rtn("-[CBRampManager setTimer]", "CBRampManager.m", 288, "_queue");
  v23 = 0.0;
  v2 = 1.0 / v25->_requiredFrequency;
  v23 = v2;
  if (v25->_clockTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)v25->_clockTimer, 0, (unint64_t)(float)(v23 * 1000000000.0), 0);
  }
  else
  {
    v25->_clockTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v25->_queue);
    if (!v25->_clockTimer)
      __assert_rtn("-[CBRampManager setTimer]", "CBRampManager.m", 296, "_clockTimer");
    clockTimer = 0;
    clockTimer = v25->_clockTimer;
    v21 = 0;
    if (v25->_logHandle)
    {
      logHandle = v25->_logHandle;
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
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v26, COERCE__INT64(v23), COERCE__INT64(v25->_requiredFrequency));
      _os_log_impl(&dword_1B5291000, v21, v20, "Setting timer with %f interval (%f Hz)", v26, 0x16u);
    }
    dispatch_source_set_timer((dispatch_source_t)v25->_clockTimer, 0, (unint64_t)(float)(v23 * 1000000000.0), 0);
    v3 = v25->_clockTimer;
    v4 = MEMORY[0x1E0C809B0];
    handler = MEMORY[0x1E0C809B0];
    v15 = -1073741824;
    v16 = 0;
    v17 = __25__CBRampManager_setTimer__block_invoke;
    v18 = &unk_1E68E9E60;
    v19 = clockTimer;
    dispatch_source_set_cancel_handler(v3, &handler);
    aBlock = 0;
    block = v4;
    v8 = -1073741824;
    v9 = 0;
    v10 = __25__CBRampManager_setTimer__block_invoke_2;
    v11 = &unk_1E68E9E60;
    v12 = v25;
    aBlock = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, &block);
    if (!aBlock)
      __assert_rtn("-[CBRampManager setTimer]", "CBRampManager.m", 312, "timerBlock");
    dispatch_source_set_event_handler((dispatch_source_t)v25->_clockTimer, aBlock);
    _Block_release(aBlock);
    dispatch_resume((dispatch_object_t)v25->_clockTimer);
  }
}

void __25__CBRampManager_setTimer__block_invoke(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t __25__CBRampManager_setTimer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerClockHandler", a1, a1);
}

- (void)stopTimer
{
  if (self->_clockTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_clockTimer);
    self->_clockTimer = 0;
  }
}

- (void)timerClockHandler
{
  -[CBRampManager updateRampsForTimestamp:](self, "updateRampsForTimestamp:", (double)mach_absolute_time() * self->_sMachTimebaseFactor);
}

- (void)generateRamp
{
  NSMutableDictionary *ramps;
  uint64_t inited;
  NSObject *logHandle;
  int i;
  double v6;
  float v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  float *v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  float *v22;
  int v23;
  int v24;
  int v25;
  SEL v26;
  CBRampManager *v27;
  uint8_t v28[40];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = self;
  v26 = a2;
  v21 = 0;
  v22 = (float *)&v21;
  v23 = 0x20000000;
  v24 = 32;
  v25 = 0;
  v16 = 0;
  v17 = (float *)&v16;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 0;
  ramps = self->_ramps;
  v9 = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __29__CBRampManager_generateRamp__block_invoke;
  v13 = &unk_1E68EB290;
  v14 = &v21;
  v15 = &v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](ramps, "enumerateKeysAndObjectsUsingBlock:", &v9);
  v8 = (int)(ceil((float)(v22[6] * v17[6])) + 1.0);
  v7 = 1.0 / v17[6];
  if (v27->_logHandle)
  {
    logHandle = v27->_logHandle;
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
    __os_log_helper_16_0_4_8_0_8_0_4_0_8_0((uint64_t)v28, COERCE__INT64(v17[6]), COERCE__INT64(v22[6]), v8, COERCE__INT64(v7));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Frequency: %f, transition time: %f, N updates: %d, Portion: %f", v28, 0x26u);
  }
  v6 = (double)mach_absolute_time() * v27->_sMachTimebaseFactor;
  for (i = 0; i < v8; ++i)
    -[CBRampManager updateRampsForTimestamp:](v27, "updateRampsForTimestamp:", v6 + (float)(v7 * (float)i));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v21, 8);
}

uint64_t __29__CBRampManager_generateRamp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float v3;
  double v4;
  int v5;
  uint64_t result;
  float v7;
  double v8;
  int v9;
  float v10;
  float v12;

  v12 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(a3, "length");
  v3 = *(float *)&v4;
  *(float *)&v4 = v12;
  if (v12 < v3)
  {
    objc_msgSend(a3, "length", v4);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  }
  v10 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(a3, "frequency");
  v7 = *(float *)&v8;
  *(float *)&v8 = v10;
  if (v10 < v7)
  {
    result = objc_msgSend(a3, "frequency", v8);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  }
  return result;
}

- (void)updateRampsForTimestamp:(double)a3
{
  NSMutableDictionary *ramps;
  NSMutableDictionary *v4;
  os_log_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  CBRampManager *v15;
  os_log_type_t v16;
  os_log_t oslog;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t, uint64_t, void *);
  void *v22;
  id v23;
  os_log_type_t v24;
  os_log_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t (*v29)(uint64_t, uint64_t, void *);
  void *v30;
  double v31;
  id v32;
  double v33;
  SEL v34;
  CBRampManager *v35;
  uint8_t v36[16];
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35 = self;
  v34 = a2;
  v33 = a3;
  if (-[NSMutableDictionary count](self->_ramps, "count"))
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    ramps = v35->_ramps;
    v26 = MEMORY[0x1E0C809B0];
    v27 = -1073741824;
    v28 = 0;
    v29 = __41__CBRampManager_updateRampsForTimestamp___block_invoke;
    v30 = &__block_descriptor_40_e23_v32__0_8__CBRamp_16_B24l;
    v31 = v33;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](ramps, "enumerateKeysAndObjectsUsingBlock:", &v26);
    v25 = 0;
    if (v35->_logHandle)
    {
      logHandle = v35->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v25 = logHandle;
    v24 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v35->_ramps);
      _os_log_debug_impl(&dword_1B5291000, v25, v24, "ramps clocked: %@", v37, 0xCu);
    }
    (*((void (**)(void))v35->_clockHandler + 2))();
    v4 = v35->_ramps;
    v18 = MEMORY[0x1E0C809B0];
    v19 = -1073741824;
    v20 = 0;
    v21 = __41__CBRampManager_updateRampsForTimestamp___block_invoke_19;
    v22 = &unk_1E68EB2D8;
    v23 = v32;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", &v18);
    if (objc_msgSend(v32, "count"))
    {
      oslog = 0;
      if (v35->_logHandle)
      {
        v7 = v35->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v6 = init_default_corebrightness_log();
        v7 = v6;
      }
      oslog = v7;
      v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v5 = oslog;
        __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)v32);
        _os_log_impl(&dword_1B5291000, oslog, v16, "Finished ramps %@", v36, 0xCu);
      }
    }
    v10 = MEMORY[0x1E0C809B0];
    v11 = -1073741824;
    v12 = 0;
    v13 = __41__CBRampManager_updateRampsForTimestamp___block_invoke_20;
    v14 = &unk_1E68EA068;
    v15 = v35;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", &v10, v5);

    if (!-[NSMutableDictionary count](v35->_ramps, "count"))
      (*((void (**)(void))v35->_rampDoneCallback + 2))();
  }
}

uint64_t __41__CBRampManager_updateRampsForTimestamp___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "clockRamp:", *(double *)(a1 + 32));
}

uint64_t __41__CBRampManager_updateRampsForTimestamp___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isFinished");
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

uint64_t __41__CBRampManager_updateRampsForTimestamp___block_invoke_20(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRampWithIdentifier:", a2);
}

- (float)remainingLength
{
  NSMutableDictionary *ramps;
  float v4;
  uint64_t v5;
  int v6;
  int v7;
  float (*v8)(uint64_t, uint64_t, void *);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  float *v12;
  int v13;
  int v14;
  int v15;
  SEL v16;
  CBRampManager *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = (float *)&v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  if (-[CBRampManager hasAnyActiveRamp](self, "hasAnyActiveRamp"))
  {
    ramps = v17->_ramps;
    v5 = MEMORY[0x1E0C809B0];
    v6 = -1073741824;
    v7 = 0;
    v8 = __32__CBRampManager_remainingLength__block_invoke;
    v9 = &unk_1E68EB268;
    v10 = &v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](ramps, "enumerateKeysAndObjectsUsingBlock:", &v5);
  }
  v4 = v12[6];
  _Block_object_dispose(&v11, 8);
  return v4;
}

float __32__CBRampManager_remainingLength__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float result;
  float v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if ((objc_msgSend(a3, "isFinished") & 1) == 0)
  {
    objc_msgSend(a3, "length");
    v8 = v4;
    objc_msgSend(a3, "currentTimestamp");
    v7 = v5;
    objc_msgSend(a3, "startTime");
    result = v8 - (v7 - v6);
    if (result > *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

- (id)rampForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_ramps, "objectForKeyedSubscript:", a3);
}

- (id)copyStatusInfo
{
  double v2;
  void *v4;
  void *context;
  id v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  v8[0] = CFSTR("Ramps");
  v9[0] = -[NSMutableDictionary description](self->_ramps, "description");
  v8[1] = CFSTR("Frequency");
  *(float *)&v2 = self->_requiredFrequency;
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v4 = (void *)objc_msgSend(v6, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  objc_autoreleasePoolPop(context);
  return v4;
}

+ (id)className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)clockHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setClockHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (id)rampDoneCallback
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setRampDoneCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)enableFrameSynchronisation
{
  return self->_enableFrameSynchronisation;
}

- (BOOL)liveUpdates
{
  return self->_liveUpdates;
}

- (void)setLiveUpdates:(BOOL)a3
{
  self->_liveUpdates = a3;
}

@end
