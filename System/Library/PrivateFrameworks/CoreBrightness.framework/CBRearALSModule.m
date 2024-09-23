@implementation CBRearALSModule

- (id)copyParam:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("lux")) & 1) != 0)
    return -[CBRearALSModule copyRearLux](self, "copyRearLux");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("GainChanged")) & 1) != 0)
    return -[CBGrimaldiModule copyGainChanged](self->_Grimaldi, "copyGainChanged");
  return -[CBGrimaldiModule copyRearLux](self->_Grimaldi, "copyRearLux");
}

- (id)copyRearLux
{
  float v2;
  double v3;
  uint64_t v4;
  float v5;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t inited;
  NSObject *logHandle;
  float v18;
  CBALSEvent *v19;
  id v20;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  if (self->_providerType == 1 && self->_rearALS)
  {
    if (self->_started)
    {
      if (self->_enableIlluminanceOverride)
      {
        v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_illuminanceOverride);
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
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v26, COERCE__INT64(self->_illuminanceOverride));
          _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Copy overridden rear ALS Lux = %f", v26, 0xCu);
        }
      }
      else if (-[CBRearALSModule isMitigationActive](self, "isMitigationActive"))
      {
        v20 = (id)-[NSNumber copy](self->_lastLux, "copy");
        if (self->super._logHandle)
        {
          v10 = self->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v9 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v9 = init_default_corebrightness_log();
          v10 = v9;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          -[NSNumber floatValue](self->_lastLux, "floatValue");
          __os_log_helper_16_0_1_8_0((uint64_t)v23, COERCE__INT64(v5));
          _os_log_impl(&dword_1B5291000, v10, OS_LOG_TYPE_INFO, "Mitigation is active -> copy last valid rear ALS Lux = %f", v23, 0xCu);
        }
      }
      else
      {
        v19 = -[CBALSNode currentALSEvent](self->_rearALS, "currentALSEvent");
        v18 = mach_time_now_in_seconds();
        if (!v19 || (-[CBHIDEvent timestamp](v19, "timestamp"), vabds_f32(v18, v2) >= 1.0))
        {

          LODWORD(v3) = 1.0;
          v19 = -[CBALSNode copyALSEventWithinTimeout:](self->_rearALS, "copyALSEventWithinTimeout:", v3);
          if (self->super._logHandle)
          {
            v15 = self->super._logHandle;
          }
          else
          {
            v14 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v15 = v14;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v19);
            _os_log_impl(&dword_1B5291000, v15, OS_LOG_TYPE_INFO, "Copied ALS event %@", v25, 0xCu);
          }
        }
        if (v19)
        {
          v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
          -[CBALSEvent illuminance](v19, "illuminance");
          v20 = (id)objc_msgSend(v13, "initWithDouble:");

          self->_lastLux = (NSNumber *)objc_msgSend(v20, "copy");
          if (self->super._logHandle)
          {
            v12 = self->super._logHandle;
          }
          else
          {
            v11 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v12 = v11;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            -[CBALSEvent illuminance](v19, "illuminance");
            __os_log_helper_16_0_1_8_0((uint64_t)v24, v4);
            _os_log_impl(&dword_1B5291000, v12, OS_LOG_TYPE_INFO, "Copy rear ALS Lux = %f", v24, 0xCu);
          }
        }

      }
    }
  }
  else if (self->_providerType == 2 && self->_Grimaldi)
  {
    v20 = -[CBGrimaldiModule copyRearLux](self->_Grimaldi, "copyRearLux");
    if (self->super._logHandle)
    {
      v8 = self->super._logHandle;
    }
    else
    {
      v7 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)v20);
      _os_log_impl(&dword_1B5291000, v8, OS_LOG_TYPE_INFO, "Copy Grimaldi Lux = %@", v22, 0xCu);
    }
  }
  return v20;
}

