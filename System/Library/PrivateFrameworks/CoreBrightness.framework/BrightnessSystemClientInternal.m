@implementation BrightnessSystemClientInternal

uint64_t __53__BrightnessSystemClientInternal_setProperty_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "clientSetPropertyWithKey:property:", a1[5], a1[6], a1, a1);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v5;
  NSObject *logHandle;
  uint64_t block;
  int v9;
  int v10;
  uint64_t (*v11)(_QWORD *);
  void *v12;
  BrightnessSystemClientInternal *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  os_log_type_t v17;
  os_log_t v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id v23;
  SEL v24;
  BrightnessSystemClientInternal *v25;
  char v26;
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  objc_sync_enter(self);
  if (v25->_remote)
  {
    v20 = (id)objc_msgSend(v22, "copy");
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v23, 0);
    if ((objc_msgSend(v22, "isEqual:", CFSTR("DisplayMode")) & 1) != 0)
    {
      v18 = 0;
      if (v25->_logHandle)
      {
        logHandle = v25->_logHandle;
      }
      else
      {
        v5 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v5;
      }
      v18 = logHandle;
      v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v23);
        _os_log_impl(&dword_1B5291000, v18, v17, "[Display Mode] %@", v27, 0xCu);
      }
    }
    if (v25->_useSynchronousRemote)
    {
      v16 = 0;
      block = MEMORY[0x1E0C809B0];
      v9 = -1073741824;
      v10 = 0;
      v11 = __53__BrightnessSystemClientInternal_setProperty_forKey___block_invoke;
      v12 = &unk_1E68EA150;
      v13 = v25;
      v14 = v20;
      v15 = v19;
      v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
      dispatch_sync((dispatch_queue_t)v25->_serialQueue, v16);
      if (v16)
        _Block_release(v16);
    }
    else
    {
      objc_msgSend(v25->_remote, "clientSetPropertyWithKey:property:", v20, v19);
    }

    v21 = 0;
  }
  else
  {
    v26 = 0;
    v21 = 1;
  }
  objc_sync_exit(self);
  if (!v21)
    v26 = 1;
  return v26 & 1;
}

