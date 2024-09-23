@implementation CBKeyboardPreferencesManager

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
  v7 = __46__CBKeyboardPreferencesManager_sharedInstance__block_invoke;
  v8 = &unk_1E68E9E60;
  v9 = v11;
  v13 = &sharedInstance_onceToken_1;
  v12 = &v4;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(v13, v12);
  objc_sync_exit(a1);
  return (id)sharedInstance__sharedObject_1;
}

uint64_t __46__CBKeyboardPreferencesManager_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_super v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1;
  v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___CBKeyboardPreferencesManager;
  result = objc_msgSend(objc_msgSendSuper2(&v2, sel_alloc), "init");
  sharedInstance__sharedObject_1 = result;
  return result;
}

- (CBKeyboardPreferencesManager)init
{
  os_log_t v2;
  dispatch_queue_t v3;
  uint64_t v4;
  NSMutableDictionary *v5;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  NSObject *v13;
  id v14;
  uint8_t v15[7];
  char v16;
  NSObject *v17;
  uint8_t v18[15];
  char v19;
  NSObject *v20;
  objc_super v21;
  SEL v22;
  CBKeyboardPreferencesManager *v23;

  v23 = self;
  v22 = a2;
  v21.receiver = self;
  v21.super_class = (Class)CBKeyboardPreferencesManager;
  v23 = -[CBKeyboardPreferencesManager init](&v21, sel_init);
  if (!v23)
    return v23;
  v2 = os_log_create("com.apple.CoreBrightness.KeyboardPreferencesManager", "default");
  v23->_logHandle = (OS_os_log *)v2;
  if (!v23->_logHandle)
  {
    v20 = 0;
    v13 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v20 = v13;
    v19 = 16;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      log = v20;
      type = v19;
      __os_log_helper_16_0_0(v18);
      _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create log handle", v18, 2u);
    }
  }
  v3 = dispatch_queue_create("com.apple.CoreBrightness.KeyboardPreferencesManager", 0);
  v23->_queue = (OS_dispatch_queue *)v3;
  if (v23->_queue)
  {
    v14 = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:](CBPreferencesHandler, "copyPreferenceForAllUsersForKey:", CFSTR("KeyboardBacklight"));
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v14);
      v23->_preferences = (NSMutableDictionary *)v4;
    }
    else
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v23->_preferences = v5;
    }

    return v23;
  }
  v17 = 0;
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
  v17 = logHandle;
  v16 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    v7 = v17;
    v8 = v16;
    __os_log_helper_16_0_0(v15);
    _os_log_error_impl(&dword_1B5291000, v7, v8, "failed to create dispatch queue", v15, 2u);
  }

  v23 = 0;
  return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBKeyboardPreferencesManager *v4;

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
  v2.super_class = (Class)CBKeyboardPreferencesManager;
  -[CBKeyboardPreferencesManager dealloc](&v2, sel_dealloc);
}

- (BOOL)setPreference:(id)a3 forKey:(id)a4
{
  NSObject *queue;
  char v6;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v10;
  int v11;
  BOOL (*v12)(_QWORD *);
  void *v13;
  CBKeyboardPreferencesManager *v14;
  id v15;
  id v16;
  uint64_t *v17;
  os_log_type_t v18;
  os_log_t v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;
  int v23;
  char v24;
  id v25;
  id v26;
  SEL v27;
  CBKeyboardPreferencesManager *v28;
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28 = self;
  v27 = a2;
  v26 = a3;
  v25 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x20000000;
  v23 = 32;
  v24 = 0;
  v19 = 0;
  if (self->_logHandle)
  {
    logHandle = v28->_logHandle;
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
  v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v29, (uint64_t)v25, (uint64_t)v26);
    _os_log_impl(&dword_1B5291000, v19, v18, "Set preference %@ = %@", v29, 0x16u);
  }
  queue = v28->_queue;
  block = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __53__CBKeyboardPreferencesManager_setPreference_forKey___block_invoke;
  v13 = &unk_1E68E9E88;
  v14 = v28;
  v15 = v26;
  v16 = v25;
  v17 = &v20;
  dispatch_sync(queue, &block);
  v6 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v6 & 1;
}

BOOL __53__CBKeyboardPreferencesManager_setPreference_forKey___block_invoke(_QWORD *a1)
{
  _BOOL8 result;

  objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[5], a1[6]);
  result = +[CBPreferencesHandler storePreferenceForAllUsersForKey:andValue:](CBPreferencesHandler, "storePreferenceForAllUsersForKey:andValue:", CFSTR("KeyboardBacklight"), *(_QWORD *)(a1[4] + 24));
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (id)copyPreferenceForKey:(id)a3
{
  NSObject *queue;
  void *v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v9;
  int v10;
  id (*v11)(_QWORD *);
  void *v12;
  CBKeyboardPreferencesManager *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  int v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  id v23;
  SEL v24;
  CBKeyboardPreferencesManager *v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = self;
  v24 = a2;
  v23 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 1375731712;
  v19 = 48;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __53__CBKeyboardPreferencesManager_copyPreferenceForKey___block_invoke;
  v12 = &unk_1E68EA6D0;
  v13 = v25;
  v15 = &v16;
  v14 = a3;
  dispatch_sync(queue, &block);
  if (v25->_logHandle)
  {
    logHandle = v25->_logHandle;
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v26, (uint64_t)v23, v17[5]);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Copy preference %@ = %@", v26, 0x16u);
  }
  v5 = (void *)v17[5];
  _Block_object_dispose(&v16, 8);
  return v5;
}

