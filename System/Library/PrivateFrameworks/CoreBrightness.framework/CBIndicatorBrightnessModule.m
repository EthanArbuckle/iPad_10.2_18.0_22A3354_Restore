@implementation CBIndicatorBrightnessModule

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  double v4;
  double v5;
  uint64_t inited;
  NSObject *logHandle;
  char v12;
  uint8_t v13[8];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("MinimumIndicatorBrightnessEnforce")) & 1) != 0)
  {
    self->_enforceMIB = objc_msgSend(a3, "BOOLValue") & 1;
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
      __os_log_helper_16_0_1_4_0((uint64_t)v13, self->_enforceMIB);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Enforce MIB: %d", v13, 8u);
    }
    v12 = 1;
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("SecureIndicatorBrightnessRampSpeed")) & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    -[CBIndicatorBrightnessModule setRampSpeed:](self, "setRampSpeed:", v4);
    v12 = 1;
  }
  else
  {
    if ((objc_msgSend(a4, "isEqualToString:", CFSTR("SecureIndicatorLightEnabled")) & 1) == 0)
    {
      if ((objc_msgSend(a4, "isEqualToString:", CFSTR("SecureIndicatorActiveCount")) & 1) != 0)
      {
        -[CBIndicatorBrightnessModule setSilEnabled:](self, "setSilEnabled:", objc_msgSend(a3, "unsignedIntValue") != 0);
      }
      else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("MinimumIndicatorBrightness")) & 1) != 0)
      {
        objc_msgSend(a3, "floatValue");
        -[CBIndicatorBrightnessModule setMinimumIndicatorBrightness:](self, "setMinimumIndicatorBrightness:", v5);
        v12 = 1;
        return v12 & 1;
      }
      v12 = 0;
      return v12 & 1;
    }
    -[CBIndicatorBrightnessModule setSilEnabled:](self, "setSilEnabled:", objc_msgSend(a3, "BOOLValue") & 1);
    v12 = 1;
  }
  return v12 & 1;
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TrustedLux")) & 1) != 0)
    -[CBIndicatorAnalyticsModule handleNotificationForKey:withProperty:](self->_mibAnalytics, "handleNotificationForKey:withProperty:", a3, a4);
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  int Type;
  double v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t DataValue;
  uint64_t TimeStamp;
  char v16;
  uint8_t v17[48];
  uint8_t v18[16];
  uint8_t v19[8];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 && (-[NSMutableArray containsObject:](self->_mibServices, "containsObject:", a4) & 1) != 0)
  {
    if (IOHIDEventGetType() == 1
      && IOHIDEventGetIntegerValue() == 65280
      && IOHIDEventGetIntegerValue() == 98)
    {
      TimeStamp = IOHIDEventGetTimeStamp();
      DataValue = IOHIDEventGetDataValue();
      if (IOHIDEventGetIntegerValue() == 16)
      {
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
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v17, TimeStamp, COERCE__INT64((double)*(unint64_t *)DataValue / 1000000.0), COERCE__INT64(*(float *)(DataValue + 8)), COERCE__INT64(*(float *)(DataValue + 12)));
          _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "[New Event] eventTimestamp=%llu MIBData.(ts=%fs mib=%f aggregatedLux=%f)\n", v17, 0x2Au);
        }
        LODWORD(v5) = *(_DWORD *)(DataValue + 8);
        -[CBIndicatorBrightnessModule setMinimumIndicatorBrightness:](self, "setMinimumIndicatorBrightness:", v5);
        v16 = 1;
      }
      else
      {
        if (self->_logHandle)
        {
          v10 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v9 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v9 = init_default_corebrightness_log();
          v10 = v9;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v18, TimeStamp);
          _os_log_error_impl(&dword_1B5291000, v10, OS_LOG_TYPE_ERROR, "[New Event] eventTimestamp=%llu (unknown payload)", v18, 0xCu);
        }
        v16 = 0;
      }
    }
    else
    {
      if (self->_logHandle)
      {
        v12 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v11 = init_default_corebrightness_log();
        v12 = v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        Type = IOHIDEventGetType();
        __os_log_helper_16_0_1_4_0((uint64_t)v19, Type);
        _os_log_error_impl(&dword_1B5291000, v12, OS_LOG_TYPE_ERROR, "[New Event] unknown event type %u", v19, 8u);
      }
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  return v16 & 1;
}

