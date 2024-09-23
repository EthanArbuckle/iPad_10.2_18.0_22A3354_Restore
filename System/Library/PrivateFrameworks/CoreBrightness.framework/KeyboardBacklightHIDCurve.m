@implementation KeyboardBacklightHIDCurve

- (KeyboardBacklightHIDCurve)initWithQueue:(id)a3
{
  return -[KeyboardBacklightHIDCurve initWithQueue:device:](self, "initWithQueue:device:", a3, 0);
}

- (KeyboardBacklightHIDCurve)initWithQueue:(id)a3 device:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v13[15];
  os_log_type_t v14;
  NSObject *v15;
  objc_super v16;
  int v17;
  id v18;
  id v19;
  SEL v20;
  KeyboardBacklightHIDCurve *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = 0;
  v16.receiver = self;
  v16.super_class = (Class)KeyboardBacklightHIDCurve;
  v21 = -[KeyboardBacklight initWithQueue:device:ambientOffset:](&v16, sel_initWithQueue_device_ambientOffset_, a3, a4);
  if (v21)
  {
    if (-[KeyboardBacklight supportsAuthentication](v21, "supportsAuthentication"))
    {
      v15 = 0;
      if (v21->super.super._logHandle)
      {
        logHandle = v21->super.super._logHandle;
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
      v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        log = v15;
        type = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_impl(&dword_1B5291000, log, type, "SECONDARY BACKLIGHT HID Curve", v13, 2u);
      }
    }
    v21->_chicletCurveCoefficient = 0.053369;
    v21->_chicletCurvePower = 2.5271;
    v21->_color = 48;
    v21->_curveVersion = 1.0;
    v21->_luxHysteresis = 40.0;
    -[KeyboardBacklight setHysteresisOn:](v21, "setHysteresisOn:", 1);
    if (-[KeyboardBacklight levelUnit](v21, "levelUnit") == 16777441)
    {
      luxToNitsCurve = 0;
      defaultLuxToNitsCurve = 0;
      dword_1EF129198 = 1116471296;
      dword_1EF1291B8 = 1116471296;
      dword_1EF1291A0 = 1126170624;
      dword_1EF1291C0 = 1126170624;
      dword_1EF1291A8 = 1133903872;
      dword_1EF1291C8 = 1133903872;
      -[KeyboardBacklight levelMax](v21, "levelMax");
      *(float *)&dword_1EF129194 = 0.25 * v4;
      *(float *)&dword_1EF1291B4 = 0.25 * v4;
      -[KeyboardBacklight levelMax](v21, "levelMax");
      *(float *)&dword_1EF12919C = 0.69375 * v5;
      *(float *)&dword_1EF1291BC = 0.69375 * v5;
      -[KeyboardBacklight levelMax](v21, "levelMax");
      *(float *)&dword_1EF1291A4 = 0.69375 * v6;
      *(float *)&dword_1EF1291C4 = 0.69375 * v6;
      -[KeyboardBacklight levelMax](v21, "levelMax");
      *(float *)&dword_1EF1291AC = 0.01 * v7;
      *(float *)&dword_1EF1291CC = 0.01 * v7;
    }
  }
  return v21;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  KeyboardBacklightHIDCurve *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)KeyboardBacklightHIDCurve;
  -[KeyboardBacklight dealloc](&v2, sel_dealloc);
}

- (id)description
{
  float v2;
  NSString *v4;
  id v5;
  objc_super v6;
  SEL v7;
  KeyboardBacklightHIDCurve *v8;

  v8 = self;
  v7 = a2;
  v5 = (id)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)KeyboardBacklightHIDCurve;
  v4 = -[KeyboardBacklight description](&v6, sel_description);
  -[KeyboardBacklightHIDCurve maxCurveNits](v8, "maxCurveNits");
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ maxCurveNits %f luxToNitsCurve [%f, %f], [%f, %f], [%f, %f], [%f, %f]"), v4, v2, *(float *)&luxToNitsCurve, *(float *)&dword_1EF129194, *(float *)&dword_1EF129198, *(float *)&dword_1EF12919C, *(float *)&dword_1EF1291A0, *(float *)&dword_1EF1291A4, *(float *)&dword_1EF1291A8, *(float *)&dword_1EF1291AC);
}

- (id)copyPropertyForKey:(id)a3
{
  id v4;
  objc_super v5;
  uint64_t v6;
  id v7;
  SEL v8;
  KeyboardBacklightHIDCurve *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightLuxHysteresis")) & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[KeyboardBacklightHIDCurve luxHysteresis](v9, "luxHysteresis");
    return (id)objc_msgSend(v4, "initWithFloat:");
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardBacklightCurve")) & 1) != 0)
  {
    return (id)-[NSDictionary copy](-[KeyboardBacklightHIDCurve brightnessCurve](v9, "brightnessCurve"), "copy");
  }
  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)KeyboardBacklightHIDCurve;
    return -[KeyboardBacklight copyPropertyForKey:](&v5, sel_copyPropertyForKey_, v7);
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  objc_super v5;
  BOOL v6;
  id v7;
  id v8;
  SEL v9;
  KeyboardBacklightHIDCurve *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  v6 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightCurve")) & 1) != 0)
  {
    v6 = -[KeyboardBacklightHIDCurve KBBrightnessCurvePropertyHandler:](v10, "KBBrightnessCurvePropertyHandler:", v8);
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardBacklightLuxHysteresis")) & 1) != 0)
  {
    v6 = -[KeyboardBacklightHIDCurve KBBrightnessLuxHysteresisPropertyHandler:](v10, "KBBrightnessLuxHysteresisPropertyHandler:", v8);
  }
  if (!v6)
  {
    v5.receiver = v10;
    v5.super_class = (Class)KeyboardBacklightHIDCurve;
    return -[KeyboardBacklight setProperty:forKey:](&v5, sel_setProperty_forKey_, v8, v7);
  }
  return v6;
}

- (BOOL)KBBrightnessCurvePropertyHandler:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->super.super._logHandle)
    {
      logHandle = self->super.super._logHandle;
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
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Update brightness curve to %@", v8, 0xCu);
    }
    -[KeyboardBacklightHIDCurve updateDefaultBrightnessCurve:](self, "updateDefaultBrightnessCurve:", a3);
    -[KeyboardBacklightHIDCurve updateBrightnessCurve:](self, "updateBrightnessCurve:", a3);
    -[KeyboardBacklightHIDCurve storeKeyboardBacklightCurveToPreferences](self, "storeKeyboardBacklightCurveToPreferences");
    -[KeyboardBacklight currentLux](self, "currentLux");
    -[KeyboardBacklightHIDCurve handleLuxUpdate:](self, "handleLuxUpdate:");
  }
  return 1;
}

- (BOOL)KBBrightnessLuxHysteresisPropertyHandler:(id)a3
{
  float v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    -[KeyboardBacklightHIDCurve setLuxHysteresis:](self, "setLuxHysteresis:");
    if (self->super.super._logHandle)
    {
      logHandle = self->super.super._logHandle;
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
      -[KeyboardBacklightHIDCurve luxHysteresis](self, "luxHysteresis");
      __os_log_helper_16_0_1_8_0((uint64_t)v9, COERCE__INT64(v3));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Lux hysteresis value set to %f", v9, 0xCu);
    }
  }
  return 1;
}

- (void)updateDefaultBrightnessCurve:(id)a3
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t inited;
  NSObject *logHandle;
  float v13;
  float luxHysteresis;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v15 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveY1"));
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      dword_1EF1291B4 = v3;
    }
    v16 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveY2"));
    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      dword_1EF1291BC = v4;
    }
    v17 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveY3"));
    if (v17)
    {
      objc_msgSend(v17, "floatValue");
      dword_1EF1291C4 = v5;
    }
    v18 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveY4"));
    if (v18)
    {
      objc_msgSend(v18, "floatValue");
      dword_1EF1291CC = v6;
    }
    v19 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveX1"));
    if (v19)
    {
      objc_msgSend(v19, "floatValue");
      defaultLuxToNitsCurve = v7;
    }
    v20 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveX2"));
    if (v20)
    {
      objc_msgSend(v20, "floatValue");
      dword_1EF1291B8 = v8;
    }
    v21 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveX3"));
    if (v21)
    {
      objc_msgSend(v21, "floatValue");
      dword_1EF1291C0 = v9;
    }
    v22 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveX4"));
    if (v22)
    {
      objc_msgSend(v22, "floatValue");
      dword_1EF1291C8 = v10;
    }
    self->_luxHysteresis = *(float *)&dword_1EF1291C8 * 0.13;
    if (self->_color == 70)
    {
      if (self->_luxHysteresis >= 5.0)
        luxHysteresis = self->_luxHysteresis;
      else
        luxHysteresis = 5.0;
      self->_luxHysteresis = luxHysteresis;
    }
    else
    {
      if (self->_luxHysteresis >= 10.0)
        v13 = self->_luxHysteresis;
      else
        v13 = 10.0;
      self->_luxHysteresis = v13;
    }
    if (self->super.super._logHandle)
    {
      logHandle = self->super.super._logHandle;
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
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v25, COERCE__INT64(self->_luxHysteresis), (uint64_t)-[KeyboardBacklightHIDCurve defaultBrightnessCurve](self, "defaultBrightnessCurve"));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Hysteresis = %f Default curve = %@", v25, 0x16u);
    }
  }
}