id __53__CBKeyboardPreferencesManager_copyPreferenceForKey___block_invoke(_QWORD *a1)
{
  if (!*(_QWORD *)(a1[4] + 24))
    *(_QWORD *)(a1[4] + 24) = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:](CBPreferencesHandler, "copyPreferenceForAllUsersForKey:", CFSTR("KeyboardBacklight"));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  return *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
}

- (id)copyAllPrefereneces
{
  NSObject *queue;
  void *v4;
  uint64_t block;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CBKeyboardPreferencesManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  SEL v19;
  CBKeyboardPreferencesManager *v20;

  v20 = self;
  v19 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 1375731712;
  v15 = 48;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __51__CBKeyboardPreferencesManager_copyAllPrefereneces__block_invoke;
  v9 = &unk_1E68EA1F0;
  v11 = &v12;
  v10 = v20;
  dispatch_sync(queue, &block);
  v4 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t __51__CBKeyboardPreferencesManager_copyAllPrefereneces__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (BOOL)setIntPreference:(int)a3 forKey:(id)a4
{
  id v5;
  char v6;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3);
  v6 = +[CBKeyboardPreferencesManager setPreference:forKey:](CBKeyboardPreferencesManager, "setPreference:forKey:", v5, a4);

  return v6 & 1;
}

+ (BOOL)setFloatPreference:(float)a3 forKey:(id)a4
{
  id v4;
  double v5;
  id v7;
  char v8;

  v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v5 = a3;
  v7 = (id)objc_msgSend(v4, "initWithFloat:", v5);
  v8 = +[CBKeyboardPreferencesManager setPreference:forKey:](CBKeyboardPreferencesManager, "setPreference:forKey:", v7, a4);

  return v8 & 1;
}

+ (BOOL)setBoolPreference:(BOOL)a3 forKey:(id)a4
{
  id v5;
  char v6;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a3);
  v6 = +[CBKeyboardPreferencesManager setPreference:forKey:](CBKeyboardPreferencesManager, "setPreference:forKey:", v5, a4);

  return v6 & 1;
}

+ (BOOL)setPreference:(id)a3 forKey:(id)a4
{
  return -[CBKeyboardPreferencesManager setPreference:forKey:](+[CBKeyboardPreferencesManager sharedInstance](CBKeyboardPreferencesManager, "sharedInstance"), "setPreference:forKey:", a3, a4);
}

+ (BOOL)getIntPreference:(int *)a3 forKey:(id)a4
{
  id v5;
  char v6;

  v6 = 0;
  v5 = +[CBKeyboardPreferencesManager copyPreferenceForKey:](CBKeyboardPreferencesManager, "copyPreferenceForKey:", a4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *a3 = objc_msgSend(v5, "intValue");
      v6 = 1;
    }
  }

  return v6 & 1;
}

+ (BOOL)getFloatPreference:(float *)a3 forKey:(id)a4
{
  int v4;
  id v6;
  char v7;

  v7 = 0;
  v6 = +[CBKeyboardPreferencesManager copyPreferenceForKey:](CBKeyboardPreferencesManager, "copyPreferenceForKey:", a4);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      *(_DWORD *)a3 = v4;
      v7 = 1;
    }
  }

  return v7 & 1;
}

+ (BOOL)getBoolPreference:(BOOL *)a3 forKey:(id)a4
{
  id v5;
  char v6;

  v6 = 0;
  v5 = +[CBKeyboardPreferencesManager copyPreferenceForKey:](CBKeyboardPreferencesManager, "copyPreferenceForKey:", a4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *a3 = objc_msgSend(v5, "BOOLValue") & 1;
      v6 = 1;
    }
  }

  return v6 & 1;
}

+ (id)copyPreferenceForKey:(id)a3
{
  return -[CBKeyboardPreferencesManager copyPreferenceForKey:](+[CBKeyboardPreferencesManager sharedInstance](CBKeyboardPreferencesManager, "sharedInstance"), "copyPreferenceForKey:", a3);
}

+ (id)copyPreferenceForKey:(id)a3 keyboardID:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;

  v7 = 0;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), a4);
  v5 = -[CBKeyboardPreferencesManager copyPreferenceForKey:](+[CBKeyboardPreferencesManager sharedInstance](CBKeyboardPreferencesManager, "sharedInstance"), "copyPreferenceForKey:", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (id)objc_msgSend(v5, "objectForKey:", a3);

  return v7;
}

+ (id)copyAllPreferences
{
  return -[CBKeyboardPreferencesManager copyAllPrefereneces](+[CBKeyboardPreferencesManager sharedInstance](CBKeyboardPreferencesManager, "sharedInstance"), "copyAllPrefereneces");
}

@end