- (BOOL)isRearALSSupported
{
  BOOL v3;

  v3 = 1;
  if (!self->_Grimaldi)
    return self->_rearALS != 0;
  return v3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  char v5;

  v5 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightnessFactor")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightnessFactorWithFade")) & 1) != 0)
  {
    v5 = -[CBRearALSModule displayBrightnessFactorPropertyHandler:](self, "displayBrightnessFactorPropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AABSensorOverride")) & 1) != 0)
  {
    v5 = -[CBRearALSModule AABSensorOverridePropertyHandler:](self, "AABSensorOverridePropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("RLuxOverride")) & 1) != 0)
  {
    v5 = -[CBRearALSModule rLuxOverridePropertyHandler:](self, "rLuxOverridePropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("RLuxOverrideEnabled")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_enableIlluminanceOverride = objc_msgSend(a3, "BOOLValue") & 1;
      v5 = 1;
    }
  }
  return (v5 & 1 | -[CBGrimaldiModule setProperty:forKey:](self->_Grimaldi, "setProperty:forKey:", a3, a4)) != 0;
}

- (CBRearALSModule)initWithQueue:(id)a3 andGrimaldiFactory:(id)a4
{
  void *v4;
  uint64_t inited;
  NSObject *v7;
  NSObject *log;
  os_log_type_t type;
  NSObject *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  _QWORD *v16;
  _QWORD v17[2];
  int v18;
  int v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  os_log_type_t v23;
  os_log_t v24;
  GrimaldiAPDSEventSource *v25;
  uint8_t v26[15];
  char v27;
  NSObject *v28;
  objc_super v29;
  id v30;
  id v31;
  SEL v32;
  id v33;
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = self;
  v32 = a2;
  v31 = a3;
  v30 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CBRearALSModule;
  v33 = -[CBModule initWithQueue:](&v29, sel_initWithQueue_, a3);
  if (!v33)
    return (CBRearALSModule *)v33;
  *((_QWORD *)v33 + 2) = os_log_create("com.apple.CoreBrightness.AABRear.CBRearALSModule", "default");
  if (*((_QWORD *)v33 + 2))
  {
    *((_QWORD *)v33 + 6) = 0;
    v25 = objc_alloc_init(GrimaldiAPDSEventSource);
    objc_msgSend(v30, "setQueue:", v31);
    objc_msgSend(v30, "setEventSource:", v25);

    *((_QWORD *)v33 + 4) = objc_msgSend(v30, "newInstance");
    v24 = 0;
    if (*((_QWORD *)v33 + 2))
    {
      v7 = *((_QWORD *)v33 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v7 = inited;
    }
    v24 = v7;
    v23 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v35, (uint64_t)v33, *((_QWORD *)v33 + 4));
      _os_log_debug_impl(&dword_1B5291000, v24, v23, "RearALS: obj (%@) initialized with ALS: %@", v35, 0x16u);
    }
    if (*((_QWORD *)v33 + 4))
    {
      *((_QWORD *)v33 + 6) = 2;
      v17[0] = 0;
      v17[1] = v17;
      v18 = 1375731712;
      v19 = 48;
      v20 = __Block_byref_object_copy__4;
      v21 = __Block_byref_object_dispose__4;
      v22 = v33;
      v4 = (void *)*((_QWORD *)v33 + 4);
      v11 = MEMORY[0x1E0C809B0];
      v12 = -1073741824;
      v13 = 0;
      v14 = __52__CBRearALSModule_initWithQueue_andGrimaldiFactory___block_invoke;
      v15 = &unk_1E68EA5E0;
      v16 = v17;
      objc_msgSend(v4, "registerNotificationBlock:", &v11);
      _Block_object_dispose(v17, 8);
    }
    *((_QWORD *)v33 + 5) = 0;
    *((_BYTE *)v33 + 56) = 0;
    *((_BYTE *)v33 + 57) = 1;
    *((_BYTE *)v33 + 58) = 0;
    *((_BYTE *)v33 + 59) = 0;
    *((_BYTE *)v33 + 72) = 0;
    *((float *)v33 + 19) = -1.0;
    *((_QWORD *)v33 + 8) = 0;
    return (CBRearALSModule *)v33;
  }
  v28 = 0;
  if (_COREBRIGHTNESS_LOG_DEFAULT)
    v10 = _COREBRIGHTNESS_LOG_DEFAULT;
  else
    v10 = init_default_corebrightness_log();
  v28 = v10;
  v27 = 16;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    log = v28;
    type = v27;
    __os_log_helper_16_0_0(v26);
    _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v26, 2u);
  }

  return 0;
}