- (id)copyPropertyForKey:(id)a3
{
  id v3;
  double v4;
  id v5;
  double v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SecureIndicatorBrightnessRampSpeed")) & 1) != 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v4 = self->_rampSpeed;
    return (id)objc_msgSend(v3, "initWithFloat:", v4);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SecureIndicatorLightEnabled")) & 1) != 0)
  {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[CBIndicatorBrightnessModule isSecureIndicatorLightEnabled](self, "isSecureIndicatorLightEnabled"));
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MinimumIndicatorBrightness")) & 1) != 0)
  {
    -[CBIndicatorBrightnessModule processTransaction](self, "processTransaction");
    v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v6 = self->_mib;
    return (id)objc_msgSend(v5, "initWithFloat:", v6);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MinimumIndicatorBrightnessEnforce")) & 1) != 0)
  {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_enforceMIB);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SecureIndicatorState")) & 1) != 0)
  {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", self->_silState);
  }
  else
  {
    return 0;
  }
}

- (void)setMinimumIndicatorBrightness:(float)a3
{
  uint64_t inited;
  NSObject *logHandle;
  float v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 > 0.0)
  {
    v6 = clamp(a3, self->_minSdr, self->_maxSdr);
    if (v6 != self->_nextUpdate.minimumIndicatorBrightness)
    {
      self->_nextUpdate.minimumIndicatorBrightness = v6;
      self->_nextUpdate.dirty = 1;
      if (!-[CBIndicatorBrightnessModule isRampRunning](self, "isRampRunning"))
        -[CBIndicatorBrightnessModule processTransaction](self, "processTransaction");
    }
  }
  else
  {
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
      _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "Negative MIB %f, ignoring", v8, 0xCu);
    }
  }
}

- (void)setSdrBrightness:(float)a3
{
  uint64_t inited;
  NSObject *logHandle;
  float v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0.0)
  {
    v6 = clamp(a3, self->_minSdr, self->_maxSdr);
    if (v6 != self->_nextUpdate.sdrBrightness)
    {
      self->_nextUpdate.sdrBrightness = v6;
      self->_nextUpdate.dirty = 1;
      if (!-[CBIndicatorBrightnessModule isRampRunning](self, "isRampRunning"))
        -[CBIndicatorBrightnessModule processTransaction](self, "processTransaction");
    }
  }
  else
  {
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
      _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "Negative sdr brightness %f, ignoring", v8, 0xCu);
    }
  }
}