- (BrightnessSystemClientInternal)init
{
  os_log_t v2;
  uint64_t v3;
  NSObject *v4;
  NSCondition *v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  NSXPCConnection *v9;
  uint64_t v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  BrightnessSystemClientExportedObj *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  NSObject *v22;
  uint64_t v23;
  int v24;
  int v25;
  void (*v26)(uint64_t, uint64_t);
  void *v27;
  BrightnessSystemClientInternal *v28;
  uint64_t v29;
  int v30;
  int v31;
  void (*v32)(uint64_t, uint64_t);
  void *v33;
  BrightnessSystemClientInternal *v34;
  uint64_t v35;
  int v36;
  int v37;
  void (*v38)(uint64_t);
  void *v39;
  BrightnessSystemClientInternal *v40;
  uint64_t v41;
  int v42;
  int v43;
  void (*v44)(uint64_t);
  void *v45;
  BrightnessSystemClientInternal *v46;
  os_log_type_t v47;
  os_log_t v48;
  dispatch_object_t v49;
  uint8_t v50[15];
  char v51;
  NSObject *v52;
  objc_super v53;
  SEL v54;
  BrightnessSystemClientInternal *v55;
  uint8_t v57[8];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v55 = self;
  v54 = a2;
  v53.receiver = self;
  v53.super_class = (Class)BrightnessSystemClientInternal;
  v55 = -[BrightnessSystemClientInternal init](&v53, sel_init);
  if (!v55)
    return v55;
  v2 = os_log_create("com.apple.CoreBrightness.BSCI", "default");
  v55->_logHandle = (OS_os_log *)v2;
  if (!v55->_logHandle)
  {
    v52 = 0;
    v22 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v52 = v22;
    v51 = 16;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      log = v52;
      type = v51;
      __os_log_helper_16_0_0(v50);
      _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v50, 2u);
    }
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.backlightd"), 0);
  v55->_connection = (NSXPCConnection *)v3;
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v49 = dispatch_queue_create("com.apple.CoreBrightness.BSCI NSXPC", v4);
  if (v49)
  {
    -[NSXPCConnection _setQueue:](v55->_connection, "_setQueue:", v49);
    dispatch_release(v49);
  }
  v55->copyPropertyForKeyCompleted = 0;
  v5 = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
  v55->copyPropertyForKeyWaitCondition = v5;
  v55->_useSynchronousRemote = 0;
  if ((_os_feature_enabled_impl() & 1) != 0)
    v55->_useSynchronousRemote = 1;
  v48 = 0;
  if (v55->_logHandle)
  {
    logHandle = v55->_logHandle;
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
  v47 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v57, v55->_useSynchronousRemote);
    _os_log_impl(&dword_1B5291000, v48, v47, "use_synchronous_remote=%d", v57, 8u);
  }
  if (!v55->_connection)
    goto LABEL_30;
  v6 = objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF12E668);
  -[NSXPCConnection setRemoteObjectInterface:](v55->_connection, "setRemoteObjectInterface:", v6);
  v17 = MEMORY[0x1E0C809B0];
  v41 = MEMORY[0x1E0C809B0];
  v42 = -1073741824;
  v43 = 0;
  v44 = __38__BrightnessSystemClientInternal_init__block_invoke;
  v45 = &unk_1E68E9E60;
  v46 = v55;
  -[NSXPCConnection setInvalidationHandler:](v55->_connection, "setInvalidationHandler:", &v41);
  v35 = v17;
  v36 = -1073741824;
  v37 = 0;
  v38 = __38__BrightnessSystemClientInternal_init__block_invoke_66;
  v39 = &unk_1E68E9E60;
  v40 = v55;
  -[NSXPCConnection setInterruptionHandler:](v55->_connection, "setInterruptionHandler:", &v35);
  if (!v55->_useSynchronousRemote)
  {
    connection = v55->_connection;
    v23 = MEMORY[0x1E0C809B0];
    v24 = -1073741824;
    v25 = 0;
    v26 = __38__BrightnessSystemClientInternal_init__block_invoke_70;
    v27 = &unk_1E68EA128;
    v28 = v55;
    v12 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &v23);
    v55->_remote = (id)v12;
    goto LABEL_25;
  }
  v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v8 = dispatch_queue_create("com.apple.CoreBrightness.BSCI serial", v7);
  v55->_serialQueue = (OS_dispatch_queue *)v8;
  if (!v55->_serialQueue)
  {
LABEL_30:

    return 0;
  }
  v9 = v55->_connection;
  v29 = MEMORY[0x1E0C809B0];
  v30 = -1073741824;
  v31 = 0;
  v32 = __38__BrightnessSystemClientInternal_init__block_invoke_2;
  v33 = &unk_1E68EA128;
  v34 = v55;
  v10 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v9, "synchronousRemoteObjectProxyWithErrorHandler:", &v29);
  v55->_remote = (id)v10;
LABEL_25:
  if (!v55->_remote)
    goto LABEL_30;
  v13 = v55->_remote;
  v14 = objc_alloc_init(BrightnessSystemClientExportedObj);
  v55->exportedObj = v14;
  if (!v55->exportedObj)
    goto LABEL_30;
  -[BrightnessSystemClientExportedObj setTarget:](v55->exportedObj, "setTarget:", v55);
  v15 = objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF12D100);
  -[NSXPCConnection setExportedInterface:](v55->_connection, "setExportedInterface:", v15);
  -[NSXPCConnection setExportedObject:](v55->_connection, "setExportedObject:", v55->exportedObj);
  -[NSXPCConnection resume](v55->_connection, "resume");
  return v55;
}

