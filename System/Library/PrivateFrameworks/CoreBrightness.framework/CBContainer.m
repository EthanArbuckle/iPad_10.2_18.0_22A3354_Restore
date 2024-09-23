@implementation CBContainer

- (void)scheduleWithDispatchQueue:(id)a3
{
  NSObject *queue;
  uint64_t block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CBContainer *v9;
  id v10;
  id v11;
  SEL v12;
  CBContainer *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  if (self->_queue)
  {
    -[CBContainer unscheduleWithDispatchQueue:](v13, "unscheduleWithDispatchQueue:", v11);
    queue = v13->_queue;
    block = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __41__CBContainer_scheduleWithDispatchQueue___block_invoke;
    v8 = &unk_1E68EA540;
    v9 = v13;
    v10 = v11;
    dispatch_sync(queue, &block);
  }
}

void __41__CBContainer_scheduleWithDispatchQueue___block_invoke(uint64_t a1)
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
  CBContainer *v9;
  id v10;
  id v11;
  SEL v12;
  CBContainer *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  if (self->_queue)
  {
    queue = v13->_queue;
    block = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __43__CBContainer_unscheduleWithDispatchQueue___block_invoke;
    v8 = &unk_1E68EA540;
    v9 = v13;
    v10 = v11;
    dispatch_sync(queue, &block);
  }
}

void __43__CBContainer_unscheduleWithDispatchQueue___block_invoke(uint64_t a1)
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
  void (*v7)(uint64_t);
  void *v8;
  CBContainer *v9;
  id v10;
  id v11;
  SEL v12;
  CBContainer *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  -[CBContainer unregisterNotificationBlock](self, "unregisterNotificationBlock");
  if (v13->_queue)
  {
    queue = v13->_queue;
    block = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __41__CBContainer_registerNotificationBlock___block_invoke;
    v8 = &unk_1E68EB340;
    v10 = v11;
    v9 = v13;
    dispatch_sync(queue, &block);
  }
}

void __41__CBContainer_registerNotificationBlock___block_invoke(uint64_t a1)
{
  uint64_t inited;
  NSObject *v2;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = _Block_copy(*(const void **)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v2 = inited;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    _os_log_debug_impl(&dword_1B5291000, v2, OS_LOG_TYPE_DEBUG, "notificationBlock = %p", v4, 0xCu);
  }
}

- (void)unregisterNotificationBlock
{
  NSObject *queue;
  uint64_t block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  CBContainer *v8;
  SEL v9;
  CBContainer *v10;

  v10 = self;
  v9 = a2;
  if (self->_queue)
  {
    queue = v10->_queue;
    block = MEMORY[0x1E0C809B0];
    v4 = -1073741824;
    v5 = 0;
    v6 = __42__CBContainer_unregisterNotificationBlock__block_invoke;
    v7 = &unk_1E68E9E60;
    v8 = v10;
    dispatch_sync(queue, &block);
  }
}

void __42__CBContainer_unregisterNotificationBlock__block_invoke(uint64_t a1)
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
  CBContainer *v4;

  v4 = self;
  v3 = a2;
  if (self->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBContainer;
  -[CBContainer dealloc](&v2, sel_dealloc);
}

@end