- (void)updateRamp
{
  const char *v2;
  float v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  CBStopsBasedBrightnessRamp *ramp;
  uint64_t v12;
  NSObject *v13;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v18[7];
  os_log_type_t v19;
  os_log_t v20;
  os_log_type_t v21;
  os_log_t oslog;
  int v23;
  os_log_type_t v24;
  os_log_t v25;
  uint8_t v26[7];
  os_log_type_t v27;
  NSObject *v28;
  SEL v29;
  CBIndicatorBrightnessModule *v30;
  uint8_t v31[64];
  uint8_t v32[72];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30 = self;
  v29 = a2;
  -[CBIndicatorBrightnessModule processTransaction](self, "processTransaction");
  if (v30->_forcedBrightnessUpdate)
  {
    v30->_forcedBrightnessUpdate = 0;
    if (-[CBIndicatorBrightnessModule isRampRunning](v30, "isRampRunning"))
    {
      v28 = 0;
      if (v30->_logHandle)
      {
        logHandle = v30->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v28 = logHandle;
      v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        log = v28;
        type = v27;
        __os_log_helper_16_0_0(v26);
        _os_log_impl(&dword_1B5291000, log, type, "WARNING: Ramp was running while forced brightness transaction happened", v26, 2u);
      }
    }
    else
    {
      -[CBModule sendNotificationForKey:withValue:](v30, "sendNotificationForKey:withValue:", CFSTR("ExternalRampHasFinished"), CFSTR("IndicatorBrightness"));
    }
  }
  v25 = 0;
  if (v30->_logHandle)
  {
    v13 = v30->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v12 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v12 = init_default_corebrightness_log();
    v13 = v12;
  }
  v25 = v13;
  v24 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if (-[CBIndicatorBrightnessModule isRampRunning](v30, "isRampRunning"))
      v2 = "YES";
    else
      v2 = "NO";
    __os_log_helper_16_2_6_8_32_8_0_8_0_8_0_8_0_8_0((uint64_t)v32, (uint64_t)v2, v30->_silState, COERCE__INT64(v30->_sdrBrightness), COERCE__INT64(v30->_currentIndicatorBrightness), COERCE__INT64(v30->_targetIndicatorBrightness), COERCE__INT64(v30->_mib));
    _os_log_debug_impl(&dword_1B5291000, v25, v24, "updateRamp called, isRampRunning: %s, silState: %lu, currentSDR: %f, currentMIB: %f, targetMIB: %f, MIB: %f", v32, 0x3Eu);
  }
  if (-[CBIndicatorBrightnessModule isRampRunning](v30, "isRampRunning"))
  {
    v23 = 0;
    ramp = v30->_ramp;
    ((void (*)(void))v30->_currentTimeFunction)();
    v23 = -[CBStopsBasedBrightnessRamp updateRampWithTimestamp:](ramp, "updateRampWithTimestamp:");
    -[CBStopsBasedBrightnessRamp currentBrightness](v30->_ramp, "currentBrightness");
    v30->_currentIndicatorBrightness = v3;
    if (v23 == 1)
    {
      -[CBIndicatorBrightnessModule endRamp](v30, "endRamp");
      if (v30->_silState == 2)
      {
        -[CBIndicatorBrightnessModule setSilState:](v30, "setSilState:", 3);
        -[CBIndicatorBrightnessModule forceBrightnessTransaction](v30, "forceBrightnessTransaction");
      }
    }
  }
  else if (v30->_silState == 2 || v30->_silState == 3)
  {
    -[CBIndicatorBrightnessModule setSilState:](v30, "setSilState:", 4);
  }
  if (!v30->_silState)
    -[CBIndicatorBrightnessModule setSilState:](v30, "setSilState:", 1);
  oslog = 0;
  if (v30->_logHandle)
  {
    v10 = v30->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v9 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v9 = init_default_corebrightness_log();
    v10 = v9;
  }
  oslog = v10;
  v21 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (-[CBIndicatorBrightnessModule isRampRunning](v30, "isRampRunning"))
      v4 = "YES";
    else
      v4 = "NO";
    __os_log_helper_16_2_6_8_32_8_0_8_0_8_0_8_0_8_0((uint64_t)v31, (uint64_t)v4, v30->_silState, COERCE__INT64(v30->_sdrBrightness), COERCE__INT64(v30->_currentIndicatorBrightness), COERCE__INT64(v30->_targetIndicatorBrightness), COERCE__INT64(v30->_mib));
    _os_log_debug_impl(&dword_1B5291000, oslog, v21, "updateRamp finished, isRampRunning: %s, silState: %lu, currentSDR: %f, currentMIB: %f, targetMIB: %f, MIB: %f", v31, 0x3Eu);
  }
  if (-[CBIndicatorBrightnessModule shouldPushIndicatorBrightness](v30, "shouldPushIndicatorBrightness")
    && v30->_sdrBrightness > v30->_currentIndicatorBrightness)
  {
    v20 = 0;
    if (v30->_logHandle)
    {
      v8 = v30->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    v20 = v8;
    v19 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v5 = v20;
      v6 = v19;
      __os_log_helper_16_0_0(v18);
      _os_log_error_impl(&dword_1B5291000, v5, v6, "SDR brightness is higher than current MIB - something is probably off", v18, 2u);
    }
  }
}

