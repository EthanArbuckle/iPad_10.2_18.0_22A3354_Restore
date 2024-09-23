@implementation CBKeyboardBacklightContainer

- (CBKeyboardBacklightContainer)initWithDevice:(id)a3
{
  os_log_t v3;
  dispatch_queue_t v4;
  HIDDevice *v5;
  uint64_t v6;
  objc_super v8;
  id v9;
  SEL v10;
  CBKeyboardBacklightContainer *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CBKeyboardBacklightContainer;
  v11 = -[CBKeyboardBacklightContainer init](&v8, sel_init);
  if (v11)
  {
    v3 = os_log_create("com.apple.CoreBrightness.KeyboardBacklightContainer", "default");
    v11->_logHandle = (OS_os_log *)v3;
    v4 = dispatch_queue_create("com.apple.CoreBrightness.KeyboardBacklightContainer", 0);
    v11->super._queue = (OS_dispatch_queue *)v4;
    if (!v11->super._queue || !v9)
    {

      return 0;
    }
    v5 = (HIDDevice *)v9;
    v11->_device = v5;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v11->_properties = (NSMutableDictionary *)v6;
    v11->_userActive = 1;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBKeyboardBacklightContainer *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBKeyboardBacklightContainer;
  -[CBContainer dealloc](&v2, sel_dealloc);
}

- (BOOL)start
{
  NSObject *queue;
  uint64_t block;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CBKeyboardBacklightContainer *v9;
  SEL v10;
  CBKeyboardBacklightContainer *v11;

  v11 = self;
  v10 = a2;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __37__CBKeyboardBacklightContainer_start__block_invoke;
  v8 = &unk_1E68E9E60;
  v9 = v11;
  dispatch_sync(queue, &block);
  return 1;
}

uint64_t __37__CBKeyboardBacklightContainer_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyboardBacklightInitialization", a1, a1);
}

- (void)stop
{
  NSObject *queue;
  uint64_t block;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  CBKeyboardBacklightContainer *v8;
  SEL v9;
  CBKeyboardBacklightContainer *v10;

  v10 = self;
  v9 = a2;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __36__CBKeyboardBacklightContainer_stop__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = v10;
  dispatch_sync(queue, &block);
}

uint64_t __36__CBKeyboardBacklightContainer_stop__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "stop");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "unregisterNotificationBlock");

  result = a1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  return result;
}

- (id)copyPropertyForKey:(id)a3
{
  NSObject *queue;
  void *v5;
  uint64_t block;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  CBKeyboardBacklightContainer *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  id v21;
  SEL v22;
  CBKeyboardBacklightContainer *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 1375731712;
  v17 = 48;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __51__CBKeyboardBacklightContainer_copyPropertyForKey___block_invoke;
  v10 = &unk_1E68EA1A0;
  v11 = a3;
  v12 = v23;
  v13 = &v14;
  dispatch_sync(queue, &block);
  v5 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __51__CBKeyboardBacklightContainer_copyPropertyForKey___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "getKeyKeyboardID");
    v3 = result;
    if (result)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "keyboardID");
      if (v3 == result
        || v3 == 1 && (result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "builtIn"), (result & 1) != 0)
        || v3 == 1
        || v3 == 3
        && (result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "supportsAuthentication"), (result & 1) != 0))
      {
        result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
      }
      else if (v3 == 2)
      {
        result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "supportsAuthentication");
        if ((result & 1) == 0)
        {
          result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", *(_QWORD *)(a1 + 32));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  NSObject *queue;
  char v6;
  uint64_t block;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  CBKeyboardBacklightContainer *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  int v19;
  char v20;
  id v21;
  id v22;
  SEL v23;
  CBKeyboardBacklightContainer *v24;

  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 0;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __51__CBKeyboardBacklightContainer_setProperty_forKey___block_invoke;
  v11 = &unk_1E68EA630;
  v12 = a4;
  v13 = v24;
  v15 = &v16;
  v14 = a3;
  dispatch_sync(queue, &block);
  v6 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v6 & 1;
}

