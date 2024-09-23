@implementation CBAnalyticsScheduler

+ (id)sharedInstance
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  SEL v10;
  id v11;
  uint64_t *v12;
  dispatch_once_t *v13;

  v11 = a1;
  v10 = a2;
  objc_sync_enter(a1);
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __38__CBAnalyticsScheduler_sharedInstance__block_invoke;
  v8 = &unk_1E68E9E60;
  v9 = v11;
  v13 = &sharedInstance_onceToken;
  v12 = &v4;
  if (sharedInstance_onceToken != -1)
    dispatch_once(v13, v12);
  objc_sync_exit(a1);
  return (id)sharedInstance__sharedObject;
}

uint64_t __38__CBAnalyticsScheduler_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_super v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1;
  v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___CBAnalyticsScheduler;
  result = objc_msgSend(objc_msgSendSuper2(&v2, sel_alloc), "init");
  sharedInstance__sharedObject = result;
  return result;
}

- (CBAnalyticsScheduler)init
{
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint64_t handler;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  _QWORD *v11;
  _QWORD v12[2];
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  CBAnalyticsScheduler *v17;
  xpc_object_t v18;
  uint8_t v19[7];
  char v20;
  NSObject *v21;
  objc_super v22;
  SEL v23;
  CBAnalyticsScheduler *v24;

  v24 = self;
  v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)CBAnalyticsScheduler;
  v24 = -[CBAnalyticsScheduler init](&v22, sel_init);
  if (v24)
  {
    v24->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.CBAnalyticsScheduler", "default");
    if (!v24->_logHandle)
    {
      v21 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v21 = inited;
      v20 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = v21;
        type = v20;
        __os_log_helper_16_0_0(v19);
        _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create log handle", v19, 2u);
      }
    }
    v24->_requests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24->_requestId = 1;
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v18, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807F0]);
    xpc_dictionary_set_string(v18, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
    v12[0] = 0;
    v12[1] = v12;
    v13 = 1375731712;
    v14 = 48;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = v24;
    handler = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __28__CBAnalyticsScheduler_init__block_invoke;
    v10 = &unk_1E68EA0E0;
    v11 = v12;
    xpc_activity_register("com.apple.CoreBrightness.Analytics", v18, &handler);
    xpc_release(v18);
    _Block_object_dispose(v12, 8);
  }
  return v24;
}

uint64_t __28__CBAnalyticsScheduler_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "run");
}

- (void)run
{
  uint64_t inited;
  NSObject *logHandle;
  void *v5;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v5 = (void *)-[NSMutableDictionary copy](self->_requests, "copy");
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v7, -[NSMutableDictionary count](self->_requests, "count"));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Running analytics scheduler - got %lu handlers", v7, 0xCu);
  }
  objc_sync_exit(self);
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1);

}

uint64_t __27__CBAnalyticsScheduler_run__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
    return (*(uint64_t (**)(void))(a3 + 16))();
  return result;
}

- (int64_t)registerHandler:(id)a3
{
  uint64_t v3;
  unint64_t requestId;
  void *context;
  id v8;

  v3 = objc_sync_enter(self);
  context = (void *)MEMORY[0x1B5E4A8B0](v3);
  v8 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKey:](self->_requests, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestId));
  requestId = self->_requestId;
  self->_requestId = requestId + 1;
  objc_autoreleasePoolPop(context);
  objc_sync_exit(self);
  return requestId;
}

- (void)removeHandler:(int64_t)a3
{
  uint64_t v3;
  void *context;

  v3 = objc_sync_enter(self);
  context = (void *)MEMORY[0x1B5E4A8B0](v3);
  -[NSMutableDictionary removeObjectForKey:](self->_requests, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
  objc_autoreleasePoolPop(context);
  objc_sync_exit(self);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAnalyticsScheduler *v4;

  v4 = self;
  v3 = a2;
  xpc_activity_unregister("com.apple.CoreBrightness.Analytics");
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v4->_requests = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBAnalyticsScheduler;
  -[CBAnalyticsScheduler dealloc](&v2, sel_dealloc);
}

@end
