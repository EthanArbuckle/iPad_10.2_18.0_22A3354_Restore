@implementation CBGrimaldiModule

- (id)copyParam:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[7];
  os_log_type_t v9;
  NSObject *v10;
  id v11;
  SEL v12;
  CBGrimaldiModule *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("lux")) & 1) != 0)
    return -[CBGrimaldiModule copyRearLux](v13, "copyRearLux");
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("GainChanged")) & 1) != 0)
    return -[CBGrimaldiModule copyGainChanged](v13, "copyGainChanged");
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("StrobeCoex")) & 1) != 0)
    return -[CBGrimaldiModule copyStrobeCoex](v13, "copyStrobeCoex");
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("JasperCoex")) & 1) != 0)
    return -[CBGrimaldiModule copyJasperCoex](v13, "copyJasperCoex");
  v10 = 0;
  if (v13->super._logHandle)
  {
    logHandle = v13->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v10 = logHandle;
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1B5291000, log, type, "Unsupported key! Exiting...", v8, 2u);
  }
  return 0;
}

- (id)copyReliableLux
{
  NSNumber *v2;
  NSNumber *v4;
  uint64_t v5;
  uint64_t v6;
  NSNumber *lastLux;

  lastLux = self->_lastLux;
  if (!self->_coexJasper && !self->_coexStrobe)
  {
    v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("absolutetime")), "longValue");
    v5 = mach_absolute_time();
    if (convertMachToNanoSeconds(v5 - v6) / 0xF4240uLL >= 0x1388)
      v4 = 0;
    else
      v4 = (NSNumber *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("lux")), "copy");
    lastLux = v4;

    self->_lastLux = v4;
  }
  v2 = lastLux;
  return lastLux;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  float v4;
  float v5;
  double v6;
  double v7;
  float v8;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  uint8_t v23[15];
  os_log_type_t v24;
  os_log_t oslog;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  os_log_type_t v30;
  os_log_t v31;
  float v32;
  os_log_type_t v33;
  os_log_t v34;
  os_log_type_t v35;
  os_log_t v36;
  os_log_type_t v37;
  os_log_t v38;
  BOOL v39;
  BOOL v40;
  BOOL v41;
  char v42;
  uint64_t v43;
  unsigned __int8 v44;
  float v45;
  float v46;
  id v47;
  id v48;
  SEL v49;
  CBGrimaldiModule *v50;
  uint8_t v51[16];
  uint8_t v52[16];
  uint8_t v53[16];
  uint8_t v54[56];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v50 = self;
  v49 = a2;
  v48 = a3;
  v47 = a4;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("RLuxOverride")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50->_overriding = 1;
      context = (void *)MEMORY[0x1B5E4A8B0]();
      objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("lux")), "floatValue");
      v46 = v4;
      objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("gain")), "floatValue");
      v45 = v5;
      v44 = objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("numsamples")), "integerValue");
      v43 = objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("absolutetime")), "longValue");
      v42 = objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("coexflags")), "integerValue");
      v41 = (v42 & 1) != 0;
      v40 = (v42 & 2) != 0;
      v39 = (v42 & 4) != 0;
      v38 = 0;
      if (v50->super._logHandle)
      {
        logHandle = v50->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v38 = logHandle;
      v37 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_7_8_0_8_0_4_0_8_0_4_0_4_0_4_0((uint64_t)v54, COERCE__INT64(v46), COERCE__INT64(v45), v44, v43, v41, v40, v39);
        _os_log_debug_impl(&dword_1B5291000, v38, v37, "rLux: %f, gain: %f, numSamples: %d, rLuxAbsoluteTime: %llu, StrobeOn? %d JasperOn? %d GainChange? %d", v54, 0x38u);
      }

      v50->_overriddenInput = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      *(float *)&v6 = v46;
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("lux"));
      *(float *)&v7 = v45;
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7), CFSTR("gain"));
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v44), CFSTR("numsamples"));
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v43), CFSTR("absolutetime"));
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v41), CFSTR("StrobeCoex"));
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v40), CFSTR("JasperCoex"));
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39), CFSTR("GainChanged"));
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0), CFSTR("status"));
      v36 = 0;
      if (v50->super._logHandle)
      {
        v19 = v50->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v18 = init_default_corebrightness_log();
        v19 = v18;
      }
      v36 = v19;
      v35 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v50->_overriddenInput);
        _os_log_impl(&dword_1B5291000, v36, v35, "Overridden input dict: %@", v53, 0xCu);
      }
      objc_autoreleasePoolPop(context);
    }
  }
  else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("RLuxOverrideEnabled")) & 1) != 0)
  {
    v50->_overriding = objc_msgSend(v48, "BOOLValue") & 1;
    v34 = 0;
    if (v50->super._logHandle)
    {
      v17 = v50->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v16 = init_default_corebrightness_log();
      v17 = v16;
    }
    v34 = v17;
    v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v52, v50->_overriding);
      _os_log_impl(&dword_1B5291000, v34, v33, "Setting rLuxOverride to %d", v52, 8u);
    }
  }
  else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("RLuxSampleWithMaxAge")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v48, "floatValue");
      v32 = v8;
      v31 = 0;
      if (v50->super._logHandle)
      {
        v15 = v50->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v14 = init_default_corebrightness_log();
        v15 = v14;
      }
      v31 = v15;
      v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v51, COERCE__INT64(v32));
        _os_log_impl(&dword_1B5291000, v31, v30, "Requesting Sample with age < %f", v51, 0xCu);
      }
      v29 = 0;
      if (-[NSDictionary objectForKeyedSubscript:](v50->_lastRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("absolutetime")))
      {
        v28 = 0;
        v28 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v50->_lastRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("absolutetime")), "longValue");
        v27 = mach_absolute_time();
        v26 = convertMachToNanoSeconds(v27 - v28) / 0xF4240uLL;
        v29 = (float)v26 < (float)(v32 * 1000.0);
      }
      if (v29)
      {
        -[CBGrimaldiModule sendNotificationForKey:withValue:](v50, "sendNotificationForKey:withValue:", CFSTR("RLuxOutput"), v50->_lastRLuxOutputDict);
      }
      else
      {
        oslog = 0;
        if (v50->super._logHandle)
        {
          v13 = v50->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v12 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v12 = init_default_corebrightness_log();
          v13 = v12;
        }
        oslog = v13;
        v24 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v10 = oslog;
          v11 = v24;
          __os_log_helper_16_0_0(v23);
          _os_log_impl(&dword_1B5291000, v10, v11, "Grimaldi: no sample. Sarting single sampling", v23, 2u);
        }
        -[CBGrimaldiModule startSingleSample](v50, "startSingleSample", v10);
      }
    }
  }
  return 0;
}

