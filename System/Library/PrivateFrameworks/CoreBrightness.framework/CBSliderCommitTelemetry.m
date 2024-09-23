@implementation CBSliderCommitTelemetry

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  NSObject *v4;
  NSObject *loggingQueue;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  CBSliderCommitTelemetry *v13;
  os_log_type_t type;
  os_log_t oslog;
  double v16;
  double Current;
  uint64_t block;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  CBSliderCommitTelemetry *v23;
  id v24;
  id v25;
  SEL v26;
  CBSliderCommitTelemetry *v27;
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayOn")) & 1) != 0)
  {
    if ((objc_msgSend(v24, "BOOLValue") & 1) != 0)
    {
      if (v27->_displayOffTimestamp > 0.0)
      {
        Current = CFAbsoluteTimeGetCurrent();
        v16 = 0.0;
        v16 = Current - v27->_displayOffTimestamp;
        if (v16 > v27->_longestInactivityLength)
        {
          v27->_longestInactivityLength = v16;
          v27->_inactivityStartTimestamp = v27->_displayOffTimestamp;
          oslog = 0;
          if (v27->super._logHandle)
          {
            logHandle = v27->super._logHandle;
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
            __os_log_helper_16_0_2_8_0_8_0((uint64_t)v28, *(_QWORD *)&v27->_longestInactivityLength, *(_QWORD *)&v27->_inactivityStartTimestamp);
            _os_log_impl(&dword_1B5291000, oslog, type, "Display turns on: Longest inactivity length is %f seconds with start timestamp = %f", v28, 0x16u);
          }
        }
      }
      loggingQueue = v27->_loggingQueue;
      v8 = MEMORY[0x1E0C809B0];
      v9 = -1073741824;
      v10 = 0;
      v11 = __65__CBSliderCommitTelemetry_handleNotificationForKey_withProperty___block_invoke_32;
      v12 = &unk_1E68E9E60;
      v13 = v27;
      dispatch_async(loggingQueue, &v8);
    }
    else
    {
      v27->_displayOffTimestamp = CFAbsoluteTimeGetCurrent();
      v4 = v27->_loggingQueue;
      block = MEMORY[0x1E0C809B0];
      v19 = -1073741824;
      v20 = 0;
      v21 = __65__CBSliderCommitTelemetry_handleNotificationForKey_withProperty___block_invoke;
      v22 = &unk_1E68E9E60;
      v23 = v27;
      dispatch_async(v4, &block);
    }
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  int v4;
  int v5;
  double v6;
  double v7;
  NSObject *loggingQueue;
  uint64_t v9;
  NSObject *v10;
  BOOL v12;
  uint64_t Current;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  CBSliderCommitTelemetry *v20;
  _QWORD *v21;
  _QWORD v22[2];
  int v23;
  int v24;
  uint64_t v25;
  uint64_t block;
  int v27;
  int v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  CBSliderCommitTelemetry *v31;
  BOOL autobrightnessEnabled;
  BOOL v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  SEL v39;
  CBSliderCommitTelemetry *v40;
  char v41;

  v40 = self;
  v39 = a2;
  v38 = a3;
  v37 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v37, "isEqualToString:", CFSTR("CBFinalBrightnessCommitDelay")) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40->_delayedAPCEDelay = objc_msgSend(v38, "longLongValue");
        v41 = 1;
      }
      else
      {
        v41 = 0;
      }
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("DisplayBrightness")) & 1) != 0)
    {
      if (v40->_initialFactorUpdateArrived && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v36 = (id)objc_msgSend(v38, "objectForKey:", CFSTR("Commit"));
        v35 = (id)objc_msgSend(v38, "objectForKey:", CFSTR("Brightness"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v36, "BOOLValue") & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            Current = (uint64_t)CFAbsoluteTimeGetCurrent();
            objc_msgSend(v35, "floatValue");
            v14 = v4;
            -[CBSliderCommitTelemetry getAPCE](v40, "getAPCE");
            LODWORD(v6) = v5;
            LODWORD(v7) = v14;
            LODWORD(v34) = v40->_state;
            -[CBSliderCommitTelemetry logAfterUserBrightnessCommitWithTimestamp:slider:apce:andTrackedState:](v40, "logAfterUserBrightnessCommitWithTimestamp:slider:apce:andTrackedState:", Current, v34, v7, v6);
          }
        }
        v41 = 1;
      }
      else
      {
        v41 = 0;
      }
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("DisplayBrightnessAuto")) & 1) != 0)
    {
      v33 = objc_msgSend(v38, "BOOLValue") & 1;
      autobrightnessEnabled = 0;
      autobrightnessEnabled = v40->_state.autobrightnessEnabled;
      v40->_state.autobrightnessEnabled = v33;
      if (v40->_initialFactorUpdateArrived && v33 && autobrightnessEnabled != v33)
      {
        loggingQueue = v40->_loggingQueue;
        block = MEMORY[0x1E0C809B0];
        v27 = -1073741824;
        v28 = 0;
        v29 = __46__CBSliderCommitTelemetry_setProperty_forKey___block_invoke;
        v30 = &unk_1E68E9E60;
        v31 = v40;
        dispatch_async(loggingQueue, &block);
      }
      v41 = 1;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("EcoMode")) & 1) != 0)
    {
      v40->_state.ecoModeEnabled = objc_msgSend(v38, "BOOLValue") & 1;
      v41 = 1;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("CBUIUserStyle")) & 1) != 0)
    {
      v40->_state.darkThemeApplied = objc_msgSend(v38, "integerValue") == 2;
      v41 = 1;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("CBUIOrientation")) & 1) != 0)
    {
      v12 = 1;
      if (objc_msgSend(v38, "integerValue") != 4)
        v12 = objc_msgSend(v38, "integerValue") == 3;
      v40->_state.landscapeOrientation = v12;
      v41 = 1;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ALSUserPreference")) & 1) != 0)
    {
      v22[0] = 0;
      v22[1] = v22;
      v23 = 0x20000000;
      v24 = 32;
      v25 = 0;
      -[CBSliderCommitTelemetry timestampFromCurveDistionary:](v40, "timestampFromCurveDistionary:", v38);
      v25 = v9;
      v10 = v40->_loggingQueue;
      v15 = MEMORY[0x1E0C809B0];
      v16 = -1073741824;
      v17 = 0;
      v18 = __46__CBSliderCommitTelemetry_setProperty_forKey___block_invoke_2;
      v19 = &unk_1E68EABC8;
      v20 = v40;
      v21 = v22;
      dispatch_async(v10, &v15);
      v41 = 1;
      _Block_object_dispose(v22, 8);
    }
    else if (((objc_msgSend(v37, "isEqualToString:", CFSTR("DisplayBrightnessFactorWithFade")) & 1) != 0
            || (objc_msgSend(v37, "isEqualToString:", CFSTR("DisplayBrightnessFactorWithFade")) & 1) != 0)
           && v38)
    {
      v40->_initialFactorUpdateArrived = 1;
      v41 = 1;
    }
    else
    {
      v41 = 0;
    }
  }
  else
  {
    v41 = 0;
  }
  return v41 & 1;
}

