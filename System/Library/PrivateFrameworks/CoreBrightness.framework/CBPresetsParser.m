@implementation CBPresetsParser

+ (id)sharedInstance
{
  void *v3;

  objc_sync_enter(a1);
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  v3 = (void *)sharedInstance__sharedObject_0;
  objc_sync_exit(a1);
  return v3;
}

CBPresetsParser *__33__CBPresetsParser_sharedInstance__block_invoke()
{
  CBPresetsParser *result;

  result = objc_alloc_init(CBPresetsParser);
  sharedInstance__sharedObject_0 = (uint64_t)result;
  return result;
}

- (CBPresetsParser)init
{
  NSMutableDictionary *v2;
  os_log_t v3;
  objc_super v5;
  SEL v6;
  CBPresetsParser *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)CBPresetsParser;
  v7 = -[CBPresetsParser init](&v5, sel_init);
  if (v7)
  {
    v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_displayPresets = v2;
    v3 = os_log_create("com.apple.CoreBrightness.CBPresetsParser", "default");
    v7->_logHandle = (OS_os_log *)v3;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBPresetsParser *v4;

  v4 = self;
  v3 = a2;

  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBPresetsParser;
  -[CBPresetsParser dealloc](&v2, sel_dealloc);
}

- (void)setDisplayList:(id)a3
{
  objc_sync_enter(self);

  self->_displayList = (NSArray *)objc_msgSend(a3, "copy");
  -[CBPresetsParser refreshPresetState](self, "refreshPresetState");
  objc_sync_exit(self);
}

- (void)refreshPresetState
{
  uint64_t v2;
  NSArray *displayList;
  void *context;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  CBPresetsParser *v11;
  SEL v12;
  CBPresetsParser *v13;

  v13 = self;
  v12 = a2;
  v2 = objc_sync_enter(self);
  context = (void *)MEMORY[0x1B5E4A8B0](v2);
  -[NSMutableDictionary removeAllObjects](v13->_displayPresets, "removeAllObjects");
  displayList = v13->_displayList;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __37__CBPresetsParser_refreshPresetState__block_invoke;
  v10 = &unk_1E68EA458;
  v11 = v13;
  -[NSArray enumerateObjectsUsingBlock:](displayList, "enumerateObjectsUsingBlock:", &v6);
  objc_autoreleasePoolPop(context);
  objc_sync_exit(self);
}

void __37__CBPresetsParser_refreshPresetState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t inited;
  NSObject *v3;
  id v5;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = +[CBPreset newActive:](CBPreset, "newActive:", objc_msgSend(a2, "unsignedIntValue"));
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v5, a2);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    {
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v3 = inited;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v7, (uint64_t)a2, (uint64_t)v5);
      _os_log_impl(&dword_1B5291000, v3, OS_LOG_TYPE_INFO, "Presets: display %@ updated info: %@", v7, 0x16u);
    }

  }
}

- (BOOL)trueToneDisabled
{
  NSMutableDictionary *displayPresets;
  const char *v3;
  char v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  char v19;
  SEL v20;
  CBPresetsParser *v21;
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  objc_sync_enter(self);
  v15 = 0;
  v16 = &v15;
  v17 = 0x20000000;
  v18 = 32;
  v19 = 0;
  displayPresets = v21->_displayPresets;
  v9 = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __35__CBPresetsParser_trueToneDisabled__block_invoke;
  v13 = &unk_1E68EA480;
  v14 = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayPresets, "enumerateKeysAndObjectsUsingBlock:", &v9);
  if (v21->_logHandle)
  {
    logHandle = v21->_logHandle;
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
    if ((v16[3] & 1) != 0)
      v3 = "disable";
    else
      v3 = "enable";
    __os_log_helper_16_2_1_8_32((uint64_t)v22, (uint64_t)v3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Presets: %s true tone", v22, 0xCu);
  }
  v5 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  objc_sync_exit(self);
  return v5 & 1;
}

uint64_t __35__CBPresetsParser_trueToneDisabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v3;
  uint64_t result;
  char v6;

  v3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = 1;
  v6 = 1;
  if ((v3 & 1) == 0)
  {
    result = objc_msgSend(a3, "trueToneDisabled");
    v6 = result;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6 & 1;
  return result;
}