- (void)startSingleSample
{
  double v2;

  LODWORD(v2) = 1.0;
  -[CBGrimaldiModule startWithFrequency:singleSample:](self, "startWithFrequency:singleSample:", 1, v2, a2, self);
}

- (void)startWithFrequency:(float)a3 singleSample:(BOOL)a4
{
  float v4;

  v4 = a3;
  if (a4)
    self->_sampleOnce = 1;
  else
    self->_sampleMultiple = 1;
  if (!self->_started)
  {
    if (a3 <= 0.0)
      v4 = 1.0;
    self->_samplingTime = (unint64_t)(float)(1000000000.0 / v4);
    self->_started = 1;
    -[CBGrimaldiModule timerCallback](self, "timerCallback");
  }
}

- (void)clearOutput
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  char v7;
  NSObject *v8;
  SEL v9;
  CBGrimaldiModule *v10;

  v10 = self;
  v9 = a2;
  -[NSMutableDictionary removeAllObjects](self->_currentRLuxOutputDict, "removeAllObjects");
  v8 = 0;
  if (v10->super._logHandle)
  {
    logHandle = v10->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v8 = logHandle;
  v7 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_1B5291000, log, type, "Grimaldi: cleared output", v6, 2u);
  }

  v10->_lastLux = 0;
}

