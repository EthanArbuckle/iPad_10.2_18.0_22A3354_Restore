@implementation CBEDRModule

- (CBEDRModule)initWithQueue:(id)a3 display:(id)a4 colorModule:(id)a5 andDisplayModule:(id)a6
{
  os_log_t v6;
  os_log_t v7;
  CADisplay *v8;
  CBDisplayModuleHID *v9;
  CBColorModuleiOS *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  float v13;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t inited;
  NSObject *logHandle;
  void *v25;
  NSObject *log;
  os_log_type_t type;
  NSObject *v28;
  void *context;
  uint8_t v30[7];
  os_log_type_t v31;
  NSObject *v32;
  uint8_t v33[7];
  char v34;
  NSObject *v35;
  os_log_type_t v36;
  os_log_t v37;
  id v38;
  CBBrightestALSFilter *v39;
  uint8_t v40[15];
  char v41;
  NSObject *v42;
  objc_super v43;
  id v44;
  id v45;
  id v46;
  id v47;
  SEL v48;
  CBEDRModule *v49;
  uint8_t v51[24];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v49 = self;
  v48 = a2;
  v47 = a3;
  v46 = a4;
  v45 = a5;
  v44 = a6;
  v43.receiver = self;
  v43.super_class = (Class)CBEDRModule;
  v49 = -[CBModule initWithQueue:](&v43, sel_initWithQueue_, a3);
  if (!v49)
    return v49;
  if (v46)
  {
    context = (void *)MEMORY[0x1B5E4A8B0]();
    v6 = os_log_create("com.apple.CoreBrightness.EDR", (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v46, "displayId")), "UTF8String"));
    v49->super._logHandle = (OS_os_log *)v6;
    objc_autoreleasePoolPop(context);
  }
  else
  {
    v7 = os_log_create("com.apple.CoreBrightness.EDR", "default");
    v49->super._logHandle = (OS_os_log *)v7;
  }
  if (!v49->super._logHandle)
  {
    v42 = 0;
    v28 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v42 = v28;
    v41 = 16;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      log = v42;
      type = v41;
      __os_log_helper_16_0_0(v40);
      _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v40, 2u);
    }
  }
  v8 = (CADisplay *)v46;
  v49->_cadisplay = v8;
  v9 = (CBDisplayModuleHID *)v44;
  v49->_displayModule = v9;
  v10 = (CBColorModuleiOS *)v45;
  v49->_colorModule = v10;
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49->_filters = v11;
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49->_alsNodes = v12;
  v39 = objc_alloc_init(CBBrightestALSFilter);
  if (v39)
    -[NSMutableArray addObject:](v49->_filters, "addObject:", v39);

  v25 = (void *)objc_msgSend(MEMORY[0x1E0CD28E0], "serverIfRunning");
  v38 = (id)objc_msgSend(v25, "displayWithDisplayId:", objc_msgSend(v46, "displayId"));
  if (v38)
  {
    objc_msgSend(v38, "maximumLuminance");
    v49->_maxNits = v13;
    v37 = 0;
    if (v49->super._logHandle)
    {
      logHandle = v49->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v37 = logHandle;
    v36 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v51, COERCE__INT64(v49->_maxNits));
      _os_log_impl(&dword_1B5291000, v37, v36, "maximum luminance if %f", v51, 0xCu);
    }
  }
  else
  {
    v49->_maxNits = 1500.0;
    v35 = 0;
    if (v49->super._logHandle)
    {
      v22 = v49->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v21 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v21 = init_default_corebrightness_log();
      v22 = v21;
    }
    v35 = v22;
    v34 = 16;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v19 = v35;
      v20 = v34;
      __os_log_helper_16_0_0(v33);
      _os_log_error_impl(&dword_1B5291000, v19, v20, "failed to retrieve CAWindowServerDisplay, defaulting the maximum luminance", v33, 2u);
    }
  }
  v49->_currentLux = 300.0;
  v49->_Ycomp = 1.0;
  v49->_currentNits = 0.0;
  v49->_prevLux = -1.0;
  v49->_prevNits = -1.0;
  v49->_prevMaxNits = -1.0;
  v49->_prevYcomp = -1.0;
  if (CBEDRServerStartServer())
    return v49;
  v32 = 0;
  if (v49->super._logHandle)
  {
    v18 = v49->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v17 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v17 = init_default_corebrightness_log();
    v18 = v17;
  }
  v32 = v18;
  v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v32;
    v16 = v31;
    __os_log_helper_16_0_0(v30);
    _os_log_impl(&dword_1B5291000, v15, v16, "Lib EDR missing. Not creating CBEDRModule", v30, 2u);
  }

  return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBEDRModule *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBEDRModule;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (id)copyPropertyForKey:(id)a3
{
  return 0;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)handleBrightnessUpdate:(id)a3
{
  float v3;
  float v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v13[7];
  char v14;
  NSObject *v15;
  uint8_t v16[7];
  char v17;
  NSObject *v18;
  id v19;
  id v20;
  SEL v21;
  CBEDRModule *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (id)objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NitsPhysical"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "floatValue");
      v22->_currentNits = v3;
    }
    else
    {
      v18 = 0;
      if (v22->super._logHandle)
      {
        logHandle = v22->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v18 = logHandle;
      v17 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v18;
        type = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_error_impl(&dword_1B5291000, log, type, "Unexpected nits type", v16, 2u);
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      v22->_currentNits = v4;
    }
    else
    {
      v15 = 0;
      if (v22->super._logHandle)
      {
        v8 = v22->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v7 = init_default_corebrightness_log();
        v8 = v7;
      }
      v15 = v8;
      v14 = 16;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v5 = v15;
        v6 = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1B5291000, v5, v6, "Unexpected brightness data type", v13, 2u);
      }
    }
  }
}