- (void)processTransaction
{
  unint64_t v2;
  unint64_t v3;
  unint64_t silState;

  if (self->_nextUpdate.dirty)
  {
    self->_mib = self->_nextUpdate.minimumIndicatorBrightness;
    self->_sdrBrightness = self->_nextUpdate.sdrBrightness;
    if (self->_nextUpdate.silEnabled)
    {
      silState = self->_silState;
      if (silState > 1)
      {
        if (silState == 2)
        {
          -[CBIndicatorBrightnessModule setSilState:](self, "setSilState:", 1);
        }
        else if (silState - 3 <= 1)
        {
          -[CBIndicatorBrightnessModule setSilState:](self, "setSilState:", 0);
        }
      }
    }
    else
    {
      v3 = self->_silState;
      if (v3)
      {
        if (v3 == 1)
          -[CBIndicatorBrightnessModule setSilState:](self, "setSilState:", 2);
      }
      else
      {
        -[CBIndicatorBrightnessModule setSilState:](self, "setSilState:", 4);
      }
    }
    self->_nextUpdate.dirty = 0;
    v2 = self->_silState;
    if (v2 <= 4)
      __asm { BR              X8 }
  }
}

- (BOOL)isRampRunning
{
  return self->_ramp != 0;
}

- (BOOL)shouldPushIndicatorBrightness
{
  BOOL v3;

  v3 = 0;
  if (self->_silState != 3)
    return self->_silState != 4;
  return v3;
}

- (void)endRamp
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  char v7;
  NSObject *v8;
  SEL v9;
  CBIndicatorBrightnessModule *v10;

  v10 = self;
  v9 = a2;
  if (self->_ramp)
  {
    v8 = 0;
    if (v10->_logHandle)
    {
      logHandle = v10->_logHandle;
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
    v7 = 1;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      log = v8;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_impl(&dword_1B5291000, log, type, "Ending ramp", v6, 2u);
    }
    -[CBModule sendNotificationForKey:withValue:](v10, "sendNotificationForKey:withValue:", CFSTR("ExternalRampHasFinished"), CFSTR("IndicatorBrightness"));

    v10->_ramp = 0;
  }
}

- (CBIndicatorBrightnessModule)initWithQueue:(id)a3 min:(float)a4 andMax:(float)a5
{
  return -[CBIndicatorBrightnessModule initWithQueue:min:max:andCurrentTimeFunction:](self, "initWithQueue:min:max:andCurrentTimeFunction:", a3, mach_time_now_in_seconds, *(double *)&a4, *(double *)&a5, __PAIR64__(LODWORD(a4), LODWORD(a5)), a3, a2, self);
}