- (void)stop
{
  if (!self->_sampleOnce)
    self->_started = 0;
  self->_sampleMultiple = 0;
  self->_samplingTime = 0;
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RLuxOutput")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && a4 != self->_lastRLuxOutputDict)
    {

      self->_lastRLuxOutputDict = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", a4);
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a4);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "RearLuxOutput %@", v8, 0xCu);
      }
    }
  }
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (void)setGrimaldiLux
{
  CBGrimaldiEventSource *eventSource;
  OS_dispatch_queue *queue;
  uint64_t currentNumSamples;
  uint64_t v5;
  NSObject *v6;
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  CBGrimaldiModule *v17;
  os_signpost_id_t v18;
  uint8_t v19[8];
  os_signpost_id_t v20;
  char v21;
  os_log_t v22;
  os_signpost_id_t v23;
  int v24;
  SEL v25;
  CBGrimaldiModule *v26;
  uint8_t v27[8];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = self;
  v25 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  v24 = 0;
  v23 = 0;
  v23 = os_signpost_id_generate((os_log_t)v26->super._logHandle);
  v22 = 0;
  if (v26->super._logHandle)
  {
    logHandle = v26->super._logHandle;
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
  v21 = 1;
  v20 = v23;
  if (v23 && v20 != -1 && os_signpost_enabled(v22))
  {
    log = v22;
    type = v21;
    spid = v20;
    __os_log_helper_16_0_0(v19);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "Grimaldi APDSCallback", (const char *)&unk_1B546AB41, v19, 2u);
  }
  eventSource = v26->_eventSource;
  queue = v26->super._queue;
  currentNumSamples = v26->_currentNumSamples;
  v12 = MEMORY[0x1E0C809B0];
  v13 = -1073741824;
  v14 = 0;
  v15 = __34__CBGrimaldiModule_setGrimaldiLux__block_invoke;
  v16 = &unk_1E68EBE28;
  v17 = v26;
  v18 = v23;
  v24 = -[CBGrimaldiEventSource requestEventOn:withNsamples:withCallback:](eventSource, "requestEventOn:withNsamples:withCallback:", queue, currentNumSamples, &v12);
  if (v24)
  {
    if (v26->super._logHandle)
    {
      v6 = v26->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v5 = init_default_corebrightness_log();
      v6 = v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v27, v24);
      _os_log_error_impl(&dword_1B5291000, v6, OS_LOG_TYPE_ERROR, "eventSource::requestEventOn returned %d", v27, 8u);
    }
  }
}