- (id)copyPropertyForKey:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBFinalBrightnessCommitDelay")) & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", self->_delayedAPCEDelay);
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBSupportsFinalCommit")) & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
  return 0;
}

- (CBSliderCommitTelemetry)initWithQueue:(id)a3 andDisplayContainer:(id)a4
{
  os_log_t v4;
  os_log_t v5;
  dispatch_queue_t v6;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  NSObject *v12;
  int MainDisplay;
  unint64_t i;
  uint8_t v15[15];
  char v16;
  NSObject *v17;
  objc_super v18;
  CBDisplayContaineriOS *v19;
  id v20;
  SEL v21;
  CBSliderCommitTelemetry *v22;
  uint8_t v24[8];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = self;
  v21 = a2;
  v20 = a3;
  v19 = (CBDisplayContaineriOS *)a4;
  v18.receiver = self;
  v18.super_class = (Class)CBSliderCommitTelemetry;
  v22 = -[CBModule initWithQueue:](&v18, sel_initWithQueue_, a3);
  if (!v22)
    return v22;
  v4 = os_log_create("com.apple.CoreBrightness.SliderCommitTelemetry", "default");
  v22->super._logHandle = (OS_os_log *)v4;
  v5 = os_log_create("com.apple.CoreBrightness.SliderCommitTelemetry", "LiveOn");
  v22->_bufferLogHandle = (OS_os_log *)v5;
  if (!v22->super._logHandle || !v22->_bufferLogHandle)
  {
    v17 = 0;
    v12 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v17 = v12;
    v16 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      log = v17;
      type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create log handle", v15, 2u);
    }
  }
  v6 = dispatch_queue_create("com.apple.CoreBrightness.SliderCommitTelemetry", 0);
  v22->_loggingQueue = (OS_dispatch_queue *)v6;
  v22->_delayedAPCETimer = 0;
  v22->_displayContainer = v19;
  v22->_bufferIndex = 0;
  v22->_bufferEntriesFilled = 0;
  v22->_displayOffTimestamp = 0.0;
  v22->_longestInactivityLength = 0.0;
  v22->_initialFactorUpdateArrived = 0;
  v22->_delayedAPCEDelay = 5;
  for (i = 0;
        i < 0x64;
        *(_QWORD *)(std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100]((uint64_t)&v22->_entryBuffer, i++) + 8) = -1)
  {
    *(_QWORD *)std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100]((uint64_t)&v22->_entryBuffer, i) = -1;
  }
  MainDisplay = IOMobileFramebufferGetMainDisplay();
  if (!MainDisplay)
    return v22;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v24, MainDisplay);
    _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "SliderCommitTelemetry Initialization | Unable to obtain IOMFB display object | ErrorCode=0x%x", v24, 8u);
  }

  return 0;
}

- (void)start
{
  -[CBSliderCommitTelemetry sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("CBSupportsFinalCommit"), MEMORY[0x1E0C9AAB0], a2, self);
}

uint64_t __46__CBSliderCommitTelemetry_setProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t v3;
  _BYTE v4[40];
  _BYTE v5[40];
  uint64_t v6;
  uint64_t v7;

  v7 = a1;
  v6 = a1;
  objc_msgSend(*(id *)(a1 + 32), "getUserAABParams:alternativeAABParams:");
  v3 = objc_msgSend(*(id *)(a1 + 32), "getNextEntryAndAdvanceBufferIndex");
  objc_msgSend(*(id *)(a1 + 32), "fillEntry:withTimestamp:andAABParams:andAlternativeAABParams:", v3, (uint64_t)CFAbsoluteTimeGetCurrent(), v5, v4);
  return objc_msgSend(*(id *)(a1 + 32), "reportCommit:", v3);
}