- (void)updateBrightnessCurve:(id)a3
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *log;
  os_log_type_t v24;
  uint64_t inited;
  NSObject *v26;
  float v27;
  float v28;
  uint8_t v29[7];
  os_log_type_t type;
  os_log_t oslog;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  SEL v43;
  float *v44;
  uint8_t v45[104];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v44 = (float *)self;
  v43 = a2;
  v42 = a3;
  if (-[KeyboardBacklightHIDCurve isBrightnessCurveValid:](self, "isBrightnessCurveValid:", a3))
  {
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY1")), "floatValue");
    dword_1EF129194 = v3;
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY2")), "floatValue");
    dword_1EF12919C = v4;
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY3")), "floatValue");
    dword_1EF1291A4 = v5;
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY4")), "floatValue");
    dword_1EF1291AC = v6;
    v41 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("KeyboardCurveX1"));
    if (v41)
    {
      objc_msgSend(v41, "floatValue");
      luxToNitsCurve = v7;
    }
    v40 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("KeyboardCurveX2"));
    if (v40)
    {
      objc_msgSend(v40, "floatValue");
      dword_1EF129198 = v8;
    }
    v39 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("KeyboardCurveX3"));
    if (v39)
    {
      objc_msgSend(v39, "floatValue");
      dword_1EF1291A0 = v9;
    }
    v38 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("KeyboardCurveX4"));
    if (v38)
    {
      objc_msgSend(v38, "floatValue");
      dword_1EF1291A8 = v10;
      objc_msgSend(v38, "floatValue");
      v44[88] = v11 * 0.13;
      if (*((_DWORD *)v44 + 84) == 70)
      {
        v37 = 0.0;
        v37 = v44[88];
        v36 = 5.0;
        if (v37 >= 5.0)
          v28 = v37;
        else
          v28 = v36;
        v35 = v28;
        v44[88] = v28;
      }
      else
      {
        v34 = 0.0;
        v34 = v44[88];
        v33 = 10.0;
        if (v34 >= 10.0)
          v27 = v34;
        else
          v27 = v33;
        v32 = v27;
        v44[88] = v27;
      }
    }
  }
  else
  {
    oslog = 0;
    if (*((_QWORD *)v44 + 2))
    {
      v26 = *((_QWORD *)v44 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v26 = inited;
    }
    oslog = v26;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v24 = type;
      __os_log_helper_16_0_0(v29);
      _os_log_error_impl(&dword_1B5291000, log, v24, "Keyboard brightness curve is corrupted -> use default curve.", v29, 2u);
    }
    luxToNitsCurve = defaultLuxToNitsCurve;
    dword_1EF129198 = dword_1EF1291B8;
    dword_1EF1291A0 = dword_1EF1291C0;
    dword_1EF1291A8 = dword_1EF1291C8;
    dword_1EF129194 = dword_1EF1291B4;
    dword_1EF12919C = dword_1EF1291BC;
    dword_1EF1291A4 = dword_1EF1291C4;
    dword_1EF1291AC = dword_1EF1291CC;
  }
  if (*((_QWORD *)v44 + 2))
  {
    v22 = *((_QWORD *)v44 + 2);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v21 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v21 = init_default_corebrightness_log();
    v22 = v21;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)&v14 = *(float *)&luxToNitsCurve;
    *(double *)&v15 = *(float *)&dword_1EF129194;
    *(double *)&v16 = *(float *)&dword_1EF129198;
    *(double *)&v17 = *(float *)&dword_1EF12919C;
    *(double *)&v18 = *(float *)&dword_1EF1291A0;
    *(double *)&v19 = *(float *)&dword_1EF1291A4;
    *(double *)&v20 = *(float *)&dword_1EF1291A8;
    *(double *)&v13 = *(float *)&dword_1EF1291AC;
    objc_msgSend(v44, "luxHysteresis");
    __os_log_helper_16_0_9_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v45, v14, v15, v16, v17, v18, v19, v20, v13, COERCE__INT64(v12));
    _os_log_impl(&dword_1B5291000, v22, OS_LOG_TYPE_DEFAULT, "Updated lux to nits curve to [%f, %f], [%f, %f], [%f, %f], [%f, %f] (Hysteresis = %f)", v45, 0x5Cu);
  }
}

- (BOOL)isBrightnessCurveValid:(id)a3
{
  float v3;
  float v4;
  float v5;
  double v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  BOOL v21;

  v21 = 1;
  v20 = (float)((float)(*(float *)&dword_1EF1291BC - *(float *)&dword_1EF1291B4)
              / (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve))
      * 1.5;
  v19 = *(float *)&luxToNitsCurve;
  v18 = *(float *)&dword_1EF129198;
  v16 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveX1"));
  if (v16)
  {
    objc_msgSend(v16, "floatValue");
    v19 = v3;
  }
  v17 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("KeyboardCurveX2"));
  if (v17)
  {
    objc_msgSend(v17, "floatValue");
    v18 = v4;
  }
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY2")), "floatValue");
  v15 = v5;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY1")), "floatValue");
  *(float *)&v6 = (float)(v15 - *(float *)&v6) / (float)(v18 - v19);
  if (*(float *)&v6 > v20)
    return 0;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY2"), v6), "floatValue");
  v14 = v7;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY1")), "floatValue");
  v8 = *(float *)&v9;
  *(float *)&v9 = v14;
  if (v14 < v8)
    return 0;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY3"), v9), "floatValue");
  v13 = v10;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("KeyboardCurveY4")), "floatValue");
  if (v13 < v11)
    return 0;
  return v21;
}

