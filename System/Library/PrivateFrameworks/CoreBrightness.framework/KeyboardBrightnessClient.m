@implementation KeyboardBrightnessClient

- (KeyboardBrightnessClient)init
{
  os_log_t v2;
  BrightnessSystemClient *v3;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[15];
  char v10;
  NSObject *v11;
  objc_super v12;
  SEL v13;
  KeyboardBrightnessClient *v14;

  v14 = self;
  v13 = a2;
  v12.receiver = self;
  v12.super_class = (Class)KeyboardBrightnessClient;
  v14 = -[KeyboardBrightnessClient init](&v12, sel_init);
  if (!v14)
    return v14;
  v2 = os_log_create("com.apple.CoreBrightness.KeyboardBrightnessClient", "Default");
  v14->_logHandle = (OS_os_log *)v2;
  v3 = objc_alloc_init(BrightnessSystemClient);
  v14->bsc = v3;
  if (v14->bsc)
    return v14;
  v11 = 0;
  if (v14->_logHandle)
  {
    logHandle = v14->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v11 = logHandle;
  v10 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    log = v11;
    type = v10;
    __os_log_helper_16_0_0(v9);
    _os_log_error_impl(&dword_1B5291000, log, type, "failed to create XPC client", v9, 2u);
  }

  return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  KeyboardBrightnessClient *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)KeyboardBrightnessClient;
  -[KeyboardBrightnessClient dealloc](&v2, sel_dealloc);
}

- (id)copyKeyboardBacklightIDs
{
  uint64_t inited;
  NSObject *logHandle;
  id v5;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = -[BrightnessSystemClient copyPropertyForKey:](self->bsc, "copyPropertyForKey:", CFSTR("KeyboardBacklightIDs"));
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)v5);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "keyboardIDs=%@", v7, 0xCu);
  }
  return v5;
}

- (BOOL)isBacklightSuppressedOnKeyboard:(unint64_t)a3
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = -[BrightnessSystemClient copyPropertyForKey:keyboardID:](self->bsc, "copyPropertyForKey:keyboardID:", CFSTR("KeyboardBacklightSuppressed"), a3);
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "suppressed=%@", v9, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "BOOLValue") & 1;

  return v7 & 1;
}

- (BOOL)isBacklightSaturatedOnKeyboard:(unint64_t)a3
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = -[BrightnessSystemClient copyPropertyForKey:keyboardID:](self->bsc, "copyPropertyForKey:keyboardID:", CFSTR("KeyboardBacklightSaturated"), a3);
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "saturated=%@", v9, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "BOOLValue") & 1;

  return v7 & 1;
}

- (BOOL)isBacklightDimmedOnKeyboard:(unint64_t)a3
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = -[BrightnessSystemClient copyPropertyForKey:keyboardID:](self->bsc, "copyPropertyForKey:keyboardID:", CFSTR("KeyboardBacklightIdleDimActive"), a3);
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "dimmed=%@", v9, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "BOOLValue") & 1;

  return v7 & 1;
}

- (float)brightnessForKeyboard:(unint64_t)a3
{
  float v3;
  uint64_t inited;
  NSObject *logHandle;
  id v7;
  float v8;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = -1.0;
  v7 = -[BrightnessSystemClient copyPropertyForKey:keyboardID:](self->bsc, "copyPropertyForKey:keyboardID:", CFSTR("KeyboardBacklightBrightness"), a3);
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
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v7);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "brightness=%@", v10, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "floatValue");
    v8 = v3;
  }

  return v8;
}

- (float)backlightLevelForKeyboard:(unint64_t)a3
{
  float v3;
  uint64_t inited;
  NSObject *logHandle;
  id v7;
  float v8;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = -1.0;
  v7 = -[BrightnessSystemClient copyPropertyForKey:keyboardID:](self->bsc, "copyPropertyForKey:keyboardID:", CFSTR("KeyboardBacklightLevel"), a3);
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
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v7);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "backlight level=%@", v10, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "floatValue");
    v8 = v3;
  }

  return v8;
}

- (BOOL)setBrightness:(float)a3 forKeyboard:(unint64_t)a4
{
  unsigned int v4;

  if (a3 <= 0.0)
    v4 = 350;
  else
    v4 = 500;
  return -[KeyboardBrightnessClient setBrightness:fadeSpeed:commit:forKeyboard:](self, "setBrightness:fadeSpeed:commit:forKeyboard:", v4, 1, a4, *(double *)&a3);
}

- (BOOL)setBrightness:(float)a3 fadeSpeed:(int)a4 commit:(BOOL)a5 forKeyboard:(unint64_t)a6
{
  double v6;
  const char *v7;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  char v12;
  uint64_t v13;
  BOOL v15;
  uint8_t v19[56];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v20[0] = CFSTR("Brightness");
  *(float *)&v6 = a3;
  v21[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v20[1] = CFSTR("FadeSpeed");
  v21[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v20[2] = CFSTR("Commit");
  v21[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v12 = -[BrightnessSystemClient setProperty:withKey:keyboardID:](self->bsc, "setProperty:withKey:keyboardID:", v13, CFSTR("KeyboardBacklightBrightness"), a6);
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
    if ((v12 & 1) != 0)
      v7 = "success";
    else
      v7 = "failed";
    __os_log_helper_16_2_6_8_64_8_64_8_0_4_0_4_0_8_32((uint64_t)v19, (uint64_t)CFSTR("KeyboardBacklightBrightness"), v13, a6, a4, v15, (uint64_t)v7);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ forID = %lu fadeSpeed = %d commit = %d (%s)", v19, 0x36u);
  }
  objc_autoreleasePoolPop(context);
  return v12 & 1;
}

- (BOOL)enableAutoBrightness:(BOOL)a3 forKeyboard:(unint64_t)a4
{
  const char *v4;
  uint64_t inited;
  NSObject *logHandle;
  char v8;
  void *v9;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a3);
  v8 = -[BrightnessSystemClient setProperty:withKey:keyboardID:](self->bsc, "setProperty:withKey:keyboardID:", v9, CFSTR("KeyboardBacklightABEnabled"), a4);
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
    __os_log_helper_16_2_3_8_64_8_64_8_32((uint64_t)v12, (uint64_t)CFSTR("KeyboardBacklightABEnabled"), (uint64_t)v9, (uint64_t)v4);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%s)", v12, 0x20u);
  }

  return v8 & 1;
}