void __46__CBSliderCommitTelemetry_setProperty_forKey___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copyPropertyForKey:", CFSTR("DisplayBrightnessFactor"));
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 23408) & 1) != 0)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v7, "BOOLValue") & 1) == 0
        && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 23264))
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
        {
          v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          v4 = inited;
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
          _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEFAULT, "Set ALSUserPreference: AAB reset after in-app adjustment (restore time = %f)", v8, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 32), "getUserAABParams:alternativeAABParams:", *(_QWORD *)(a1 + 32) + 23280, *(_QWORD *)(a1 + 32) + 23320, 0x1EF0FB000uLL, 0x1EF0FB000uLL);
        v6 = objc_msgSend(*(id *)(a1 + 32), "getNextEntryAndAdvanceBufferIndex");
        objc_msgSend(*(id *)(a1 + 32), "fillEntry:withTimestamp:andRestoreTimeTarget:andAABParams:andAlternativeAABParams:", v6, (uint64_t)CFAbsoluteTimeGetCurrent(), (uint64_t)*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(_QWORD *)(a1 + 32) + *(int *)(v1 + 3876), *(_QWORD *)(a1 + 32) + *(int *)(v2 + 3880));
        objc_msgSend(*(id *)(a1 + 32), "reportCommit:", v6);
      }
    }
  }

}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBSliderCommitTelemetry copyPropertyForKey:](self, "copyPropertyForKey:", a3, a4, a3, a2, self);
}

void __65__CBSliderCommitTelemetry_handleNotificationForKey_withProperty___block_invoke(uint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v8;
  uint8_t v10[15];
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t v14[7];
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = a1;
  v17 = a1;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 23376))
    goto LABEL_21;
  v16 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v8 = inited;
  }
  v16 = v8;
  v15 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    log = v16;
    type = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_impl(&dword_1B5291000, log, type, "Canceling delayed APCE timer due to display off", v14, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "cancelDelayedAPCETimer");
  v13 = 0;
  v13 = objc_msgSend(*(id *)(a1 + 32), "getLastFilledEntry");
  if (v13)
  {
    *(_DWORD *)(v13 + 48) = 2;
    objc_msgSend(*(id *)(a1 + 32), "reportCommit:", v13);
LABEL_21:
    objc_msgSend(*(id *)(a1 + 32), "getUserAABParams:alternativeAABParams:", *(_QWORD *)(a1 + 32) + 23280, *(_QWORD *)(a1 + 32) + 23320);
    return;
  }
  v12 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v3 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v3 = init_default_corebrightness_log();
    v4 = v3;
  }
  v12 = v4;
  v11 = 16;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v1 = v12;
    v2 = v11;
    __os_log_helper_16_0_0(v10);
    _os_log_error_impl(&dword_1B5291000, v1, v2, "Last entry == nil when canceling delayed APCE timer due to display off", v10, 2u);
  }
}

uint64_t __65__CBSliderCommitTelemetry_handleNotificationForKey_withProperty___block_invoke_32(uint64_t a1)
{
  uint64_t result;
  NSObject *log;
  os_log_type_t v3;
  uint64_t inited;
  NSObject *v5;
  uint64_t v7;
  uint8_t v8[7];
  os_log_type_t type;
  os_log_t oslog;
  CBAABParams v11;
  CBAABParams v12;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v13 = a1;
  result = objc_msgSend(*(id *)(a1 + 32), "getUserAABParams:alternativeAABParams:", &v12, &v11);
  if ((result & 1) != 0)
  {
    if (aabParamsDiffer(&v12, (const CBAABParams *)(*(_QWORD *)(a1 + 32) + 23280))
      || (result = aabParamsDiffer(&v11, (const CBAABParams *)(*(_QWORD *)(a1 + 32) + 23320)), (result & 1) != 0))
    {
      oslog = 0;
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
      oslog = v5;
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        v3 = type;
        __os_log_helper_16_0_0(v8);
        _os_log_impl(&dword_1B5291000, log, v3, "Different AAB params on unlock detected", v8, 2u);
      }
      v7 = objc_msgSend(*(id *)(a1 + 32), "getNextEntryAndAdvanceBufferIndex");
      objc_msgSend(*(id *)(a1 + 32), "fillEntry:withTimestamp:andAABParams:andAlternativeAABParams:", v7, (uint64_t)CFAbsoluteTimeGetCurrent(), &v12, &v11);
      return objc_msgSend(*(id *)(a1 + 32), "reportCommit:", v7);
    }
  }
  return result;
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  NSObject *loggingQueue;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  CBSliderCommitTelemetry *v12;
  id v13;
  float v14;
  unint64_t v15;
  SEL v16;
  CBSliderCommitTelemetry *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = a5;
  if (a3 == 2)
  {
    loggingQueue = v17->_loggingQueue;
    v7 = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __71__CBSliderCommitTelemetry_handleAODStateUpdate_transitionTime_context___block_invoke;
    v11 = &unk_1E68E9E60;
    v12 = v17;
    dispatch_async(loggingQueue, &v7);
  }
  return 1;
}