- (NSDictionary)brightnessCurve
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v11[8];
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("KeyboardCurveX1");
  LODWORD(v2) = luxToNitsCurve;
  v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v11[1] = CFSTR("KeyboardCurveX2");
  LODWORD(v3) = dword_1EF129198;
  v12[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v11[2] = CFSTR("KeyboardCurveX3");
  LODWORD(v4) = dword_1EF1291A0;
  v12[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v11[3] = CFSTR("KeyboardCurveX4");
  LODWORD(v5) = dword_1EF1291A8;
  v12[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v11[4] = CFSTR("KeyboardCurveY1");
  LODWORD(v6) = dword_1EF129194;
  v12[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v11[5] = CFSTR("KeyboardCurveY2");
  LODWORD(v7) = dword_1EF12919C;
  v12[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v11[6] = CFSTR("KeyboardCurveY3");
  LODWORD(v8) = dword_1EF1291A4;
  v12[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v11[7] = CFSTR("KeyboardCurveY4");
  LODWORD(v9) = dword_1EF1291AC;
  v12[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 8);
}

- (id)defaultBrightnessCurve
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v11[8];
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("KeyboardCurveX1");
  LODWORD(v2) = defaultLuxToNitsCurve;
  v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v11[1] = CFSTR("KeyboardCurveX2");
  LODWORD(v3) = dword_1EF1291B8;
  v12[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v11[2] = CFSTR("KeyboardCurveX3");
  LODWORD(v4) = dword_1EF1291C0;
  v12[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v11[3] = CFSTR("KeyboardCurveX4");
  LODWORD(v5) = dword_1EF1291C8;
  v12[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v11[4] = CFSTR("KeyboardCurveY1");
  LODWORD(v6) = dword_1EF1291B4;
  v12[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v11[5] = CFSTR("KeyboardCurveY2");
  LODWORD(v7) = dword_1EF1291BC;
  v12[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v11[6] = CFSTR("KeyboardCurveY3");
  LODWORD(v8) = dword_1EF1291C4;
  v12[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v11[7] = CFSTR("KeyboardCurveY4");
  LODWORD(v9) = dword_1EF1291CC;
  v12[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 8);
}

- (float)maxCurveNits
{
  float v2;
  float v3;
  float v5;

  -[KeyboardBacklightHIDCurve maxCapableNits](self, "maxCapableNits");
  v5 = v2;
  -[KeyboardBacklightHIDCurve maxLevelPercentage](self, "maxLevelPercentage");
  return v5 * v3;
}

- (float)maxLevelPercentage
{
  float v2;
  float v3;
  float v5;

  -[KeyboardBacklightHIDCurve chicletCurveCoefficient](self, "chicletCurveCoefficient");
  v5 = v2;
  -[KeyboardBacklightHIDCurve chicletCurvePower](self, "chicletCurvePower");
  return v5 * expf(v3);
}

- (float)maxUserLevel
{
  float v2;
  float v3;
  float v4;
  double v5;
  float v6;
  float v8;
  float v9;
  float v10;

  -[KeyboardBacklight levelMax](self, "levelMax");
  v8 = v2;
  -[KeyboardBacklightHIDCurve maxLevelPercentage](self, "maxLevelPercentage");
  v10 = v8 * v3;
  v9 = v8 * v3;
  -[KeyboardBacklight levelMin](self, "levelMin");
  v4 = *(float *)&v5;
  *(float *)&v5 = v9;
  if (v9 < v4)
  {
    -[KeyboardBacklight levelMin](self, "levelMin", v5);
    return v6;
  }
  return v10;
}

- (void)getKeyboardBacklightPreferences
{
  float v2;
  float v3;
  float v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  int v17;
  objc_super v18;
  os_log_type_t v19;
  os_log_t v20;
  os_log_type_t v21;
  os_log_t v22;
  uint8_t v23[7];
  os_log_type_t v24;
  NSObject *v25;
  uint8_t v26[15];
  os_log_type_t v27;
  NSObject *v28;
  id v29;
  id v30;
  char v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  SEL v36;
  KeyboardBacklightHIDCurve *v37;
  uint8_t v38[16];
  uint8_t v39[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v37 = self;
  v36 = a2;
  v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", -[KeyboardBacklight keyboardID](self, "keyboardID"));
  v34 = +[CBKeyboardPreferencesManager copyPreferenceForKey:](CBKeyboardPreferencesManager, "copyPreferenceForKey:", objc_msgSend(v35, "stringValue"));
  if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v33 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("KeyboardBacklightMaxUser"));
    v32 = objc_msgSend(v34, "objectForKey:", CFSTR("KeyboardBacklightAdjustedBrightnessCurve"));
    v31 = 1;
    v30 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("KeyboardCurveVersion"));
    if (v30)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v30, "floatValue");
        v37->_curveVersion = v2;
      }
    }
    v29 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("KeyboardColor"));
    if (v29)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v29, "intValue") == 53 && v37->_curveVersion < 2.03
          || objc_msgSend(v29, "intValue") == 70 && v37->_curveVersion < 3.0
          || objc_msgSend(v29, "intValue") == 71 && v37->_curveVersion < 2.0)
        {
          v31 = 0;
        }
        -[KeyboardBacklightHIDCurve setColor:](v37, "setColor:", objc_msgSend(v29, "intValue"));
      }
    }
    if ((v31 & 1) != 0)
    {
      if (v32)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v33, "floatValue");
          v17 = (int)(float)(v3 * 1000.0);
          -[KeyboardBacklightHIDCurve maxUserLevel](v37, "maxUserLevel");
          if (v17 == (int)(float)(v4 * 1000.0))
          {
            v28 = 0;
            if (v37->super.super._logHandle)
            {
              logHandle = v37->super.super._logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                inited = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                inited = init_default_corebrightness_log();
              logHandle = inited;
            }
            v28 = logHandle;
            v27 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
            {
              log = v28;
              type = v27;
              __os_log_helper_16_0_0(v26);
              _os_log_impl(&dword_1B5291000, log, type, "Pref curve present and max user level matched -> update the curve", v26, 2u);
            }
            -[KeyboardBacklightHIDCurve updateBrightnessCurve:](v37, "updateBrightnessCurve:", v32);
          }
        }
      }
    }
  }
  else
  {
    v25 = 0;
    if (v37->super.super._logHandle)
    {
      v12 = v37->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v11 = init_default_corebrightness_log();
      v12 = v11;
    }
    v25 = v12;
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v25;
      v10 = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_impl(&dword_1B5291000, v9, v10, "Pref not present or max user doesn't matched", v23, 2u);
    }
  }
  v22 = 0;
  if (v37->super.super._logHandle)
  {
    v8 = v37->super.super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v7 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v7 = init_default_corebrightness_log();
    v8 = v7;
  }
  v22 = v8;
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v39, (uint64_t)-[KeyboardBacklightHIDCurve defaultBrightnessCurve](v37, "defaultBrightnessCurve"));
    _os_log_impl(&dword_1B5291000, v22, v21, "Default curve = %{public}@", v39, 0xCu);
  }
  v20 = 0;
  if (v37->super.super._logHandle)
  {
    v6 = v37->super.super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v5 = init_default_corebrightness_log();
    v6 = v5;
  }
  v20 = v6;
  v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v38, (uint64_t)-[KeyboardBacklightHIDCurve brightnessCurve](v37, "brightnessCurve"));
    _os_log_impl(&dword_1B5291000, v20, v19, "Current curve = %{public}@", v38, 0xCu);
  }

  v18.receiver = v37;
  v18.super_class = (Class)KeyboardBacklightHIDCurve;
  -[KeyboardBacklight getKeyboardBacklightPreferences](&v18, sel_getKeyboardBacklightPreferences);
}

- (void)storeKeyboardBacklightPreferences
{
  objc_super v2;
  SEL v3;
  KeyboardBacklightHIDCurve *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)KeyboardBacklightHIDCurve;
  -[KeyboardBacklight storeKeyboardBacklightPreferences](&v2, sel_storeKeyboardBacklightPreferences);
  -[KeyboardBacklightHIDCurve storeKeyboardBacklightCurveToPreferences](v4, "storeKeyboardBacklightCurveToPreferences");
}

- (void)storeKeyboardBacklightCurveToPreferences
{
  id v2;
  double v3;
  id v4;
  double v5;
  uint64_t inited;
  NSObject *logHandle;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", -[KeyboardBacklight keyboardID](self, "keyboardID"));
  v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v3 = self->_curveVersion;
  v9 = (void *)objc_msgSend(v2, "initWithFloat:", v3);
  v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v5 = (float)self->_color;
  v8 = (void *)objc_msgSend(v4, "initWithFloat:", v5);
  -[NSMutableDictionary setObject:forKey:](-[KeyboardBacklight keyboardSpecificPreferences](self, "keyboardSpecificPreferences"), "setObject:forKey:", v9, CFSTR("KeyboardCurveVersion"));
  -[NSMutableDictionary setObject:forKey:](-[KeyboardBacklight keyboardSpecificPreferences](self, "keyboardSpecificPreferences"), "setObject:forKey:", v8, CFSTR("KeyboardColor"));

  -[NSMutableDictionary setObject:forKey:](-[KeyboardBacklight keyboardSpecificPreferences](self, "keyboardSpecificPreferences"), "setObject:forKey:", -[KeyboardBacklightHIDCurve brightnessCurve](self, "brightnessCurve"), CFSTR("KeyboardBacklightAdjustedBrightnessCurve"));
  +[CBKeyboardPreferencesManager setPreference:forKey:](CBKeyboardPreferencesManager, "setPreference:forKey:", -[KeyboardBacklight keyboardSpecificPreferences](self, "keyboardSpecificPreferences"), objc_msgSend(v10, "stringValue"));

  if (self->super.super._logHandle)
  {
    logHandle = self->super.super._logHandle;
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
    __os_log_helper_16_2_1_8_66((uint64_t)v12, (uint64_t)-[KeyboardBacklight keyboardSpecificPreferences](self, "keyboardSpecificPreferences"));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Brightness curve stored to preferences: %{public}@", v12, 0xCu);
  }
}