- (CBIndicatorBrightnessModule)initWithQueue:(id)a3 min:(float)a4 max:(float)a5 andCurrentTimeFunction:(void *)a6
{
  os_log_t v6;
  id v7;
  CBIndicatorAnalyticsModule *v8;
  uint64_t v9;
  uint64_t inited;
  NSObject *v12;
  objc_super v13;
  void *v14;
  float v15;
  float v16;
  id v17;
  SEL v18;
  void *v19;
  uint8_t v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = a5;
  v14 = a6;
  v13.receiver = self;
  v13.super_class = (Class)CBIndicatorBrightnessModule;
  v19 = -[CBModule initWithQueue:](&v13, sel_initWithQueue_, a3);
  if (!v19)
    return 0;
  v6 = os_log_create("com.apple.CoreBrightness.CBIndicatorBrightnessModule", "default");
  *((_QWORD *)v19 + 5) = v6;
  *((float *)v19 + 12) = v16;
  *((float *)v19 + 13) = v15;
  *((_DWORD *)v19 + 14) = *((_DWORD *)v19 + 12);
  *((_DWORD *)v19 + 18) = *((_DWORD *)v19 + 12);
  *((_DWORD *)v19 + 20) = *((_DWORD *)v19 + 12);
  *((_DWORD *)v19 + 19) = *((_DWORD *)v19 + 12);
  *((float *)v19 + 21) = 0.5;
  *((_QWORD *)v19 + 12) = v14;
  *((_QWORD *)v19 + 13) = 4;
  *((_BYTE *)v19 + 112) = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *((_QWORD *)v19 + 15) = v7;
  *((_BYTE *)v19 + 128) = _os_feature_enabled_impl() & 1;
  if (*((_QWORD *)v19 + 5))
  {
    v12 = *((_QWORD *)v19 + 5);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v12 = inited;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v21, *((_BYTE *)v19 + 128) & 1);
    _os_log_impl(&dword_1B5291000, v12, OS_LOG_TYPE_DEFAULT, "Enforce MIB: %d", v21, 8u);
  }
  v8 = [CBIndicatorAnalyticsModule alloc];
  v9 = -[CBIndicatorAnalyticsModule initWithQueue:andIndicatorModule:](v8, "initWithQueue:andIndicatorModule:", *((_QWORD *)v19 + 3), v19);
  *((_QWORD *)v19 + 17) = v9;
  return (CBIndicatorBrightnessModule *)v19;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBIndicatorBrightnessModule *v4;

  v4 = self;
  v3 = a2;

  -[CBIndicatorBrightnessModule endRamp](v4, "endRamp");
  -[CBModule unregisterNotificationBlock](v4, "unregisterNotificationBlock");
  v2.receiver = v4;
  v2.super_class = (Class)CBIndicatorBrightnessModule;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (float)currentIndicatorBrightness
{
  if (self->_enforceMIB)
    return self->_currentIndicatorBrightness;
  else
    return self->_sdrBrightness;
}

- (double)currentDigitalDimmingFactor
{
  return (float)(self->_currentIndicatorBrightness / self->_sdrBrightness);
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  if (!a3 || !IOHIDServiceClientConformsTo(a3, 0xFF00u, 0x62u))
    return 0;
  -[NSMutableArray addObject:](self->_mibServices, "addObject:", a3);
  return 1;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  if ((-[NSMutableArray containsObject:](self->_mibServices, "containsObject:", a3) & 1) == 0)
    return 0;
  -[NSMutableArray removeObject:](self->_mibServices, "removeObject:", a3);
  return 1;
}

- (BOOL)isSecureIndicatorLightEnabled
{
  BOOL v3;

  v3 = 1;
  if (self->_silState)
    return self->_silState == 1;
  return v3;
}

- (void)setRampSpeed:(float)a3
{
  uint64_t v3;
  NSObject *v4;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[15];
  char v10;
  NSObject *v11;
  float v12;
  SEL v13;
  CBIndicatorBrightnessModule *v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = self;
  v13 = a2;
  v12 = a3;
  if (a3 >= 0.0)
  {
    if (v12 == 0.0)
    {
      v11 = 0;
      if (v14->_logHandle)
      {
        logHandle = v14->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v11 = logHandle;
      v10 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v11;
        type = v10;
        __os_log_helper_16_0_0(v9);
        _os_log_error_impl(&dword_1B5291000, log, type, "MIB ramp speed can't be 0 seconds/stop, using default ramp speed", v9, 2u);
      }
      v14->_rampSpeed = 0.5;
    }
    else
    {
      v14->_rampSpeed = v12;
    }
  }
  else
  {
    v14->_rampSpeed = 0.5;
  }
  if (v14->_logHandle)
  {
    v4 = v14->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v3 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v3 = init_default_corebrightness_log();
    v4 = v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v15, COERCE__INT64(v14->_rampSpeed));
    _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEFAULT, "MIB ramp speed overriden to %f seconds/stop", v15, 0xCu);
  }
}

