@implementation CBCAManager

- (CBCAManager)initWithCADisplay:(id)a3 andQueue:(id)a4
{
  os_log_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v9;
  uint64_t v10;
  void *context;
  os_log_t log;
  os_log_type_t type[4];
  os_log_t inited;
  id v15;
  objc_super v16;
  uint8_t v17[15];
  unsigned __int8 v18;
  NSObject *v19;
  id v20;
  id v21;
  SEL v22;
  CBCAManager *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  if (a3 && (v15 = v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16.receiver = v23;
    v16.super_class = (Class)CBCAManager;
    v23 = -[CBModule initWithQueue:](&v16, sel_initWithQueue_, v20);
    if (v23)
    {
      v23->_digitalDimmingBrightnessScaler = 1.0;
      v9 = 0x1EF0FB000uLL;
      v23->_currentlySetMatrix[0] = 1.0;
      v23->_currentlySetMatrix[1] = 0.0;
      v23->_currentlySetMatrix[2] = 0.0;
      v23->_currentlySetMatrix[3] = 0.0;
      v23->_currentlySetMatrix[4] = 1.0;
      v23->_currentlySetMatrix[5] = 0.0;
      v23->_currentlySetMatrix[6] = 0.0;
      v23->_currentlySetMatrix[7] = 0.0;
      v23->_currentlySetMatrix[8] = 1.0;
      v23->_currentlySetScaler = 1.0;
      context = (void *)MEMORY[0x1B5E4A8B0]();
      v10 = MEMORY[0x1E0CB3940];
      v4 = os_log_create("com.apple.CoreBrightness.CBCAManager", (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v21, "displayId")), "UTF8String"));
      v5 = context;
      v23->super._logHandle = (OS_os_log *)v4;
      objc_autoreleasePoolPop(v5);
      v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v7 = objc_msgSend(v6, "initWithObjects:", v21, 0);
      v23->_displays = (NSMutableArray *)v7;
    }
    return v23;
  }
  else
  {
    v19 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = (os_log_t)_COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = (os_log_t)init_default_corebrightness_log();
    v19 = inited;
    v18 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v19;
      *(_DWORD *)type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_error_impl(&dword_1B5291000, log, type[0], "invalid display", v17, 2u);
    }

    v23 = 0;
    return 0;
  }
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBCAManager *v4;

  v4 = self;
  v3 = a2;

  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBCAManager;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ColorRamp")) & 1) != 0)
  {
    -[CBCAManager colorRampPropertyHandler:](self, "colorRampPropertyHandler:", a4);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightness")) & 1) != 0)
  {
    -[CBCAManager displayBrightnessPropertyHandler:](self, "displayBrightnessPropertyHandler:", a4);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("nitsExceedsPLCThreshold")) & 1) != 0)
  {
    -[CBCAManager nitsThresholdPLCPropertyHandler:](self, "nitsThresholdPLCPropertyHandler:", a4);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("UpdateDigitalDimmingBrightnessScaler")) & 1) != 0)
  {
    -[CBCAManager updateDigitalDimmingBrightnessScaler:](self, "updateDigitalDimmingBrightnessScaler:", a4);
  }
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (void)updateDigitalDimmingBrightnessScaler:(id)a3
{
  float v3;
  NSMutableArray *displays;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, void *);
  void *v9;
  CBCAManager *v10;
  float v11;
  id v12;
  id v13;
  SEL v14;
  CBCAManager *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (id)objc_msgSend(v13, "objectForKey:", CFSTR("Scaler"));
      if (v12)
      {
        objc_msgSend(v12, "floatValue");
        v11 = v3;
        if (v15->_digitalDimmingBrightnessScaler != v3)
        {
          v15->_digitalDimmingBrightnessScaler = v11;
          displays = v15->_displays;
          v5 = MEMORY[0x1E0C809B0];
          v6 = -1073741824;
          v7 = 0;
          v8 = __52__CBCAManager_updateDigitalDimmingBrightnessScaler___block_invoke;
          v9 = &unk_1E68EA068;
          v10 = v15;
          -[NSMutableArray enumerateObjectsUsingBlock:](displays, "enumerateObjectsUsingBlock:", &v5);
        }
      }
    }
  }
}

uint64_t __52__CBCAManager_updateDigitalDimmingBrightnessScaler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t inited;
  NSObject *v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0 && *(_QWORD *)(a1 + 32) != -40)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v7 = inited;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v10, COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 80)));
      _os_log_impl(&dword_1B5291000, v7, OS_LOG_TYPE_INFO, "Updating digital dimming brightness scaler to %f", v10, 0xCu);
    }
    v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD28E0], "serverIfRunning"), "displayWithDisplayId:", objc_msgSend(a2, "displayId"));
    v4 = *(_QWORD *)(a1 + 32);
    *(float *)&v5 = *(float *)(v4 + 76) * *(float *)(v4 + 80);
    return objc_msgSend(v3, "setColorMatrix:scale:rampDuration:", v4 + 40, v5, 0.0);
  }
  return result;
}

