@implementation BrightnessSystemClient

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  const char *v4;
  uint64_t inited;
  NSObject *logHandle;
  char v8;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = -[BrightnessSystemClientInternal setProperty:forKey:](self->bsci, "setProperty:forKey:", a3, a4);
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
    if ((v8 & 1) != 0)
      v4 = "success";
    else
      v4 = "failed";
    __os_log_helper_16_2_3_8_64_8_64_8_34((uint64_t)v12, (uint64_t)a4, (uint64_t)a3, (uint64_t)v4);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%{public}s)", v12, 0x20u);
  }
  return v8 & 1;
}

- (BOOL)isAlsSupported
{
  _BOOL4 v3;
  CFTypeRef cf1;

  v3 = 0;
  cf1 = -[BrightnessSystemClientInternal copyPropertyForKey:](self->bsci, "copyPropertyForKey:", CFSTR("BLControlAlsSupported"));
  if (cf1)
  {
    v3 = CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
    CFRelease(cf1);
  }
  return v3;
}

- (id)copyPropertyForKey:(id)a3
{
  return -[BrightnessSystemClientInternal copyPropertyForKey:](self->bsci, "copyPropertyForKey:", a3);
}

- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)a4);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "keys=%@", v9, 0xCu);
  }
  -[BrightnessSystemClientInternal registerNotificationBlock:forProperties:](self->bsci, "registerNotificationBlock:forProperties:", a3, a4);
}

- (BrightnessSystemClient)init
{
  BrightnessSystemClientInternal *bsci;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  NSObject *v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  _QWORD *v16;
  _QWORD v17[2];
  int v18;
  int v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  BrightnessSystemClient *v22;
  uint8_t v23[7];
  char v24;
  NSObject *v25;
  uint8_t v26[15];
  char v27;
  NSObject *v28;
  objc_super v29;
  SEL v30;
  BrightnessSystemClient *v31;

  v31 = self;
  v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)BrightnessSystemClient;
  v31 = -[BrightnessSystemClient init](&v29, sel_init);
  if (!v31)
    return v31;
  v31->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.Client", "Default");
  if (!v31->_logHandle)
  {
    v28 = 0;
    v10 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v28 = v10;
    v27 = 16;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      log = v28;
      type = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v26, 2u);
    }
  }
  v31->bsci = objc_alloc_init(BrightnessSystemClientInternal);
  if (v31->bsci)
  {
    v17[0] = 0;
    v17[1] = v17;
    v18 = 1375731712;
    v19 = 48;
    v20 = __Block_byref_object_copy__5;
    v21 = __Block_byref_object_dispose__5;
    v22 = v31;
    bsci = v31->bsci;
    v11 = MEMORY[0x1E0C809B0];
    v12 = -1073741824;
    v13 = 0;
    v14 = __30__BrightnessSystemClient_init__block_invoke;
    v15 = &unk_1E68EA5E0;
    v16 = v17;
    -[BrightnessSystemClientInternal registerNotificationBlock:](bsci, "registerNotificationBlock:", &v11);
    _Block_object_dispose(v17, 8);
    return v31;
  }
  v25 = 0;
  if (v31->_logHandle)
  {
    logHandle = v31->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v25 = logHandle;
  v24 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    v4 = v25;
    v5 = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_error_impl(&dword_1B5291000, v4, v5, "failed to create XPC client", v23, 2u);
  }

  return 0;
}

void __30__BrightnessSystemClient_init__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  id obj;
  uint64_t inited;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v15[16];
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))
  {
    v8 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v8 = inited;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v16, (uint64_t)a2, a3);
    _os_log_impl(&dword_1B5291000, v8, OS_LOG_TYPE_INFO, "key=%@ value=%@", v16, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(a2, "getKeyString");
    v11 = objc_msgSend(a2, "getKeyDisplayID");
    v10 = objc_msgSend(a2, "getKeyKeyboardID");
    if (v12)
    {
      obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_sync_enter(obj);
      if (v11)
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 24))
          (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 24) + 16))();
      }
      else if (v10 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 32))
      {
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 32) + 16))();
      }
      objc_sync_exit(obj);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_sync_enter(v5);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 40))
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 40) + 16))();
      objc_sync_exit(v5);
    }
    else
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))
      {
        v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v3 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v3 = init_default_corebrightness_log();
        v4 = v3;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)a2);
        _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "unknown or invaid key (%@)", v15, 0xCu);
      }
    }
  }
}