uint64_t __51__CBKeyboardBacklightContainer_setProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "getKeyKeyboardID");
    v3 = result;
    if (result)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "keyboardID");
      if (v3 == result
        || v3 == 1 && (result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "builtIn"), (result & 1) != 0)
        || v3 == 1
        || v3 == 3
        && (result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "supportsAuthentication"), (result & 1) != 0))
      {
        result = objc_msgSend(*(id *)(a1 + 40), "setPropertyInternal:forKey:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result & 1;
      }
      else if (v3 == 2)
      {
        result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "supportsAuthentication");
        if ((result & 1) == 0)
        {
          result = objc_msgSend(*(id *)(a1 + 40), "setPropertyInternal:forKey:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result & 1;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "setPropertyInternal:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result & 1;
    }
  }
  return result;
}

- (BOOL)setPropertyInternal:(id)a3 forKey:(id)a4
{
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CBUserActivityUpdate")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_userActive = objc_msgSend(a3, "BOOLValue") & 1;
  }
  v7 = -[KeyboardBacklight setProperty:forKey:](self->_keyboardBacklight, "setProperty:forKey:", a3, a4);
  if ((v7 & 1) != 0)
    -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, a4);
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
    __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v11, (uint64_t)a4, (uint64_t)a3, v7 & 1);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "key=%@ property=%@ result=%d", v11, 0x1Cu);
  }
  return v7 & 1;
}

- (id)copyPropertyInternalForKey:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  id v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("StatusInfo")) & 1) != 0)
  {
    v6 = +[CBStatusInfoHelper copyStatusInfoFor:](CBStatusInfoHelper, "copyStatusInfoFor:", self);
    if (v6)
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("CBKeyboardBacklightContainer"), 0);

  }
  else
  {
    v7 = -[KeyboardBacklight copyPropertyForKey:](self->_keyboardBacklight, "copyPropertyForKey:", a3);
    if (!v7)
      v7 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3), "copy");
  }
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)a3, (uint64_t)v7);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "key=%@ result=%@", v10, 0x16u);
  }
  return v7;
}

- (id)copyIdentifiers
{
  SEL v3;
  CBKeyboardBacklightContainer *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("KeyboardBacklightSuppressed"), CFSTR("KeyboardBacklightSaturated"), CFSTR("KeyboardBacklightBrightness"), CFSTR("KeyboardBacklightLevel"), CFSTR("KeyboardBacklightABSuspend"), CFSTR("KeyboardBacklightABEnabled"), CFSTR("KeyboardBacklightIdleDimActive"), CFSTR("KeyboardBacklightIdleDimTime"), CFSTR("KeyboardBacklightBuiltIn"), 0);
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSObject *queue;
  char v5;
  uint64_t v6;
  NSObject *v7;
  CFTypeID v8;
  CFTypeID v9;
  CFTypeID v10;
  CFTypeID TypeID;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  uint64_t v16;
  NSObject *v17;
  uint64_t block;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  CBKeyboardBacklightContainer *v23;
  uint64_t *v24;
  IOHIDServiceClientRef v25;
  os_log_type_t v26;
  os_log_t v27;
  int v28;
  uint64_t v29;
  char v30;
  id v31;
  os_log_type_t v32;
  os_log_t v33;
  char v34;
  uint8_t v35[3];
  char v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t *v39;
  int v40;
  int v41;
  char v42;
  IOHIDServiceClientRef v43;
  SEL v44;
  CBKeyboardBacklightContainer *v45;
  uint8_t v46[32];
  uint8_t v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v45 = self;
  v44 = a2;
  v43 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x20000000;
  v41 = 32;
  v42 = 0;
  if (a3)
  {
    v34 = 0;
    if (IOHIDServiceClientConformsTo(v43, 0xFF00u, 4u))
    {
      v34 = 1;
      v33 = 0;
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
      v33 = logHandle;
      v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v47, (uint64_t)v43);
        _os_log_impl(&dword_1B5291000, v33, v32, "ALS service %p", v47, 0xCu);
      }
    }
    else if (IOHIDServiceClientConformsTo(v43, 0x20u, 0x41u))
    {
      v30 = 0;
      v29 = 0;
      v28 = 0;
      v31 = (id)IOHIDServiceClientCopyProperty(v43, CFSTR("VendorID"));
      if (v31)
      {
        TypeID = CFNumberGetTypeID();
        if (TypeID == CFGetTypeID(v31))
          v28 = objc_msgSend(v31, "unsignedIntValue");
      }
      if (v31)
        CFRelease(v31);
      v31 = (id)IOHIDServiceClientCopyProperty(v43, CFSTR("Built-In"));
      if (v31)
      {
        v10 = CFBooleanGetTypeID();
        if (v10 == CFGetTypeID(v31))
        {
          if (v31 == (id)*MEMORY[0x1E0C9AE50])
            v30 = 1;
        }
        else
        {
          v9 = CFNumberGetTypeID();
          if (v9 == CFGetTypeID(v31))
            v30 = objc_msgSend(v31, "BOOLValue") & 1;
        }
        CFRelease(v31);
      }
      v31 = (id)IOHIDServiceClientCopyProperty(v43, CFSTR("SensorLocation"));
      if (v31)
      {
        v8 = CFNumberGetTypeID();
        if (v8 == CFGetTypeID(v31))
          v29 = objc_msgSend(v31, "unsignedIntegerValue");
        CFRelease(v31);
      }
      v27 = 0;
      if (v45->_logHandle)
      {
        v7 = v45->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v6 = init_default_corebrightness_log();
        v7 = v6;
      }
      v27 = v7;
      v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_4_0_8_0((uint64_t)v46, (uint64_t)v43, v30 & 1, v29);
        _os_log_impl(&dword_1B5291000, v27, v26, "ALS service %p: builtIn=%u location=%lu", v46, 0x1Cu);
      }
      if ((v30 & 1) != 0 && v28 == 1452)
        v34 = 1;
    }
    if ((v34 & 1) != 0)
    {
      queue = v45->super._queue;
      block = MEMORY[0x1E0C809B0];
      v19 = -1073741824;
      v20 = 0;
      v21 = __52__CBKeyboardBacklightContainer_addHIDServiceClient___block_invoke;
      v22 = &unk_1E68EA658;
      v23 = v45;
      v25 = v43;
      v24 = &v38;
      dispatch_sync(queue, &block);
    }
  }
  else
  {
    v37 = 0;
    if (v45->_logHandle)
    {
      v17 = v45->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v16 = init_default_corebrightness_log();
      v17 = v16;
    }
    v37 = v17;
    v36 = 16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      log = v37;
      type = v36;
      __os_log_helper_16_0_0(v35);
      _os_log_error_impl(&dword_1B5291000, log, type, "HID service client pointer is NULL", v35, 2u);
    }
  }
  v5 = *((_BYTE *)v39 + 24);
  _Block_object_dispose(&v38, 8);
  return v5 & 1;
}