- (void)colorRampPropertyHandler:(id)a3
{
  NSMutableArray *displays;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *, uint64_t, uint64_t);
  void *v8;
  id v9;
  CBCAManager *v10;
  id v11;
  SEL v12;
  CBCAManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    displays = v13->_displays;
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __40__CBCAManager_colorRampPropertyHandler___block_invoke;
    v8 = &unk_1E68EA760;
    v9 = v11;
    v10 = v13;
    -[NSMutableArray enumerateObjectsUsingBlock:](displays, "enumerateObjectsUsingBlock:", &v4);
  }
}

void __40__CBCAManager_colorRampPropertyHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  float v5;
  int v6;
  void *v7;
  double v8;
  float v9;
  float v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t inited;
  NSObject *v21;
  uint8_t v23[7];
  os_log_type_t v24;
  os_log_t v25;
  os_log_type_t v26;
  os_log_t v27;
  os_log_type_t v28;
  os_log_t oslog;
  id v30;
  os_log_type_t v31;
  os_log_t v32;
  unsigned int i;
  id v34;
  float v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint8_t v44[16];
  uint8_t v45[32];
  uint8_t v46[36];
  _DWORD v47[9];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v43 = a1;
  v42 = a2;
  v41 = a3;
  v40 = a4;
  v39 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = 0;
    v38 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ColorRampTarget"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = 0;
      v36 = 0;
      v36 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ColorRampPeriod"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v36, "doubleValue");
        v37 = v4;
      }
      v35 = 1.0;
      v34 = 0;
      v34 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ColorScaler"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v34, "floatValue");
        v35 = v5;
      }
      if (objc_msgSend(v38, "count") == 9)
      {
        for (i = 0; i < 9; ++i)
        {
          objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", i), "floatValue");
          v47[i] = v6;
        }
        v32 = 0;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
        {
          v21 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          v21 = inited;
        }
        v32 = v21;
        v31 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_3_4_0_8_64_8_0((uint64_t)v46, objc_msgSend(v42, "displayId"), (uint64_t)v38, v37);
          _os_log_debug_impl(&dword_1B5291000, v32, v31, "pushing matrix to display %u CA: %@ with ramp period %f", v46, 0x1Cu);
        }
        __memcpy_chk();
        *(float *)(*(_QWORD *)(a1 + 40) + 76) = v35;
        v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD28E0], "serverIfRunning"), "displayWithDisplayId:", objc_msgSend(v42, "displayId"));
        *(float *)&v8 = v35 * *(float *)(*(_QWORD *)(a1 + 40) + 80);
        objc_msgSend(v7, "setColorMatrix:scale:rampDuration:", v47, v8, *(double *)&v37);
        v30 = 0;
        v30 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ColorRampWhitePointTarget"));
        if (objc_msgSend(v30, "count") == 2)
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              oslog = 0;
              if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
              {
                v19 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v18 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v18 = init_default_corebrightness_log();
                v19 = v18;
              }
              oslog = v19;
              v28 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                objc_msgSend((id)objc_msgSend(v30, "objectAtIndex:", 0), "floatValue");
                *(double *)&v17 = v9;
                objc_msgSend((id)objc_msgSend(v30, "objectAtIndex:", 1), "floatValue");
                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v45, v17, COERCE__INT64(v10), v37);
                _os_log_impl(&dword_1B5291000, oslog, v28, "pushing white point [%f, %f] with ramp period %f", v45, 0x20u);
              }
            }
          }
        }
      }
      else
      {
        v27 = 0;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
        {
          v16 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v15 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v15 = init_default_corebrightness_log();
          v16 = v15;
        }
        v27 = v16;
        v26 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v44, objc_msgSend(v38, "count"));
          _os_log_error_impl(&dword_1B5291000, v27, v26, "Unexpected number or elements in the matrix (%lu)", v44, 0xCu);
        }
      }
    }
    else
    {
      v25 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
      {
        v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
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
      v24 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v11 = v25;
        v12 = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_error_impl(&dword_1B5291000, v11, v12, "Unexpected color ramp target type", v23, 2u);
      }
    }
  }
}

- (void)displayBrightnessPropertyHandler:(id)a3
{
  NSMutableArray *displays;
  NSObject *log;
  os_log_type_t v5;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[15];
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t);
  void *v15;
  id v16;
  CBCAManager *v17;
  id v18;
  SEL v19;
  CBCAManager *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    displays = v20->_displays;
    v11 = MEMORY[0x1E0C809B0];
    v12 = -1073741824;
    v13 = 0;
    v14 = __48__CBCAManager_displayBrightnessPropertyHandler___block_invoke;
    v15 = &unk_1E68EA760;
    v16 = v18;
    v17 = v20;
    -[NSMutableArray enumerateObjectsUsingBlock:](displays, "enumerateObjectsUsingBlock:", &v11);
  }
  else
  {
    oslog = 0;
    if (v20->super._logHandle)
    {
      logHandle = v20->super._logHandle;
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
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v5 = type;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1B5291000, log, v5, "Unexpected brightness type", v8, 2u);
    }
  }
}