- (CBGrimaldiModule)initWithQueue:(id)a3 andEventSource:(id)a4 andSamplingStrategy:(id)a5
{
  os_log_t v5;
  dispatch_queue_t v6;
  id v7;
  id v8;
  NSObject *v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint64_t block;
  int v32;
  int v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  os_log_type_t v37;
  os_log_t v38;
  uint8_t v39[7];
  os_log_type_t v40;
  NSObject *v41;
  uint8_t v42[7];
  os_log_type_t v43;
  NSObject *v44;
  uint8_t v45[7];
  char v46;
  NSObject *v47;
  uint8_t v48[7];
  char v49;
  NSObject *v50;
  objc_super v51;
  id v52;
  id v53;
  id v54;
  SEL v55;
  id v56;
  uint8_t v58[24];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v56 = self;
  v55 = a2;
  v54 = a3;
  v53 = a4;
  v52 = a5;
  v51.receiver = self;
  v51.super_class = (Class)CBGrimaldiModule;
  v56 = -[CBModule initWithQueue:](&v51, sel_initWithQueue_, a3);
  if (v56)
  {
    v5 = os_log_create((const char *)CBGrimaldiModuleName, "default");
    *((_QWORD *)v56 + 2) = v5;
    if (!*((_QWORD *)v56 + 2))
    {
      v50 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v50 = inited;
      v49 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = v50;
        type = v49;
        __os_log_helper_16_0_0(v48);
        _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v48, 2u);
      }
      goto LABEL_50;
    }
    if ((CBU_DeviceHasGrimaldi() & 1) == 0)
    {
LABEL_50:

      return 0;
    }
    v6 = dispatch_queue_create((const char *)CBGrimaldiModuleName, 0);
    *((_QWORD *)v56 + 15) = v6;
    if (!*((_QWORD *)v56 + 15))
    {
      v47 = 0;
      if (*((_QWORD *)v56 + 2))
      {
        v27 = *((_QWORD *)v56 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v26 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v26 = init_default_corebrightness_log();
        v27 = v26;
      }
      v47 = v27;
      v46 = 16;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v24 = v47;
        v25 = v46;
        __os_log_helper_16_0_0(v45);
        _os_log_error_impl(&dword_1B5291000, v24, v25, "Failed to create dispatch queue", v45, 2u);
      }
      goto LABEL_50;
    }
    *((double *)v56 + 10) = 1.0;
    if (!v53)
    {
      v44 = 0;
      if (*((_QWORD *)v56 + 2))
      {
        v23 = *((_QWORD *)v56 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v22 = init_default_corebrightness_log();
        v23 = v22;
      }
      v44 = v23;
      v43 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v44;
        v21 = v43;
        __os_log_helper_16_0_0(v42);
        _os_log_impl(&dword_1B5291000, v20, v21, "Event Source is nil", v42, 2u);
      }
      goto LABEL_50;
    }
    v7 = v53;
    *((_QWORD *)v56 + 13) = v7;
    if (!v52)
    {
      v41 = 0;
      if (*((_QWORD *)v56 + 2))
      {
        v19 = *((_QWORD *)v56 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v18 = init_default_corebrightness_log();
        v19 = v18;
      }
      v41 = v19;
      v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v41;
        v17 = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_impl(&dword_1B5291000, v16, v17, "Sampling Strategy is nil", v39, 2u);
      }
      goto LABEL_50;
    }
    v8 = v52;
    *((_QWORD *)v56 + 14) = v8;
    v38 = 0;
    if (*((_QWORD *)v56 + 2))
    {
      v15 = *((_QWORD *)v56 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v14 = init_default_corebrightness_log();
      v15 = v14;
    }
    v38 = v15;
    v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v58, *((_QWORD *)v56 + 14), *((_QWORD *)v56 + 13));
      _os_log_impl(&dword_1B5291000, v38, v37, "Grimaldi init: %@, %@", v58, 0x16u);
    }
    v9 = *((_QWORD *)v56 + 15);
    block = MEMORY[0x1E0C809B0];
    v32 = -1073741824;
    v33 = 0;
    v34 = __69__CBGrimaldiModule_initWithQueue_andEventSource_andSamplingStrategy___block_invoke;
    v35 = &unk_1E68E9E60;
    v36 = v56;
    dispatch_async(v9, &block);
    *((_BYTE *)v56 + 128) = 1;
    *((_BYTE *)v56 + 129) = 0;
    v10 = objc_msgSend(v52, "getInitialNumberOfSamples");
    *((_BYTE *)v56 + 96) = v10;
    *((_BYTE *)v56 + 100) = 0;
    *((_BYTE *)v56 + 101) = 0;
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v56 + 4) = v11;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("lux"), CFSTR("gain"), CFSTR("absoluteTime"), CFSTR("numSamples"), CFSTR("StrobeCoex"), CFSTR("JasperCoex"), 0);
    *((_QWORD *)v56 + 8) = v12;
  }
  return (CBGrimaldiModule *)v56;
}

void __69__CBGrimaldiModule_initWithQueue_andEventSource_andSamplingStrategy___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint64_t block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  _QWORD v12[3];

  v12[2] = a1;
  v12[1] = a1;
  v12[0] = 0;
  v11 = 0;
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "getGlobalCorrectionFactor:", v12);
  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __69__CBGrimaldiModule_initWithQueue_andEventSource_andSamplingStrategy___block_invoke_2;
  v7 = &unk_1E68EAAA8;
  v10 = v11;
  v9 = v12[0];
  v8 = *(_QWORD *)(a1 + 32);
  dispatch_sync(v1, &block);
}

void __69__CBGrimaldiModule_initWithQueue_andEventSource_andSamplingStrategy___block_invoke_2(uint64_t a1)
{
  uint64_t inited;
  NSObject *v2;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(a1 + 48) && *(double *)(a1 + 40) > 0.5)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v2 = inited;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(a1 + 40));
    _os_log_impl(&dword_1B5291000, v2, OS_LOG_TYPE_DEFAULT, "Grimaldi init: correction factor = %f (found %f)", v4, 0x16u);
  }
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBGrimaldiModule *v4;

  v4 = self;
  v3 = a2;

  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBGrimaldiModule;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (void)start
{
  double v2;

  LODWORD(v2) = 1.0;
  -[CBGrimaldiModule startWithFrequency:](self, "startWithFrequency:", v2, a2, self);
}

