@implementation CBSoftWakeDisplayDelegate

+ (BOOL)isSupported
{
  return CBU_IsSoftWakeSupported();
}

- (__DisplayFactorFade)fade
{
  return &self->_fade;
}

- (CBSoftWakeDisplayDelegate)init
{
  os_log_t v2;
  objc_super v4;
  SEL v5;
  CBSoftWakeDisplayDelegate *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CBSoftWakeDisplayDelegate;
  v6 = -[CBSoftWakeDisplayDelegate init](&v4, sel_init);
  if (v6)
  {
    v6->_state = 0;
    v2 = os_log_create("com.apple.CoreBrightness.Display.SoftWake", "default");
    v6->_logHandle = (OS_os_log *)v2;
    v6->_fade.rampDoneCallback = 0;
    v6->_fade.refcon = 0;
    v6->_fade.coeff[0] = 0.0;
    v6->_fade.coeff[1] = 1.0;
    v6->_fade.coeff[2] = 0.0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBSoftWakeDisplayDelegate *v4;

  v4 = self;
  v3 = a2;

  v4->_logHandle = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBSoftWakeDisplayDelegate;
  -[CBSoftWakeDisplayDelegate dealloc](&v2, sel_dealloc);
}

- (BOOL)isActive
{
  return self->_state == 1;
}

- (int64_t)action:(int64_t)a3
{
  const char *v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v12[32];
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((canTransition(self->_state, a3) & 1) != 0)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 == 1)
        v3 = "activated";
      else
        v3 = "deactivated";
      __os_log_helper_16_2_1_8_32((uint64_t)v13, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Soft wake %s", v13, 0xCu);
    }
    self->_fade.Fstart = 0.0;
    self->_fade.Fcurrent = 0.0;
    self->_fade.Ftarget = 0.0;
    self->_fade.period = 0.0;
    self->_state = a3;
    return 0;
  }
  else
  {
    if (self->_logHandle)
    {
      v6 = self->_logHandle;
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
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v12, self->_state, a3);
      _os_log_error_impl(&dword_1B5291000, v6, OS_LOG_TYPE_ERROR, "Cannot transition from %ld to %ld", v12, 0x16u);
    }
    return 1;
  }
}

- (int64_t)setFactor:(float)a3 withFade:(float)a4
{
  uint64_t inited;
  NSObject *logHandle;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[7];
  char v14;
  NSObject *v15;
  os_log_type_t v16;
  os_log_t v17;
  float v18;
  float v19;
  SEL v20;
  CBSoftWakeDisplayDelegate *v21;
  uint8_t v23[32];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  if (a3 <= 1.0 && (a3 = v18, v18 >= 0.0))
  {
    if (-[CBSoftWakeDisplayDelegate isActive](v21, "isActive", *(double *)&a3))
    {
      v21->_fade.period = v18;
      v21->_fade.startTime = CFAbsoluteTimeGetCurrent();
      v21->_fade.Fstart = v21->_fade.Fcurrent;
      v21->_fade.Ftarget = v19;
      if (v21->_logHandle)
      {
        logHandle = v21->_logHandle;
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
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v23, COERCE__INT64(v21->_fade.Fstart), COERCE__INT64(v21->_fade.Ftarget), *(_QWORD *)&v21->_fade.period);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Ramping up factor %f -> %f in %f", v23, 0x20u);
      }
      return 0;
    }
    else
    {
      v15 = 0;
      if (v21->_logHandle)
      {
        v10 = v21->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v9 = init_default_corebrightness_log();
        v10 = v9;
      }
      v15 = v10;
      v14 = 16;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v7 = v15;
        v8 = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1B5291000, v7, v8, "Trying to start ramp up when not active", v13, 2u);
      }
      return 1;
    }
  }
  else
  {
    v17 = 0;
    if (v21->_logHandle)
    {
      v12 = v21->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v11 = init_default_corebrightness_log();
      v12 = v11;
    }
    v17 = v12;
    v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v24, COERCE__INT64(v19), COERCE__INT64(v18));
      _os_log_error_impl(&dword_1B5291000, v17, v16, "Out of range factor %f or fade %f", v24, 0x16u);
    }
    return 1;
  }
}

@end