- (void)updateLuxToNitsCurve
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  int v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  int v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  NSObject *v33;
  os_log_type_t v34;
  NSObject *v35;
  NSObject *v36;
  os_log_type_t type;
  NSObject *v38;
  NSObject *log;
  os_log_type_t v40;
  NSObject *v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  uint8_t v47[7];
  char v48;
  NSObject *v49;
  uint8_t v50[7];
  char v51;
  NSObject *v52;
  uint8_t v53[7];
  char v54;
  NSObject *v55;
  SEL v56;
  KeyboardBacklightHIDCurve *v57;

  v57 = self;
  v56 = a2;
  if (!-[KeyboardBacklight autoAdjust](self, "autoAdjust"))
  {
    v55 = 0;
    v41 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v55 = v41;
    v54 = 16;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      log = v55;
      v40 = v54;
      __os_log_helper_16_0_0(v53);
      _os_log_error_impl(&dword_1B5291000, log, v40, "ASSERTION FAILED: self.autoAdjust", v53, 2u);
    }
  }
  -[KeyboardBacklight currentLux](v57, "currentLux");
  if (v2 < *(float *)&luxToNitsCurve
    || (-[KeyboardBacklight currentLux](v57, "currentLux"), v3 > *(float *)&dword_1EF1291A8))
  {
    v52 = 0;
    v38 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v52 = v38;
    v51 = 16;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v36 = v52;
      type = v51;
      __os_log_helper_16_0_0(v50);
      _os_log_error_impl(&dword_1B5291000, v36, type, "ASSERTION FAILED: self.currentLux >= luxToNitsCurve[0][0] && self.currentLux <= luxToNitsCurve[3][0]", v50, 2u);
    }
  }
  -[KeyboardBacklight levelPercentage](v57, "levelPercentage");
  if (v4 < 0.0 || (-[KeyboardBacklight levelPercentage](v57, "levelPercentage"), v5 > 1.0))
  {
    v49 = 0;
    v35 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v49 = v35;
    v48 = 16;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v33 = v49;
      v34 = v48;
      __os_log_helper_16_0_0(v47);
      _os_log_error_impl(&dword_1B5291000, v33, v34, "ASSERTION FAILED: self.levelPercentage >= 0.0F && self.levelPercentage <= 1.0F", v47, 2u);
    }
  }
  v46 = (float)(*(float *)&dword_1EF1291BC - *(float *)&dword_1EF1291B4)
      / (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve);
  v45 = v46 * 1.5;
  -[KeyboardBacklight levelPercentage](v57, "levelPercentage");
  v32 = v6;
  -[KeyboardBacklightHIDCurve maxCapableNits](v57, "maxCapableNits");
  v44 = v32 * v7;
  -[KeyboardBacklight currentLux](v57, "currentLux");
  if (v8 == *(float *)&defaultLuxToNitsCurve)
  {
    dword_1EF129194 = LODWORD(v44);
    *(float *)&dword_1EF12919C = v44
                               + (float)(v46 * (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve));
  }
  else
  {
    -[KeyboardBacklight currentLux](v57, "currentLux");
    if (v9 <= *(float *)&defaultLuxToNitsCurve
      || (-[KeyboardBacklight currentLux](v57, "currentLux"), v10 > *(float *)&dword_1EF1291B8))
    {
      -[KeyboardBacklight currentLux](v57, "currentLux");
      if (v17 <= *(float *)&dword_1EF1291B8
        || (-[KeyboardBacklight currentLux](v57, "currentLux"), v18 > *(float *)&dword_1EF1291C0))
      {
        -[KeyboardBacklight currentLux](v57, "currentLux");
        if (v20 > *(float *)&dword_1EF1291C0)
        {
          -[KeyboardBacklight currentLux](v57, "currentLux");
          if (v21 < *(float *)&dword_1EF1291C8)
          {
            v27 = *(float *)&dword_1EF1291CC - v44;
            v26 = *(float *)&dword_1EF1291C8;
            -[KeyboardBacklight currentLux](v57, "currentLux");
            *(float *)&dword_1EF1291A4 = *(float *)&dword_1EF1291CC
                                       - (float)((float)(v27 / (float)(v26 - v22))
                                               * (float)(*(float *)&dword_1EF1291C8 - *(float *)&dword_1EF1291C0));
            *(float *)&dword_1EF12919C = *(float *)&dword_1EF1291BC
                                       + (float)(*(float *)&dword_1EF1291A4 - *(float *)&dword_1EF1291C4);
            v28 = *(float *)&dword_1EF1291BC + (float)(*(float *)&dword_1EF1291A4 - *(float *)&dword_1EF1291C4);
            -[KeyboardBacklightHIDCurve maxCurveNits](v57, "maxCurveNits");
            v23 = *(float *)&v24;
            *(float *)&v24 = v28;
            if (v28 > v23)
            {
              -[KeyboardBacklightHIDCurve maxCurveNits](v57, "maxCurveNits", v24);
              dword_1EF12919C = v25;
            }
            if ((float)((float)(*(float *)&dword_1EF12919C - *(float *)&dword_1EF1291B4)
                       / (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve)) <= v45)
              *(float *)&dword_1EF129194 = *(float *)&dword_1EF12919C
                                         - (float)(fmaxf((float)(*(float *)&dword_1EF12919C - *(float *)&dword_1EF1291B4)/ (float)(*(float *)&dword_1EF1291B8- *(float *)&defaultLuxToNitsCurve), v46)* (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve));
            else
              *(float *)&dword_1EF129194 = *(float *)&dword_1EF12919C
                                         - (float)(v45
                                                 * (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve));
          }
        }
      }
      else
      {
        -[KeyboardBacklight currentLux](v57, "currentLux");
        v42 = v44
            - (float)(*(float *)&dword_1EF1291BC
                    + (float)((float)((float)(v19 - *(float *)&dword_1EF1291B8)
                                    / (float)(*(float *)&dword_1EF1291C0 - *(float *)&dword_1EF1291B8))
                            * (float)(*(float *)&dword_1EF1291C4 - *(float *)&dword_1EF1291BC)));
        *(float *)&dword_1EF12919C = *(float *)&dword_1EF1291BC + v42;
        *(float *)&dword_1EF1291A4 = *(float *)&dword_1EF1291C4 + v42;
        if ((float)((float)((float)(*(float *)&dword_1EF1291BC + v42) - *(float *)&dword_1EF1291B4)
                   / (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve)) <= v45)
          *(float *)&dword_1EF129194 = *(float *)&dword_1EF12919C
                                     - (float)(fmaxf((float)((float)(*(float *)&dword_1EF1291BC + v42)- *(float *)&dword_1EF1291B4)/ (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve), v46)* (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve));
        else
          *(float *)&dword_1EF129194 = *(float *)&dword_1EF12919C
                                     - (float)(v45
                                             * (float)(*(float *)&dword_1EF1291B8 - *(float *)&defaultLuxToNitsCurve));
      }
    }
    else
    {
      v31 = v44 - *(float *)&dword_1EF1291B4;
      -[KeyboardBacklight currentLux](v57, "currentLux");
      v43 = v31 / (float)(v11 - *(float *)&defaultLuxToNitsCurve);
      if (v43 <= v45)
      {
        v30 = fmaxf(v43, v46);
        -[KeyboardBacklight currentLux](v57, "currentLux");
        *(float *)&dword_1EF12919C = (float)(v44 - (float)(v30 * (float)(v13 - *(float *)&defaultLuxToNitsCurve)))
                                   + (float)(*(float *)&dword_1EF1291B8 * v30);
        *(float *)&dword_1EF129194 = v44 - (float)(v30 * (float)(v13 - *(float *)&defaultLuxToNitsCurve));
      }
      else
      {
        -[KeyboardBacklight currentLux](v57, "currentLux");
        *(float *)&dword_1EF12919C = (float)(v44 - (float)(v45 * (float)(v12 - *(float *)&defaultLuxToNitsCurve)))
                                   + (float)(*(float *)&dword_1EF1291B8 * v45);
        *(float *)&dword_1EF129194 = v44 - (float)(v45 * (float)(v12 - *(float *)&defaultLuxToNitsCurve));
      }
      *(float *)&dword_1EF1291A4 = *(float *)&dword_1EF1291C4
                                 + (float)(*(float *)&dword_1EF12919C - *(float *)&dword_1EF1291BC);
      v29 = *(float *)&dword_1EF1291C4 + (float)(*(float *)&dword_1EF12919C - *(float *)&dword_1EF1291BC);
      -[KeyboardBacklightHIDCurve maxCurveNits](v57, "maxCurveNits");
      v14 = *(float *)&v15;
      *(float *)&v15 = v29;
      if (v29 > v14)
      {
        -[KeyboardBacklightHIDCurve maxCurveNits](v57, "maxCurveNits", v15);
        dword_1EF1291A4 = v16;
      }
    }
  }
  -[KeyboardBacklightHIDCurve storeKeyboardBacklightCurveToPreferences](v57, "storeKeyboardBacklightCurveToPreferences");
}

- (float)level
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v9;
  float v10;
  float v11;

  if (-[KeyboardBacklight suppressed](self, "suppressed") || -[KeyboardBacklight saturated](self, "saturated"))
  {
    -[KeyboardBacklight levelOff](self, "levelOff");
    return v2;
  }
  else
  {
    -[KeyboardBacklight levelMax](self, "levelMax");
    v10 = v3;
    -[KeyboardBacklight levelPercentage](self, "levelPercentage");
    v11 = (float)(int)rintf(v10 * v4);
    -[KeyboardBacklight levelMin](self, "levelMin");
    if (v11 >= v5)
      v9 = v11;
    else
      v9 = v5;
    -[KeyboardBacklight levelMax](self, "levelMax");
    if (v9 >= v6)
      return v6;
    else
      return v9;
  }
}

- (float)brightness
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v7;
  float v8;
  float v10;

  v10 = 0.0;
  if (!-[KeyboardBacklight suppressed](self, "suppressed") && !-[KeyboardBacklight saturated](self, "saturated"))
  {
    -[KeyboardBacklight levelPercentage](self, "levelPercentage");
    if (v2 == 0.0)
      return 0.0;
    -[KeyboardBacklight levelPercentage](self, "levelPercentage");
    v7 = v3;
    -[KeyboardBacklightHIDCurve chicletCurveCoefficient](self, "chicletCurveCoefficient");
    v8 = logf(v7 / v4);
    -[KeyboardBacklightHIDCurve chicletCurvePower](self, "chicletCurvePower");
    return v8 / v5;
  }
  return v10;
}