- (void)startWithFrequency:(float)a3
{
  -[CBGrimaldiModule startWithFrequency:singleSample:](self, "startWithFrequency:singleSample:", 0, *(double *)&a3);
}

- (id)copyPropertyForKey:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  void *v10;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "copyPropertyForKey called with key: %@", v15, 0xCu);
  }
  v10 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RLuxOutput")) & 1) != 0)
  {
    if (self->super._logHandle)
    {
      v7 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)self->_currentRLuxOutputDict);
      _os_log_debug_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEBUG, "copyPropertyForKey returning value: %@", v14, 0xCu);
    }
    return (id)-[NSMutableDictionary copy](self->_currentRLuxOutputDict, "copy");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RLuxOverride")) & 1) != 0 && self->_overriding)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_overriddenInput, 1);
    if (self->super._logHandle)
    {
      v5 = self->super._logHandle;
    }
    else
    {
      v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)self->_overriddenInput);
      _os_log_debug_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEBUG, "copyPropertyForKey returning value: %@", v13, 0xCu);
    }
  }
  return v10;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)registerNotificationBlock:(id)a3
{
  -[CBGrimaldiModule unregisterNotificationBlock](self, "unregisterNotificationBlock");
  if (a3)
    self->super._notificationBlock = _Block_copy(a3);
}

- (void)unregisterNotificationBlock
{
  if (self->super._notificationBlock)
  {
    _Block_release(self->super._notificationBlock);
    self->super._notificationBlock = 0;
  }
}

- (void)timerCallback
{
  dispatch_time_t v2;
  NSObject *queue;
  uint64_t block;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CBGrimaldiModule *v9;
  SEL v10;
  CBGrimaldiModule *v11;

  v11 = self;
  v10 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (v11->_provideLux)
    -[CBGrimaldiModule setGrimaldiLux](v11, "setGrimaldiLux");
  if (!v11->_provideLux && v11->_provideCoex)
    -[CBGrimaldiModule CBAPDSGetCoex](v11, "CBAPDSGetCoex");
  if (v11->_sampleOnce)
    v11->_sampleOnce = 0;
  if (v11->_sampleMultiple)
  {
    if (v11->_started)
    {
      v2 = dispatch_time(0, v11->_samplingTime);
      queue = v11->super._queue;
      block = MEMORY[0x1E0C809B0];
      v5 = -1073741824;
      v6 = 0;
      v7 = __33__CBGrimaldiModule_timerCallback__block_invoke;
      v8 = &unk_1E68E9E60;
      v9 = v11;
      dispatch_after(v2, queue, &block);
    }
    else
    {
      -[CBGrimaldiModule clearOutput](v11, "clearOutput");
    }
  }
  else
  {
    -[CBGrimaldiModule stop](v11, "stop");
  }
}

uint64_t __33__CBGrimaldiModule_timerCallback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerCallback", a1, a1);
}