- (id)copyPropertyForKey:(id)a3
{
  id remote;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *log;
  os_log_type_t v9;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v13[7];
  os_log_type_t type;
  os_log_t oslog;
  char v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t, void *, void *);
  void *v22;
  BrightnessSystemClientInternal *v23;
  uint64_t *v24;
  uint64_t block;
  int v26;
  int v27;
  uint64_t (*v28)(_QWORD *);
  void *v29;
  BrightnessSystemClientInternal *v30;
  id v31;
  uint64_t *v32;
  dispatch_block_t v33;
  id v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  int v38;
  int v39;
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  uint64_t v42;
  id v43;
  SEL v44;
  BrightnessSystemClientInternal *v45;
  void *v46;
  uint8_t v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v45 = self;
  v44 = a2;
  v43 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 1375731712;
  v39 = 48;
  v40 = __Block_byref_object_copy__1;
  v41 = __Block_byref_object_dispose__1;
  v42 = 0;
  objc_sync_enter(self);
  if (v45->_remote)
  {
    v34 = (id)objc_msgSend(v43, "copy");
    if (v45->_useSynchronousRemote)
    {
      v33 = 0;
      block = MEMORY[0x1E0C809B0];
      v26 = -1073741824;
      v27 = 0;
      v28 = __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke;
      v29 = &unk_1E68EA1A0;
      v30 = v45;
      v31 = v34;
      v32 = &v36;
      v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
      dispatch_sync((dispatch_queue_t)v45->_serialQueue, v33);
      if (v33)
        _Block_release(v33);
    }
    else
    {
      -[NSCondition lock](v45->copyPropertyForKeyWaitCondition, "lock");
      v45->copyPropertyForKeyCompleted = 0;
      -[NSCondition unlock](v45->copyPropertyForKeyWaitCondition, "unlock");
      remote = v45->_remote;
      v18 = MEMORY[0x1E0C809B0];
      v19 = -1073741824;
      v20 = 0;
      v21 = __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke_3;
      v22 = &unk_1E68EA1C8;
      v24 = &v36;
      v23 = v45;
      objc_msgSend(remote, "clientCopyPropertyWithKey:reply:", v34, &v18);
      -[NSCondition lock](v45->copyPropertyForKeyWaitCondition, "lock");
      while (!v45->copyPropertyForKeyCompleted)
      {
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 10.0);
        v16 = 0;
        v16 = !-[NSCondition waitUntilDate:](v45->copyPropertyForKeyWaitCondition, "waitUntilDate:", v17);

        if ((v16 & 1) != 0)
        {
          oslog = 0;
          if (v45->_logHandle)
          {
            logHandle = v45->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              inited = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              inited = init_default_corebrightness_log();
            logHandle = inited;
          }
          oslog = logHandle;
          type = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
          {
            log = oslog;
            v9 = type;
            __os_log_helper_16_0_0(v13);
            _os_log_impl(&dword_1B5291000, log, v9, "copyPropertyForKeyWaitCondition waitUntilDate timeout", v13, 2u);
          }
          break;
        }
      }
      v45->copyPropertyForKeyCompleted = 0;
      -[NSCondition unlock](v45->copyPropertyForKeyWaitCondition, "unlock");
    }

    v35 = 0;
  }
  else
  {
    v46 = 0;
    v35 = 1;
  }
  objc_sync_exit(self);
  if (!v35)
  {
    if ((objc_msgSend(v43, "isEqual:", CFSTR("DisplayBrightness")) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v45->_logHandle)
        {
          v7 = v45->_logHandle;
        }
        else
        {
          v6 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          v7 = v6;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v5 = objc_opt_class();
          __os_log_helper_16_2_1_8_64((uint64_t)v47, v5);
          _os_log_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEFAULT, "Value of the key, \"kCBDisplayBrightnessKey\", is NOT a dictionary class (is a \"%@\" object)", v47, 0xCu);
        }
      }
    }
    if (v37[5] == *MEMORY[0x1E0C9B0D0])
    {
      CFRelease((CFTypeRef)v37[5]);
      v37[5] = 0;
    }
    v46 = (void *)v37[5];
    v35 = 1;
  }
  _Block_object_dispose(&v36, 8);
  return v46;
}

uint64_t __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  int v6;
  int v7;
  CFTypeRef (*v8)(uint64_t, void *, void *);
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v12 = a1;
  v11 = a1;
  v2 = *(void **)(a1[4] + 16);
  v3 = a1[5];
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke_2;
  v9 = &unk_1E68EA178;
  v10 = a1[6];
  return objc_msgSend(v2, "clientCopyPropertyWithKey:reply:", v3, &v5);
}