void __71__CBSliderCommitTelemetry_handleAODStateUpdate_transitionTime_context___block_invoke(uint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v8;
  uint8_t v10[15];
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t v14[7];
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = a1;
  v17 = a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 23376))
  {
    v16 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v8 = inited;
    }
    v16 = v8;
    v15 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      log = v16;
      type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_impl(&dword_1B5291000, log, type, "Canceling delayed APCE timer due to transitioning to AOD", v14, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "cancelDelayedAPCETimer");
    v13 = 0;
    v13 = objc_msgSend(*(id *)(a1 + 32), "getLastFilledEntry");
    if (v13)
    {
      *(_DWORD *)(v13 + 48) = 3;
      objc_msgSend(*(id *)(a1 + 32), "reportCommit:", v13);
    }
    else
    {
      v12 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
      {
        v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v3 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v3 = init_default_corebrightness_log();
        v4 = v3;
      }
      v12 = v4;
      v11 = 16;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v1 = v12;
        v2 = v11;
        __os_log_helper_16_0_0(v10);
        _os_log_error_impl(&dword_1B5291000, v1, v2, "Last entry == nil when canceling delayed APCE timer due to transitioning to AOD", v10, 2u);
      }
    }
  }
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

+ (id)sliderInfoToNSDictionary:(const CBSliderCommitInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD v36[50];
  _QWORD v37[51];

  v37[50] = *MEMORY[0x1E0C80C00];
  v36[0] = CFSTR("timestamp");
  v37[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->timestamp);
  v36[1] = CFSTR("localTimestamp");
  v37[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->localTimestamp);
  v36[2] = CFSTR("trustedLux");
  v37[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->trustedLux);
  v36[3] = CFSTR("frontLux");
  *(float *)&v3 = a3->frontLux;
  v37[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v36[4] = CFSTR("rearLux");
  *(float *)&v4 = a3->rearLux;
  v37[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v36[5] = CFSTR("rearLuxInUse");
  v37[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->rearLuxInUse);
  v36[6] = CFSTR("nits");
  *(float *)&v5 = a3->nits;
  v37[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v36[7] = CFSTR("slider");
  *(float *)&v6 = a3->slider;
  v37[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v36[8] = CFSTR("apce");
  *(float *)&v7 = a3->apce;
  v37[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v36[9] = CFSTR("delayedAPCE");
  *(float *)&v8 = a3->delayedAPCE;
  v37[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v36[10] = CFSTR("delayedAPCEStatus");
  v37[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->delayedAPCEStatus);
  v36[11] = CFSTR("autobrightnessEnabled");
  v37[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->autobrightnessEnabled);
  v36[12] = CFSTR("ecoModeEnabled");
  v37[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->ecoModeEnabled);
  v36[13] = CFSTR("ecoModeFactor");
  *(float *)&v9 = a3->ecoModeFactor;
  v37[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v36[14] = CFSTR("e0a");
  *(float *)&v10 = a3->aabParams.e0a;
  v37[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v36[15] = CFSTR("e0b");
  *(float *)&v11 = a3->aabParams.e0b;
  v37[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v36[16] = CFSTR("e1");
  *(float *)&v12 = a3->aabParams.e1;
  v37[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v36[17] = CFSTR("e2");
  *(float *)&v13 = a3->aabParams.e2;
  v37[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v36[18] = CFSTR("l0a");
  *(float *)&v14 = a3->aabParams.l0a;
  v37[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v36[19] = CFSTR("l0b");
  *(float *)&v15 = a3->aabParams.l0b;
  v37[19] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v36[20] = CFSTR("l1");
  *(float *)&v16 = a3->aabParams.l1;
  v37[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v36[21] = CFSTR("l2");
  *(float *)&v17 = a3->aabParams.l2;
  v37[21] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v36[22] = CFSTR("thirdSlope");
  *(float *)&v18 = a3->aabParams.thirdSlope;
  v37[22] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v36[23] = CFSTR("curveType");
  v37[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->aabParams.curveType);
  v36[24] = CFSTR("alternativeE0a");
  *(float *)&v19 = a3->aabAlternativeParams.e0a;
  v37[24] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v36[25] = CFSTR("alternativeE0b");
  *(float *)&v20 = a3->aabAlternativeParams.e0b;
  v37[25] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v36[26] = CFSTR("alternativeE1");
  *(float *)&v21 = a3->aabAlternativeParams.e1;
  v37[26] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v36[27] = CFSTR("alternativeE2");
  *(float *)&v22 = a3->aabAlternativeParams.e2;
  v37[27] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v36[28] = CFSTR("alternativeL0a");
  *(float *)&v23 = a3->aabAlternativeParams.l0a;
  v37[28] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v36[29] = CFSTR("alternativeL0b");
  *(float *)&v24 = a3->aabAlternativeParams.l0b;
  v37[29] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v36[30] = CFSTR("alternativeL1");
  *(float *)&v25 = a3->aabAlternativeParams.l1;
  v37[30] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v36[31] = CFSTR("alternativeL2");
  *(float *)&v26 = a3->aabAlternativeParams.l2;
  v37[31] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v36[32] = CFSTR("alternativeThirdSlope");
  *(float *)&v27 = a3->aabAlternativeParams.thirdSlope;
  v37[32] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v36[33] = CFSTR("alternativeCurveType");
  v37[33] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->aabAlternativeParams.curveType);
  v36[34] = CFSTR("aabParamsUpdateOnly");
  v37[34] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->aabParamsUpdateOnly);
  v36[35] = CFSTR("aabParamsUpdateReason");
  v37[35] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->aabParamsUpdateReason);
  v36[36] = CFSTR("nitsDelta");
  *(float *)&v28 = a3->nitsDelta;
  v37[36] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v36[37] = CFSTR("nitsDeltaAlternative");
  *(float *)&v29 = a3->nitsDeltaAlternative;
  v37[37] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v36[38] = CFSTR("restoreTimeTarget");
  v37[38] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->restoreTimeTarget);
  v36[39] = CFSTR("inactiveLength");
  *(float *)&v30 = a3->inactiveLength;
  v37[39] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  v36[40] = CFSTR("inactiveStart");
  v37[40] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->inactiveStart);
  v36[41] = CFSTR("cpmsMitigationLimitingBrightness");
  v37[41] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->cpmsMitigationLimitingBrightness);
  v36[42] = CFSTR("touchMitigationTriggered");
  v37[42] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->touchMitigationTriggered);
  v36[43] = CFSTR("proxMitigationTriggered");
  v37[43] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->proxMitigationTriggered);
  v36[44] = CFSTR("auroraFactor");
  *(float *)&v31 = a3->auroraFactor;
  v37[44] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
  v36[45] = CFSTR("edrHeadroom");
  *(float *)&v32 = a3->edrHeadroom;
  v37[45] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v36[46] = CFSTR("colorAdaptationStrength");
  *(float *)&v33 = a3->colorAdaptationStrength;
  v37[46] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
  v36[47] = CFSTR("colorAdaptationMode");
  v37[47] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->colorAdaptationMode);
  v36[48] = CFSTR("darkThemeApplied");
  v37[48] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->darkThemeApplied);
  v36[49] = CFSTR("landscapeOrientation");
  v37[49] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->landscapeOrientation);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 50);
}

- (float)getAPCE
{
  IOMobileFramebufferGetBlock();
  return 0.0;
}

- (BOOL)getUserAABParams:(CBAABParams *)a3
{
  return -[CBSliderCommitTelemetry getUserAABParams:key:](self, "getUserAABParams:key:", a3, CFSTR("ALSCurveInfo"));
}

- (BOOL)getUserAABParams:(CBAABParams *)a3 alternativeAABParams:(CBAABParams *)a4
{
  BOOL v5;

  v5 = -[CBSliderCommitTelemetry getUserAABParams:key:](self, "getUserAABParams:key:", a3, CFSTR("ALSCurveInfo"));
  return (v5 | -[CBSliderCommitTelemetry getUserAABParams:key:](self, "getUserAABParams:key:", a4, CFSTR("ALSAlternativeCurveInfo"))) != 0;
}

- (BOOL)getUserAABParams:(CBAABParams *)a3 key:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  int v19;
  uint8_t v20[7];
  char v21;
  NSObject *v22;
  id v23;
  id v24;
  CBAABParams *v25;
  SEL v26;
  CBSliderCommitTelemetry *v27;
  char v28;

  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v23 = 0;
  v23 = -[CBDisplayContaineriOS copyPropertyForKey:](v27->_displayContainer, "copyPropertyForKey:", v24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("E0a")), "floatValue");
    v25->e0a = v4;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("E0b")), "floatValue");
    v25->e0b = v5;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("E1")), "floatValue");
    v25->e1 = v6;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("E2")), "floatValue");
    v25->e2 = v7;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("L0a")), "floatValue");
    v25->l0a = v8;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("L0b")), "floatValue");
    v25->l0b = v9;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("L1")), "floatValue");
    v25->l1 = v10;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("L2")), "floatValue");
    v25->l2 = v11;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectForKey:"), "objectForKey:", CFSTR("thirdSlope")), "floatValue");
    v25->thirdSlope = v12;
    v25->curveType = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("Prefs")), "objectForKey:", CFSTR("curveType")), "intValue");
    v19 = 0;
  }
  else
  {
    v22 = 0;
    if (v27->super._logHandle)
    {
      logHandle = v27->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v22 = logHandle;
    v21 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v22;
      type = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_error_impl(&dword_1B5291000, log, type, "Failed to obtain ALS Curve info", v20, 2u);
    }
    v28 = 0;
    v19 = 1;
  }
  objc_autoreleasePoolPop(context);
  if (!v19)
    v28 = 1;
  return v28 & 1;
}

