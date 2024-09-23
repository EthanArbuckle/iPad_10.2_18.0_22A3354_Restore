@implementation CBProxFilter

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  BOOL v5;

  v5 = 0;
  if ((objc_msgSend(a4, "isEqual:", CFSTR("AutoBrightnessProxEnabled")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CBProxFilter setIsActive:](self, "setIsActive:", objc_msgSend(a3, "BOOLValue") & 1);
      return 1;
    }
  }
  return v5;
}

- (id)filterEvent:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "eventType");
  if (v4 == 12)
    return -[CBProxFilter handleALSEvent:](self, "handleALSEvent:", a3);
  if (v4 == 14)
    return -[CBProxFilter handleProximityEvent:](self, "handleProximityEvent:", a3);
  return a3;
}

- (id)handleALSEvent:(id)a3
{
  float v3;

  if (self->_proxHasJustBeenRemoved)
  {
    objc_msgSend(a3, "timestamp");
    if ((float)(v3 - self->_proxReleaseTime) > self->_proxTriggerDelay)
    {
      self->_proxHasJustBeenRemoved = 0;
      -[CBProxFilter setTriggered:](self, "setTriggered:", 0);
      self->_proxReleaseTime = 0.0;
    }
  }
  if (-[CBProxFilter isActive](self, "isActive") && self->_triggered)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a3, "firstALSSample") & 1) == 0)
      objc_msgSend(a3, "setObstructed:", 1);
  }
  return a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (id)handleProximityEvent:(id)a3
{
  float v3;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v11[15];
  char v12;
  NSObject *v13;
  os_log_type_t v14;
  os_log_t v15;
  int IntegerValue;
  uint64_t v17;
  id v18;
  SEL v19;
  CBProxFilter *v20;
  uint8_t v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = objc_msgSend(a3, "event");
  IntegerValue = IOHIDEventGetIntegerValue();
  if ((IntegerValue & 0x200) != 0 || (IntegerValue & 0x40) != 0 || (IntegerValue & 0x100) != 0)
  {
    v15 = 0;
    if (v20->super._logHandle)
    {
      logHandle = v20->super._logHandle;
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
    v14 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v21, IntegerValue);
      _os_log_impl(&dword_1B5291000, v15, v14, "setting _proxTriggered = YES (proxMask=%x)", v21, 8u);
    }
    -[CBProxFilter setTriggered:](v20, "setTriggered:", 1);
    v20->_proxHasJustBeenRemoved = 0;
  }
  else
  {
    v13 = 0;
    if (v20->super._logHandle)
    {
      v8 = v20->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    v13 = v8;
    v12 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v5 = v13;
      v6 = v12;
      __os_log_helper_16_0_0(v11);
      _os_log_impl(&dword_1B5291000, v5, v6, "Prox has been removed", v11, 2u);
    }
    v20->_proxHasJustBeenRemoved = 1;
    objc_msgSend(v18, "timestamp");
    v20->_proxReleaseTime = v3;
  }
  return v18;
}

- (void)setTriggered:(BOOL)a3
{
  void *context;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_triggered != a3)
  {
    self->_triggered = a3;
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
      __os_log_helper_16_0_2_4_0_4_0((uint64_t)v8, v6, self->_isActive);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Setting triggered = %d active = %d", v8, 0xEu);
    }
    if (-[CBProxFilter isActive](self, "isActive"))
    {
      context = (void *)MEMORY[0x1B5E4A8B0]();
      -[CBFilter sendNotificationForKey:andValue:](self, "sendNotificationForKey:andValue:", CFSTR("ProxStateChanged"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_triggered));
      objc_autoreleasePoolPop(context);
    }
  }
}

- (CBProxFilter)init
{
  os_log_t v2;
  objc_super v4;
  SEL v5;
  CBProxFilter *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CBProxFilter;
  v6 = -[CBFilter init](&v4, sel_init);
  if (v6)
  {
    v2 = os_log_create("com.apple.CoreBrightness.CBProxFilter", "default");
    v6->super._logHandle = (OS_os_log *)v2;
    v6->_proxReleaseTime = 0.0;
    v6->_proxHasJustBeenRemoved = 0;
    v6->_proxTriggerDelay = 3.0;
    v6->_isActive = 1;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBProxFilter *v4;

  v4 = self;
  v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBProxFilter;
  -[CBFilter dealloc](&v2, sel_dealloc);
}

- (void)setIsActive:(BOOL)a3
{
  uint64_t inited;
  NSObject *logHandle;
  BOOL v5;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = a3;
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
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v7, self->_isActive, v5);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Changing active=%d to %d", v7, 0xEu);
  }
  self->_isActive = v5;
}

@end
