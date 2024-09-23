@implementation CBExtendedDisplayMitigation

+ (BOOL)isSupported
{
  char v3;

  v3 = 0;
  if (CBU_IsPad())
    v3 = MGGetBoolAnswer() & 1;
  return v3 & 1;
}

- (CBExtendedDisplayMitigation)init
{
  os_log_t v2;
  float v3;
  uint64_t inited;
  NSObject *logHandle;
  objc_super v7;
  SEL v8;
  CBExtendedDisplayMitigation *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)CBExtendedDisplayMitigation;
  v9 = -[CBExtendedDisplayMitigation init](&v7, sel_init);
  if (v9)
  {
    v9->_isActive = 0;
    v2 = os_log_create("com.apple.CoreBrightness.AABC.EDM", "default");
    v9->_logHandle = (OS_os_log *)v2;
    if (v9->_logHandle)
    {
      logHandle = v9->_logHandle;
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
      -[CBExtendedDisplayMitigation getCap](v9, "getCap");
      __os_log_helper_16_0_1_8_0((uint64_t)v10, COERCE__INT64(v3));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "EDM cap created, will limit to %f when active", v10, 0xCu);
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBExtendedDisplayMitigation *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBExtendedDisplayMitigation;
  -[CBExtendedDisplayMitigation dealloc](&v2, sel_dealloc);
}

- (BOOL)setActive:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v8;
  char v9;
  uint8_t v10[16];
  uint8_t v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_isActive == a3)
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
      __os_log_helper_16_0_1_4_0((uint64_t)v11, v8);
      _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "State of extended display mitigation already set to to %d", v11, 8u);
    }
    v9 = 0;
  }
  else
  {
    self->_isActive = a3;
    if (self->_logHandle)
    {
      v5 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v4 = init_default_corebrightness_log();
      v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v10, v8);
      _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEFAULT, "Setting state of extended display mitigation to %d", v10, 8u);
    }
    v9 = 1;
  }
  return v9 & 1;
}

- (float)getCap
{
  return 335.0;
}

- (BOOL)isActive
{
  return self->_isActive;
}

@end