- (void)handleTargetWhitepointUpdate:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  void *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("YWP"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      CFXFindBrightnessCompAlpha(self->_maxNits);
      v7 = v3;
      v6 = v3;
      objc_msgSend(v8, "floatValue");
      v5 = (float)(v6 * (float)(1.0 / v4)) + 1.0 - v7;
      self->_Ycomp = v5;
    }
  }
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  if ((objc_msgSend(a3, "isEqual:", CFSTR("DisplayBrightness")) & 1) != 0)
  {
    -[CBEDRModule handleBrightnessUpdate:](self, "handleBrightnessUpdate:", a4);
    -[CBEDRModule updateEDRState](self, "updateEDRState");
  }
  else if ((objc_msgSend(a3, "isEqual:", CFSTR("CBTargetWhitePoint")) & 1) != 0)
  {
    -[CBEDRModule handleTargetWhitepointUpdate:](self, "handleTargetWhitepointUpdate:", a4);
    -[CBEDRModule updateEDRState](self, "updateEDRState");
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (void)start
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  id v7;
  uint8_t v8[7];
  os_log_type_t v9;
  NSObject *v10;
  SEL v11;
  CBEDRModule *v12;

  v12 = self;
  v11 = a2;
  v10 = 0;
  if (self->super._logHandle)
  {
    logHandle = v12->super._logHandle;
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
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v8, 2u);
  }
  CBEDRServerAddDisplay(-[CADisplay displayId](v12->_cadisplay, "displayId"));
  v7 = -[CBColorModuleiOS copyPropertyForKey:](v12->_colorModule, "copyPropertyForKey:", CFSTR("CBTargetWhitePoint"));
  if (v7)
    -[CBEDRModule handleTargetWhitepointUpdate:](v12, "handleTargetWhitepointUpdate:", v7);

  v6 = (id)-[CBDisplayModuleHID copyPropertyForKey:](v12->_displayModule, "copyPropertyForKey:", CFSTR("DisplayBrightness"));
  if (v6)
    -[CBEDRModule handleBrightnessUpdate:](v12, "handleBrightnessUpdate:", v6);

  -[CBEDRModule updateEDRState](v12, "updateEDRState");
}

- (void)stop
{
  CBEDRServerRemoveDisplay(-[CADisplay displayId](self->_cadisplay, "displayId", a2, self));
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  CFTypeRef RegistryID;
  uint64_t v5;
  NSObject *v6;
  uint64_t inited;
  NSObject *logHandle;
  CFTypeRef cf;
  CBALSNode *v10;
  uint8_t v13[16];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
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
    RegistryID = IOHIDServiceClientGetRegistryID(a3);
    __os_log_helper_16_2_1_8_66((uint64_t)v14, (uint64_t)RegistryID);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "new service ID = %{public}@", v14, 0xCu);
  }
  if (IOHIDServiceClientConformsTo(a3, 0x20u, 0x41u))
  {
    v10 = -[CBALSNode initWithALSServiceClient:]([CBALSNode alloc], "initWithALSServiceClient:", a3);
    if (v10)
    {
      -[NSMutableArray addObject:](self->_alsNodes, "addObject:", v10);
      cf = (CFTypeRef)IOHIDServiceClientCopyEvent();
      if (cf)
      {
        -[CBEDRModule handleHIDEventInternal:from:](self, "handleHIDEventInternal:from:", cf, a3);
        CFRelease(cf);
      }
      else
      {
        if (self->super._logHandle)
        {
          v6 = self->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v5 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v5 = init_default_corebrightness_log();
          v6 = v5;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v13, (uint64_t)a3);
          _os_log_error_impl(&dword_1B5291000, v6, OS_LOG_TYPE_ERROR, "failed to copy event for ALS (%p)", v13, 0xCu);
        }
      }

    }
  }
  return 1;
}

- (void)handleALSEvent:(id)a3
{
  double v3;

  objc_msgSend(a3, "illuminance");
  *(float *)&v3 = v3;
  self->_currentLux = *(float *)&v3;
  -[CBEDRModule updateEDRState](self, "updateEDRState");
}