uint64_t __52__CBKeyboardBacklightContainer_addHIDServiceClient___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "keyboardBacklightInitialization");
  result = a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addHIDServiceClient:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  NSObject *queue;
  char v6;
  uint64_t block;
  int v8;
  int v9;
  uint64_t (*v10)(_QWORD *);
  void *v11;
  CBKeyboardBacklightContainer *v12;
  uint64_t *v13;
  __IOHIDEvent *v14;
  __IOHIDServiceClient *v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  int v19;
  char v20;
  __IOHIDServiceClient *v21;
  __IOHIDEvent *v22;
  SEL v23;
  CBKeyboardBacklightContainer *v24;

  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 0;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __52__CBKeyboardBacklightContainer_handleHIDEvent_from___block_invoke;
  v11 = &unk_1E68EA680;
  v13 = &v16;
  v12 = v24;
  v14 = a3;
  v15 = a4;
  dispatch_sync(queue, &block);
  v6 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v6 & 1;
}

uint64_t __52__CBKeyboardBacklightContainer_handleHIDEvent_from___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 48), "handleHIDEvent:from:", a1[6], a1[7]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result & 1;
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSObject *queue;
  char v5;
  uint64_t block;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  CBKeyboardBacklightContainer *v11;
  uint64_t *v12;
  __IOHIDServiceClient *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  __IOHIDServiceClient *v19;
  SEL v20;
  CBKeyboardBacklightContainer *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x20000000;
  v17 = 32;
  v18 = 0;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __55__CBKeyboardBacklightContainer_removeHIDServiceClient___block_invoke;
  v10 = &unk_1E68EA6A8;
  v12 = &v14;
  v11 = v21;
  v13 = a3;
  dispatch_sync(queue, &block);
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v5 & 1;
}

uint64_t __55__CBKeyboardBacklightContainer_removeHIDServiceClient___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 48), "removeHIDServiceClient:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result & 1;
  return result;
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  id v4;
  id v5;
  NSObject *notificationQueue;
  uint64_t block;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  CBKeyboardBacklightContainer *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SEL v17;
  CBKeyboardBacklightContainer *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  if (self->super._notificationQueue)
  {
    v4 = v16;
    v5 = v15;
    notificationQueue = v18->super._notificationQueue;
    block = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __64__CBKeyboardBacklightContainer_sendNotificationForKey_andValue___block_invoke;
    v11 = &unk_1E68EA150;
    v12 = v18;
    v13 = v16;
    v14 = v15;
    dispatch_async(notificationQueue, &block);
  }
}