- (void)dealloc
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  objc_super v6;
  uint8_t v7[7];
  char v8;
  NSObject *v9;
  SEL v10;
  BrightnessSystemClient *v11;

  v11 = self;
  v10 = a2;
  v9 = 0;
  if (self->_logHandle)
  {
    logHandle = v11->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v9 = logHandle;
  v8 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_debug_impl(&dword_1B5291000, log, type, "BSC dealloc", v7, 2u);
  }
  -[BrightnessSystemClient unregisterDisplayNotificationBlock](v11, "unregisterDisplayNotificationBlock");
  -[BrightnessSystemClient unregisterKeyboardNotificationBlock](v11, "unregisterKeyboardNotificationBlock");
  -[BrightnessSystemClient unregisterPropertyNotificationBlock](v11, "unregisterPropertyNotificationBlock");
  -[BrightnessSystemClientInternal registerNotificationBlock:](v11->bsci, "registerNotificationBlock:", 0);
  if (v11->_logHandle)
  {

    v11->_logHandle = 0;
  }
  -[BrightnessSystemClientInternal stopXpcService](v11->bsci, "stopXpcService");

  v6.receiver = v11;
  v6.super_class = (Class)BrightnessSystemClient;
  -[BrightnessSystemClient dealloc](&v6, sel_dealloc);
}

- (BOOL)setProperty:(id)a3 withKey:(id)a4 andDisplay:(unint64_t)a5
{
  const char *v5;
  uint64_t inited;
  NSObject *logHandle;
  id v9;
  char v10;
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:andDisplay:", a4, a5);
  if (v9)
  {
    v10 = -[BrightnessSystemClientInternal setProperty:forKey:](self->bsci, "setProperty:forKey:", a3, v9);
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
      if ((v10 & 1) != 0)
        v5 = "success";
      else
        v5 = "failed";
      __os_log_helper_16_2_3_8_64_8_64_8_34((uint64_t)v13, (uint64_t)v9, (uint64_t)a3, (uint64_t)v5);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%{public}s)", v13, 0x20u);
    }
  }

  return v10 & 1;
}

- (id)copyPropertyForKey:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t inited;
  NSObject *logHandle;
  id v7;
  id v8;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:andDisplay:", a3, a4);
  if (v7)
  {
    v8 = -[BrightnessSystemClientInternal copyPropertyForKey:](self->bsci, "copyPropertyForKey:", v7);
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
      __os_log_helper_16_2_3_8_64_8_0_8_64((uint64_t)v12, (uint64_t)a3, a4, (uint64_t)v8);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ display=%lu property=%@", v12, 0x20u);
    }
  }

  return v8;
}

- (void)registerDisplayNotificationCallbackBlock:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "block=%p", v7, 0xCu);
  }
  -[BrightnessSystemClient unregisterDisplayNotificationBlock](self, "unregisterDisplayNotificationBlock");
  objc_sync_enter(self);
  if (a3)
    self->_displayNotificationBlock = _Block_copy(a3);
  objc_sync_exit(self);
}

- (void)unregisterDisplayNotificationBlock
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[11];
  char v8;
  NSObject *v9;
  SEL v10;
  BrightnessSystemClient *v11;

  v11 = self;
  v10 = a2;
  objc_sync_enter(self);
  if (v11->_displayNotificationBlock)
  {
    v9 = 0;
    if (v11->_logHandle)
    {
      logHandle = v11->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v9 = logHandle;
    v8 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v9;
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v7, 2u);
    }
    _Block_release(v11->_displayNotificationBlock);
    v11->_displayNotificationBlock = 0;
  }
  objc_sync_exit(self);
}

- (void)registerNotificationBlock:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "block=%p", v7, 0xCu);
  }
  -[BrightnessSystemClient unregisterPropertyNotificationBlock](self, "unregisterPropertyNotificationBlock");
  objc_sync_enter(self);
  if (a3)
    self->_propertyNotificationBlock = _Block_copy(a3);
  objc_sync_exit(self);
}