- (void)setBrightness:(float)a3
{
  double v3;
  float v4;
  float v5;
  float v6;
  float v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->super.super._logHandle)
  {
    logHandle = self->super.super._logHandle;
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
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v22, COERCE__INT64(a3), -[KeyboardBacklight manualAdjust](self, "manualAdjust"));
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "requested brightness %f manualAdjust %d", v22, 0x12u);
  }
  if (-[KeyboardBacklight manualAdjust](self, "manualAdjust"))
  {
    if (a3 <= 0.0)
      v15 = 0.0;
    else
      v15 = a3;
    if (v15 >= 1.0)
      v14 = 1.0;
    else
      v14 = v15;
    *(float *)&v3 = v14;
    if (v14 == 0.0)
    {
      v13 = 0.0;
    }
    else
    {
      -[KeyboardBacklightHIDCurve chicletCurveCoefficient](self, "chicletCurveCoefficient", v3);
      v12 = v4;
      -[KeyboardBacklightHIDCurve chicletCurvePower](self, "chicletCurvePower");
      v13 = v12 * expf(v5 * v14);
    }
    *(float *)&v3 = v13;
    -[KeyboardBacklight setLevelPercentage:](self, "setLevelPercentage:", v3);
    -[KeyboardBacklight setSaturated:](self, "setSaturated:", 0);
    -[KeyboardBacklight levelPercentage](self, "levelPercentage");
    -[KeyboardBacklight setMuted:](self, "setMuted:", v6 == 0.0);
    if (-[KeyboardBacklight autoAdjust](self, "autoAdjust"))
      -[KeyboardBacklightHIDCurve updateLuxToNitsCurve](self, "updateLuxToNitsCurve");
    -[KeyboardBacklight levelPercentage](self, "levelPercentage");
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightManualBrightness"));
    -[KeyboardBacklight updateBacklightDeviceWithReason:](self, "updateBacklightDeviceWithReason:", 1);
    if (self->super.super._logHandle)
    {
      v11 = self->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v10 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v10 = init_default_corebrightness_log();
      v11 = v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)self);
      _os_log_debug_impl(&dword_1B5291000, v11, OS_LOG_TYPE_DEBUG, "%@", v21, 0xCu);
    }
  }
  else
  {
    if (self->super.super._logHandle)
    {
      v9 = self->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v8 = init_default_corebrightness_log();
      v9 = v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[KeyboardBacklight currentLux](self, "currentLux");
      __os_log_helper_16_0_1_8_0((uint64_t)v20, COERCE__INT64(v7));
      _os_log_impl(&dword_1B5291000, v9, OS_LOG_TYPE_DEFAULT, "Manual keyboard brightness adjustment not allowed (Lux=%f)", v20, 0xCu);
    }
  }
}

- (void)setBrightness:(float)a3 withFadeSpeed:(int)a4 commit:(BOOL)a5
{
  double v5;
  float v6;
  float v7;
  float v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v21[15];
  os_log_type_t v22;
  os_log_t oslog;
  os_log_type_t v24;
  os_log_t v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  os_log_type_t v32;
  os_log_t v33;
  BOOL v34;
  unsigned int v35;
  float v36;
  SEL v37;
  KeyboardBacklightHIDCurve *v38;
  uint8_t v39[16];
  uint8_t v40[40];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v38 = self;
  v37 = a2;
  v36 = a3;
  v35 = a4;
  v34 = a5;
  v33 = 0;
  if (self->super.super._logHandle)
  {
    logHandle = v38->super.super._logHandle;
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
  v32 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_4_8_0_4_0_4_0_4_0((uint64_t)v40, COERCE__INT64(v36), -[KeyboardBacklight manualAdjust](v38, "manualAdjust"), v35, v34);
    _os_log_debug_impl(&dword_1B5291000, v33, v32, "Requested keyboard brightness %f, manualAdjust %d, fade speed %d, commit %d", v40, 0x1Eu);
  }
  if (-[KeyboardBacklight manualAdjust](v38, "manualAdjust"))
  {
    v31 = 0.0;
    v30 = 0.0;
    v29 = v36;
    if (v36 <= 0.0)
      v18 = v30;
    else
      v18 = v29;
    v28 = v18;
    v31 = v18;
    v27 = 1.0;
    if (v18 >= 1.0)
      v17 = v27;
    else
      v17 = v31;
    v26 = v17;
    v36 = v17;
    *(float *)&v5 = v17;
    if (v17 == 0.0)
    {
      v16 = 0.0;
    }
    else
    {
      -[KeyboardBacklightHIDCurve chicletCurveCoefficient](v38, "chicletCurveCoefficient", v5);
      v15 = v6;
      -[KeyboardBacklightHIDCurve chicletCurvePower](v38, "chicletCurvePower");
      v16 = v15 * expf(v7 * v36);
    }
    *(float *)&v5 = v16;
    -[KeyboardBacklight setLevelPercentage:](v38, "setLevelPercentage:", v5);
    -[KeyboardBacklight setSaturated:](v38, "setSaturated:", 0);
    -[KeyboardBacklight levelPercentage](v38, "levelPercentage");
    -[KeyboardBacklight setMuted:](v38, "setMuted:", v8 == 0.0);
    if (-[KeyboardBacklight autoAdjust](v38, "autoAdjust"))
      -[KeyboardBacklightHIDCurve updateLuxToNitsCurve](v38, "updateLuxToNitsCurve");
    -[KeyboardBacklight levelPercentage](v38, "levelPercentage");
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightManualBrightness"));
    -[KeyboardBacklight updateBacklightDeviceWithFadeSpeed:commit:reason:](v38, "updateBacklightDeviceWithFadeSpeed:commit:reason:", v35, v34, 1);
    v25 = 0;
    if (v38->super.super._logHandle)
    {
      v14 = v38->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v13 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v13 = init_default_corebrightness_log();
      v14 = v13;
    }
    v25 = v14;
    v24 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v39, (uint64_t)v38);
      _os_log_debug_impl(&dword_1B5291000, v25, v24, "%@", v39, 0xCu);
    }
  }
  else
  {
    oslog = 0;
    if (v38->super.super._logHandle)
    {
      v12 = v38->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v11 = init_default_corebrightness_log();
      v12 = v11;
    }
    oslog = v12;
    v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v9 = oslog;
      v10 = v22;
      __os_log_helper_16_0_0(v21);
      _os_log_impl(&dword_1B5291000, v9, v10, "Manual keyboard brightness adjustment not allowed", v21, 2u);
    }
  }
}

- (void)setBacklightLevel:(float)a3
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->super.super._logHandle)
  {
    logHandle = self->super.super._logHandle;
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
    __os_log_helper_16_0_1_8_0((uint64_t)v10, COERCE__INT64(a3));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Set backlight level = %f", v10, 0xCu);
  }
  *(float *)&v3 = a3;
  -[KeyboardBacklightHIDCurve convertNitsToLevelPercentage:](self, "convertNitsToLevelPercentage:", v3);
  if (*(float *)&v4 >= 0.0)
    HIDWORD(v5) = LODWORD(v4);
  else
    HIDWORD(v5) = 0;
  if (*((float *)&v5 + 1) >= 1.0)
    LODWORD(v5) = 1.0;
  else
    LODWORD(v5) = HIDWORD(v5);
  LODWORD(v4) = v5;
  -[KeyboardBacklightHIDCurve setBrightness:](self, "setBrightness:", v4, v5);
}

