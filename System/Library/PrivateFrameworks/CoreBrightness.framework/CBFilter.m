@implementation CBFilter

- (id)copyPropertyForKey:(id)a3
{
  return 0;
}

- (CBFilter)init
{
  dispatch_queue_t v2;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[15];
  char v9;
  NSObject *v10;
  objc_super v11;
  SEL v12;
  CBFilter *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)CBFilter;
  v13 = -[CBFilter init](&v11, sel_init);
  if (!v13)
    return v13;
  v2 = dispatch_queue_create("CBFilter", 0);
  v13->_queue = (OS_dispatch_queue *)v2;
  if (v13->_queue)
    return v13;
  v10 = 0;
  if (v13->_logHandle)
  {
    logHandle = v13->_logHandle;
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
  v9 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    log = v10;
    type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_error_impl(&dword_1B5291000, log, type, "failed to create dispatch queue", v8, 2u);
  }

  v13 = 0;
  return 0;
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  NSObject *queue;
  uint64_t block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CBFilter *v9;
  id v10;
  id v11;
  SEL v12;
  CBFilter *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  if (self->_queue)
  {
    -[CBFilter unscheduleWithDispatchQueue:](v13, "unscheduleWithDispatchQueue:", v11);
    queue = v13->_queue;
    block = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __38__CBFilter_scheduleWithDispatchQueue___block_invoke;
    v8 = &unk_1E68EA540;
    v9 = v13;
    v10 = v11;
    dispatch_sync(queue, &block);
  }
}

void __38__CBFilter_scheduleWithDispatchQueue___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)unscheduleWithDispatchQueue:(id)a3
{
  NSObject *queue;
  uint64_t block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CBFilter *v9;
  id v10;
  id v11;
  SEL v12;
  CBFilter *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  if (self->_queue)
  {
    queue = v13->_queue;
    block = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __40__CBFilter_unscheduleWithDispatchQueue___block_invoke;
    v8 = &unk_1E68EA540;
    v9 = v13;
    v10 = v11;
    dispatch_sync(queue, &block);
  }
}

void __40__CBFilter_unscheduleWithDispatchQueue___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    {
      dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    }
  }
}

- (void)registerNotificationBlock:(id)a3
{
  NSObject *queue;
  uint64_t block;
  int v5;
  int v6;
  const void **(*v7)(const void **);
  void *v8;
  CBFilter *v9;
  id v10;
  id v11;
  SEL v12;
  CBFilter *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  -[CBFilter unregisterNotificationBlock](self, "unregisterNotificationBlock");
  if (v13->_queue)
  {
    queue = v13->_queue;
    block = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __38__CBFilter_registerNotificationBlock___block_invoke;
    v8 = &unk_1E68EB340;
    v10 = v11;
    v9 = v13;
    dispatch_sync(queue, &block);
  }
}

const void **__38__CBFilter_registerNotificationBlock___block_invoke(const void **result)
{
  const void **v1;

  v1 = result;
  if (result[5])
  {
    result = (const void **)_Block_copy(result[5]);
    *((_QWORD *)v1[4] + 4) = result;
  }
  return result;
}

- (void)unregisterNotificationBlock
{
  NSObject *queue;
  uint64_t block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  CBFilter *v8;
  SEL v9;
  CBFilter *v10;

  v10 = self;
  v9 = a2;
  if (self->_queue)
  {
    queue = v10->_queue;
    block = MEMORY[0x1E0C809B0];
    v4 = -1073741824;
    v5 = 0;
    v6 = __39__CBFilter_unregisterNotificationBlock__block_invoke;
    v7 = &unk_1E68E9E60;
    v8 = v10;
    dispatch_sync(queue, &block);
  }
}

void __39__CBFilter_unregisterNotificationBlock__block_invoke(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v4;
  uint8_t v6[7];
  char v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  v8 = 0;
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
  v8 = v4;
  v7 = 2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v6, 2u);
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    _Block_release(*(const void **)(*(_QWORD *)(a1 + 32) + 32));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  dispatch_object_t *v4;

  v4 = (dispatch_object_t *)self;
  v3 = a2;
  if (self->_queue)
  {
    dispatch_release(v4[2]);
    v4[2] = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBFilter;
  -[CBFilter dealloc](&v2, sel_dealloc);
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  id v4;
  id v5;
  NSObject *notificationQueue;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  os_log_type_t v18;
  os_log_t v19;
  id v20;
  id v21;
  SEL v22;
  CBFilter *v23;
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  if (self->_notificationQueue && v23->_notificationBlock)
  {
    v19 = 0;
    if (v23->_logHandle)
    {
      logHandle = v23->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v19 = logHandle;
    v18 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)v21);
      _os_log_debug_impl(&dword_1B5291000, v19, v18, "send notification for key = %@", v24, 0xCu);
    }
    v17 = 0;
    v17 = _Block_copy(v23->_notificationBlock);
    if (v17)
    {
      v4 = v20;
      v5 = v21;
      notificationQueue = v23->_notificationQueue;
      block = MEMORY[0x1E0C809B0];
      v10 = -1073741824;
      v11 = 0;
      v12 = __44__CBFilter_sendNotificationForKey_andValue___block_invoke;
      v13 = &unk_1E68EA938;
      v14 = v21;
      v16 = v17;
      v15 = v20;
      dispatch_async(notificationQueue, &block);
    }
  }
}

void __44__CBFilter_sendNotificationForKey_andValue___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    _Block_release(*(const void **)(a1 + 48));
  }

}

- (id)filterEvent:(id)a3
{
  return a3;
}

- (id)filterEvents:(id)a3
{
  return a3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

@end