CFTypeRef __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  CFTypeRef result;
  CFTypeRef v4;

  result = (CFTypeRef)objc_msgSend(a3, "code");
  if (!result)
  {
    result = (CFTypeRef)objc_msgSend(a2, "objectAtIndex:", 0);
    if (result)
    {
      result = CFRetain(result);
      v4 = result;
    }
    else
    {
      v4 = 0;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v4;
  }
  return result;
}

- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4
{
  id v4;

  objc_sync_enter(self);
  if (self->_remote)
  {
    -[BrightnessSystemClientInternal registerNotificationBlock:](self, "registerNotificationBlock:", 0);
    if (self->_clientProperties)
    {

      self->_clientProperties = 0;
    }
    if (a4)
      self->_clientProperties = (NSMutableArray *)objc_msgSend(a4, "mutableCopy");
    if (self->_clientProperties)
    {
      objc_msgSend(self->_remote, "registerNotificationForProperties:", self->_clientProperties);
    }
    else
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      objc_msgSend(self->_remote, "registerNotificationForProperties:", v4);

    }
    -[BrightnessSystemClientInternal registerNotificationBlock:](self, "registerNotificationBlock:", a3, v4);
  }
  objc_sync_exit(self);
}

- (void)registerNotificationBlock:(id)a3
{
  BrightnessSystemClientInternal *obj;
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint8_t v7[15];
  os_log_type_t v8;
  NSObject *v9;
  id v10;
  SEL v11;
  BrightnessSystemClientInternal *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = 0;
  if (_COREBRIGHTNESS_LOG_DEFAULT)
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
  else
    inited = init_default_corebrightness_log();
  v9 = inited;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "Register notification block", v7, 2u);
  }
  obj = v12;
  objc_sync_enter(v12);
  -[BrightnessSystemClientExportedObj registerNotificationBlock:](v12->exportedObj, "registerNotificationBlock:", v10);
  objc_sync_exit(obj);
}

- (void)stopXpcService
{
  objc_sync_enter(self);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");

  self->_remote = 0;
  objc_sync_exit(self);
}

- (void)dealloc
{
  BrightnessSystemClientInternal *obj;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  objc_super v7;
  uint8_t v8[7];
  char v9;
  NSObject *v10;
  SEL v11;
  BrightnessSystemClientInternal *v12;

  v12 = self;
  v11 = a2;
  v10 = 0;
  if (self->_logHandle)
  {
    logHandle = v12->_logHandle;
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
  v9 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v10;
    type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_debug_impl(&dword_1B5291000, log, type, "BSCI dealloc", v8, 2u);
  }
  if (v12->_logHandle)
  {

    v12->_logHandle = 0;
  }
  obj = v12;
  objc_sync_enter(v12);
  -[BrightnessSystemClientInternal registerNotificationBlock:](v12, "registerNotificationBlock:", 0);
  if (v12->_clientProperties)
  {

    v12->_clientProperties = 0;
  }
  if (v12->_connection)

  if (v12->exportedObj)
  {

    v12->exportedObj = 0;
  }
  if (v12->_useSynchronousRemote)

  objc_sync_exit(obj);
  v7.receiver = v12;
  v7.super_class = (Class)BrightnessSystemClientInternal;
  -[BrightnessSystemClientInternal dealloc](&v7, sel_dealloc);
}

void __38__BrightnessSystemClientInternal_init__block_invoke(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v4;
  uint8_t v5[7];
  os_log_type_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = a1;
  v7 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v4 = inited;
  }
  v7 = v4;
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    log = v7;
    type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_impl(&dword_1B5291000, log, type, "Connection invalidated!", v5, 2u);
  }
}