uint64_t __52__CBRearALSModule_initWithQueue_andGrimaldiFactory___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "sendNotificationForKey:withValue:", a2, a3);
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBRearALSModule *v4;

  v4 = self;
  v3 = a2;
  -[CBGrimaldiModule unregisterNotificationBlock](self->_Grimaldi, "unregisterNotificationBlock");

  v4->_lastLux = 0;
  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBRearALSModule;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (void)startSamplingWithFrequency:(float)a3
{
  double v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_started)
  {
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
      __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Start rear ALS with freq %f.", v8, 0xCu);
    }
    *(float *)&v3 = a3;
    -[CBGrimaldiModule startWithFrequency:](self->_Grimaldi, "startWithFrequency:", v3);
    self->_started = 1;
  }
}

- (void)stopSampling
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  SEL v9;
  CBRearALSModule *v10;

  v10 = self;
  v9 = a2;
  if (self->_started)
  {
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
    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v8;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_impl(&dword_1B5291000, log, type, "Stop sampling.", v6, 2u);
    }
    -[CBGrimaldiModule stop](v10->_Grimaldi, "stop");
    v10->_started = 0;

    v10->_lastLux = 0;
  }
}

- (BOOL)isMitigationActive
{
  const char *v2;
  uint64_t inited;
  NSObject *logHandle;
  char v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = -[CBGrimaldiModule strobeCoex](self->_Grimaldi, "strobeCoex");
  if (v6 != self->_strobeCoex)
  {
    self->_strobeCoex = v6 & 1;
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
      if ((v6 & 1) != 0)
        v2 = "activated";
      else
        v2 = "deactivated";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v2);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Strobe mitigation %s.", v8, 0xCu);
    }
  }
  return self->_strobeCoex;
}

- (id)copyPropertyForKey:(id)a3
{
  return -[CBGrimaldiModule copyPropertyForKey:](self->_Grimaldi, "copyPropertyForKey:", a3);
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBGrimaldiModule copyPropertyForKey:withParameter:](self->_Grimaldi, "copyPropertyForKey:withParameter:", a3, a4, a4, a3, a2, self);
}

- (void)stop
{
  -[CBGrimaldiModule stop](self->_Grimaldi, "stop");
  -[CBGrimaldiModule unregisterNotificationBlock](self->_Grimaldi, "unregisterNotificationBlock");
}

- (BOOL)displayBrightnessFactorPropertyHandler:(id)a3
{
  float v3;
  id v5;
  BOOL v6;

  v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (id)objc_msgSend(a3, "objectForKey:", CFSTR("DisplayBrightnessFactor"));
  else
    v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "floatValue");
    if (v3 <= 0.0)
    {
      self->_displayOn = 0;
      if (self->_rearALS)
        -[CBALSNode setReportInterval:](self->_rearALS, "setReportInterval:", 0);

      self->_lastLux = 0;
    }
    else
    {
      self->_displayOn = 1;
      if (self->_rearALS && -[CBALSNode slowIntegrationTime](self->_rearALS, "slowIntegrationTime") > 0)
        -[CBALSNode setReportInterval:](self->_rearALS, "setReportInterval:", -[CBALSNode slowIntegrationTime](self->_rearALS, "slowIntegrationTime"));
    }
    return 1;
  }
  return v6;
}

