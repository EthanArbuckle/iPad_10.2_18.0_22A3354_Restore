@implementation AABRear

- (BOOL)started
{
  return self->_started;
}

- (id)copyParam:(id)a3
{
  return -[CBRearALSModule copyParam:](self->_rearALSModule, "copyParam:", a3);
}

- (BOOL)checkSensorEnablementConditions:(float)a3
{
  double v3;

  if (self->_sensorEnabled)
  {
    if (a3 < self->_frontALSThreshold && self->_activationFLux < 0.0)
    {
      -[CBRearALSModule stopSampling](self->_rearALSModule, "stopSampling");
      self->_sensorEnabled = 0;
      self->_lastFrequency = 0.0;
    }
  }
  else if (a3 > self->_frontALSThreshold)
  {
    self->_lastFrequency = 1.0;
    *(float *)&v3 = self->_lastFrequency;
    -[CBRearALSModule startSamplingWithFrequency:](self->_rearALSModule, "startSamplingWithFrequency:", v3);
    self->_sensorEnabled = 1;
  }
  return self->_sensorEnabled;
}

- (BOOL)isRearALSSupported
{
  return -[CBRearALSModule isRearALSSupported](self->_rearALSModule, "isRearALSSupported", a2, self);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return -[CBRearALSModule setProperty:forKey:](self->_rearALSModule, "setProperty:forKey:", a3, a4, a4, a3, a2, self);
}