- (CBSliderCommitInfo)getNextEntryAndAdvanceBufferIndex
{
  unint64_t *v2;
  uint64_t v4;
  CBSliderCommitInfo *v5;
  SEL v6;
  CBSliderCommitTelemetry *v7;

  v7 = self;
  v6 = a2;
  v5 = 0;
  v5 = (CBSliderCommitInfo *)std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100]((uint64_t)&self->_entryBuffer, self->_bufferIndex);
  v7->_bufferIndex = nextBufferIndex(v7->_bufferIndex, 1);
  v4 = v7->_bufferEntriesFilled + 1;
  v2 = std::min[abi:ne180100]<unsigned long>(&v4, &kCBSliderCommitTelemetryEntryBufferSize);
  v7->_bufferEntriesFilled = *v2;
  return v5;
}

- (CBSliderCommitInfo)getLastFilledEntry
{
  unint64_t v2;

  if (!self->_bufferEntriesFilled)
    return 0;
  v2 = previousBufferIndex(self->_bufferIndex);
  return (CBSliderCommitInfo *)std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100]((uint64_t)&self->_entryBuffer, v2);
}

- (void)logAllFilledEntries
{
  unint64_t BufferIndex;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t p_entryBuffer;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *bufferLogHandle;
  uint8_t v14[7];
  char v15;
  NSObject *v16;
  os_log_type_t v17;
  os_log_t v18;
  uint64_t v19;
  unint64_t i;
  uint8_t v21[7];
  char v22;
  NSObject *v23;
  SEL v24;
  CBSliderCommitTelemetry *v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = self;
  v24 = a2;
  v23 = 0;
  if (self->_bufferLogHandle)
  {
    bufferLogHandle = v25->_bufferLogHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    bufferLogHandle = inited;
  }
  v23 = bufferLogHandle;
  v22 = 1;
  if (os_log_type_enabled(bufferLogHandle, OS_LOG_TYPE_INFO))
  {
    log = v23;
    type = v22;
    __os_log_helper_16_0_0(v21);
    _os_log_impl(&dword_1B5291000, log, type, "======================= Brightness commit =======================", v21, 2u);
  }
  i = 0;
  for (i = 100 - v25->_bufferEntriesFilled; i < 0x64; ++i)
  {
    v19 = 0;
    p_entryBuffer = (uint64_t)&v25->_entryBuffer;
    BufferIndex = nextBufferIndex(v25->_bufferIndex, i);
    v19 = std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100](p_entryBuffer, BufferIndex);
    v18 = 0;
    if (v25->_bufferLogHandle)
    {
      v8 = v25->_bufferLogHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    v18 = v8;
    v17 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v26, *(_QWORD *)(v19 + 8), (uint64_t)+[CBSliderCommitTelemetry sliderInfoToNSDictionary:](CBSliderCommitTelemetry, "sliderInfoToNSDictionary:", v19));
      _os_log_impl(&dword_1B5291000, v18, v17, "%lld: %@", v26, 0x16u);
    }
  }
  v16 = 0;
  if (v25->_bufferLogHandle)
  {
    v6 = v25->_bufferLogHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v5 = init_default_corebrightness_log();
    v6 = v5;
  }
  v16 = v6;
  v15 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v3 = v16;
    v4 = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_impl(&dword_1B5291000, v3, v4, "=================================================================", v14, 2u);
  }
}