- (float)currentLuxToNits
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  NSObject *log;
  os_log_type_t type;
  NSObject *v19;
  float v20;
  float v21;
  uint8_t v22[7];
  char v23;
  NSObject *v24;
  uint8_t v25[15];
  char v26;
  NSObject *v27;
  float v28;
  float v29;
  int i;
  float v31;
  int v32;
  SEL v33;
  KeyboardBacklightHIDCurve *v34;

  v34 = self;
  v33 = a2;
  v32 = 4;
  v31 = 0.0;
  -[KeyboardBacklight currentLux](self, "currentLux");
  if (v2 >= *(float *)luxToNitsCurve)
  {
    -[KeyboardBacklight currentLux](v34, "currentLux");
    if (v3 < *(float *)&dword_1EF1291A8)
    {
      for (i = 0; i < 3; ++i)
      {
        -[KeyboardBacklight currentLux](v34, "currentLux");
        if (v4 >= *(float *)&luxToNitsCurve[2 * i])
        {
          -[KeyboardBacklight currentLux](v34, "currentLux");
          if (v5 < *(float *)&luxToNitsCurve[2 * i + 2])
          {
            v29 = 0.0;
            v6 = fabs((float)(*(float *)&luxToNitsCurve[2 * i + 2] - *(float *)&luxToNitsCurve[2 * i]));
            v29 = v6;
            v28 = 0.0;
            -[KeyboardBacklight currentLux](v34, "currentLux");
            v8 = fabs((float)(v7 - *(float *)&luxToNitsCurve[2 * i]));
            v28 = v8;
            if (v29 <= 0.0)
            {
              v27 = 0;
              v19 = (_COREBRIGHTNESS_LOG_DEFAULT
                               ? _COREBRIGHTNESS_LOG_DEFAULT
                               : init_default_corebrightness_log());
              v27 = v19;
              v26 = 16;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                log = v27;
                type = v26;
                __os_log_helper_16_0_0(v25);
                _os_log_error_impl(&dword_1B5291000, log, type, "ASSERTION FAILED: deltaLuxCurve > 0.0F", v25, 2u);
              }
            }
            if (v28 < 0.0)
            {
              v24 = 0;
              v16 = (_COREBRIGHTNESS_LOG_DEFAULT
                               ? _COREBRIGHTNESS_LOG_DEFAULT
                               : init_default_corebrightness_log());
              v24 = v16;
              v23 = 16;
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                v14 = v24;
                v15 = v23;
                __os_log_helper_16_0_0(v22);
                _os_log_error_impl(&dword_1B5291000, v14, v15, "ASSERTION FAILED: deltaLuxALS >= 0.0F", v22, 2u);
              }
            }
            v21 = 0.0;
            if (v29 != 0.0)
              v21 = v28 / v29;
            v31 = *(float *)&luxToNitsCurve[2 * i + 1]
                + (float)(v21 * (float)(*(float *)&luxToNitsCurve[2 * i + 3] - *(float *)&luxToNitsCurve[2 * i + 1]));
            break;
          }
        }
      }
    }
    else
    {
      v31 = *(float *)&dword_1EF1291AC;
    }
  }
  else
  {
    v31 = *(float *)&dword_1EF129194;
  }
  v20 = v31;
  -[KeyboardBacklightHIDCurve maxCurveNits](v34, "maxCurveNits");
  if (v20 >= v9)
    v13 = v9;
  else
    v13 = v20;
  -[KeyboardBacklightHIDCurve minCapableNits](v34, "minCapableNits");
  if (v13 >= v10)
    return v13;
  else
    return v10;
}

- (float)convertNitsToLevelPercentage:(float)a3
{
  float v3;
  float v4;
  float v5;
  float v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  NSObject *log;
  os_log_type_t type;
  NSObject *v14;
  float v15;
  float v16;
  uint8_t v17[7];
  char v18;
  NSObject *v19;
  uint8_t v20[15];
  char v21;
  NSObject *v22;
  float v23;
  float v24;
  int i;
  int v26;
  float v27;
  float v28;
  SEL v29;
  KeyboardBacklightHIDCurve *v30;

  v30 = self;
  v29 = a2;
  v28 = a3;
  v27 = 0.0;
  v26 = 17;
  if (a3 >= 0.0)
  {
    if (v28 < 30.0)
    {
      for (i = 0; i < 16; ++i)
      {
        if (v28 >= *(float *)&nitsToPWMPercentage[2 * i] && v28 < *(float *)&nitsToPWMPercentage[2 * i + 2])
        {
          v24 = 0.0;
          v3 = fabs((float)(*(float *)&nitsToPWMPercentage[2 * i + 2] - *(float *)&nitsToPWMPercentage[2 * i]));
          v24 = v3;
          v23 = 0.0;
          v4 = fabs((float)(v28 - *(float *)&nitsToPWMPercentage[2 * i]));
          v23 = v4;
          if (v3 <= 0.0)
          {
            v22 = 0;
            v14 = (_COREBRIGHTNESS_LOG_DEFAULT
                             ? _COREBRIGHTNESS_LOG_DEFAULT
                             : init_default_corebrightness_log());
            v22 = v14;
            v21 = 16;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              log = v22;
              type = v21;
              __os_log_helper_16_0_0(v20);
              _os_log_error_impl(&dword_1B5291000, log, type, "ASSERTION FAILED: deltaPWMCurve > 0.0F", v20, 2u);
            }
          }
          if (v23 < 0.0)
          {
            v19 = 0;
            v11 = (_COREBRIGHTNESS_LOG_DEFAULT
                             ? _COREBRIGHTNESS_LOG_DEFAULT
                             : init_default_corebrightness_log());
            v19 = v11;
            v18 = 16;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v9 = v19;
              v10 = v18;
              __os_log_helper_16_0_0(v17);
              _os_log_error_impl(&dword_1B5291000, v9, v10, "ASSERTION FAILED: deltaPWMALS >= 0.0F", v17, 2u);
            }
          }
          v16 = 0.0;
          if (v24 != 0.0)
            v16 = v23 / v24;
          v27 = *(float *)&nitsToPWMPercentage[2 * i + 1]
              + (float)(v16
                      * (float)(*(float *)&nitsToPWMPercentage[2 * i + 3] - *(float *)&nitsToPWMPercentage[2 * i + 1]));
          break;
        }
      }
    }
    else
    {
      v27 = 1.0;
    }
  }
  else
  {
    v27 = 0.0;
  }
  v15 = v27;
  -[KeyboardBacklightHIDCurve maxLevelPercentage](v30, "maxLevelPercentage");
  if (v15 >= v5)
    v8 = v5;
  else
    v8 = v15;
  if (v8 <= 0.0)
    return 0.0;
  else
    return v8;
}

- (float)convertPWMPercentageToNits:(float)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v12;
  NSObject *log;
  os_log_type_t type;
  NSObject *v15;
  float v16;
  uint8_t v17[7];
  char v18;
  NSObject *v19;
  uint8_t v20[7];
  char v21;
  NSObject *v22;
  float v23;
  float v24;
  float v25;
  int i;
  int v27;
  float v28;
  float v29;
  SEL v30;
  KeyboardBacklightHIDCurve *v31;

  v31 = self;
  v30 = a2;
  v29 = a3;
  v28 = 0.0;
  v27 = 17;
  if (a3 >= 0.0)
  {
    if (v29 < 1.0)
    {
      for (i = 0; i < 16; ++i)
      {
        if (v29 >= *(float *)&nitsToPWMPercentage[2 * i + 1] && v29 < *(float *)&nitsToPWMPercentage[2 * i + 3])
        {
          v25 = 0.0;
          v24 = 0.0;
          v3 = fabs((float)(*(float *)&nitsToPWMPercentage[2 * i + 3] - *(float *)&nitsToPWMPercentage[2 * i + 1]));
          v24 = v3;
          v23 = 0.0;
          v4 = fabs((float)(v29 - *(float *)&nitsToPWMPercentage[2 * i + 1]));
          v23 = v4;
          if (v3 <= 0.0)
          {
            v22 = 0;
            v15 = (_COREBRIGHTNESS_LOG_DEFAULT
                             ? _COREBRIGHTNESS_LOG_DEFAULT
                             : init_default_corebrightness_log());
            v22 = v15;
            v21 = 16;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              log = v22;
              type = v21;
              __os_log_helper_16_0_0(v20);
              _os_log_error_impl(&dword_1B5291000, log, type, "ASSERTION FAILED: deltaCurve > 0.0F", v20, 2u);
            }
          }
          if (v23 < 0.0)
          {
            v19 = 0;
            v12 = (_COREBRIGHTNESS_LOG_DEFAULT
                             ? _COREBRIGHTNESS_LOG_DEFAULT
                             : init_default_corebrightness_log());
            v19 = v12;
            v18 = 16;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v10 = v19;
              v11 = v18;
              __os_log_helper_16_0_0(v17);
              _os_log_error_impl(&dword_1B5291000, v10, v11, "ASSERTION FAILED: deltaPWM >= 0.0F", v17, 2u);
            }
          }
          if (v24 != 0.0)
            v25 = v23 / v24;
          v28 = *(float *)&nitsToPWMPercentage[2 * i]
              + (float)(v25 * (float)(*(float *)&nitsToPWMPercentage[2 * i + 2] - *(float *)&nitsToPWMPercentage[2 * i]));
          break;
        }
      }
    }
    else
    {
      v28 = 30.0;
    }
  }
  else
  {
    v28 = 0.0;
  }
  if (v28 > 0.0)
  {
    v16 = v28;
    -[KeyboardBacklightHIDCurve maxCurveNits](v31, "maxCurveNits");
    if (v16 >= v5)
      v9 = v5;
    else
      v9 = v16;
    -[KeyboardBacklightHIDCurve minCapableNits](v31, "minCapableNits");
    if (v9 >= v6)
      return v9;
    else
      return v6;
  }
  return v28;
}