void __48__CBCAManager_displayBrightnessPropertyHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  float v4;
  void *v5;
  double v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t inited;
  NSObject *v16;
  uint8_t v18[15];
  os_log_type_t v19;
  os_log_t oslog;
  os_signpost_id_t v21;
  os_signpost_type_t v22;
  os_log_t v23;
  os_signpost_id_t v24;
  os_signpost_type_t v25;
  os_log_t v26;
  os_log_type_t v27;
  os_log_t v28;
  float v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint8_t v36[32];
  uint8_t v37[32];
  uint8_t v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v35 = a1;
  v34 = a2;
  v33 = a3;
  v32 = a4;
  v31 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = 0;
    v30 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("NitsPhysical"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v30, "floatValue");
      v29 = v4;
      v28 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
      {
        v16 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v16 = inited;
      }
      v28 = v16;
      v27 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_2_4_0_8_0((uint64_t)v38, objc_msgSend(v34, "displayId"), COERCE__INT64(v29));
        _os_log_impl(&dword_1B5291000, v28, v27, "pushing nits to CA: display=%u | nits=%f", v38, 0x12u);
      }
      v26 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
      {
        v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v13 = init_default_corebrightness_log();
        v14 = v13;
      }
      v26 = v14;
      v25 = OS_SIGNPOST_INTERVAL_BEGIN;
      v24 = 0xEEEEB0B5B2B2EEEELL;
      if (os_signpost_enabled(v14))
      {
        __os_log_helper_16_0_2_4_0_8_0((uint64_t)v37, objc_msgSend(v34, "displayId"), COERCE__INT64(v29));
        _os_signpost_emit_with_name_impl(&dword_1B5291000, v26, v25, v24, "SetNits", "display=%u | nits=%f", v37, 0x12u);
      }
      v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD28E0], "serverIfRunning"), "displayWithDisplayId:", objc_msgSend(v34, "displayId"));
      *(float *)&v6 = v29;
      objc_msgSend(v5, "setNits:", v6);
      v23 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
      {
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v11 = init_default_corebrightness_log();
        v12 = v11;
      }
      v23 = v12;
      v22 = OS_SIGNPOST_INTERVAL_END;
      v21 = 0xEEEEB0B5B2B2EEEELL;
      if (os_signpost_enabled(v12))
      {
        __os_log_helper_16_0_2_4_0_8_0((uint64_t)v36, objc_msgSend(v34, "displayId"), COERCE__INT64(v29));
        _os_signpost_emit_with_name_impl(&dword_1B5291000, v23, v22, v21, "SetNits", "display=%u | nits=%f", v36, 0x12u);
      }
      objc_msgSend(*(id *)(a1 + 40), "sendNotificationForKey:andValue:", CFSTR("CBCACommit"), *(_QWORD *)(a1 + 32));
    }
    else
    {
      oslog = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
      {
        v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
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
      v19 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v7 = oslog;
        v8 = v19;
        __os_log_helper_16_0_0(v18);
        _os_log_error_impl(&dword_1B5291000, v7, v8, "Unexpected nits type", v18, 2u);
      }
    }
  }
}

- (void)nitsThresholdPLCPropertyHandler:(id)a3
{
  NSMutableArray *displays;
  NSObject *log;
  os_log_type_t v5;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[15];
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  CBCAManager *v16;
  id v17;
  id v18;
  SEL v19;
  CBCAManager *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    displays = v20->_displays;
    v11 = MEMORY[0x1E0C809B0];
    v12 = -1073741824;
    v13 = 0;
    v14 = __47__CBCAManager_nitsThresholdPLCPropertyHandler___block_invoke;
    v15 = &unk_1E68EA760;
    v16 = v20;
    v17 = v18;
    -[NSMutableArray enumerateObjectsUsingBlock:](displays, "enumerateObjectsUsingBlock:", &v11);
  }
  else
  {
    oslog = 0;
    if (v20->super._logHandle)
    {
      logHandle = v20->super._logHandle;
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
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v5 = type;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1B5291000, log, v5, "Unexpected PLC threshold type", v8, 2u);
    }
  }
}

uint64_t __47__CBCAManager_nitsThresholdPLCPropertyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  const char *v3;
  uint64_t inited;
  NSObject *v5;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v5 = inited;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (((objc_msgSend(*(id *)(a1 + 40), "BOOLValue") ^ 1) & 1) != 0)
        v3 = "ON";
      else
        v3 = "OFF";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_INFO, "pushing update in compositing to CA: %s", v8, 0xCu);
    }
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD28E0], "serverIfRunning"), "displayWithDisplayId:", objc_msgSend(a2, "displayId")), "setAllowsDisplayCompositing:", (objc_msgSend(*(id *)(a1 + 40), "BOOLValue") ^ 1) & 1);
  }
  return result;
}

@end