- (void)cancelDelayedAPCETimer
{
  dispatch_source_cancel((dispatch_source_t)self->_delayedAPCETimer);
  dispatch_release((dispatch_object_t)self->_delayedAPCETimer);
  self->_delayedAPCETimer = 0;
}

- (void)reportCommit:(CBSliderCommitInfo *)a3
{
  self->_longestInactivityLength = 0.0;
  -[CBSliderCommitTelemetry logAllFilledEntries](self, "logAllFilledEntries");
  +[CBAnalytics userSliderCommit:](CBAnalytics, "userSliderCommit:", a3);
  -[CBSliderCommitTelemetry sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("CBFinalBrightnessCommit"), +[CBSliderCommitTelemetry sliderInfoToNSDictionary:](CBSliderCommitTelemetry, "sliderInfoToNSDictionary:", a3));
}

- (void)delayedAPCETimerHandler:(CBSliderCommitInfo *)a3
{
  float v3;

  -[CBSliderCommitTelemetry getAPCE](self, "getAPCE");
  a3->delayedAPCE = v3;
  a3->delayedAPCEStatus = 0;
  -[CBSliderCommitTelemetry cancelDelayedAPCETimer](self, "cancelDelayedAPCETimer");
  -[CBSliderCommitTelemetry reportCommit:](self, "reportCommit:", a3);
}