- (void)unregisterPropertyNotificationBlock
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[11];
  char v8;
  NSObject *v9;
  SEL v10;
  BrightnessSystemClient *v11;

  v11 = self;
  v10 = a2;
  objc_sync_enter(self);
  if (v11->_propertyNotificationBlock)
  {
    v9 = 0;
    if (v11->_logHandle)
    {
      logHandle = v11->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v9 = logHandle;
    v8 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v9;
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v7, 2u);
    }
    _Block_release(v11->_propertyNotificationBlock);
    v11->_propertyNotificationBlock = 0;
  }
  objc_sync_exit(self);
}

- (void)registerNotificationForKey:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@", v7, 0xCu);
  }
  if (a3)
    -[BrightnessSystemClientInternal addPropertyForNotification:](self->bsci, "addPropertyForNotification:", a3);
}

- (void)unregisterNotificationForKey:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@", v7, 0xCu);
  }
  if (a3)
    -[BrightnessSystemClientInternal removePropertyFromNotification:](self->bsci, "removePropertyFromNotification:", a3);
}

- (void)registerNotificationForKeys:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "keys=%@", v7, 0xCu);
  }
  if (a3)
    -[BrightnessSystemClientInternal addPropertiesForNotification:](self->bsci, "addPropertiesForNotification:", a3);
}

- (void)unregisterNotificationForKeys:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "keys=%@", v7, 0xCu);
  }
  if (a3)
    -[BrightnessSystemClientInternal removePropertiesFromNotification:](self->bsci, "removePropertiesFromNotification:", a3);
}

- (void)registerNotificationForKeys:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  os_log_type_t v14;
  os_log_t v15;
  unint64_t v16;
  id v17;
  SEL v18;
  BrightnessSystemClient *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = 0;
  if (self->_logHandle)
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
  v15 = logHandle;
  v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v20, v16, (uint64_t)v17);
    _os_log_debug_impl(&dword_1B5291000, v15, v14, "displayID=%lu keys=%@", v20, 0x16u);
  }
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  if (v13)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __65__BrightnessSystemClient_registerNotificationForKeys_andDisplay___block_invoke;
    v10 = &unk_1E68EA608;
    v12 = v16;
    v11 = v13;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v6);
    -[BrightnessSystemClientInternal addPropertiesForNotification:](v19->bsci, "addPropertiesForNotification:", v13);
  }

}

void __65__BrightnessSystemClient_registerNotificationForKeys_andDisplay___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:andDisplay:", a2, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (void)unregisterNotificationForKeys:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  os_log_type_t v14;
  os_log_t v15;
  unint64_t v16;
  id v17;
  SEL v18;
  BrightnessSystemClient *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = 0;
  if (self->_logHandle)
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
  v15 = logHandle;
  v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v20, v16, (uint64_t)v17);
    _os_log_debug_impl(&dword_1B5291000, v15, v14, "displayID=%lu keys=%@", v20, 0x16u);
  }
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  if (v13)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __67__BrightnessSystemClient_unregisterNotificationForKeys_andDisplay___block_invoke;
    v10 = &unk_1E68EA608;
    v12 = v16;
    v11 = v13;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v6);
    -[BrightnessSystemClientInternal removePropertiesFromNotification:](v19->bsci, "removePropertiesFromNotification:", v13);
  }

}

void __67__BrightnessSystemClient_unregisterNotificationForKeys_andDisplay___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:andDisplay:", a2, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (void)registerNotificationForKey:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v10, a4, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "displayID=%lu key=%@", v10, 0x16u);
  }
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:andDisplay:", a3, a4);
  if (v6)
    -[BrightnessSystemClientInternal addPropertyForNotification:](self->bsci, "addPropertyForNotification:", v6);

}

- (void)unregisterNotificationForKey:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v10, a4, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "displayID=%lu keys=%@", v10, 0x16u);
  }
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:andDisplay:", a3, a4);
  if (v6)
    -[BrightnessSystemClientInternal removePropertyFromNotification:](self->bsci, "removePropertyFromNotification:", v6);

}