- (BOOL)isAmbientFeatureAvailableOnKeyboard:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id obj;
  uint64_t v10;
  _QWORD __b[8];
  id v12;
  id v13;
  char v14;
  unint64_t v15;
  SEL v16;
  KeyboardBrightnessClient *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = 0;
  v13 = -[KeyboardBrightnessClient copyKeyboardBacklightIDs](self, "copyKeyboardBacklightIDs");
  memset(__b, 0, sizeof(__b));
  obj = v13;
  v10 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
  if (v10)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v10;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v12 = 0;
      v12 = *(id *)(__b[1] + 8 * v7);
      if (v15 == 1)
      {
        v14 = 1;
        goto LABEL_11;
      }
      v3 = objc_msgSend(v12, "unsignedIntegerValue");
      if (v3 == v15)
        break;
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
        if (!v8)
          goto LABEL_11;
      }
    }
    v14 = 1;
  }
LABEL_11:

  return v14 & 1;
}

- (BOOL)isKeyboardBuiltIn:(unint64_t)a3
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = -[BrightnessSystemClient copyPropertyForKey:keyboardID:](self->bsc, "copyPropertyForKey:keyboardID:", CFSTR("KeyboardBacklightBuiltIn"), a3);
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "builtIn=%@", v9, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "BOOLValue") & 1;

  return v7 & 1;
}

- (double)idleDimTimeForKeyboard:(unint64_t)a3
{
  float v3;
  uint64_t inited;
  NSObject *logHandle;
  id v7;
  double v8;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = -1.0;
  v7 = -[BrightnessSystemClient copyPropertyForKey:keyboardID:](self->bsc, "copyPropertyForKey:keyboardID:", CFSTR("KeyboardBacklightIdleDimTime"), a3);
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
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v7);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "dim time=%@", v10, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "floatValue");
    v8 = v3;
  }

  return v8;
}

- (BOOL)setIdleDimTime:(double)a3 forKeyboard:(unint64_t)a4
{
  const char *v4;
  uint64_t inited;
  NSObject *logHandle;
  char v8;
  void *v9;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a3);
  v8 = -[BrightnessSystemClient setProperty:withKey:keyboardID:](self->bsc, "setProperty:withKey:keyboardID:", v9, CFSTR("KeyboardBacklightIdleDimTime"), a4);
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
    __os_log_helper_16_2_3_8_64_8_64_8_32((uint64_t)v12, (uint64_t)CFSTR("KeyboardBacklightIdleDimTime"), (uint64_t)v9, (uint64_t)v4);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%s)", v12, 0x20u);
  }

  return v8 & 1;
}

- (BOOL)suspendIdleDimming:(BOOL)a3 forKeyboard:(unint64_t)a4
{
  const char *v4;
  uint64_t inited;
  NSObject *logHandle;
  char v8;
  void *v9;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a3);
  v8 = -[BrightnessSystemClient setProperty:withKey:keyboardID:](self->bsc, "setProperty:withKey:keyboardID:", v9, CFSTR("KeyboardBacklightSuspendDimming"), a4);
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
    __os_log_helper_16_2_3_8_64_8_64_8_32((uint64_t)v12, (uint64_t)CFSTR("KeyboardBacklightSuspendDimming"), (uint64_t)v9, (uint64_t)v4);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%s)", v12, 0x20u);
  }

  return v8 & 1;
}

- (BOOL)isIdleDimmingSuspendedOnKeyboard:(unint64_t)a3
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = -[BrightnessSystemClient copyPropertyForKey:keyboardID:](self->bsc, "copyPropertyForKey:keyboardID:", CFSTR("KeyboardBacklightSuspendDimming"), a3);
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "dimming suspended=%@", v9, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "BOOLValue") & 1;

  return v7 & 1;
}

- (BOOL)isAutoBrightnessEnabledForKeyboard:(unint64_t)a3
{
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = -[BrightnessSystemClient copyPropertyForKey:keyboardID:](self->bsc, "copyPropertyForKey:keyboardID:", CFSTR("KeyboardBacklightABEnabled"), a3);
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "AB enabled=%@", v9, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "BOOLValue") & 1;

  return v7 & 1;
}

- (void)unregisterKeyboardNotificationBlock
{
  -[BrightnessSystemClient unregisterKeyboardNotificationBlock](self->bsc, "unregisterKeyboardNotificationBlock", a2, self);
}

- (void)registerNotificationForKeys:(id)a3 keyboardID:(unint64_t)a4 block:(id)a5
{
  -[BrightnessSystemClient registerKeyboardNotificationCallbackBlock:](self->bsc, "registerKeyboardNotificationCallbackBlock:", a5);
  -[BrightnessSystemClient registerNotificationForKeys:keyboardID:](self->bsc, "registerNotificationForKeys:keyboardID:", a3, a4);
}

@end