- (void)fillEntry:(CBSliderCommitInfo *)a3 withTimestamp:(int64_t)a4 slider:(float)a5 apce:(float)a6 andTrackedState:(TrackedState)a7
{
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  void *context;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  a3->timestamp = a4;
  a3->localTimestamp = localizeTimestamp(a4);
  a3->trustedLux = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("TrustedLux")), "intValue");
  v24 = -[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("RLuxStats"));
  objc_msgSend((id)objc_msgSend(v24, "objectForKey:", CFSTR("frontLux")), "floatValue");
  a3->frontLux = v7;
  objc_msgSend((id)objc_msgSend(v24, "objectForKey:", CFSTR("rearLux")), "floatValue");
  a3->rearLux = v8;
  a3->rearLuxInUse = objc_msgSend((id)objc_msgSend(v24, "objectForKey:", CFSTR("rearLuxInUse")), "BOOLValue") & 1;
  v23 = -[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("DisplayBrightness"));
  objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("NitsPhysical")), "floatValue");
  a3->nits = v9;
  a3->slider = a5;
  objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("AuroraFactor")), "floatValue");
  a3->auroraFactor = v10;
  objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("EDRHeadroom")), "floatValue");
  a3->edrHeadroom = v11;
  objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("ColorAdaptationStrength")), "floatValue");
  a3->colorAdaptationStrength = v12;
  a3->colorAdaptationMode = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("ColorAdaptationMode")), "intValue");
  a3->cpmsMitigationLimitingBrightness = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("ThermalMitigationLimitingBrightness")), "BOOLValue") & 1;
  objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("EcoModeFactor")), "floatValue");
  a3->ecoModeFactor = v13;
  a3->touchMitigationTriggered = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("TouchMitigationTriggered")), "BOOLValue") & 1;
  a3->proxMitigationTriggered = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("ProxMitigationTriggered")), "BOOLValue") & 1;
  -[CBSliderCommitTelemetry getUserAABParams:alternativeAABParams:](self, "getUserAABParams:alternativeAABParams:", &a3->aabParams, &a3->aabAlternativeParams);
  a3->aabParamsUpdateOnly = 0;
  a3->aabParamsUpdateReason = -1;
  v22 = -[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("AABCurveUpdateReason"));
  if (v22)
    a3->aabParamsUpdateReason = objc_msgSend(v22, "intValue");
  v21 = -[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("AABCurveUpdateNitsDelta"), 0x1EF0FB000uLL);
  v20 = (id)objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v17 + 3836)), "copyPropertyForKey:", CFSTR("AABCurveUpdateNitsDeltaAlternative"));
  if (v21)
  {
    objc_msgSend(v21, "floatValue");
    a3->nitsDelta = a3->nitsDelta + v14;
  }
  if (v20)
  {
    objc_msgSend(v20, "floatValue");
    a3->nitsDeltaAlternative = a3->nitsDeltaAlternative + v15;
  }
  a3->apce = a6;
  a3->delayedAPCE = -1.0;
  a3->delayedAPCEStatus = 1;
  a3->autobrightnessEnabled = a7.autobrightnessEnabled;
  a3->ecoModeEnabled = a7.ecoModeEnabled;
  a3->darkThemeApplied = a7.darkThemeApplied;
  a3->landscapeOrientation = a7.landscapeOrientation;

  v19 = -[CBTrialSettingsProvider copyExperimentIdentifiers](+[CBTrialSettingsProvider sharedInstance](CBTrialSettingsProvider, "sharedInstance"), "copyExperimentIdentifiers");
  if (v19)
  {
    a3->trialExperimentId = (NSString *)(id)objc_msgSend(v19, "experimentId");
    a3->trialDeploymentId = objc_msgSend(v19, "deploymentId");
    a3->trialTreatmentId = (NSString *)(id)objc_msgSend(v19, "treatmentId");

  }
  else
  {
    a3->trialExperimentId = 0;
    a3->trialDeploymentId = 0;
    a3->trialTreatmentId = 0;
  }
  v16 = round(self->_longestInactivityLength * 10.0 / 3600.0) / 10.0;
  a3->inactiveLength = v16;
  a3->inactiveStart = (uint64_t)self->_inactivityStartTimestamp;
  objc_autoreleasePoolPop(context);
}

- (void)fillEntry:(CBSliderCommitInfo *)a3 withTimestamp:(int64_t)a4 andAABParams:(CBAABParams *)a5 andAlternativeAABParams:(CBAABParams *)a6
{
  -[CBSliderCommitTelemetry fillEntry:withTimestamp:andRestoreTimeTarget:andAABParams:andAlternativeAABParams:](self, "fillEntry:withTimestamp:andRestoreTimeTarget:andAABParams:andAlternativeAABParams:", a3, a4, 0, a5, a6, a6, a5, a4, a3, a2, self);
}