- (BOOL)setProperty:(id)a3 withKey:(id)a4 keyboardID:(unint64_t)a5
{
  const char *v5;
  uint64_t inited;
  NSObject *logHandle;
  id v9;
  char v10;
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:keyboardID:", a4, a5);
  if (v9)
  {
    v10 = -[BrightnessSystemClientInternal setProperty:forKey:](self->bsci, "setProperty:forKey:", a3, v9);
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
      if ((v10 & 1) != 0)
        v5 = "success";
      else
        v5 = "failed";
      __os_log_helper_16_2_3_8_64_8_64_8_32((uint64_t)v13, (uint64_t)v9, (uint64_t)a3, (uint64_t)v5);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%s)", v13, 0x20u);
    }
  }

  return v10 & 1;
}

- (id)copyPropertyForKey:(id)a3 keyboardID:(unint64_t)a4
{
  uint64_t inited;
  NSObject *logHandle;
  id v7;
  id v8;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:keyboardID:", a3, a4);
  if (v7)
  {
    v8 = -[BrightnessSystemClientInternal copyPropertyForKey:](self->bsci, "copyPropertyForKey:", v7);
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
      __os_log_helper_16_2_3_8_64_8_0_8_64((uint64_t)v12, (uint64_t)a3, a4, (uint64_t)v8);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ keyboardID=%lu property=%@", v12, 0x20u);
    }
  }

  return v8;
}

- (void)registerKeyboardNotificationCallbackBlock:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "block=%p", v7, 0xCu);
  }
  -[BrightnessSystemClient unregisterKeyboardNotificationBlock](self, "unregisterKeyboardNotificationBlock");
  objc_sync_enter(self);
  if (a3)
    self->_keyboardNotificationBlock = _Block_copy(a3);
  objc_sync_exit(self);
}

- (void)unregisterKeyboardNotificationBlock
{
  objc_sync_enter(self);
  if (self->_keyboardNotificationBlock)
  {
    _Block_release(self->_keyboardNotificationBlock);
    self->_keyboardNotificationBlock = 0;
  }
  objc_sync_exit(self);
}

- (void)registerNotificationForKeys:(id)a3 keyboardID:(unint64_t)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  os_log_type_t v14;
  os_log_t v15;
  unint64_t v16;
  id v17;
  SEL v18;
  BrightnessSystemClient *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = 0;
  if (self->_logHandle)
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
  v15 = logHandle;
  v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v20, v16, (uint64_t)v17);
    _os_log_debug_impl(&dword_1B5291000, v15, v14, "keyboardID=%lu keys=%@", v20, 0x16u);
  }
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  if (v13)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __65__BrightnessSystemClient_registerNotificationForKeys_keyboardID___block_invoke;
    v10 = &unk_1E68EA608;
    v12 = v16;
    v11 = v13;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v6);
    -[BrightnessSystemClientInternal addPropertiesForNotification:](v19->bsci, "addPropertiesForNotification:", v13);
  }

}

void __65__BrightnessSystemClient_registerNotificationForKeys_keyboardID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:keyboardID:", a2, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (void)unregisterNotificationForKeys:(id)a3 keyboardID:(unint64_t)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  os_log_type_t v14;
  os_log_t v15;
  unint64_t v16;
  id v17;
  SEL v18;
  BrightnessSystemClient *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = 0;
  if (self->_logHandle)
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
  v15 = logHandle;
  v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v20, v16, (uint64_t)v17);
    _os_log_debug_impl(&dword_1B5291000, v15, v14, "keyboardID=%lu keys=%@", v20, 0x16u);
  }
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  if (v13)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __67__BrightnessSystemClient_unregisterNotificationForKeys_keyboardID___block_invoke;
    v10 = &unk_1E68EA608;
    v12 = v16;
    v11 = v13;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v6);
    -[BrightnessSystemClientInternal removePropertiesFromNotification:](v19->bsci, "removePropertiesFromNotification:", v13);
  }

}

void __67__BrightnessSystemClient_unregisterNotificationForKeys_keyboardID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:keyboardID:", a2, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

@end