void __64__CBKeyboardBacklightContainer_sendNotificationForKey_andValue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = a1;
  v12 = a1;
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __64__CBKeyboardBacklightContainer_sendNotificationForKey_andValue___block_invoke_2;
  v8 = &unk_1E68EA150;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  dispatch_sync(v2, &block);

}

void __64__CBKeyboardBacklightContainer_sendNotificationForKey_andValue___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:keyboardID:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "keyboardID"));
    if (v3)
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();

    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:keyboardID:", *(_QWORD *)(a1 + 40), 1);
    if (v2)
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();

  }
}

- (id)newKeyboardBacklightWithQueue:(id)a3 device:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  uint64_t inited;
  NSObject *logHandle;
  void *v9;
  KeyboardBacklightHIDCurveNits *v10;
  uint8_t v14[16];
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = (void *)objc_msgSend(a4, "propertyForKey:", CFSTR("ProductID"));
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
    __os_log_helper_16_2_1_8_66((uint64_t)v15, (uint64_t)v9);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "PID = %{public}@", v15, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[CBKeyboardBacklightContainer keyboardUsesNitUnits:](self, "keyboardUsesNitUnits:", a4))
    {
      v10 = -[KeyboardBacklightHIDCurveNits initWithQueue:device:]([KeyboardBacklightHIDCurveNits alloc], "initWithQueue:device:", a3, a4);
    }
    else if ((keyboardUsesAdjustedBrightnessCurve(objc_msgSend(v9, "intValue")) & 1) != 0)
    {
      v10 = -[KeyboardBacklightHIDCurve initWithQueue:device:]([KeyboardBacklightHIDCurve alloc], "initWithQueue:device:", a3, a4);
    }
    else
    {
      v10 = -[KeyboardBacklight initWithQueue:device:]([KeyboardBacklight alloc], "initWithQueue:device:", a3, a4);
    }
  }
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v14, 10);
    _os_log_impl(&dword_1B5291000, v6, OS_LOG_TYPE_DEFAULT, "Keyboard backlight initialized for lgpVersion = %d", v14, 8u);
  }
  return v10;
}