- (void)setSilEnabled:(BOOL)a3
{
  NSMutableArray *mibServices;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, __IOHIDServiceClient *);
  void *v8;
  BOOL v9;
  BOOL v10;
  SEL v11;
  CBIndicatorBrightnessModule *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  if (a3 != self->_nextUpdate.silEnabled)
  {
    v12->_nextUpdate.silEnabled = v10;
    v12->_nextUpdate.dirty = 1;
    mibServices = v12->_mibServices;
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __45__CBIndicatorBrightnessModule_setSilEnabled___block_invoke;
    v8 = &__block_descriptor_33_e15_v32__0_8Q16_B24l;
    v9 = v10;
    -[NSMutableArray enumerateObjectsUsingBlock:](mibServices, "enumerateObjectsUsingBlock:", &v4);
    if (!-[CBIndicatorBrightnessModule isRampRunning](v12, "isRampRunning"))
      -[CBIndicatorBrightnessModule processTransaction](v12, "processTransaction");
  }
}

uint64_t __45__CBIndicatorBrightnessModule_setSilEnabled___block_invoke(uint64_t a1, __IOHIDServiceClient *a2)
{
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
    return IOHIDServiceClientSetProperty(a2, CFSTR("EXBrightSILEnabled"), (CFTypeRef)*MEMORY[0x1E0C9AE50]);
  else
    return IOHIDServiceClientSetProperty(a2, CFSTR("EXBrightSILEnabled"), (CFTypeRef)*MEMORY[0x1E0C9AE40]);
}

- (unint64_t)currentSilState
{
  return self->_silState;
}

- (void)setSilState:(unint64_t)a3
{
  if (a3 != self->_silState)
  {
    self->_silState = a3;
    -[CBIndicatorAnalyticsModule setProperty:forKey:](self->_mibAnalytics, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_silState));
    -[CBModule sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("SecureIndicatorState"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_silState));
  }
}

- (void)forceBrightnessTransaction
{
  id v2;
  double v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t inited;
  NSObject *v7;
  NSObject *log;
  os_log_type_t type;
  uint64_t v10;
  NSObject *logHandle;
  uint8_t v12[7];
  char v13;
  NSObject *v14;
  uint8_t v15[15];
  char v16;
  NSObject *v17;
  id v18;
  SEL v19;
  CBIndicatorBrightnessModule *v20;

  v20 = self;
  v19 = a2;
  if (!self->_forcedBrightnessUpdate)
  {
    v20->_forcedBrightnessUpdate = 1;
    -[CBModule sendNotificationForKey:withValue:](v20, "sendNotificationForKey:withValue:", CFSTR("ExternalRampIsRunning"), CFSTR("IndicatorBrightness"));
    v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v3) = 1015580809;
    v18 = (id)objc_msgSend(v2, "initWithFloat:", v3);
    if (!v18)
    {
      v17 = 0;
      if (v20->_logHandle)
      {
        logHandle = v20->_logHandle;
      }
      else
      {
        v10 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v10;
      }
      v17 = logHandle;
      v16 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v17;
        type = v16;
        __os_log_helper_16_0_0(v15);
        _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create frequency NSNumber, display might not ramp", v15, 2u);
      }
    }
    -[CBModule sendNotificationForKey:withValue:](v20, "sendNotificationForKey:withValue:", CFSTR("DisplayDisplayStartFade"), v18);

    v14 = 0;
    if (v20->_logHandle)
    {
      v7 = v20->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v7 = inited;
    }
    v14 = v7;
    v13 = 2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v4 = v14;
      v5 = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_1B5291000, v4, v5, "Forced brightness transaction", v12, 2u);
    }
  }
}