- (void)grimaldiLuxReceived:(ApplePhotonDetectorServicesLuxInfo *)a3
{
  char *v3;
  float v4;
  float v5;
  float v6;
  float v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *context;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v32[15];
  os_log_type_t v33;
  os_log_t v34;
  id v35;
  BOOL v36;
  char v37;
  float v38;
  BOOL v39;
  char v40;
  int v41;
  uint8_t v42[7];
  os_log_type_t v43;
  os_log_t oslog;
  os_log_type_t v45;
  os_log_t v46;
  id v47;
  os_log_type_t v48;
  os_log_t v49;
  ApplePhotonDetectorServicesLuxInfo *v50;
  SEL v51;
  CBGrimaldiModule *v52;
  uint8_t v53[80];
  uint8_t v54[64];
  uint8_t v55[24];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v52 = self;
  v51 = a2;
  v50 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (v50->var4)
  {
    v49 = 0;
    if (v52->super._logHandle)
    {
      logHandle = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v49 = logHandle;
    v48 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      v3 = mach_error_string(v50->var4);
      __os_log_helper_16_2_1_8_32((uint64_t)v55, (uint64_t)v3);
      _os_log_error_impl(&dword_1B5291000, v49, v48, "Could not get rLuxSamples: %s", v55, 0xCu);
    }
    context = (void *)MEMORY[0x1B5E4A8B0]();
    -[NSMutableDictionary removeAllObjects](v52->_currentRLuxOutputDict, "removeAllObjects");
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50->var4), CFSTR("status"));
    v47 = 0;
    v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v52->_currentRLuxOutputDict);
    -[CBGrimaldiModule sendNotificationForKey:withValue:](v52, "sendNotificationForKey:withValue:", CFSTR("RLuxOutput"), v47);

    objc_autoreleasePoolPop(context);
    return;
  }
  if (v52->_overriding)
  {
    -[CBGrimaldiModule sendNotificationForKey:withValue:](v52, "sendNotificationForKey:withValue:", CFSTR("RLuxOutput"), v52->_overriddenInput);
    -[CBGrimaldiModule sendNotificationForKey:withValue:](v52, "sendNotificationForKey:withValue:", CFSTR("RLuxOverride"), v52->_overriddenInput);
    v46 = 0;
    if (v52->super._logHandle)
    {
      v28 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v27 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v27 = init_default_corebrightness_log();
      v28 = v27;
    }
    v46 = v28;
    v45 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", CFSTR("lux")), "floatValue");
      *(double *)&v26 = v4;
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", CFSTR("gain")), "floatValue");
      __os_log_helper_16_0_7_8_0_8_0_4_0_8_0_4_0_4_0_4_0((uint64_t)v54, v26, COERCE__INT64(v5), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", CFSTR("numsamples")), "intValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", CFSTR("absolutetime")), "longValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:",
                CFSTR("StrobeCoex")),
          "BOOLValue") & 1,
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", CFSTR("JasperCoex")), "BOOLValue") & 1, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", CFSTR("GainChanged")), "BOOLValue") & 1);
      _os_log_debug_impl(&dword_1B5291000, v46, v45, "[Overriding] Rear Lux Dictionary: lux = %f, gain = %f, numSamples= %d, absoluteTime = %ld, StrobeCoex = %d, JasperCoex = %d, GainChanged = %d", v54, 0x38u);
    }
    return;
  }
  if (v50->var5)
  {
    v21 = (void *)MEMORY[0x1B5E4A8B0]();
    if (!v50->var5)
      __assert_rtn("-[CBGrimaldiModule grimaldiLuxReceived:]", "CBGrimaldiModule.m", 709, "luxInfo->numSamples > 0");
    v41 = 0;
    v41 = v50->var5 - 1;
    v40 = 0;
    v40 = v50->var3[v41];
    v52->_coexStrobe = (v40 & 1) != 0;
    v52->_coexJasper = (v40 & 2) != 0;
    v39 = 0;
    v39 = (v50->var3[v50->var5 - 1] & 4) != 0;
    while (1)
    {
      v20 = 0;
      if (v41 - 1 >= 0)
        v20 = (v50->var3[v41] & 4) != 0;
      if (!v20)
        break;
      --v41;
    }
    v38 = 0.0;
    v6 = v50->var0[v41] * v52->_correctionFactor;
    v38 = v6;
    v37 = 0;
    v37 = v50->var3[v41];
    v36 = (v37 & 4) != 0;
    if ((v37 & 4) != 0)
    {
      v35 = -[CBGrimaldiModule copyReliableLux](v52, "copyReliableLux");
      if (!v35)
      {
        v34 = 0;
        if (v52->super._logHandle)
        {
          v19 = v52->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v18 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v18 = init_default_corebrightness_log();
          v19 = v18;
        }
        v34 = v19;
        v33 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v16 = v34;
          v17 = v33;
          __os_log_helper_16_0_0(v32);
          _os_log_error_impl(&dword_1B5291000, v16, v17, "First sample received with gainChange=1 and no reliable lux is available", v32, 2u);
        }
        goto LABEL_59;
      }
      objc_msgSend(v35, "floatValue");
      v38 = v7;
    }
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v52->_coexStrobe), CFSTR("StrobeCoex"));
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v52->_coexJasper), CFSTR("JasperCoex"));
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50->var4), CFSTR("status"));
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v50->var5), CFSTR("numsamples"));
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v50->var2[v41]), CFSTR("absolutetime"));
    *(float *)&v8 = v38;
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8), CFSTR("lux"));
    *(float *)&v9 = v50->var1[v41];
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9), CFSTR("gain"));
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39), CFSTR("GainChanged"));
    -[CBGrimaldiModule sendNotificationForKey:withValue:](v52, "sendNotificationForKey:withValue:", CFSTR("RLuxOutput"), (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v52->_currentRLuxOutputDict));
    if (v52->super._logHandle)
    {
      v15 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v14 = init_default_corebrightness_log();
      v15 = v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("lux")), "floatValue");
      *(double *)&v13 = v11;
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("gain")), "floatValue");
      __os_log_helper_16_0_9_8_0_8_0_4_0_8_0_4_0_4_0_4_0_4_0_4_0((uint64_t)v53, v13, COERCE__INT64(v12), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("numsamples")), "intValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("absolutetime")), "longValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:",
                CFSTR("StrobeCoex")),
          "BOOLValue") & 1,
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("JasperCoex")), "BOOLValue") & 1, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("GainChanged")), "BOOLValue") & 1, v41 + 1, v50->var5);
      _os_log_debug_impl(&dword_1B5291000, v15, OS_LOG_TYPE_DEBUG, "Rear Lux Dictionary: lux = %f, gain = %f, numSamples= %d, absoluteTime = %ld, StrobeCoex = %d, JasperCoex = %d, GainChanged = %d (sample %d/%d)", v53, 0x44u);
    }
    *(float *)&v10 = v38;
    v52->_currentNumSamples = -[CBGrimaldiSamplingStrategy getNextNumberOfSamplesFromNewLux:withLastLux:](v52->_samplingStrategy, "getNextNumberOfSamplesFromNewLux:withLastLux:", v52->_lastLux, v10);