- (BOOL)keyboardUsesNitUnits:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t inited;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id obj;
  uint64_t v25;
  NSObject *log;
  os_log_type_t v27;
  uint64_t v28;
  NSObject *logHandle;
  uint8_t v30[15];
  os_log_type_t v31;
  os_log_t v32;
  int v33;
  os_log_type_t v34;
  os_log_t oslog;
  _QWORD __b[8];
  id v37;
  uint8_t v38[7];
  os_log_type_t type;
  NSObject *v40;
  id v41;
  void *v42;
  char v43;
  id v44;
  SEL v45;
  CBKeyboardBacklightContainer *v46;
  uint8_t v47[16];
  uint8_t v48[72];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v46 = self;
  v45 = a2;
  v44 = a3;
  v43 = 0;
  v42 = &unk_1E69176A0;
  v41 = 0;
  v41 = (id)-[HIDDevice elementsMatching:](self->_device, "elementsMatching:", &unk_1E69176A0);
  if (!objc_msgSend(v41, "count"))
  {
    v40 = 0;
    if (v46->_logHandle)
    {
      logHandle = v46->_logHandle;
    }
    else
    {
      v28 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v28;
    }
    v40 = logHandle;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v40;
      v27 = type;
      __os_log_helper_16_0_0(v38);
      _os_log_error_impl(&dword_1B5291000, log, v27, "HID elements not found.", v38, 2u);
    }
  }
  memset(__b, 0, sizeof(__b));
  obj = v41;
  v25 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
  if (v25)
  {
    v21 = *(_QWORD *)__b[2];
    v22 = 0;
    v23 = v25;
    while (1)
    {
      v20 = v22;
      if (*(_QWORD *)__b[2] != v21)
        objc_enumerationMutation(obj);
      v37 = 0;
      v37 = *(id *)(__b[1] + 8 * v22);
      if (objc_msgSend(v37, "type") == 257)
      {
        oslog = 0;
        if (v46->_logHandle)
        {
          v19 = v46->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          v19 = inited;
        }
        oslog = v19;
        v34 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v16 = oslog;
          v17 = v34;
          v10 = objc_msgSend(v37, "usage");
          v11 = objc_msgSend(v37, "usagePage");
          v12 = objc_msgSend(v37, "reportID");
          v13 = objc_msgSend(v37, "unit");
          v14 = objc_msgSend(v37, "reportSize");
          v15 = objc_msgSend(v37, "logicalMax");
          __os_log_helper_16_0_7_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v48, v10, v11, v12, v13, v14, v15, objc_msgSend(v37, "logicalMin"));
          _os_log_debug_impl(&dword_1B5291000, v16, v17, "usage = 0x%lx, usage page = 0x%lx, reportID = %ld, unit = 0x%lx, reportSize = %ld, max logical = %ld, min logical = %ld", v48, 0x48u);
        }
        if (objc_msgSend(v37, "usage") == 1)
        {
          v33 = 0;
          v33 = objc_msgSend(v37, "unit");
          if (v33 == 16777441)
          {
            v43 = 1;
            v32 = 0;
            if (v46->_logHandle)
            {
              v9 = v46->_logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v8 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v8 = init_default_corebrightness_log();
              v9 = v8;
            }
            v32 = v9;
            v31 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              v6 = v32;
              v7 = v31;
              __os_log_helper_16_0_0(v30);
              _os_log_debug_impl(&dword_1B5291000, v6, v7, "found level element using nit units", v30, 2u);
            }
          }
        }
        else
        {
          if (v46->_logHandle)
          {
            v5 = v46->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v4 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v4 = init_default_corebrightness_log();
            v5 = v4;
          }
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_0_1_8_0((uint64_t)v47, objc_msgSend(v37, "usage"));
            _os_log_debug_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEBUG, "Unknown element with usage = %ld", v47, 0xCu);
          }
        }
      }
      ++v22;
      if (v20 + 1 >= v23)
      {
        v22 = 0;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
        if (!v23)
          break;
      }
    }
  }
  return v43 & 1;
}

- (void)keyboardBacklightInitialization
{
  uint64_t v2;
  uint64_t v3;
  KeyboardBacklight *keyboardBacklight;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  CBKeyboardBacklightContainer *v14;
  uint8_t v15[7];
  os_log_type_t v16;
  NSObject *v17;
  SEL v18;
  CBKeyboardBacklightContainer *v19;

  v19 = self;
  v18 = a2;
  if (!self->_keyboardBacklight)
  {
    v17 = 0;
    if (v19->_logHandle)
    {
      logHandle = v19->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v17 = logHandle;
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v17;
      type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1B5291000, log, type, "KeyboardBacklight initialization", v15, 2u);
    }
    v2 = -[CBKeyboardBacklightContainer newKeyboardBacklightWithQueue:device:](v19, "newKeyboardBacklightWithQueue:device:", v19->super._queue, v19->_device);
    v19->_keyboardBacklight = (KeyboardBacklight *)v2;
    -[KeyboardBacklight start](v19->_keyboardBacklight, "start");
    if (v19->_userActive)
      v3 = MEMORY[0x1E0C9AAB0];
    else
      v3 = MEMORY[0x1E0C9AAA0];
    -[KeyboardBacklight setProperty:forKey:](v19->_keyboardBacklight, "setProperty:forKey:", v3, CFSTR("DisplayBrightnessFactor"));
    keyboardBacklight = v19->_keyboardBacklight;
    v9 = MEMORY[0x1E0C809B0];
    v10 = -1073741824;
    v11 = 0;
    v12 = __63__CBKeyboardBacklightContainer_keyboardBacklightInitialization__block_invoke;
    v13 = &unk_1E68E9F38;
    v14 = v19;
    -[CBModule registerNotificationBlock:](keyboardBacklight, "registerNotificationBlock:", &v9);
  }
}

uint64_t __63__CBKeyboardBacklightContainer_keyboardBacklightInitialization__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  NSObject *v4;
  uint64_t v5;
  uint8_t v8[24];
  uint64_t v9;

  v5 = result;
  v9 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 40))
    {
      v4 = *(NSObject **)(*(_QWORD *)(result + 32) + 40);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    return objc_msgSend(*(id *)(v5 + 32), "sendNotificationForKey:andValue:", a2, a3);
  }
  return result;
}

- (HIDDevice)device
{
  return self->_device;
}

@end