- (BOOL)rLuxOverridePropertyHandler:(id)a3
{
  float v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_enableIlluminanceOverride = 1;
    objc_msgSend(a3, "objectForKey:", CFSTR("lux"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("lux")), "floatValue");
      self->_illuminanceOverride = v3;
    }
  }
  return 1;
}

- (BOOL)AABSensorOverridePropertyHandler:(id)a3
{
  float v3;
  float v4;
  const char *v5;
  uint64_t v7;
  NSObject *logHandle;
  void *v9;
  void *v10;
  float v11;
  int v12;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v11 = -1.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    v11 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AABSensorOverrideValue"));
      v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AABSensorOverrideOrientation"));
      if (v10)
      {
        objc_msgSend(v10, "floatValue");
        v11 = v4;
      }
      if (v9)
        v12 = objc_msgSend(v9, "intValue");
    }
  }
  if (!v12 || -[CBALSNode orientation](self->_rearALS, "orientation") == v12)
  {
    self->_illuminanceOverride = v11;
    self->_enableIlluminanceOverride = v11 >= 0.0;
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      v7 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v7;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_enableIlluminanceOverride)
        v5 = "enabled";
      else
        v5 = "disabled";
      __os_log_helper_16_2_2_8_0_8_32((uint64_t)v15, COERCE__INT64(v11), (uint64_t)v5);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Override rear ALS samples with value = %f %s.", v15, 0x16u);
    }
  }
  return 1;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t inited;
  NSObject *logHandle;
  CBALSNode *v6;
  char v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if (IOHIDServiceClientConformsTo(a3, 0xFF00u, 4u))
  {
    v6 = -[CBALSNode initWithALSServiceClient:]([CBALSNode alloc], "initWithALSServiceClient:", a3);
    if (-[CBALSNode placement](v6, "placement") == 2)
    {
      self->_rearALS = v6;
      v7 = 1;
      self->_providerType = 1;
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
        __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)self->_rearALS);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Found rear ALS sensor %@.", v10, 0xCu);
      }
      -[CBGrimaldiModule setProvideLux:](self->_Grimaldi, "setProvideLux:", 0);
      -[CBGrimaldiModule setProvideCoex:](self->_Grimaldi, "setProvideCoex:", 1);
      if (self->_displayOn && -[CBALSNode slowIntegrationTime](self->_rearALS, "slowIntegrationTime") > 0)
        -[CBALSNode setReportInterval:](self->_rearALS, "setReportInterval:", -[CBALSNode slowIntegrationTime](self->_rearALS, "slowIntegrationTime"));
    }

  }
  return v7 & 1;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  uint64_t inited;
  NSObject *logHandle;
  CBALSEvent *v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[CBALSNode conformsToHIDServiceClient:](self->_rearALS, "conformsToHIDServiceClient:", a4))
  {
    v7 = -[CBALSEvent initWithHIDEvent:andNode:]([CBALSEvent alloc], "initWithHIDEvent:andNode:", a3, self->_rearALS);
    -[CBALSNode handleALSEvent:](self->_rearALS, "handleALSEvent:", v7);
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
      __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v7);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Handle rear ALS hid event %@.", v10, 0xCu);
    }

  }
  return 0;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[CBALSNode conformsToHIDServiceClient:](self->_rearALS, "conformsToHIDServiceClient:", a3))
  {

    self->_rearALS = 0;
    self->_lastLux = 0;
    if (self->_Grimaldi)
      self->_providerType = 2;
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
      __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)self->_rearALS);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Remove rear ALS sensor %@.", v7, 0xCu);
    }
    -[CBGrimaldiModule setProvideLux:](self->_Grimaldi, "setProvideLux:", 1);
    -[CBGrimaldiModule setProvideCoex:](self->_Grimaldi, "setProvideCoex:", 0);
  }
  return 0;
}

@end
