@implementation KeyboardBacklightHIDCurveNits

- (KeyboardBacklightHIDCurveNits)initWithQueue:(id)a3 device:(id)a4
{
  objc_super v5;
  id v6;
  id v7;
  SEL v8;
  KeyboardBacklightHIDCurveNits *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  v5.receiver = self;
  v5.super_class = (Class)KeyboardBacklightHIDCurveNits;
  return -[KeyboardBacklightHIDCurve initWithQueue:device:](&v5, sel_initWithQueue_device_, a3, a4);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  KeyboardBacklightHIDCurveNits *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)KeyboardBacklightHIDCurveNits;
  -[KeyboardBacklightHIDCurve dealloc](&v2, sel_dealloc);
}

- (float)level
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  uint64_t inited;
  NSObject *logHandle;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[KeyboardBacklight suppressed](self, "suppressed") || -[KeyboardBacklight saturated](self, "saturated"))
  {
    -[KeyboardBacklight levelOff](self, "levelOff");
    return v2;
  }
  else
  {
    -[KeyboardBacklight levelMax](self, "levelMax");
    v12 = v3;
    -[KeyboardBacklight levelPercentage](self, "levelPercentage");
    v13 = v12 * v4;
    -[KeyboardBacklight levelMin](self, "levelMin");
    if (v13 >= v5)
      v11 = v13;
    else
      v11 = v5;
    -[KeyboardBacklight levelMax](self, "levelMax");
    if (v11 >= v6)
      v10 = v6;
    else
      v10 = v11;
    v14 = v10;
    if (self->super.super.super._logHandle)
    {
      logHandle = self->super.super.super._logHandle;
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
      __os_log_helper_16_0_1_8_0((uint64_t)v16, COERCE__INT64(v10));
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "level = %f (Nits)", v16, 0xCu);
    }
  }
  return v14;
}

- (void)setBrightness:(float)a3
{
  double v3;
  float v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  float v11;
  float v12;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v15[7];
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  os_log_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  os_log_type_t v26;
  os_log_t v27;
  float v28;
  SEL v29;
  KeyboardBacklightHIDCurveNits *v30;
  uint8_t v31[16];
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30 = self;
  v29 = a2;
  v28 = a3;
  v27 = 0;
  if (self->super.super.super._logHandle)
  {
    logHandle = v30->super.super.super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v27 = logHandle;
  v26 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v32, COERCE__INT64(v28), -[KeyboardBacklight manualAdjust](v30, "manualAdjust"));
    _os_log_debug_impl(&dword_1B5291000, v27, v26, "requested brightness %f manualAdjust %d", v32, 0x12u);
  }
  if (-[KeyboardBacklight manualAdjust](v30, "manualAdjust"))
  {
    v25 = 0.0;
    v24 = 0.0;
    v23 = v28;
    if (v28 <= 0.0)
      v12 = v24;
    else
      v12 = v23;
    v22 = v12;
    v25 = v12;
    v21 = 1.0;
    if (v12 >= 1.0)
      v11 = v21;
    else
      v11 = v25;
    v20 = v11;
    v28 = v11;
    *(float *)&v3 = v11;
    -[KeyboardBacklight setLevelPercentage:](v30, "setLevelPercentage:", v3);
    -[KeyboardBacklight setSaturated:](v30, "setSaturated:", 0);
    -[KeyboardBacklight levelPercentage](v30, "levelPercentage");
    -[KeyboardBacklight setMuted:](v30, "setMuted:", v4 == 0.0);
    if (-[KeyboardBacklight autoAdjust](v30, "autoAdjust"))
      -[KeyboardBacklightHIDCurve updateLuxToNitsCurve](v30, "updateLuxToNitsCurve");
    -[KeyboardBacklight levelPercentage](v30, "levelPercentage");
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightManualBrightness"));
    -[KeyboardBacklight updateBacklightDeviceWithReason:](v30, "updateBacklightDeviceWithReason:", 1);
    v19 = 0;
    if (v30->super.super.super._logHandle)
    {
      v10 = v30->super.super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v9 = init_default_corebrightness_log();
      v10 = v9;
    }
    v19 = v10;
    v18 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v30);
      _os_log_debug_impl(&dword_1B5291000, v19, v18, "%@", v31, 0xCu);
    }
  }
  else
  {
    v17 = 0;
    if (v30->super.super.super._logHandle)
    {
      v8 = v30->super.super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    v17 = v8;
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v17;
      v6 = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1B5291000, v5, v6, "Manual keyboard brightness adjustment not allowed", v15, 2u);
    }
  }
}