- (void)handleHIDEventInternal:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSMutableArray *obj;
  uint64_t v10;
  id v11;
  _QWORD __b[8];
  id v13;
  id v14;
  __IOHIDServiceClient *v15;
  __IOHIDEvent *v16;
  SEL v17;
  CBEDRModule *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = +[CBHIDEvent newEvent:andService:](CBHIDEvent, "newEvent:andService:", a3, a4);
  if (v14)
  {
    memset(__b, 0, sizeof(__b));
    obj = v18->_filters;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
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
        v13 = 0;
        v13 = *(id *)(__b[1] + 8 * v7);
        v11 = (id)objc_msgSend(v13, "filterEvent:", v14);
        if (!v11)
          break;
        v4 = v11;

        v14 = v11;
        ++v7;
        if (v5 + 1 >= v8)
        {
          v7 = 0;
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
          if (!v8)
            break;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CBEDRModule handleALSEvent:](v18, "handleALSEvent:", v14);
  }

}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  NSMutableArray *alsNodes;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  CBEDRModule *v11;
  __IOHIDServiceClient *v12;
  __IOHIDEvent *v13;
  __IOHIDServiceClient *v14;
  __IOHIDEvent *v15;
  SEL v16;
  CBEDRModule *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  alsNodes = self->_alsNodes;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __35__CBEDRModule_handleHIDEvent_from___block_invoke;
  v10 = &unk_1E68EAB50;
  v12 = a4;
  v11 = v17;
  v13 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](alsNodes, "enumerateObjectsUsingBlock:", &v6);
  return 0;
}

uint64_t __35__CBEDRModule_handleHIDEvent_from___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToHIDServiceClient:", *(_QWORD *)(a1 + 40));
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "handleHIDEventInternal:from:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSMutableArray *alsNodes;
  NSMutableArray *filters;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  uint64_t *v17;
  __IOHIDServiceClient *v18;
  uint64_t v19;
  uint64_t *v20;
  int v21;
  int v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  __IOHIDServiceClient *v26;
  SEL v27;
  CBEDRModule *v28;

  v28 = self;
  v27 = a2;
  v26 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 1375731712;
  v22 = 48;
  v23 = __Block_byref_object_copy__13;
  v24 = __Block_byref_object_dispose__13;
  v25 = 0;
  alsNodes = self->_alsNodes;
  v12 = MEMORY[0x1E0C809B0];
  v13 = -1073741824;
  v14 = 0;
  v15 = __38__CBEDRModule_removeHIDServiceClient___block_invoke;
  v16 = &unk_1E68EAB78;
  v18 = a3;
  v17 = &v19;
  -[NSMutableArray enumerateObjectsUsingBlock:](alsNodes, "enumerateObjectsUsingBlock:", &v12);
  if (v20[5])
  {
    filters = v28->_filters;
    v6 = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __38__CBEDRModule_removeHIDServiceClient___block_invoke_2;
    v10 = &unk_1E68EABA0;
    v11 = &v19;
    -[NSMutableArray enumerateObjectsUsingBlock:](filters, "enumerateObjectsUsingBlock:", &v6);
    -[NSMutableArray removeObject:](v28->_alsNodes, "removeObject:", v20[5]);
  }
  _Block_object_dispose(&v19, 8);
  return 1;
}

uint64_t __38__CBEDRModule_removeHIDServiceClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToHIDServiceClient:", *(_QWORD *)(a1 + 40));
  if ((result & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

uint64_t __38__CBEDRModule_removeHIDServiceClient___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forgetDataForService:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "alsService"));
}

- (void)updateEDRState
{
  uint64_t v2;
  NSObject *v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[48];
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_currentLux == self->_prevLux
    && self->_currentNits == self->_prevNits
    && self->_maxNits == self->_prevMaxNits
    && self->_Ycomp == self->_prevYcomp)
  {
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
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
      __os_log_helper_16_0_1_4_0((uint64_t)v8, -[CADisplay displayId](self->_cadisplay, "displayId"));
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "No update in properties -> skip update of EDR state for display = %d", v8, 8u);
    }
  }
  else
  {
    self->_prevLux = self->_currentLux;
    self->_prevNits = self->_currentNits;
    self->_prevMaxNits = self->_maxNits;
    self->_prevYcomp = self->_Ycomp;
    if (self->super._logHandle)
    {
      v3 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v2 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v2 = init_default_corebrightness_log();
      v3 = v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_5_4_0_8_0_8_0_8_0_8_0((uint64_t)v7, -[CADisplay displayId](self->_cadisplay, "displayId"), COERCE__INT64(self->_currentNits), COERCE__INT64(self->_maxNits), COERCE__INT64(self->_currentLux), COERCE__INT64(self->_Ycomp));
      _os_log_debug_impl(&dword_1B5291000, v3, OS_LOG_TYPE_DEBUG, "Update EDR state for display = %d ; currentNits = %f ; maxNits = %f ; currentLux = %f ; Ycomp = %f",
        v7,
        0x30u);
    }
    CBEDRServerDisplayBrightness(-[CADisplay displayId](self->_cadisplay, "displayId"), self->_currentNits, self->_maxNits, self->_currentLux, self->_Ycomp);
  }
}

@end