- (float)currentLuxToAmbient
{
  float result;

  -[KeyboardBacklightHIDCurve currentLuxToNits](self, "currentLuxToNits");
  -[KeyboardBacklightHIDCurve convertNitsToLevelPercentage:](self, "convertNitsToLevelPercentage:");
  return result;
}

- (void)handleLuxUpdate:(float)a3
{
  double v3;
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  float v12;
  float v13;
  int v14;
  float v15;
  float v16;
  float v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t inited;
  NSObject *logHandle;
  KeyboardBacklightHIDCurve *v25;
  KeyboardBacklightHIDCurve *v26;
  KeyboardBacklightHIDCurve *v27;
  float v28;
  float v29;
  float v30;
  float v31;
  NSObject *log;
  os_log_type_t type;
  NSObject *v34;
  float v35;
  int v36;
  float v37;
  char v38;
  uint8_t v39[15];
  char v40;
  NSObject *v41;
  float v42;
  SEL v43;
  KeyboardBacklightHIDCurve *v44;
  uint8_t v45[16];
  uint8_t v46[72];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v44 = self;
  v43 = a2;
  v42 = a3;
  if (a3 < 0.0)
  {
    v41 = 0;
    v34 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v41 = v34;
    v40 = 16;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      log = v41;
      type = v40;
      __os_log_helper_16_0_0(v39);
      _os_log_error_impl(&dword_1B5291000, log, type, "ASSERTION FAILED: lux >= 0.0F", v39, 2u);
    }
  }
  *(float *)&v3 = v42;
  -[KeyboardBacklight setCurrentLux:](v44, "setCurrentLux:", v3);
  if (-[KeyboardBacklight hysteresisOn](v44, "hysteresisOn"))
  {
    v31 = v42;
    v30 = *(float *)&dword_1EF1291A8;
    -[KeyboardBacklightHIDCurve luxHysteresis](v44, "luxHysteresis");
    v5 = v4;
    *(float *)&v6 = v31;
    -[KeyboardBacklight setHysteresisOn:](v44, "setHysteresisOn:", v31 < (float)(v30 + v5), v6);
  }
  if (!-[KeyboardBacklight suspend](v44, "suspend"))
  {
    *(float *)&v7 = v42;
    -[KeyboardBacklight setManualAdjust:](v44, "setManualAdjust:", v42 <= *(float *)&dword_1EF1291A8, v7);
    v38 = 1;
    if (v44->_color == 70
      && !-[KeyboardBacklight hysteresisOn](v44, "hysteresisOn")
      && -[KeyboardBacklight saturated](v44, "saturated"))
    {
      *(float *)&v8 = v42;
      if (v42 < *(float *)&dword_1EF1291A8)
      {
        -[KeyboardBacklight setSaturated:](v44, "setSaturated:", 0, v8);
        -[KeyboardBacklight setHysteresisOn:](v44, "setHysteresisOn:", 1);
      }
    }
    else if (-[KeyboardBacklight saturated](v44, "saturated")
           && (v29 = v42,
               v28 = *(float *)&dword_1EF1291A8,
               -[KeyboardBacklightHIDCurve luxHysteresis](v44, "luxHysteresis"),
               v9 = *(float *)&v10,
               *(float *)&v10 = v29,
               v29 < (float)(v28 - v9)))
    {
      -[KeyboardBacklight setSaturated:](v44, "setSaturated:", 0, v10);
    }
    else if (-[KeyboardBacklight saturated](v44, "saturated")
           || (*(float *)&v11 = v42, v42 <= *(float *)&dword_1EF1291A8))
    {
      if (-[KeyboardBacklight suppressed](v44, "suppressed") || -[KeyboardBacklight saturated](v44, "saturated"))
        v38 = 0;
    }
    else
    {
      -[KeyboardBacklight setSaturated:](v44, "setSaturated:", 1, v11);
    }
    -[KeyboardBacklight levelPercentage](v44, "levelPercentage", v8);
    if (v12 > 0.0
      && -[KeyboardBacklight autoAdjust](v44, "autoAdjust")
      && !-[KeyboardBacklight suspend](v44, "suspend")
      && (v38 & 1) != 0)
    {
      v25 = v44;
      -[KeyboardBacklight previousLevel](v44, "previousLevel");
      -[KeyboardBacklightHIDCurve perceptualBrightnessForLevel:](v25, "perceptualBrightnessForLevel:");
      v37 = v13;
      -[KeyboardBacklight levelPercentage](v44, "levelPercentage");
      v36 = v14;
      v26 = v44;
      -[KeyboardBacklightHIDCurve currentLuxToAmbient](v44, "currentLuxToAmbient");
      -[KeyboardBacklightHIDCurve calculateLevelPercentageAtAmbient:](v26, "calculateLevelPercentageAtAmbient:");
      v27 = v44;
      -[KeyboardBacklightHIDCurve level](v44, "level");
      -[KeyboardBacklightHIDCurve perceptualBrightnessForLevel:](v27, "perceptualBrightnessForLevel:");
      v35 = v15;
      if (v44->super.super._logHandle)
      {
        logHandle = v44->super.super._logHandle;
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
        *(double *)&v21 = v42;
        -[KeyboardBacklight previousLevel](v44, "previousLevel");
        *(double *)&v22 = v16;
        -[KeyboardBacklightHIDCurve level](v44, "level");
        __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v46, v21, COERCE__INT64(v37), COERCE__INT64(v35), COERCE__INT64(fabs((float)(v35 - v37))), v22, COERCE__INT64(v17));
        _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Lux = %f, prevPerceptualLevel = %f, currentPerceptualLevel = %f, diff = %f, prevLevel = %f, level = %f", v46, 0x3Eu);
      }
      if (fabs((float)(v35 - v37)) >= 0.00999999978 || -[KeyboardBacklight saturated](v44, "saturated"))
      {
        -[KeyboardBacklight updateBacklightDeviceWithReason:](v44, "updateBacklightDeviceWithReason:", 3);
      }
      else
      {
        LODWORD(v18) = v36;
        -[KeyboardBacklight setLevelPercentage:](v44, "setLevelPercentage:", v18);
      }
    }
    if (v44->super.super._logHandle)
    {
      v20 = v44->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v19 = init_default_corebrightness_log();
      v20 = v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v44);
      _os_log_debug_impl(&dword_1B5291000, v20, OS_LOG_TYPE_DEBUG, "%@", v45, 0xCu);
    }
  }
}

- (void)calculateLevelPercentageAtAmbient:(float)a3
{
  float v3;
  double v4;
  float v5;
  double v6;
  float v7;
  float v8;
  float v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v12;
  NSObject *log;
  os_log_type_t type;
  NSObject *v15;
  float v16;
  float v17;
  uint8_t v18[7];
  char v19;
  NSObject *v20;
  uint8_t v21[15];
  char v22;
  NSObject *v23;
  float v24;
  SEL v25;
  KeyboardBacklightHIDCurve *v26;

  v26 = self;
  v25 = a2;
  v24 = a3;
  if (a3 < 0.0)
  {
    v23 = 0;
    v15 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v23 = v15;
    v22 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      log = v23;
      type = v22;
      __os_log_helper_16_0_0(v21);
      _os_log_error_impl(&dword_1B5291000, log, type, "ASSERTION FAILED: ambient >= 0.0", v21, 2u);
    }
  }
  if (v24 > 1.0)
  {
    v20 = 0;
    v12 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v20 = v12;
    v19 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v10 = v20;
      v11 = v19;
      __os_log_helper_16_0_0(v18);
      _os_log_error_impl(&dword_1B5291000, v10, v11, "ASSERTION FAILED: ambient <= 1.0", v18, 2u);
    }
  }
  v17 = 0.001;
  -[KeyboardBacklight levelMin](v26, "levelMin");
  if (v3 == 0.0)
    v17 = 0.015;
  if (v24 >= 0.0 && v24 <= 1.0)
  {
    v4 = v24;
    if (v24 == 0.0)
    {
      v9 = v17;
    }
    else
    {
      -[KeyboardBacklight ambientSlope](v26, "ambientSlope", v4);
      v9 = *(float *)&v4 * v24;
    }
    *(float *)&v4 = v9;
    -[KeyboardBacklight setLevelPercentage:](v26, "setLevelPercentage:", v4);
    -[KeyboardBacklight levelPercentage](v26, "levelPercentage");
    v16 = v5;
    -[KeyboardBacklightHIDCurve maxLevelPercentage](v26, "maxLevelPercentage");
    if (v16 >= *(float *)&v6)
      v8 = *(float *)&v6;
    else
      v8 = v16;
    if (v17 >= v8)
      v7 = v17;
    else
      v7 = v8;
    *(float *)&v6 = v7;
    -[KeyboardBacklight setLevelPercentage:](v26, "setLevelPercentage:", v6);
  }
}

- (float)maxCapableNits
{
  return 30.0;
}