LABEL_59:
    objc_autoreleasePoolPop(v21);
    return;
  }
  oslog = 0;
  if (v52->super._logHandle)
  {
    v25 = v52->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v24 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v24 = init_default_corebrightness_log();
    v25 = v24;
  }
  oslog = v25;
  v43 = OS_LOG_TYPE_FAULT;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    v22 = oslog;
    v23 = v43;
    __os_log_helper_16_0_0(v42);
    _os_log_fault_impl(&dword_1B5291000, v22, v23, "APDS framework didn't provide the requested sample", v42, 2u);
  }
}

void __34__CBGrimaldiModule_setGrimaldiLux__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *v6;
  uint8_t v8[16];
  os_signpost_id_t v9;
  char v10;
  os_log_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v13 = a2;
  v12 = a1;
  objc_msgSend(*(id *)(a1 + 32), "grimaldiLuxReceived:", a2);
  v11 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v6 = inited;
  }
  v11 = v6;
  v10 = 2;
  v9 = 0;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 && v9 != -1 && os_signpost_enabled(v11))
  {
    log = v11;
    type = v10;
    spid = v9;
    __os_log_helper_16_0_0(v8);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "Grimaldi APDSCallback", (const char *)&unk_1B546AB41, v8, 2u);
  }
}

- (void)CBAPDSGetCoex
{
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_type_t v15;
  os_signpost_id_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v24[7];
  char v25;
  NSObject *v26;
  os_log_type_t v27;
  os_log_t v28;
  os_log_type_t v29;
  os_log_t v30;
  uint8_t v31[16];
  os_signpost_id_t v32;
  char v33;
  os_log_t v34;
  int v35;
  uint8_t v36[8];
  os_signpost_id_t v37;
  char v38;
  os_log_t v39;
  os_signpost_id_t v40;
  int v41;
  SEL v42;
  CBGrimaldiModule *v43;
  uint8_t v44[32];
  uint8_t v45[24];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v43 = self;
  v42 = a2;
  v41 = 0;
  v40 = 0;
  v40 = os_signpost_id_generate((os_log_t)self->super._logHandle);
  v39 = 0;
  if (v43->super._logHandle)
  {
    logHandle = v43->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v39 = logHandle;
  v38 = 1;
  v37 = v40;
  if (v40 && v37 != -1 && os_signpost_enabled(v39))
  {
    log = v39;
    type = v38;
    spid = v37;
    __os_log_helper_16_0_0(v36);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "Grimaldi GetCoexFlags", (const char *)&unk_1B546AB41, v36, 2u);
  }
  v35 = 0;
  v35 = -[CBGrimaldiEventSource getCoexFlags:](v43->_eventSource, "getCoexFlags:", &v41);
  v34 = 0;
  if (v43->super._logHandle)
  {
    v18 = v43->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v17 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v17 = init_default_corebrightness_log();
    v18 = v17;
  }
  v34 = v18;
  v33 = 2;
  v32 = v40;
  if (v40 && v32 != -1 && os_signpost_enabled(v34))
  {
    v14 = v34;
    v15 = v33;
    v16 = v32;
    __os_log_helper_16_0_0(v31);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v14, v15, v16, "Grimaldi GetCoexFlags", (const char *)&unk_1B546AB41, v31, 2u);
  }
  if (v35)
  {
    v26 = 0;
    if (v43->super._logHandle)
    {
      v9 = v43->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v8 = init_default_corebrightness_log();
      v9 = v8;
    }
    v26 = v9;
    v25 = 16;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v6 = v26;
      v7 = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_error_impl(&dword_1B5291000, v6, v7, "Failed to get coex flags using APDSGetCoexFunction.", v24, 2u);
    }
  }
  else
  {
    if (v43->_coexStrobe != (v41 & 1))
    {
      v43->_coexStrobe = (v41 & 1) != 0;
      v30 = 0;
      if (v43->super._logHandle)
      {
        v13 = v43->super._logHandle;
      }
      else
      {
        v12 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v13 = v12;
      }
      v30 = v13;
      v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if ((v41 & 1) != 0)
          v2 = "ON";
        else
          v2 = "OFF";
        if ((v41 & 2) != 0)
          v3 = "ON";
        else
          v3 = "OFF";
        __os_log_helper_16_2_2_8_32_8_32((uint64_t)v45, (uint64_t)v2, (uint64_t)v3);
        _os_log_impl(&dword_1B5291000, v30, v29, "APDSGetCoex: Strobe %s, Lidar %s", v45, 0x16u);
      }
    }
    if (v43->_coexJasper != (v41 & 2))
    {
      v43->_coexJasper = (v41 & 2) != 0;
      v28 = 0;
      if (v43->super._logHandle)
      {
        v11 = v43->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v10 = init_default_corebrightness_log();
        v11 = v10;
      }
      v28 = v11;
      v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if ((v41 & 1) != 0)
          v4 = "ON";
        else
          v4 = "OFF";
        if ((v41 & 2) != 0)
          v5 = "ON";
        else
          v5 = "OFF";
        __os_log_helper_16_2_2_8_32_8_32((uint64_t)v44, (uint64_t)v4, (uint64_t)v5);
        _os_log_impl(&dword_1B5291000, v28, v27, "APDSGetCoex: Strobe %s, Lidar %s", v44, 0x16u);
      }
    }
  }
}