void __38__BrightnessSystemClientInternal_init__block_invoke_66(uint64_t a1)
{
  NSObject *global_queue;
  id obj;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v6;
  uint64_t block;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  uint8_t v14[7];
  os_log_type_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = a1;
  v17 = a1;
  v16 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v6 = inited;
  }
  v16 = v6;
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    log = v16;
    type = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_impl(&dword_1B5291000, log, type, "Connection interrupted!", v14, 2u);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 1) != 0)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    block = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __38__BrightnessSystemClientInternal_init__block_invoke_67;
    v12 = &unk_1E68E9E60;
    v13 = *(_QWORD *)(a1 + 32);
    dispatch_async(global_queue, &block);
  }
  else
  {
    obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reconnect");
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "registerNotificationForProperties:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    objc_sync_exit(obj);
  }
}

uint64_t __38__BrightnessSystemClientInternal_init__block_invoke_67(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reconnect");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "registerNotificationForProperties:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  return objc_sync_exit(obj);
}

void __38__BrightnessSystemClientInternal_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  NSObject *v3;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v3 = inited;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v5, a2);
    _os_log_error_impl(&dword_1B5291000, v3, OS_LOG_TYPE_ERROR, "_connection synchronousRemoteObjectProxyWithErrorHandler error: %{public}@", v5, 0xCu);
  }
}

void __38__BrightnessSystemClientInternal_init__block_invoke_70(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  NSObject *v3;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lock");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "signal");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "unlock");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v3 = inited;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v6, a2);
    _os_log_error_impl(&dword_1B5291000, v3, OS_LOG_TYPE_ERROR, "_connection remoteObjectProxyWithErrorHandler error: %{public}@", v6, 0xCu);
  }
}

- (BOOL)setSyncProperty:(id)a3 forKey:(id)a4
{
  NSObject *log;
  os_log_type_t v6;
  NSObject *logHandle;
  uint8_t v9[7];
  os_log_type_t type;
  os_log_t oslog;
  uint64_t block;
  int v13;
  int v14;
  uint64_t (*v15)(_QWORD *);
  void *v16;
  BrightnessSystemClientInternal *v17;
  id v18;
  id v19;
  uint64_t *v20;
  dispatch_block_t v21;
  id v22;
  id v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  int v27;
  int v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  char v32;
  id v33;
  id v34;
  SEL v35;
  BrightnessSystemClientInternal *v36;
  char v37;
  uint8_t v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36 = self;
  v35 = a2;
  v34 = a3;
  v33 = a4;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 1375731712;
  v28 = 48;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  objc_sync_enter(self);
  if (v36->_remote)
  {
    v23 = (id)objc_msgSend(v33, "copy");
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v34, 0);
    if (v36->_useSynchronousRemote)
    {
      v21 = 0;
      block = MEMORY[0x1E0C809B0];
      v13 = -1073741824;
      v14 = 0;
      v15 = __57__BrightnessSystemClientInternal_setSyncProperty_forKey___block_invoke;
      v16 = &unk_1E68E9E88;
      v17 = v36;
      v18 = v23;
      v19 = v22;
      v20 = &v25;
      v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
      if (v21)
      {
        dispatch_sync((dispatch_queue_t)v36->_serialQueue, v21);
        _Block_release(v21);
      }
    }
    else
    {
      oslog = 0;
      oslog = (os_log_t)v36->_logHandle;
      type = OS_LOG_TYPE_FAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
      {
        log = oslog;
        v6 = type;
        __os_log_helper_16_0_0(v9);
        _os_log_fault_impl(&dword_1B5291000, log, v6, "non-sycnhronous remote unsupported for set sycn property", v9, 2u);
      }
    }

    v24 = 0;
  }
  else
  {
    v37 = v32 & 1;
    v24 = 1;
  }
  objc_sync_exit(self);
  if (!v24)
  {
    if (v26[5] == *MEMORY[0x1E0C9B0D0])
    {

      v26[5] = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = objc_msgSend((id)v26[5], "BOOLValue") & 1;

      }
      else
      {
        logHandle = v36->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_FAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v38, v26[5]);
          _os_log_fault_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_FAULT, "unexpected result from setProperty (sync): %@", v38, 0xCu);
        }
      }
    }
    v37 = v32 & 1;
    v24 = 1;
  }
  _Block_object_dispose(&v25, 8);
  return v37 & 1;
}