- (AABRear)initWithQueue:(id)a3 andGrimaldiFactory:(id)a4
{
  CBRearALSModule *rearALSModule;
  float v5;
  float v6;
  float v7;
  float v8;
  uint64_t v10;
  NSObject *v11;
  CFTypeID v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t inited;
  NSObject *logHandle;
  CFTypeID v21;
  NSObject *log;
  os_log_type_t type;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *cf;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  void *v34;
  _QWORD *v35;
  _QWORD v36[2];
  int v37;
  int v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  AABRear *v41;
  uint8_t v42[7];
  char v43;
  NSObject *v44;
  uint8_t v45[7];
  char v46;
  NSObject *v47;
  CFTypeRef v48;
  int valuePtr;
  uint8_t v50[15];
  char v51;
  NSObject *v52;
  objc_super v53;
  id v54;
  id v55;
  SEL v56;
  AABRear *v57;
  uint8_t v59[48];
  __int128 v60;
  int v61;
  __int128 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v57 = self;
  v56 = a2;
  v55 = a3;
  v54 = a4;
  v53.receiver = self;
  v53.super_class = (Class)AABRear;
  v57 = -[CBModule initWithQueue:](&v53, sel_initWithQueue_, a3);
  if (v57)
  {
    v57->super._logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.AABRear", "default");
    if (!v57->super._logHandle)
    {
      v52 = 0;
      v24 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v52 = v24;
      v51 = 16;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        log = v52;
        type = v51;
        __os_log_helper_16_0_0(v50);
        _os_log_error_impl(&dword_1B5291000, log, type, "AABRear: failed to create log handle", v50, 2u);
      }
    }
    v62 = xmmword_1B545C8D8;
    v63 = 713503427;
    v60 = xmmword_1B545C8EC;
    v61 = -1632750650;
    if ((MGIsDeviceOneOfType() & 1) != 0)
    {
      valuePtr = 0;
      v48 = 0;
      v48 = CFPreferencesCopyValue(CFSTR("AllowGrimaldi"), CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
      if (v48)
      {
        v21 = CFGetTypeID(v48);
        if (v21 == CFNumberGetTypeID())
          CFNumberGetValue((CFNumberRef)v48, kCFNumberIntType, &valuePtr);
        CFRelease(v48);
      }
      if (!valuePtr)
      {
        v47 = 0;
        if (v57->super._logHandle)
        {
          logHandle = v57->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          logHandle = inited;
        }
        v47 = logHandle;
        v46 = 2;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          v17 = v47;
          v18 = v46;
          __os_log_helper_16_0_0(v45);
          _os_log_debug_impl(&dword_1B5291000, v17, v18, "Skipping Grimaldi check", v45, 2u);
        }
LABEL_54:

        v57 = 0;
        return 0;
      }
    }
    v57->_rearALSModule = -[CBRearALSModule initWithQueue:andGrimaldiFactory:]([CBRearALSModule alloc], "initWithQueue:andGrimaldiFactory:", v55, v54, &v60, 0);
    if (!v57->_rearALSModule)
    {
      v44 = 0;
      if (v57->super._logHandle)
      {
        v16 = v57->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v15 = init_default_corebrightness_log();
        v16 = v15;
      }
      v44 = v16;
      v43 = 16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v13 = v44;
        v14 = v43;
        __os_log_helper_16_0_0(v42);
        _os_log_error_impl(&dword_1B5291000, v13, v14, "Failed to initialize CBRearALSModule.", v42, 2u);
      }
      goto LABEL_54;
    }
    v36[0] = 0;
    v36[1] = v36;
    v37 = 1375731712;
    v38 = 48;
    v39 = __Block_byref_object_copy__6;
    v40 = __Block_byref_object_dispose__6;
    v41 = v57;
    rearALSModule = v57->_rearALSModule;
    v30 = MEMORY[0x1E0C809B0];
    v31 = -1073741824;
    v32 = 0;
    v33 = __44__AABRear_initWithQueue_andGrimaldiFactory___block_invoke;
    v34 = &unk_1E68EA5E0;
    v35 = v36;
    -[CBModule registerNotificationBlock:](rearALSModule, "registerNotificationBlock:", &v30);
    v57->_sensorEnabled = 0;
    v57->_started = 0;
    v57->_frontALSThreshold = 100.0;
    v57->_rearALSThreshold = 1000.0;
    v57->_luxRatioThreshold = 2.0;
    v57->_nitsRatioThreshold = 3.0;
    cf = (void *)CFPreferencesCopyValue(CFSTR("GrimaldiAABConfig"), CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    if (cf)
    {
      v12 = CFGetTypeID(cf);
      if (v12 == CFDictionaryGetTypeID())
      {
        v25 = (void *)objc_msgSend(cf, "objectForKey:", CFSTR("frontALSThreshold"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v25, "floatValue");
          v57->_frontALSThreshold = v5;
        }
        v26 = (void *)objc_msgSend(cf, "objectForKey:", CFSTR("rearALSThreshold"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v26, "floatValue");
          v57->_rearALSThreshold = v6;
        }
        v27 = (void *)objc_msgSend(cf, "objectForKey:", CFSTR("luxRatioThreshold"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v27, "floatValue");
          v57->_luxRatioThreshold = v7;
        }
        v28 = (void *)objc_msgSend(cf, "objectForKey:", CFSTR("nitsRatioThreshold"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v28, "floatValue");
          v57->_nitsRatioThreshold = v8;
        }
      }
      CFRelease(cf);
    }
    if (v57->super._logHandle)
    {
      v11 = v57->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v10 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v10 = init_default_corebrightness_log();
      v11 = v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v59, COERCE__INT64(v57->_frontALSThreshold), COERCE__INT64(v57->_rearALSThreshold), COERCE__INT64(v57->_luxRatioThreshold), COERCE__INT64(v57->_nitsRatioThreshold));
      _os_log_debug_impl(&dword_1B5291000, v11, OS_LOG_TYPE_DEBUG, "AABRear: frontALSThreshold = %f, rearALSThreshold = %f, luxRatioThreshold = %f, nitsRatioThreshold = %f", v59, 0x2Au);
    }
    _Block_object_dispose(v36, 8);
  }
  return v57;
}

uint64_t __44__AABRear_initWithQueue_andGrimaldiFactory___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
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
  int *v2;
  objc_super v3;
  SEL v4;
  AABRear *v5;

  v5 = self;
  v4 = a2;
  -[CBModule unregisterNotificationBlock](self->_rearALSModule, "unregisterNotificationBlock");

  if (v5->super._logHandle)
  {
    v2 = &OBJC_IVAR___CBModule__logHandle;

    v5->super._logHandle = 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)AABRear;
  -[CBModule dealloc](&v3, sel_dealloc, v2);
}

- (BOOL)shouldUseRLux:(float)a3 rLux:(float)a4
{
  BOOL v5;
  BOOL v6;
  BOOL v7;

  v6 = 0;
  if (a3 >= self->_frontALSThreshold)
    v6 = a4 >= self->_rearALSThreshold;
  if (self->_activationFLux <= 0.0 || a3 >= a4 || a4 <= self->_frontALSThreshold)
  {
    v5 = 0;
    if (v6)
      v5 = a4 >= (float)(self->_luxRatioThreshold * a3);
    v7 = v5;
    if (v5)
      self->_activationFLux = a3;
  }
  else
  {
    v7 = 1;
  }
  if (!v7)
    self->_activationFLux = -1.0;
  return v7;
}