- (id)copyRearLux
{
  if (self->_overriding)
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", CFSTR("lux")), "copy");
  else
    return -[CBGrimaldiModule copyReliableLux](self, "copyReliableLux");
}

- (id)copyGainChanged
{
  if (self->_overriding)
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", CFSTR("GainChanged")), "copy");
  else
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentRLuxOutputDict, "objectForKeyedSubscript:", CFSTR("GainChanged")), "copy");
}

- (id)copyStrobeCoex
{
  if (self->_overriding)
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", CFSTR("StrobeCoex")), "copy");
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_coexStrobe);
}

- (id)copyJasperCoex
{
  if (self->_overriding)
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", CFSTR("JasperCoex")), "copy");
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_coexJasper);
}

- (BOOL)strobeCoex
{
  int coexStrobe;

  if (self->_overriding)
    coexStrobe = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", CFSTR("StrobeCoex")), "BOOLValue") & 1;
  else
    coexStrobe = self->_coexStrobe;
  return coexStrobe != 0;
}

- (BOOL)jasperCoex
{
  int coexJasper;

  if (self->_overriding)
    coexJasper = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", CFSTR("JasperCoex")), "BOOLValue") & 1;
  else
    coexJasper = self->_coexJasper;
  return coexJasper != 0;
}

- (BOOL)provideLux
{
  return self->_provideLux;
}

- (void)setProvideLux:(BOOL)a3
{
  self->_provideLux = a3;
}

- (BOOL)provideCoex
{
  return self->_provideCoex;
}

- (void)setProvideCoex:(BOOL)a3
{
  self->_provideCoex = a3;
}

@end