- (void)setBrightness:(float)a3 withFadeSpeed:(int)a4 commit:(BOOL)a5
{
  double v5;
  float v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  float v13;
  float v14;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v17[15];
  os_log_type_t v18;
  os_log_t oslog;
  os_log_type_t v20;
  os_log_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  os_log_type_t v28;
  os_log_t v29;
  BOOL v30;
  unsigned int v31;
  float v32;
  SEL v33;
  KeyboardBacklightHIDCurveNits *v34;
  uint8_t v35[16];
  uint8_t v36[40];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = self;
  v33 = a2;
  v32 = a3;
  v31 = a4;
  v30 = a5;
  v29 = 0;
  if (self->super.super.super._logHandle)
  {
    logHandle = v34->super.super.super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v29 = logHandle;
  v28 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_4_8_0_4_0_4_0_4_0((uint64_t)v36, COERCE__INT64(v32), -[KeyboardBacklight manualAdjust](v34, "manualAdjust"), v31, v30);
    _os_log_debug_impl(&dword_1B5291000, v29, v28, "Requested keyboard brightness %f, manualAdjust %d, fade speed %d, commit %d", v36, 0x1Eu);
  }
  if (-[KeyboardBacklight manualAdjust](v34, "manualAdjust"))
  {
    v27 = 0.0;
    v26 = 0.0;
    v25 = v32;
    if (v32 <= 0.0)
      v14 = v26;
    else
      v14 = v25;
    v24 = v14;
    v27 = v14;
    v23 = 1.0;
    if (v14 >= 1.0)
      v13 = v23;
    else
      v13 = v27;
    v22 = v13;
    v32 = v13;
    *(float *)&v5 = v13;
    -[KeyboardBacklight setLevelPercentage:](v34, "setLevelPercentage:", v5);
    -[KeyboardBacklight setSaturated:](v34, "setSaturated:", 0);
    -[KeyboardBacklight levelPercentage](v34, "levelPercentage");
    -[KeyboardBacklight setMuted:](v34, "setMuted:", v6 == 0.0);
    if (v30)
    {
      if (-[KeyboardBacklight autoAdjust](v34, "autoAdjust"))
        -[KeyboardBacklightHIDCurve updateLuxToNitsCurve](v34, "updateLuxToNitsCurve");
      -[KeyboardBacklight levelPercentage](v34, "levelPercentage");
      +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightManualBrightness"));
    }
    -[KeyboardBacklight updateBacklightDeviceWithFadeSpeed:commit:reason:](v34, "updateBacklightDeviceWithFadeSpeed:commit:reason:", v31, v30, 1);
    v21 = 0;
    if (v34->super.super.super._logHandle)
    {
      v12 = v34->super.super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v11 = init_default_corebrightness_log();
      v12 = v11;
    }
    v21 = v12;
    v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v34);
      _os_log_debug_impl(&dword_1B5291000, v21, v20, "%@", v35, 0xCu);
    }
  }
  else
  {
    oslog = 0;
    if (v34->super.super.super._logHandle)
    {
      v10 = v34->super.super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v9 = init_default_corebrightness_log();
      v10 = v9;
    }
    oslog = v10;
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_impl(&dword_1B5291000, v7, v8, "Manual keyboard brightness adjustment not allowed", v17, 2u);
    }
  }
}

- (float)convertNitsToLevelPercentage:(float)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  uint64_t v9;
  uint64_t inited;
  NSObject *logHandle;
  float v12;
  float v13;
  float v14;
  uint8_t v17[56];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0.0;
  -[KeyboardBacklight levelMax](self, "levelMax");
  if (v3 != 0.0)
  {
    -[KeyboardBacklight levelMax](self, "levelMax");
    v14 = a3 / v4;
  }
  -[KeyboardBacklightHIDCurveNits maxLevelPercentage](self, "maxLevelPercentage");
  if (v14 >= v5)
    v13 = v5;
  else
    v13 = v14;
  if (v13 <= 0.0)
    v12 = 0.0;
  else
    v12 = v13;
  if (self->super.super.super._logHandle)
  {
    logHandle = self->super.super.super._logHandle;
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
    -[KeyboardBacklight levelMax](self, "levelMax");
    *(double *)&v9 = v6;
    -[KeyboardBacklight levelMin](self, "levelMin");
    __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v17, COERCE__INT64(a3), COERCE__INT64(v12), v9, COERCE__INT64(v7));
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "nits = %f -> level percentage = %f, max = %f, min = %f", v17, 0x2Au);
  }
  return v12;
}

- (float)maxLevelPercentage
{
  return 1.0;
}

- (float)brightness
{
  float v2;
  float v4;

  v4 = 0.0;
  if (!-[KeyboardBacklight suppressed](self, "suppressed") && !-[KeyboardBacklight saturated](self, "saturated"))
  {
    -[KeyboardBacklight levelPercentage](self, "levelPercentage");
    return v2;
  }
  return v4;
}

- (float)maxCapableNits
{
  float result;

  -[KeyboardBacklight levelMax](self, "levelMax", a2, self);
  return result;
}

- (float)minCapableNits
{
  float v2;
  float v3;

  -[KeyboardBacklight levelMin](self, "levelMin");
  if (v2 <= 0.0)
    return 0.01;
  -[KeyboardBacklight levelMin](self, "levelMin");
  return v3;
}

@end