- (void)rampTo:(float)a3
{
  float v3;
  CBStopsBasedBrightnessRamp *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v29[7];
  os_log_type_t v30;
  os_log_t v31;
  id v32;
  os_log_type_t v33;
  os_log_t v34;
  os_log_type_t v35;
  os_log_t v36;
  os_log_type_t v37;
  os_log_t v38;
  float v39;
  char v40;
  os_log_type_t v41;
  os_log_t oslog;
  os_log_type_t v43;
  os_log_t v44;
  os_log_type_t v45;
  os_log_t v46;
  os_log_type_t v47;
  os_log_t v48;
  float v49;
  SEL v50;
  CBIndicatorBrightnessModule *v51;
  uint8_t v52[32];
  uint8_t v53[32];
  uint8_t v54[32];
  uint8_t v55[16];
  uint8_t v56[16];
  uint8_t v57[16];
  uint8_t v58[24];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v51 = self;
  v50 = a2;
  v49 = a3;
  if (self->_silState == 4)
  {
    v48 = 0;
    if (v51->_logHandle)
    {
      logHandle = v51->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v48 = logHandle;
    v47 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v58, COERCE__INT64(v49));
      _os_log_error_impl(&dword_1B5291000, v48, v47, "Can't ramp MIB target %f when SIL is off", v58, 0xCu);
    }
  }
  else if (v51->_silState != 2 || v49 == v51->_sdrBrightness)
  {
    if (-[CBIndicatorBrightnessModule isRampRunning](v51, "isRampRunning") || v51->_currentIndicatorBrightness != v49)
    {
      if (-[CBIndicatorBrightnessModule isRampRunning](v51, "isRampRunning")
        && v51->_targetIndicatorBrightness == v49
        && v51->_silState)
      {
        oslog = 0;
        if (v51->_logHandle)
        {
          v22 = v51->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v21 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v21 = init_default_corebrightness_log();
          v22 = v21;
        }
        oslog = v22;
        v41 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v55, COERCE__INT64(v49));
          _os_log_debug_impl(&dword_1B5291000, oslog, v41, "Already running ramp with the same target %f", v55, 0xCu);
        }
      }
      else
      {
        v51->_targetIndicatorBrightness = v49;
        v40 = -[CBIndicatorBrightnessModule isRampRunning](v51, "isRampRunning");
        v39 = 0.0;
        v39 = ((float (*)(void))v51->_currentTimeFunction)();
        if ((v40 & 1) != 0)
        {
          -[CBStopsBasedBrightnessRamp timeOfLastUpdate](v51->_ramp, "timeOfLastUpdate");
          v39 = v3;
        }

        v51->_ramp = 0;
        if (v51->_currentIndicatorBrightness == v49)
        {
          -[CBModule sendNotificationForKey:withValue:](v51, "sendNotificationForKey:withValue:", CFSTR("ExternalRampHasFinished"), CFSTR("IndicatorBrightness"));
        }
        else
        {
          v4 = [CBStopsBasedBrightnessRamp alloc];
          *(float *)&v5 = v51->_currentIndicatorBrightness;
          *(float *)&v6 = v49;
          *(float *)&v7 = v51->_rampSpeed;
          *(float *)&v8 = v39;
          v51->_ramp = -[CBStopsBasedBrightnessRamp initWithStartingBrightness:targetBrightness:rampSpeed:andCurrentTime:](v4, "initWithStartingBrightness:targetBrightness:rampSpeed:andCurrentTime:", v5, v6, v7, v8);
          if (v51->_ramp)
          {
            if ((v40 & 1) != 0)
            {
              v36 = 0;
              if (v51->_logHandle)
              {
                v18 = v51->_logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v17 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v17 = init_default_corebrightness_log();
                v18 = v17;
              }
              v36 = v18;
              v35 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v53, COERCE__INT64(v51->_currentIndicatorBrightness), COERCE__INT64(v49), COERCE__INT64(v51->_rampSpeed));
                _os_log_impl(&dword_1B5291000, v36, v35, "Updated ramp %f -> %f @ %f", v53, 0x20u);
              }
            }
            else
            {
              v34 = 0;
              if (v51->_logHandle)
              {
                v16 = v51->_logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v15 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v15 = init_default_corebrightness_log();
                v16 = v15;
              }
              v34 = v16;
              v33 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v52, COERCE__INT64(v51->_currentIndicatorBrightness), COERCE__INT64(v49), COERCE__INT64(v51->_rampSpeed));
                _os_log_impl(&dword_1B5291000, v34, v33, "Created ramp %f -> %f @ %f", v52, 0x20u);
              }
              if (v51->_forcedBrightnessUpdate)
                v51->_forcedBrightnessUpdate = 0;
              -[CBModule sendNotificationForKey:withValue:](v51, "sendNotificationForKey:withValue:", CFSTR("ExternalRampIsRunning"), CFSTR("IndicatorBrightness"));
              v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
              LODWORD(v10) = 1015580809;
              v32 = (id)objc_msgSend(v9, "initWithFloat:", v10);
              if (!v32)
              {
                v31 = 0;
                if (v51->_logHandle)
                {
                  v14 = v51->_logHandle;
                }
                else
                {
                  v13 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
                  v14 = v13;
                }
                v31 = v14;
                v30 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  v11 = v31;
                  v12 = v30;
                  __os_log_helper_16_0_0(v29);
                  _os_log_error_impl(&dword_1B5291000, v11, v12, "Failed to create frequency NSNumber, display might not ramp", v29, 2u);
                }
              }
              -[CBModule sendNotificationForKey:withValue:](v51, "sendNotificationForKey:withValue:", CFSTR("DisplayDisplayStartFade"), v32, v11);

            }
          }
          else
          {
            v38 = 0;
            if (v51->_logHandle)
            {
              v20 = v51->_logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v19 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v19 = init_default_corebrightness_log();
              v20 = v19;
            }
            v38 = v20;
            v37 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v54, COERCE__INT64(v51->_currentIndicatorBrightness), COERCE__INT64(v49), COERCE__INT64(v51->_rampSpeed));
              _os_log_error_impl(&dword_1B5291000, v38, v37, "Failed to create ramp %f -> %f @ %f", v54, 0x20u);
            }
            if ((v40 & 1) != 0)
              -[CBModule sendNotificationForKey:withValue:](v51, "sendNotificationForKey:withValue:", CFSTR("ExternalRampHasFinished"), CFSTR("IndicatorBrightness"));
          }
        }
      }
    }
    else
    {
      v44 = 0;
      if (v51->_logHandle)
      {
        v24 = v51->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v23 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v23 = init_default_corebrightness_log();
        v24 = v23;
      }
      v44 = v24;
      v43 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v56, COERCE__INT64(v49));
        _os_log_debug_impl(&dword_1B5291000, v44, v43, "Already at correct brightness %f with ramp not running", v56, 0xCu);
      }
    }
  }
  else
  {
    v46 = 0;
    if (v51->_logHandle)
    {
      v26 = v51->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v25 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v25 = init_default_corebrightness_log();
      v26 = v25;
    }
    v46 = v26;
    v45 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v57, COERCE__INT64(v49));
      _os_log_fault_impl(&dword_1B5291000, v46, v45, "Ignoring MIB target (%f) that is different than current sdr", v57, 0xCu);
    }
  }
}

- (BOOL)shouldRampToMib
{
  BOOL v3;

  if (!self->_silState)
    return self->_mib >= self->_sdrBrightness;
  v3 = 0;
  if (self->_silState == 1)
    return self->_mib >= self->_sdrBrightness;
  return v3;
}

@end