- (BOOL)nightShiftDisabled
{
  NSMutableDictionary *displayPresets;
  const char *v3;
  char v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  char v19;
  SEL v20;
  CBPresetsParser *v21;
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  objc_sync_enter(self);
  v15 = 0;
  v16 = &v15;
  v17 = 0x20000000;
  v18 = 32;
  v19 = 0;
  displayPresets = v21->_displayPresets;
  v9 = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __37__CBPresetsParser_nightShiftDisabled__block_invoke;
  v13 = &unk_1E68EA480;
  v14 = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayPresets, "enumerateKeysAndObjectsUsingBlock:", &v9);
  if (v21->_logHandle)
  {
    logHandle = v21->_logHandle;
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
    if ((v16[3] & 1) != 0)
      v3 = "disable";
    else
      v3 = "enable";
    __os_log_helper_16_2_1_8_32((uint64_t)v22, (uint64_t)v3);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Presets: %s night-shift", v22, 0xCu);
  }
  v5 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  objc_sync_exit(self);
  return v5 & 1;
}

uint64_t __37__CBPresetsParser_nightShiftDisabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v3;
  uint64_t result;
  char v6;

  v3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = 1;
  v6 = 1;
  if ((v3 & 1) == 0)
  {
    result = objc_msgSend(a3, "nightShiftDisabled");
    v6 = result;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6 & 1;
  return result;
}

- (BOOL)autoBrightnessDisabledForDisplay:(unint64_t)a3
{
  uint64_t v3;
  char v5;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  uint8_t v12[15];
  char v13;
  NSObject *v14;
  id v15;
  char v16;
  unint64_t v17;
  SEL v18;
  CBPresetsParser *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v3 = objc_sync_enter(self);
  v16 = 0;
  context = (void *)MEMORY[0x1B5E4A8B0](v3);
  v15 = 0;
  v15 = (id)-[NSMutableDictionary objectForKey:](v19->_displayPresets, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17));
  if (v15)
  {
    v14 = 0;
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
    v14 = logHandle;
    v13 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v14;
      type = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_1B5291000, log, type, "Presets: disable auto-brightness updates", v12, 2u);
    }
    v16 = objc_msgSend(v15, "autoBrighnessDisabled") & 1;
  }
  objc_autoreleasePoolPop(context);
  v5 = v16;
  objc_sync_exit(self);
  return v5 & 1;
}

- (float)maxSDRLuminanceForDisplay:(unint64_t)a3
{
  uint64_t v3;
  float v4;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  void *v10;
  float v11;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_sync_enter(self);
  v11 = 0.0;
  context = (void *)MEMORY[0x1B5E4A8B0](v3);
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_displayPresets, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
  if (v10)
  {
    objc_msgSend(v10, "maxSDRLuminance");
    v11 = v4;
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
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v14, a3, COERCE__INT64(v11));
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Presets(%lu): Aurora in maxSDRLuminance: %f", v14, 0x16u);
    }
  }
  objc_autoreleasePoolPop(context);
  objc_sync_exit(self);
  return v11;
}

- (BOOL)brightnessDisabledForDisplay:(unint64_t)a3
{
  uint64_t v3;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  void *v9;
  char v10;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_sync_enter(self);
  v10 = 0;
  context = (void *)MEMORY[0x1B5E4A8B0](v3);
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->_displayPresets, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
  if (v9)
  {
    v10 = objc_msgSend(v9, "brightnessDisabled") & 1;
    if (v10)
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v13, a3);
        _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Presets(%lu): lock brightness updates", v13, 0xCu);
      }
    }
  }
  objc_autoreleasePoolPop(context);
  objc_sync_exit(self);
  return v10 & 1;
}

- (BOOL)referenceMode:(unint64_t)a3
{
  uint64_t v3;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  void *v9;
  char v10;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_sync_enter(self);
  context = (void *)MEMORY[0x1B5E4A8B0](v3);
  v10 = 0;
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->_displayPresets, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
  if (v9)
  {
    v10 = objc_msgSend(v9, "referenceMode") & 1;
    if (v10)
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_2_8_0_4_0((uint64_t)v13, a3, v10 & 1);
        _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Presets(%lu): reference mode = %d", v13, 0x12u);
      }
    }
  }
  objc_autoreleasePoolPop(context);
  objc_sync_exit(self);
  return v10 & 1;
}

@end