uint64_t __57__BrightnessSystemClientInternal_setSyncProperty_forKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, void *, void *);
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v13 = a1;
  v12 = a1;
  v2 = *(void **)(a1[4] + 16);
  v3 = a1[5];
  v4 = a1[6];
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __57__BrightnessSystemClientInternal_setSyncProperty_forKey___block_invoke_2;
  v10 = &unk_1E68EA178;
  v11 = a1[7];
  return objc_msgSend(v2, "clientSetSYNCPropertyWithKey:property:reply:", v3, v4, &v6);
}

uint64_t __57__BrightnessSystemClientInternal_setSyncProperty_forKey___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "code");
  if (!result)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", 0), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

uint64_t __53__BrightnessSystemClientInternal_copyPropertyForKey___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  CFTypeRef v4;
  const void *v7;

  if (!objc_msgSend(a3, "code"))
  {
    v7 = (const void *)objc_msgSend(a2, "objectAtIndex:", 0);
    if (v7)
      v4 = CFRetain(v7);
    else
      v4 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v4;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lock", v4);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "signal");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "unlock");
}

- (void)addPropertiesForNotification:(id)a3
{
  BrightnessSystemClientInternal *obj;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  BrightnessSystemClientInternal *v9;
  id v10;
  SEL v11;
  BrightnessSystemClientInternal *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  if (a3)
  {
    obj = v12;
    objc_sync_enter(v12);
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __63__BrightnessSystemClientInternal_addPropertiesForNotification___block_invoke;
    v8 = &unk_1E68EA068;
    v9 = v12;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v4);
    objc_msgSend(v12->_remote, "registerNotificationForProperties:", v12->_clientProperties);
    objc_sync_exit(obj);
  }
}

uint64_t __63__BrightnessSystemClientInternal_addPropertiesForNotification___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addKeyToClientProperties:", a2);
  return result;
}

- (void)removePropertiesFromNotification:(id)a3
{
  BrightnessSystemClientInternal *obj;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  BrightnessSystemClientInternal *v9;
  id v10;
  SEL v11;
  BrightnessSystemClientInternal *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  if (a3)
  {
    obj = v12;
    objc_sync_enter(v12);
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __67__BrightnessSystemClientInternal_removePropertiesFromNotification___block_invoke;
    v8 = &unk_1E68EA068;
    v9 = v12;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v4);
    objc_msgSend(v12->_remote, "registerNotificationForProperties:", v12->_clientProperties);
    objc_sync_exit(obj);
  }
}

uint64_t __67__BrightnessSystemClientInternal_removePropertiesFromNotification___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeKeyFromClientProperties:", a2);
  return result;
}

- (void)addPropertyForNotification:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    -[BrightnessSystemClientInternal addKeyToClientProperties:](self, "addKeyToClientProperties:", a3);
    objc_msgSend(self->_remote, "registerNotificationForProperties:", self->_clientProperties);
    objc_sync_exit(self);
  }
}

- (void)removePropertyFromNotification:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    -[BrightnessSystemClientInternal removeKeyFromClientProperties:](self, "removeKeyFromClientProperties:", a3);
    objc_msgSend(self->_remote, "registerNotificationForProperties:", self->_clientProperties);
    objc_sync_exit(self);
  }
}

- (void)addKeyToClientProperties:(id)a3
{
  objc_sync_enter(self);
  if (!self->_clientProperties)
    self->_clientProperties = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((-[NSMutableArray containsObject:](self->_clientProperties, "containsObject:", a3) & 1) == 0)
    -[NSMutableArray addObject:](self->_clientProperties, "addObject:", a3);
  objc_sync_exit(self);
}

- (void)removeKeyFromClientProperties:(id)a3
{
  objc_sync_enter(self);
  if ((-[NSMutableArray containsObject:](self->_clientProperties, "containsObject:", a3) & 1) != 0)
    -[NSMutableArray removeObject:](self->_clientProperties, "removeObject:", a3);
  objc_sync_exit(self);
}

@end
