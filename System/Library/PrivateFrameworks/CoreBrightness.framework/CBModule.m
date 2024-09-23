@implementation CBModule

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->_notificationBlock)
    (*((void (**)(void))self->_notificationBlock + 2))();
}

- (CBModule)initWithQueue:(id)a3
{
  objc_super v4;
  id v5;
  SEL v6;
  void *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  if (!a3)
    return 0;
  v4.receiver = v7;
  v4.super_class = (Class)CBModule;
  v7 = -[CBModule init](&v4, sel_init);
  if (v7)
  {
    *((_QWORD *)v7 + 3) = v5;
    dispatch_retain(*((dispatch_object_t *)v7 + 3));
  }
  return (CBModule *)v7;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBModule *v4;

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
  v2.receiver = v4;
  v2.super_class = (Class)CBModule;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (void)registerNotificationBlock:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CBModule unregisterNotificationBlock](self, "unregisterNotificationBlock");
  if (a3)
    self->_notificationBlock = _Block_copy(a3);
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
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)self->_notificationBlock);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "notificationBlock = %p", v7, 0xCu);
  }
}

- (void)unregisterNotificationBlock
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  char v7;
  NSObject *v8;
  SEL v9;
  CBModule *v10;

  v10 = self;
  v9 = a2;
  if (self->_notificationBlock)
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
    v7 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v8;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_debug_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v6, 2u);
    }
    _Block_release(v10->_notificationBlock);
    v10->_notificationBlock = 0;
  }
}

@end