- (void)evaluateSamplingFrequencyWithLux:(float)a3 andCap:(float)a4
{
  double v4;
  double v5;

  if (self->_sensorEnabled)
  {
    if (a3 < a4)
    {
      if (self->_lastFrequency < 1.0)
      {
        self->_lastFrequency = 1.0;
        -[CBRearALSModule stopSampling](self->_rearALSModule, "stopSampling");
        *(float *)&v5 = self->_lastFrequency;
        -[CBRearALSModule startSamplingWithFrequency:](self->_rearALSModule, "startSamplingWithFrequency:", v5);
      }
    }
    else if (self->_lastFrequency > 1.0)
    {
      self->_lastFrequency = 1.0;
      -[CBRearALSModule stopSampling](self->_rearALSModule, "stopSampling");
      *(float *)&v4 = self->_lastFrequency;
      -[CBRearALSModule startSamplingWithFrequency:](self->_rearALSModule, "startSamplingWithFrequency:", v4);
    }
  }
}

- (BOOL)shouldUseRearLuxFrontLux:(float)a3 rearLux:(float)a4 andCap:(float)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t inited;
  NSObject *logHandle;
  char v17;
  uint8_t v22[48];
  uint8_t v23[16];
  uint8_t v24[40];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v24, COERCE__INT64(a3), COERCE__INT64(a4), COERCE__INT64(a5));
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "AABRear: shouldUseRearLuxFrontLux called with (fLux:%f, rLux:%f, cap: %f)", v24, 0x20u);
  }
  *(float *)&v5 = a3;
  *(float *)&v6 = a4;
  v17 = -[AABRear shouldUseRLux:rLux:](self, "shouldUseRLux:rLux:", v5, v6);
  *(float *)&v7 = a4;
  *(float *)&v8 = a5;
  -[AABRear evaluateSamplingFrequencyWithLux:andCap:](self, "evaluateSamplingFrequencyWithLux:andCap:", v7, v8);
  if (self->super._logHandle)
  {
    v14 = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v13 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v13 = init_default_corebrightness_log();
    v14 = v13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v23, v17 & 1);
    _os_log_debug_impl(&dword_1B5291000, v14, OS_LOG_TYPE_DEBUG, "AABRear: using rear? %d", v23, 8u);
  }
  if ((v17 & 1) != self->_shouldUseRearLux)
  {
    self->_shouldUseRearLux = v17 & 1;
    if (self->super._logHandle)
    {
      v12 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v11 = init_default_corebrightness_log();
      v12 = v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldUseRearLux)
        v9 = "Don't ";
      else
        v9 = "";
      __os_log_helper_16_2_4_8_32_8_0_8_0_8_0((uint64_t)v22, (uint64_t)v9, COERCE__INT64(a3), COERCE__INT64(a4), COERCE__INT64(a5));
      _os_log_impl(&dword_1B5291000, v12, OS_LOG_TYPE_DEFAULT, "AABRear: %suse rear Lux (fLux:%f, rLux:%f, cap: %f)", v22, 0x2Au);
    }
  }
  return v17 & 1;
}

- (float)nitsRatio
{
  return self->_nitsRatioThreshold;
}

- (void)startSampling
{
  self->_started = 1;
}

- (void)stopSampling
{
  if (self->_sensorEnabled)
  {
    -[CBRearALSModule stopSampling](self->_rearALSModule, "stopSampling");
    self->_sensorEnabled = 0;
  }
  self->_started = 0;
  self->_activationFLux = -1.0;
}

- (id)copyPropertyForKey:(id)a3
{
  return -[CBRearALSModule copyPropertyForKey:](self->_rearALSModule, "copyPropertyForKey:", a3);
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBRearALSModule copyPropertyForKey:withParameter:](self->_rearALSModule, "copyPropertyForKey:withParameter:", a3, a4, a4, a3, a2, self);
}

- (void)stop
{
  -[CBModule unregisterNotificationBlock](self->_rearALSModule, "unregisterNotificationBlock");
  -[CBRearALSModule stop](self->_rearALSModule, "stop");
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  return -[CBRearALSModule addHIDServiceClient:](self->_rearALSModule, "addHIDServiceClient:", a3);
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  return -[CBRearALSModule handleHIDEvent:from:](self->_rearALSModule, "handleHIDEvent:from:", a3, a4, a4, a3, a2, self);
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  return -[CBRearALSModule removeHIDServiceClient:](self->_rearALSModule, "removeHIDServiceClient:", a3);
}

@end