- (void)fillEntry:(CBSliderCommitInfo *)a3 withTimestamp:(int64_t)a4 andRestoreTimeTarget:(int64_t)a5 andAABParams:(CBAABParams *)a6 andAlternativeAABParams:(CBAABParams *)a7
{
  float v7;
  id v8;
  id v9;

  a3->timestamp = a4;
  a3->localTimestamp = localizeTimestamp(a4);
  memcpy(&a3->aabParams, a6, sizeof(a3->aabParams));
  memcpy(&a3->aabAlternativeParams, a7, sizeof(a3->aabAlternativeParams));
  a3->aabParamsUpdateOnly = 1;
  a3->autobrightnessEnabled = self->_state.autobrightnessEnabled;
  a3->aabParamsUpdateReason = -1;
  v9 = -[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", CFSTR("AABCurveUpdateReason"));
  if (v9)
    a3->aabParamsUpdateReason = objc_msgSend(v9, "intValue");
  a3->restoreTimeTarget = a5;
  v8 = -[CBTrialSettingsProvider copyExperimentIdentifiers](+[CBTrialSettingsProvider sharedInstance](CBTrialSettingsProvider, "sharedInstance"), "copyExperimentIdentifiers");

  if (v8)
  {
    a3->trialExperimentId = (NSString *)(id)objc_msgSend(v8, "experimentId");
    a3->trialDeploymentId = objc_msgSend(v8, "deploymentId");
    a3->trialTreatmentId = (NSString *)(id)objc_msgSend(v8, "treatmentId");

  }
  else
  {
    a3->trialExperimentId = 0;
    a3->trialDeploymentId = 0;
    a3->trialTreatmentId = 0;
  }
  v7 = round(self->_longestInactivityLength * 10.0 / 3600.0) / 10.0;
  a3->inactiveLength = v7;
  a3->inactiveStart = (uint64_t)self->_inactivityStartTimestamp;
}

- (CBSliderCommitInfo)addOrUpdateEntryWithTimestamp:(int64_t)a3 slider:(float)a4 apce:(float)a5 andTrackedState:(TrackedState)a6
{
  double v6;
  double v7;
  dispatch_source_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t inited;
  NSObject *v15;
  NSObject *source;
  NSObject *log;
  os_log_type_t type;
  uint64_t v19;
  NSObject *v20;
  uint8_t v21[7];
  os_log_type_t v22;
  os_log_t oslog;
  uint64_t handler;
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  dispatch_queue_t *v29;
  CBSliderCommitInfo *v30;
  uint64_t v31;
  TrackedState v32;
  uint8_t v33[15];
  char v34;
  NSObject *v35;
  CBSliderCommitInfo *v36;
  float v37;
  float v38;
  int64_t v39;
  SEL v40;
  dispatch_queue_t *v41;
  uint64_t v42;
  TrackedState v43;

  v42 = *(_QWORD *)&a6.darkThemeApplied;
  v43 = a6;
  v41 = (dispatch_queue_t *)self;
  v40 = a2;
  v39 = a3;
  v38 = a4;
  v37 = a5;
  v36 = 0;
  if (self->_delayedAPCETimer)
  {
    v36 = (CBSliderCommitInfo *)-[dispatch_queue_t getLastFilledEntry](v41, "getLastFilledEntry");
    if (!v36)
    {
      v35 = 0;
      if (v41[2])
      {
        v20 = v41[2];
      }
      else
      {
        v19 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v20 = v19;
      }
      v35 = v20;
      v34 = 16;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        log = v35;
        type = v34;
        __os_log_helper_16_0_0(v33);
        _os_log_error_impl(&dword_1B5291000, log, type, "Failed to get last filled entry while delay APCE timer is active!", v33, 2u);
      }
    }
    -[dispatch_queue_t cancelDelayedAPCETimer](v41, "cancelDelayedAPCETimer");
  }
  if (!v36)
    v36 = (CBSliderCommitInfo *)-[dispatch_queue_t getNextEntryAndAdvanceBufferIndex](v41, "getNextEntryAndAdvanceBufferIndex");
  *(float *)&v6 = v38;
  *(float *)&v7 = v37;
  v32 = v43;
  LODWORD(v31) = v43;
  -[dispatch_queue_t fillEntry:withTimestamp:slider:apce:andTrackedState:](v41, "fillEntry:withTimestamp:slider:apce:andTrackedState:", v36, v39, v31, v6, v7);
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v41[6]);
  v41[2922] = v8;
  if (v41[2922])
  {
    v9 = v41[2922];
    handler = MEMORY[0x1E0C809B0];
    v25 = -1073741824;
    v26 = 0;
    v27 = __85__CBSliderCommitTelemetry_addOrUpdateEntryWithTimestamp_slider_apce_andTrackedState___block_invoke;
    v28 = &unk_1E68EA3D8;
    v29 = v41;
    v30 = v36;
    dispatch_source_set_event_handler(v9, &handler);
    source = v41[2922];
    v10 = dispatch_time(0, 1000000000 * (_QWORD)v41[2909]);
    dispatch_source_set_timer(source, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(v41[2922]);
  }
  else
  {
    oslog = 0;
    if (v41[2])
    {
      v15 = v41[2];
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v15 = inited;
    }
    oslog = v15;
    v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v12 = oslog;
      v13 = v22;
      __os_log_helper_16_0_0(v21);
      _os_log_error_impl(&dword_1B5291000, v12, v13, "Failed to create timer, reporting immediately", v21, 2u);
    }
    v36->delayedAPCEStatus = -1;
    -[dispatch_queue_t reportCommit:](v41, "reportCommit:", v36, v12);
  }
  return v36;
}

uint64_t __85__CBSliderCommitTelemetry_addOrUpdateEntryWithTimestamp_slider_apce_andTrackedState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "delayedAPCETimerHandler:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)logAfterUserBrightnessCommitWithTimestamp:(int64_t)a3 slider:(float)a4 apce:(float)a5 andTrackedState:(TrackedState)a6
{
  NSObject *loggingQueue;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t, double, double);
  void *v11;
  CBSliderCommitTelemetry *v12;
  int64_t v13;
  float v14;
  float v15;
  TrackedState v16;
  float v17;
  float v18;
  int64_t v19;
  SEL v20;
  CBSliderCommitTelemetry *v21;
  uint64_t v22;
  TrackedState v23;

  v22 = *(_QWORD *)&a6.darkThemeApplied;
  v23 = a6;
  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = a5;
  loggingQueue = self->_loggingQueue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __97__CBSliderCommitTelemetry_logAfterUserBrightnessCommitWithTimestamp_slider_apce_andTrackedState___block_invoke;
  v11 = &unk_1E68EABF0;
  v12 = v21;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  dispatch_async(loggingQueue, &v7);
}

uint64_t __97__CBSliderCommitTelemetry_logAfterUserBrightnessCommitWithTimestamp_slider_apce_andTrackedState___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4;

  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "addOrUpdateEntryWithTimestamp:slider:apce:andTrackedState:", *(_QWORD *)(a1 + 40), v4, a2, a3, v4);
}

- (double)timestampFromCurveDistionary:(id)a3
{
  double v3;
  void *v5;
  void *v6;
  double v7;

  v7 = 0.0;
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Prefs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("timestamp"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "doubleValue");
      return v3;
    }
  }
  return v7;
}

- (id).cxx_construct
{
  TrackedState::TrackedState(&self->_state);
  return self;
}

@end