- (float)minCapableNits
{
  return 1.875;
}

- (float)perceptualBrightnessForLevel:(float)a3
{
  float v3;
  float v4;
  float v5;
  float v7;
  float v8;
  float v9;

  v9 = 0.0;
  if (a3 > 0.0)
  {
    -[KeyboardBacklightHIDCurve maxCapableNits](self, "maxCapableNits");
    v7 = v3;
    -[KeyboardBacklightHIDCurve minCapableNits](self, "minCapableNits");
    v8 = logf(v7 / v4);
    if (v8 != 0.0)
    {
      -[KeyboardBacklightHIDCurve maxCapableNits](self, "maxCapableNits");
      return (float)(logf(a3 / v5) / v8) + 1.0;
    }
  }
  return v9;
}

- (int)color
{
  return self->_color;
}

- (void)setColor:(int)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 != self->_color)
  {
    if (self->super.super._logHandle)
    {
      logHandle = self->super.super._logHandle;
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
      __os_log_helper_16_0_1_4_0((uint64_t)v7, a3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Set color to %d", v7, 8u);
    }
    self->_color = a3;
    -[KeyboardBacklightHIDCurve reconfigureSettingsForColor:](self, "reconfigureSettingsForColor:", a3);
  }
}

- (void)reconfigureSettingsForColor:(int)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t inited;
  NSObject *logHandle;
  id v11;
  uint8_t v14[16];
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((a3 == 53 || a3 == 70 || a3 == 71) && -[KeyboardBacklight levelUnit](self, "levelUnit") == 16777441)
  {
    v11 = +[CBKeyboardPreferencesManager copyPreferenceForKey:keyboardID:](CBKeyboardPreferencesManager, "copyPreferenceForKey:keyboardID:", CFSTR("KeyboardCurveVersion"), -[KeyboardBacklight keyboardID](self, "keyboardID"));
    if (v11
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (a3 == 53 && (objc_msgSend(v11, "floatValue"), v3 >= 2.03)
       || a3 == 70 && (objc_msgSend(v11, "floatValue"), v4 >= 3.0)
       || a3 == 71 && (objc_msgSend(v11, "floatValue"), v5 >= 2.0)))
    {
      if (self->super.super._logHandle)
      {
        logHandle = self->super.super._logHandle;
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
        objc_msgSend(v11, "floatValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v15, COERCE__INT64(v6));
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Found up to date curve version %f in preferences.", v15, 0xCu);
      }
      -[KeyboardBacklightHIDCurve updateDefaultCurveForColor:](self, "updateDefaultCurveForColor:", a3);
    }
    else
    {
      if (self->super.super._logHandle)
      {
        v8 = self->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v7 = init_default_corebrightness_log();
        v8 = v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v14, a3);
        _os_log_impl(&dword_1B5291000, v8, OS_LOG_TYPE_DEFAULT, "Update curve and version for color %d", v14, 8u);
      }
      -[KeyboardBacklightHIDCurve updateDefaultCurveForColor:](self, "updateDefaultCurveForColor:", a3);
      luxToNitsCurve[0] = defaultLuxToNitsCurve;
      dword_1EF129198 = dword_1EF1291B8;
      dword_1EF1291A0 = dword_1EF1291C0;
      dword_1EF1291A8 = dword_1EF1291C8;
      dword_1EF129194 = dword_1EF1291B4;
      dword_1EF12919C = dword_1EF1291BC;
      dword_1EF1291A4 = dword_1EF1291C4;
      dword_1EF1291AC = dword_1EF1291CC;
      switch(a3)
      {
        case '5':
          self->_curveVersion = 2.03;
          break;
        case 'F':
          self->_curveVersion = 3.0;
          break;
        case 'G':
          self->_curveVersion = 2.0;
          break;
        default:
          self->_curveVersion = 1.0;
          break;
      }
      -[KeyboardBacklightHIDCurve storeKeyboardBacklightCurveToPreferences](self, "storeKeyboardBacklightCurveToPreferences");
      -[KeyboardBacklight currentLux](self, "currentLux");
      -[KeyboardBacklightHIDCurve handleLuxUpdate:](self, "handleLuxUpdate:");
    }

  }
}

- (void)updateDefaultCurveForColor:(int)a3
{
  float v3;
  uint64_t v4;
  NSObject *v5;
  float v6;
  uint64_t v7;
  NSObject *v8;
  float v9;
  uint64_t inited;
  NSObject *logHandle;
  float luxHysteresis;
  int v13;
  void *v14;
  uint8_t v16[32];
  uint8_t v17[32];
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case '5':
      v14 = (void *)-[HIDDevice propertyForKey:](-[KeyboardBacklight device](self, "device"), "propertyForKey:", CFSTR("ProductID"));
      v13 = -1;
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = objc_msgSend(v14, "intValue");
      }
      defaultLuxToNitsCurve = 0;
      dword_1EF1291B8 = 5.0;
      dword_1EF1291C0 = 20.0;
      dword_1EF1291C8 = 21.0;
      dword_1EF1291B4 = 1114636288;
      dword_1EF1291BC = 1124204544;
      dword_1EF1291C4 = 1124204544;
      -[KeyboardBacklight levelMax](self, "levelMax");
      *(float *)&dword_1EF1291CC = 0.01 * v3;
      self->_luxHysteresis = *(float *)&dword_1EF1291C8 * 0.13;
      if (self->_luxHysteresis >= 10.0)
        luxHysteresis = self->_luxHysteresis;
      else
        luxHysteresis = 10.0;
      self->_luxHysteresis = luxHysteresis;
      if (self->super.super._logHandle)
      {
        logHandle = self->super.super._logHandle;
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
        __os_log_helper_16_2_4_8_0_4_0_4_0_8_66((uint64_t)v18, COERCE__INT64(self->_luxHysteresis), -[KeyboardBacklightHIDCurve color](self, "color"), v13, (uint64_t)-[KeyboardBacklightHIDCurve defaultBrightnessCurve](self, "defaultBrightnessCurve"));
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Hysteresis = %f Color = %d PID = %d Default curve = %{public}@", v18, 0x22u);
      }
      break;
    case 'F':
      defaultLuxToNitsCurve = 0;
      dword_1EF1291B8 = 5.0;
      dword_1EF1291C0 = 1097754214;
      dword_1EF1291C8 = 1097848586;
      dword_1EF1291B4 = 3.25;
      dword_1EF1291BC = 7.0;
      dword_1EF1291C4 = 7.0;
      dword_1EF1291CC = 0;
      self->_luxHysteresis = 14.99 * 0.13;
      if (self->_luxHysteresis >= 5.0)
        v9 = self->_luxHysteresis;
      else
        v9 = 5.0;
      self->_luxHysteresis = v9;
      if (self->super.super._logHandle)
      {
        v8 = self->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v7 = init_default_corebrightness_log();
        v8 = v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_0_4_0_8_66((uint64_t)v17, COERCE__INT64(self->_luxHysteresis), -[KeyboardBacklightHIDCurve color](self, "color"), (uint64_t)-[KeyboardBacklightHIDCurve defaultBrightnessCurve](self, "defaultBrightnessCurve"));
        _os_log_impl(&dword_1B5291000, v8, OS_LOG_TYPE_DEFAULT, "Hysteresis = %f Color = %d Default curve = %{public}@", v17, 0x1Cu);
      }
      break;
    case 'G':
      defaultLuxToNitsCurve = 0;
      dword_1EF1291B8 = 1116471296;
      dword_1EF1291C0 = 1126170624;
      dword_1EF1291C8 = 1133903872;
      dword_1EF1291B4 = 3.25;
      dword_1EF1291BC = 9.0;
      dword_1EF1291C4 = 9.0;
      dword_1EF1291CC = 0;
      self->_luxHysteresis = 300.0 * 0.13;
      v6 = self->_luxHysteresis >= 10.0 ? self->_luxHysteresis : 10.0;
      self->_luxHysteresis = v6;
      if (self->super.super._logHandle)
      {
        v5 = self->super.super._logHandle;
      }
      else
      {
        v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v5 = v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_0_4_0_8_66((uint64_t)v16, COERCE__INT64(self->_luxHysteresis), -[KeyboardBacklightHIDCurve color](self, "color"), (uint64_t)-[KeyboardBacklightHIDCurve defaultBrightnessCurve](self, "defaultBrightnessCurve"));
        _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEFAULT, "Hysteresis = %f Color = %d Default curve = %{public}@", v16, 0x1Cu);
      }
      break;
  }
}

- (float)chicletCurveCoefficient
{
  return self->_chicletCurveCoefficient;
}

- (float)chicletCurvePower
{
  return self->_chicletCurvePower;
}

- (float)luxHysteresis
{
  return self->_luxHysteresis;
}

- (void)setLuxHysteresis:(float)a3
{
  self->_luxHysteresis = a3;
}

@end
