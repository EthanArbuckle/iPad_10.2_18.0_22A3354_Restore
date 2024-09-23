@implementation CBAODModule

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  const char *v4;
  double v5;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CPMSCurrentCap")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
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
        if ((objc_msgSend(a4, "BOOLValue") & 1) != 0)
          v4 = "";
        else
          v4 = "not";
        __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)v4);
        _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "CPMS Cap Updated: Forcing update while %s ramping", v10, 0xCu);
      }
      if ((objc_msgSend(a4, "BOOLValue") & 1) != 0)
      {
        -[CBAODModule performUpdate](self, "performUpdate");
      }
      else
      {
        LODWORD(v5) = 0;
        -[CBAODModule performUpdate:](self, "performUpdate:", v5);
      }
    }
  }
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  double v4;

  LODWORD(v4) = -1.0;
  return -[CBAODModule handleHIDEvent:from:transitionLength:forceUpdate:](self, "handleHIDEvent:from:transitionLength:forceUpdate:", a3, a4, 0, v4, a4, a3, a2, self);
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4 transitionLength:(float)a5 forceUpdate:(BOOL)a6
{
  _BYTE __dst[48];
  _DWORD __b[12];
  BOOL v9;
  float v10;
  __IOHIDServiceClient *v11;
  __IOHIDEvent *v12;
  SEL v13;
  CBAODModule *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v10 = a5;
  v9 = a6;
  memset(__b, 0, sizeof(__b));
  LOBYTE(__b[0]) = v9;
  HIBYTE(__b[0]) = v10 >= 0.0;
  *(float *)&__b[1] = v10;
  memcpy(__dst, __b, sizeof(__dst));
  return -[CBAODModule handleHIDEvent:from:transitionParameters:](v14, "handleHIDEvent:from:transitionParameters:", v12, v11, __dst);
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4 transitionParameters:(id *)a5
{
  _BYTE __dst[48];
  id v8;
  $9424C94D2D96C890884F5126E9ED469E *v9;
  __IOHIDServiceClient *v10;
  __IOHIDEvent *v11;
  SEL v12;
  CBAODModule *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  v9 = a5;
  if (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 1)
  {
    v8 = +[CBHIDEvent newEvent:andService:](CBHIDEvent, "newEvent:andService:", v11, v10);
    if (v13->_aabSensorOverrideFilter)
      -[CBSensorOverrideFilter filterEvent:](v13->_aabSensorOverrideFilter, "filterEvent:", v8);
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        memcpy(__dst, a5, sizeof(__dst));
        -[CBAODModule handleALSEvent:transitionParameters:](v13, "handleALSEvent:transitionParameters:", v8, __dst);
      }
    }

  }
  return 1;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  double v4;
  double v5;
  BOOL v6;
  CBAODState *v7;
  BOOL v8;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  CBAODTransitionController *transitionController;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v31[15];
  os_log_type_t v32;
  os_log_t v33;
  os_log_type_t v34;
  os_log_t v35;
  os_log_type_t v36;
  os_log_t v37;
  os_log_type_t v38;
  os_log_t v39;
  os_log_type_t v40;
  os_log_t v41;
  os_log_type_t v42;
  os_log_t v43;
  os_log_type_t v44;
  os_log_t v45;
  os_log_type_t v46;
  os_log_t v47;
  os_log_type_t type;
  os_log_t oslog;
  char v50;
  id v51;
  id v52;
  SEL v53;
  CBAODModule *v54;
  uint8_t v55[32];
  uint8_t v56[32];
  uint8_t v57[32];
  uint8_t v58[32];
  uint8_t v59[32];
  uint8_t v60[32];
  uint8_t v61[32];
  uint8_t v62[24];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v54 = self;
  v53 = a2;
  v52 = a3;
  v51 = a4;
  v50 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("FlipBookState")) & 1) != 0)
  {
    v50 = -[CBAODModule handleFlipBookStatePropertyHandler:](v54, "handleFlipBookStatePropertyHandler:", v52);
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("DisplayBrightness")) & 1) != 0)
  {
    oslog = 0;
    if (v54->super._logHandle)
    {
      logHandle = v54->super._logHandle;
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
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v62, (uint64_t)v51, (uint64_t)v52);
      _os_log_debug_impl(&dword_1B5291000, oslog, type, "DisplayBrightness = %@ property = %@", v62, 0x16u);
    }
    LODWORD(v4) = 0;
    v50 = -[CBAODModule performUpdate:](v54, "performUpdate:", v4);
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("DisplayNitsKey")) & 1) != 0)
  {
    v47 = 0;
    if (v54->super._logHandle)
    {
      v28 = v54->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v27 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v27 = init_default_corebrightness_log();
      v28 = v27;
    }
    v47 = v28;
    v46 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v61, (uint64_t)v51, (uint64_t)v52);
      _os_log_debug_impl(&dword_1B5291000, v47, v46, "DisplayNits = %@ property = %@", v61, 0x16u);
    }
    LODWORD(v5) = 0;
    v50 = -[CBAODModule performUpdate:](v54, "performUpdate:", v5);
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("AODDisplayNitsOverride")) & 1) != 0)
  {
    -[CBAODModule handleDisplayNitsOverridePropertyHandler:](v54, "handleDisplayNitsOverridePropertyHandler:", v52);
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("ForceLiveUpdates")) & 1) != 0)
  {
    v45 = 0;
    if (v54->super._logHandle)
    {
      v26 = v54->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v25 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v25 = init_default_corebrightness_log();
      v26 = v25;
    }
    v45 = v26;
    v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v60, (uint64_t)v51, (uint64_t)v52);
      _os_log_impl(&dword_1B5291000, v45, v44, "ForceLiveUpdates = %@ property = %@", v60, 0x16u);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CBAODTransitionController setLiveUpdatesOverride:](v54->_transitionController, "setLiveUpdatesOverride:", objc_msgSend(v52, "BOOLValue") & 1);
      -[CBAODTransitionController setLiveUpdates:](v54->_transitionController, "setLiveUpdates:", objc_msgSend(v52, "BOOLValue") & 1);
    }
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("EnableDCPFlipBookUpdates")) & 1) != 0)
  {
    v43 = 0;
    if (v54->super._logHandle)
    {
      v24 = v54->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v23 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v23 = init_default_corebrightness_log();
      v24 = v23;
    }
    v43 = v24;
    v42 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v59, (uint64_t)v51, (uint64_t)v52);
      _os_log_impl(&dword_1B5291000, v43, v42, "EnableDCPFlipBookUpdates = %@ property = %@", v59, 0x16u);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CBAODTransitionController enableDCPFlipBookUpdates:](v54->_transitionController, "enableDCPFlipBookUpdates:", objc_msgSend(v52, "BOOLValue") & 1);
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("AABSensorOverride")) & 1) != 0)
  {
    v41 = 0;
    if (v54->super._logHandle)
    {
      v22 = v54->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v21 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v21 = init_default_corebrightness_log();
      v22 = v21;
    }
    v41 = v22;
    v40 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v58, (uint64_t)v51, (uint64_t)v52);
      _os_log_impl(&dword_1B5291000, v41, v40, "AABSensorOverride = %@ property = %@", v58, 0x16u);
    }
    -[CBAODModule handleAABSensorOverridePropertyHandler:](v54, "handleAABSensorOverridePropertyHandler:", v52);
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("EnableAOD")) & 1) != 0)
  {
    v39 = 0;
    if (v54->super._logHandle)
    {
      v20 = v54->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v19 = init_default_corebrightness_log();
      v20 = v19;
    }
    v39 = v20;
    v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v57, (uint64_t)v51, (uint64_t)v52);
      _os_log_impl(&dword_1B5291000, v39, v38, "Enable AOD = %@ property = %@", v57, 0x16u);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v54->_aodEnabled = objc_msgSend(v52, "BOOLValue") & 1;
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("AODEDRRampDurationPerStop")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      transitionController = v54->_transitionController;
      objc_msgSend(v52, "floatValue");
      -[CBAODTransitionController setDurationOfEDRRamp:](transitionController, "setDurationOfEDRRamp:");
    }
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("AODUpdateWithCopiedEvent")) & 1) != 0)
  {
    v37 = 0;
    if (v54->super._logHandle)
    {
      v17 = v54->super._logHandle;
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
    v36 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v56, (uint64_t)v51, (uint64_t)v52);
      _os_log_impl(&dword_1B5291000, v37, v36, "%@ = %@", v56, 0x16u);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v52, "BOOLValue") & 1) != 0)
      -[CBAODModule copyAndHandleEvent](v54, "copyAndHandleEvent");
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("ALSMedianHistorySize")) & 1) != 0)
  {
    v35 = 0;
    if (v54->super._logHandle)
    {
      v15 = v54->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v14 = init_default_corebrightness_log();
      v15 = v14;
    }
    v35 = v15;
    v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v55, (uint64_t)v51, (uint64_t)v52);
      _os_log_impl(&dword_1B5291000, v35, v34, "%@ = %@", v55, 0x16u);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CBAODModule setALSServiceProperty:forKey:](v54, "setALSServiceProperty:forKey:", v52, CFSTR("ALSMedianHistorySize"));
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("CBSystemDidWakeFromSleep")) & 1) != 0)
  {
    -[CBAODModule handleSystemDidWakeFromSleepPropertyHandler:](v54, "handleSystemDidWakeFromSleepPropertyHandler:", v52);
  }
  else if ((objc_msgSend(v51, "isEqual:", -[CBBrightnessProxy brightnessNotificationPowerOff](v54->_brtCtl, "brightnessNotificationPowerOff")) & 1) != 0)
  {
    if (-[CBAODTransitionController displayON](v54->_transitionController, "displayON"))
    {
      v33 = 0;
      if (v54->super._logHandle)
      {
        v13 = v54->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v12 = init_default_corebrightness_log();
        v13 = v12;
      }
      v33 = v13;
      v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v33;
        v11 = v32;
        __os_log_helper_16_0_0(v31);
        _os_log_impl(&dword_1B5291000, v10, v11, "BrightnessNotificationPowerOff from CA -> canceling ongoing transitions.", v31, 2u);
      }
      -[CBAODTransitionController setDisplayON:](v54->_transitionController, "setDisplayON:", 0);
      -[CBAODTransitionController cancelTransition](v54->_transitionController, "cancelTransition");
    }
  }
  else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("DominoStateUpdate")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v54->_dominoModeEnabled = objc_msgSend(v52, "BOOLValue") & 1;
  }
  v6 = -[CBAODThresholdModule setProperty:forKey:](v54->_thresholdModule, "setProperty:forKey:", v52, v51);
  v50 = (v50 & 1 | v6) != 0;
  v7 = +[CBAODState sharedInstance](CBAODState, "sharedInstance");
  v8 = -[CBAODState setProperty:forKey:](v7, "setProperty:forKey:", v52, v51);
  return (v50 & 1 | v8) != 0;
}

void __91__CBAODModule_performUpdateWithTransitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke(uint64_t a1)
{
  float v1;
  float v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t inited;
  NSObject *v15;
  uint8_t v17[15];
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  os_log_t v21;
  _BYTE __dst[50];
  char v23;
  os_log_type_t v24;
  os_log_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t v29[16];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = a1;
  v27 = a1;
  if (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 1
    && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) & 1) == 0
    || (*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v26 = 0;
    v26 = (id)objc_msgSend(*(id *)(a1 + 32), "copyModulesInfo:", 0);
    v25 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v15 = inited;
    }
    v25 = v15;
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v26);
      _os_log_impl(&dword_1B5291000, v25, v24, "CB features update for Collected modules info \n %@", v30, 0xCu);
    }
    v23 = 0;
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    memcpy(__dst, (const void *)(a1 + 56), 0x30uLL);
    v23 = objc_msgSend(v11, "startTransition:transitionParameters:rampDoneCallback:rampCanceledCallback:", v26, __dst, v12, v13) & 1;
    if (v23)
    {
      v19 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
      {
        v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v5 = init_default_corebrightness_log();
        v6 = v5;
      }
      v19 = v6;
      v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v3 = v19;
        v4 = v18;
        __os_log_helper_16_0_0(v17);
        _os_log_impl(&dword_1B5291000, v3, v4, "This change doesn't trigger transition.", v17, 2u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "remainingTransitionLength");
      if (v1 <= 0.0)
      {
        if (*(_QWORD *)(a1 + 40))
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        v21 = 0;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
        {
          v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v9 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v9 = init_default_corebrightness_log();
          v10 = v9;
        }
        v21 = v10;
        v20 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "remainingTransitionLength");
          __os_log_helper_16_0_1_8_0((uint64_t)v29, COERCE__INT64(v2));
          _os_log_impl(&dword_1B5291000, v21, v20, "Detected unfinished transition -> force to ramp to the target in remaining time = %f.", v29, 0xCu);
        }
        v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v8 = v26;
        objc_msgSend(v7, "remainingTransitionLength");
        objc_msgSend(v7, "startTransition:length:forceUpdate:rampDoneCallback:rampCanceledCallback:", v8, 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
    }

  }
}

- (BOOL)performUpdateWithTransitionParameters:(id *)a3 rampDoneCallback:(id)a4 rampCanceledCallback:(id)a5
{
  NSObject *queue;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  CBAODModule *v12;
  id v13;
  id v14;
  _BYTE v15[48];
  char v16;
  id v17;
  id v18;
  $9424C94D2D96C890884F5126E9ED469E *v19;
  SEL v20;
  CBAODModule *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = a5;
  v16 = 1;
  queue = self->super._queue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __91__CBAODModule_performUpdateWithTransitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke;
  v11 = &unk_1E68EAA30;
  v12 = self;
  memcpy(v15, a3, sizeof(v15));
  v13 = v18;
  v14 = v17;
  dispatch_async(queue, &v7);
  return v16 & 1;
}

- (BOOL)performUpdate:(float)a3 forceUpdate:(BOOL)a4 rampDoneCallback:(id)a5 rampCanceledCallback:(id)a6
{
  _BYTE __dst[48];
  _DWORD __b[12];
  id v9;
  id v10;
  BOOL v11;
  float v12;
  SEL v13;
  CBAODModule *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v10 = a5;
  v9 = a6;
  memset(__b, 0, sizeof(__b));
  LOBYTE(__b[0]) = v11;
  HIBYTE(__b[0]) = v12 >= 0.0;
  *(float *)&__b[1] = v12;
  memcpy(__dst, __b, sizeof(__dst));
  return -[CBAODModule performUpdateWithTransitionParameters:rampDoneCallback:rampCanceledCallback:](v14, "performUpdateWithTransitionParameters:rampDoneCallback:rampCanceledCallback:", __dst, v10, v9);
}

- (BOOL)performUpdate:(float)a3 forceUpdate:(BOOL)a4
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CBAODModule *v10;
  BOOL v11;
  float v12;
  SEL v13;
  CBAODModule *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __41__CBAODModule_performUpdate_forceUpdate___block_invoke;
  v9 = &unk_1E68E9E60;
  v10 = self;
  return -[CBAODModule performUpdate:forceUpdate:rampDoneCallback:rampCanceledCallback:](self, "performUpdate:forceUpdate:rampDoneCallback:rampCanceledCallback:", a4, &v5, 0, *(double *)&a3);
}

- (BOOL)performUpdate:(float)a3
{
  return -[CBAODModule performUpdate:forceUpdate:](self, "performUpdate:forceUpdate:", 0, *(double *)&a3);
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (CBAODModule)initWithCBBrtControl:(id)a3 andQueue:(id)a4
{
  os_log_t v4;
  CBBrightnessProxy *v5;
  NSMutableArray *v6;
  CBAODThresholdModule *v7;
  uint64_t v8;
  CBAODTransitionController *v9;
  uint64_t v10;
  NSMutableArray *v11;
  const char *v12;
  uint64_t v14;
  NSObject *v15;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v20[15];
  char v21;
  NSObject *v22;
  objc_super v23;
  id v24;
  CBBrightnessProxy *v25;
  SEL v26;
  CBAODModule *v27;
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27 = self;
  v26 = a2;
  v25 = (CBBrightnessProxy *)a3;
  v24 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CBAODModule;
  v27 = -[CBModule initWithQueue:](&v23, sel_initWithQueue_, a4);
  if (v27)
  {
    v4 = os_log_create("com.apple.CoreBrightness.AOD.CBAODModule", "default");
    v27->super._logHandle = (OS_os_log *)v4;
    if (!-[CBAODState isAODSupported](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODSupported"))
    {
LABEL_25:

      return 0;
    }
    v27->_brtCtl = v25;
    v5 = v27->_brtCtl;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27->_modules = v6;
    v7 = [CBAODThresholdModule alloc];
    v8 = -[CBAODThresholdModule initWithQueue:](v7, "initWithQueue:", v24);
    v27->_thresholdModule = (CBAODThresholdModule *)v8;
    v9 = [CBAODTransitionController alloc];
    v10 = -[CBAODTransitionController initWithCBBrtControl:andThresholdModule:andQueue:](v9, "initWithCBBrtControl:andThresholdModule:andQueue:", v25, v27->_thresholdModule, v24);
    v27->_transitionController = (CBAODTransitionController *)v10;
    if (!v27->_transitionController)
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
        _os_log_error_impl(&dword_1B5291000, log, type, "Failed to initialized transition controller", v20, 2u);
      }
      goto LABEL_25;
    }
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27->_alsServiceClients = v11;
    v27->_ABStateBackup = 1;
    v27->_displayBrightnessBackup = 2.0;
    v27->_ABLuxFilterBackup = 0;
    v27->_aabSensorOverrideFilter = 0;
    v27->_backupState = 0;
    v27->_currentDisplayMode = 5;
    v27->_suspendFeatureUpdates = 0;
    v27->_displayModeCompletionTimer = 0;
    v27->_aodEnabled = 1;
    v27->_flipBookEnabled = 0;
    v27->_dominoModeEnabled = 0;
    -[CBAODModule checkBootArgsConfiguration](v27, "checkBootArgsConfiguration");
    if (v27->super._logHandle)
    {
      v15 = v27->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v14 = init_default_corebrightness_log();
      v15 = v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v27->_aodEnabled)
        v12 = "enabled";
      else
        v12 = "disabled";
      __os_log_helper_16_2_1_8_32((uint64_t)v29, (uint64_t)v12);
      _os_log_impl(&dword_1B5291000, v15, OS_LOG_TYPE_DEFAULT, "Andromeda support %s.", v29, 0xCu);
    }
  }
  return v27;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAODModule *v4;

  v4 = self;
  v3 = a2;
  -[CBAODModule releaseDisplayModeCompletionTimer](self, "releaseDisplayModeCompletionTimer");

  if (v4->_aabSensorOverrideFilter)
  {

    v4->_aabSensorOverrideFilter = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAODModule;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (void)checkBootArgsConfiguration
{
  BOOL v2;
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  char *v6;
  size_t v7[2];
  CBAODModule *v8;
  uint8_t v9[24];
  char __s1[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v7[1] = (size_t)a2;
  bzero(__s1, 0x400uLL);
  v7[0] = 1024;
  if (!sysctlbyname("kern.bootargs", __s1, v7, 0, 0))
  {
    v6 = strstr(__s1, "cb_enable_aod");
    if (v6)
    {
      v2 = strtol(v6 + 14, 0, 0) != 0;
      v8->_aodEnabled = v2;
      if (v8->super._logHandle)
      {
        logHandle = v8->super._logHandle;
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
        if (v8->_aodEnabled)
          v3 = "Enable";
        else
          v3 = "Disable";
        __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Boot arg override: %s AOD.", v9, 0xCu);
      }
    }
  }
}

- (id)copyPropertyForKey:(id)a3
{
  id v4;
  id v5;
  id v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AODDisplayNits")) & 1) != 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[CBAODTransitionController currentDisplayNits](self->_transitionController, "currentDisplayNits");
    return (id)objc_msgSend(v6, "initWithFloat:");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AODDisplayNitsCap")) & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[CBAODState nitsCap](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "nitsCap");
    return (id)objc_msgSend(v5, "initWithFloat:");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AODDisplayNitsOverride")) & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[CBAODTransitionController nitsOverride](self->_transitionController, "nitsOverride");
    return (id)objc_msgSend(v4, "initWithFloat:");
  }
  else
  {
    return -[CBAODThresholdModule copyPropertyForKey:](self->_thresholdModule, "copyPropertyForKey:", a3);
  }
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBAODModule copyPropertyForKey:](self, "copyPropertyForKey:", a3, a4, a3, a2, self);
}

- (void)start
{
  CBAODThresholdModule *thresholdModule;
  CBAODTransitionController *transitionController;
  char v4;
  uint64_t v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  CBAODModule *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  void *v21;
  CBAODModule *v22;
  SEL v23;
  CBAODModule *v24;
  uint8_t v25[16];
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = self;
  v23 = a2;
  thresholdModule = self->_thresholdModule;
  v8 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = -1073741824;
  v19 = 0;
  v20 = __20__CBAODModule_start__block_invoke;
  v21 = &unk_1E68E9F38;
  v22 = v24;
  -[CBModule registerNotificationBlock:](thresholdModule, "registerNotificationBlock:", &v17);
  transitionController = v24->_transitionController;
  v11 = v8;
  v12 = -1073741824;
  v13 = 0;
  v14 = __20__CBAODModule_start__block_invoke_48;
  v15 = &unk_1E68E9F38;
  v16 = v24;
  -[CBModule registerNotificationBlock:](transitionController, "registerNotificationBlock:", &v11);
  v10 = -[CBAODModule copyModulesPropertyForKey:](v24, "copyModulesPropertyForKey:", CFSTR("DisplayOn"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v10, "BOOLValue");
    v5 = 3;
    if ((v4 & 1) == 0)
      v5 = 0;
    v24->_currentDisplayMode = v5;
    if (v24->super._logHandle)
    {
      logHandle = v24->super._logHandle;
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
      __os_log_helper_16_2_1_8_66((uint64_t)v26, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v24->_currentDisplayMode));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "display mode initialised to %{public}@ based on display brightness state", v26, 0xCu);
    }
  }
  else
  {
    v24->_currentDisplayMode = 0;
    v9 = v24->super._logHandle;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v25, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v24->_currentDisplayMode));
      _os_log_fault_impl(&dword_1B5291000, v9, OS_LOG_TYPE_FAULT, "display mode initialised to %{public}@ - display state invalid", v25, 0xCu);
    }
  }

}

uint64_t __20__CBAODModule_start__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
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
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
    {
      v4 = *(NSObject **)(*(_QWORD *)(result + 32) + 16);
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

uint64_t __20__CBAODModule_start__block_invoke_48(uint64_t result, uint64_t a2, uint64_t a3)
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
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
    {
      v4 = *(NSObject **)(*(_QWORD *)(result + 32) + 16);
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

- (void)stop
{
  -[CBModule unregisterNotificationBlock](self->_thresholdModule, "unregisterNotificationBlock");
  -[CBModule unregisterNotificationBlock](self->_transitionController, "unregisterNotificationBlock");
}

- (id)copyModulesPropertyForKey:(id)a3
{
  NSMutableArray *modules;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  id v20;
  SEL v21;
  CBAODModule *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 1375731712;
  v16 = 48;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  v19 = 0;
  modules = self->_modules;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __41__CBAODModule_copyModulesPropertyForKey___block_invoke;
  v10 = &unk_1E68EA910;
  v12 = &v13;
  v11 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:", &v6);
  v5 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __41__CBAODModule_copyModulesPropertyForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  if ((objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890) & 1) != 0)
  {
    result = objc_msgSend(a2, "copyPropertyForKey:", *(_QWORD *)(a1 + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *a4 = 1;
  }
  else
  {
    result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780);
    if ((result & 1) != 0)
    {
      result = objc_msgSend(a2, "copyPropertyForKey:", *(_QWORD *)(a1 + 32));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        *a4 = 1;
    }
  }
  return result;
}

- (BOOL)setModulesProperty:(id)a3 forKey:(id)a4
{
  NSMutableArray *modules;
  char v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(_QWORD *, void *);
  void *v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  char v19;
  id v20;
  id v21;
  SEL v22;
  CBAODModule *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x20000000;
  v18 = 32;
  v19 = 0;
  modules = self->_modules;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __41__CBAODModule_setModulesProperty_forKey___block_invoke;
  v11 = &unk_1E68EA268;
  v14 = &v15;
  v12 = a3;
  v13 = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:", &v7);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v6 & 1;
}

uint64_t __41__CBAODModule_setModulesProperty_forKey___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  if ((objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890) & 1) != 0
    || (result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780), (result & 1) != 0))
  {
    result = objc_msgSend(a2, "setProperty:forKey:", a1[4], a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) & 1 | result & 1) != 0;
  }
  return result;
}

- (void)addModule:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  id v5;
  id v6;
  id v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Adding module to AOD modules %@", v10, 0xCu);
  }
  -[NSMutableArray addObject:](self->_modules, "addObject:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_transitionController)
    {
      v7 = (id)objc_msgSend(a3, "copyPropertyForKey:", CFSTR("TwilightModule"));
      -[CBAODTransitionController setTwilight:](self->_transitionController, "setTwilight:", v7);

      v6 = (id)objc_msgSend(a3, "copyPropertyForKey:", CFSTR("AmmoliteModule"));
      -[CBAODTransitionController setAmmolite:](self->_transitionController, "setAmmolite:", v6);

      v5 = (id)objc_msgSend(a3, "copyPropertyForKey:", CFSTR("IndicatorModule"));
      -[CBAODTransitionController setIndicator:](self->_transitionController, "setIndicator:", v5);

    }
  }
}

- (BOOL)handleFlipBookStatePropertyHandler:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t inited;
  NSObject *v10;
  NSObject *logHandle;
  unint64_t v12;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(a3, "integerValue");
    if (self->_currentDisplayMode == 3
      || -[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 4
      || -[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 3
      || -[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 2)
    {
      logHandle = self->super._logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_FAULT))
      {
        __os_log_helper_16_2_3_8_66_8_66_8_32((uint64_t)v18, (uint64_t)+[CBDisplayStateUtilities stringForFlipbookState:](CBDisplayStateUtilities, "stringForFlipbookState:", v12), (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", self->_currentDisplayMode), (uint64_t)-[CBAODState AODStateString](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODStateString"));
        _os_log_fault_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_FAULT, "[Flipbook state][FAULT] Unexpected flipbook state request (%{public}@) while in display mode [%{public}@] and AOD state [%s]", v18, 0x20u);
      }
    }
    if (self->super._logHandle)
    {
      v10 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v10 = inited;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v17, (uint64_t)+[CBDisplayStateUtilities stringForFlipbookState:](CBDisplayStateUtilities, "stringForFlipbookState:", v12));
      _os_log_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEFAULT, "[Flipbook state] %{public}@", v17, 0xCu);
    }
    if (v12 <= 3)
      __asm { BR              X8 }
    if (self->super._logHandle)
    {
      v8 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v16, v12);
      _os_log_error_impl(&dword_1B5291000, v8, OS_LOG_TYPE_ERROR, "invalid flipbook state change request (%ld)", v16, 0xCu);
    }
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
      v3 = objc_opt_class();
      __os_log_helper_16_2_1_8_66((uint64_t)v15, v3);
      _os_log_error_impl(&dword_1B5291000, v6, OS_LOG_TYPE_ERROR, "invalid flipbook state change request data format (%{public}@)", v15, 0xCu);
    }
  }
  return 0;
}

- (BOOL)handleDisplayNitsOverridePropertyHandler:(id)a3
{
  double v3;
  double v4;
  CBAODTransitionController *v6;
  CBAODTransitionController *transitionController;
  uint64_t inited;
  NSObject *logHandle;
  int v10;
  void *v11;
  void *v12;
  char v13;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0;
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
    __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "CBAODDisplayNitsOverride = %@", v16, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    transitionController = self->_transitionController;
    objc_msgSend(a3, "floatValue");
    -[CBAODTransitionController setNitsOverride:](transitionController, "setNitsOverride:");
    LODWORD(v3) = 0;
    v13 = -[CBAODModule performUpdate:](self, "performUpdate:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AODDisplayNitsOverrideSubKey"));
      v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AODDisplayNitsOverrideFadePeriodSubKey"));
      if (v12)
      {
        v6 = self->_transitionController;
        objc_msgSend(v12, "floatValue");
        -[CBAODTransitionController setNitsOverride:](v6, "setNitsOverride:");
        v10 = 0;
        if (v11)
        {
          objc_msgSend(v11, "floatValue");
          v10 = LODWORD(v4);
        }
        LODWORD(v4) = v10;
        v13 = -[CBAODModule performUpdate:](self, "performUpdate:", v4);
      }
    }
  }
  return v13 & 1;
}

- (BOOL)handleAABSensorOverridePropertyHandler:(id)a3
{
  float v3;
  float v4;
  uint64_t inited;
  NSObject *logHandle;
  void *v8;
  void *v9;
  float v10;
  int v11;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v10 = -1.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    v10 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AABSensorOverrideValue"));
      v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AABSensorOverrideOrientation"));
      if (v9)
      {
        objc_msgSend(v9, "floatValue");
        v10 = v4;
      }
      if (v8)
        v11 = objc_msgSend(v8, "intValue");
    }
  }
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v14, COERCE__INT64(v10), v11);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "override ALS samples with value = %f, with orientation = %d", v14, 0x12u);
  }
  if (self->_aabSensorOverrideFilter)
  {

    self->_aabSensorOverrideFilter = 0;
  }
  if (v10 >= 0.0)
    self->_aabSensorOverrideFilter = -[CBSensorOverrideFilter initWithData:]([CBSensorOverrideFilter alloc], "initWithData:", a3);
  return 1;
}

- (void)handleSystemDidWakeFromSleepPropertyHandler:(id)a3
{
  double v3;
  id v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t *v10;
  id v11;
  CBALSEvent *v12;
  uint8_t *v13;
  os_log_t v14;
  os_log_type_t v15[4];
  CBALSEvent *currentALSEvent;
  NSObject *v17;
  os_log_t v18;
  os_log_t log;
  os_log_type_t v20[4];
  uint8_t *buf;
  NSObject *inited;
  os_log_t logHandle;
  id v24;
  id v25;
  id v26;
  _BYTE v27[137];
  id v28;
  id v29;
  id v30;
  _BYTE __b[137];
  os_log_type_t v32;
  os_log_t oslog;
  os_log_type_t type;
  os_log_t v35;
  size_t v37[3];
  CBAODModule *v38;
  uint8_t v39[16];
  uint8_t v40[16];
  char __s2[24];
  char __s1[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = self;
  v37[2] = (size_t)a2;
  v37[1] = (size_t)a3;
  strcpy(__s2, "aop_threshold_als");
  v37[0] = 128;
  if (!sysctlbyname("kern.wakereason", __s1, v37, 0, 0))
  {
    v35 = 0;
    if (v38->super._logHandle)
    {
      logHandle = (os_log_t)v38->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v35 = logHandle;
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v35;
      *(_DWORD *)v20 = type;
      buf = v40;
      __os_log_helper_16_2_1_8_32((uint64_t)v40, (uint64_t)__s1);
      _os_log_impl(&dword_1B5291000, v35, type, "AP Wake. Reason: %s", v40, 0xCu);
    }
    if (strstr(__s1, __s2))
    {
      oslog = 0;
      if (v38->super._logHandle)
      {
        v18 = (os_log_t)v38->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v17 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v17 = init_default_corebrightness_log();
        v18 = v17;
      }
      oslog = v18;
      v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v14 = oslog;
        *(_DWORD *)v15 = v32;
        currentALSEvent = v38->_currentALSEvent;
        if (currentALSEvent)
          -[CBALSEvent vendorData](currentALSEvent, "vendorData");
        else
          memset(__b, 0, sizeof(__b));
        v13 = v39;
        __os_log_helper_16_0_1_8_0((uint64_t)v39, COERCE__INT64(*(float *)&__b[20]));
        _os_log_impl(&dword_1B5291000, v14, v15[0], "Wake reason aop_threshold_als: lux value = %f", v39, 0xCu);
      }
      v30 = -[CBAODModule copyModulesPropertyForKey:](v38, "copyModulesPropertyForKey:", CFSTR("CBAmbientLightTelemetry"));
      v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", __s1);
      v28 = 0;
      v11 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v12 = v38->_currentALSEvent;
      if (v12)
        -[CBALSEvent vendorData](v12, "vendorData");
      else
        memset(v27, 0, sizeof(v27));
      LODWORD(v3) = *(_DWORD *)&v27[20];
      v28 = (id)objc_msgSend(v11, "initWithFloat:", v3);
      v26 = 0;
      v7 = 0x1E0CB3000uLL;
      v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v8 = 0x1EF0FB000uLL;
      -[CBAODThresholdModule dimLuxThreshold](v38->_thresholdModule, "dimLuxThreshold");
      v26 = (id)objc_msgSend(v6, "initWithFloat:");
      v25 = 0;
      v9 = objc_alloc(*(Class *)(v7 + 2024));
      objc_msgSend(*(id *)((char *)&v38->super.super.isa + *(int *)(v8 + 3652)), "brightenLuxThreshold");
      v25 = (id)objc_msgSend(v9, "initWithFloat:");
      v24 = 0;
      v4 = objc_alloc(MEMORY[0x1E0C99E08]);
      v10 = &v5;
      v24 = (id)objc_msgSend(v4, "initWithObjectsAndKeys:", v29, CFSTR("WakeReason"), v28, CFSTR("Lux"), v26, CFSTR("DimThreshold"), v25, CFSTR("BrightenThreshold"), 0);
      if (v30)
        objc_msgSend(v24, "setObject:forKey:", v30, CFSTR("ALSSamplesBeforeWake"));
      -[CBAODModule sendNotificationForKey:andValue:](v38, "sendNotificationForKey:andValue:", CFSTR("AODWakeFromALSThreshold"), v24);

    }
  }
  if (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState"))
    -[CBAODModule copyAndHandleEvent](v38, "copyAndHandleEvent");
}

- (BOOL)performUpdate
{
  double v2;

  LODWORD(v2) = -1.0;
  return -[CBAODModule performUpdate:](self, "performUpdate:", v2, a2, self);
}

uint64_t __41__CBAODModule_performUpdate_forceUpdate___block_invoke(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  v8 = 0;
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
  v8 = v5;
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1B5291000, log, type, "Transition in AOD done", v6, 2u);
  }
  return -[CBAODState releasePowerAssertion](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "releasePowerAssertion");
}

- (BOOL)performUpdateWithTransitionParameters:(id *)a3
{
  _BYTE __dst[48];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CBAODModule *v11;
  $9424C94D2D96C890884F5126E9ED469E *v12;
  SEL v13;
  CBAODModule *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __53__CBAODModule_performUpdateWithTransitionParameters___block_invoke;
  v10 = &unk_1E68E9E60;
  v11 = self;
  memcpy(__dst, a3, sizeof(__dst));
  return -[CBAODModule performUpdateWithTransitionParameters:rampDoneCallback:rampCanceledCallback:](self, "performUpdateWithTransitionParameters:rampDoneCallback:rampCanceledCallback:", __dst, &v6, 0);
}

uint64_t __53__CBAODModule_performUpdateWithTransitionParameters___block_invoke(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  v8 = 0;
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
  v8 = v5;
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1B5291000, log, type, "Transition in AOD done", v6, 2u);
  }
  return -[CBAODState releasePowerAssertion](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "releasePowerAssertion");
}

- (BOOL)handleDisplayModeUpdate:(id)a3
{
  double v3;
  float v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Value"));
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("TransitionLength"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (int)objc_msgSend(v8, "intValue");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "floatValue");
        v5 = *(float *)&v3;
      }
      else
      {
        v5 = -1.0;
      }
      *(float *)&v3 = v5;
      return -[CBAODModule handleDisplayModeUpdate:transitionLength:](self, "handleDisplayModeUpdate:transitionLength:", v6, v3);
    }
  }
  return v9;
}

- (BOOL)handleDisplayModeUpdate:(int64_t)a3 transitionLength:(float)a4
{
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  NSObject *oslog;
  _DWORD __b[12];
  char v10;
  float v11;
  unint64_t v12;
  SEL v13;
  CBAODModule *v14;
  uint8_t v15[32];
  uint8_t v16[40];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v10 = 0;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  if (v14->_aodEnabled)
  {
    memset(__b, 0, sizeof(__b));
    LOBYTE(__b[0]) = 1;
    HIBYTE(__b[0]) = 1;
    *(float *)&__b[1] = v11;
    if (v14->super._logHandle)
    {
      logHandle = v14->super._logHandle;
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
      __os_log_helper_16_2_3_8_66_8_66_8_0((uint64_t)v16, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v14->_currentDisplayMode), (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v12), COERCE__INT64(v11));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "[Display Mode] %{public}@ -> %{public}@ in %f seconds", v16, 0x20u);
    }
    -[CBAODTransitionController cancelTransition](v14->_transitionController, "cancelTransition");
    -[CBAODModule releaseDisplayModeCompletionTimer](v14, "releaseDisplayModeCompletionTimer");
    if (v12 <= 4)
      __asm { BR              X8 }
    oslog = v14->super._logHandle;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_2_2_8_66_4_0((uint64_t)v15, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v14->_currentDisplayMode), v12);
      _os_log_fault_impl(&dword_1B5291000, oslog, OS_LOG_TYPE_FAULT, "[Display Mode] Transition to unknown display mode: %{public}@ -> display mode %d", v15, 0x12u);
    }
    v10 = 0;
  }
  objc_autoreleasePoolPop(context);
  v14->_currentDisplayMode = v12;
  return v10 & 1;
}

uint64_t __56__CBAODModule_handleDisplayModeUpdate_transitionLength___block_invoke(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = 0;
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
  v9 = v5;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "Transition in AOD done", v7, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setDisplayON:", 0);
  return -[CBAODState releasePowerAssertion](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "releasePowerAssertion");
}

uint64_t __56__CBAODModule_handleDisplayModeUpdate_transitionLength___block_invoke_156(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = 0;
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
  v9 = v5;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "Transition in AOD canceled", v7, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setDisplayON:", 0);
  return -[CBAODState releasePowerAssertion](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "releasePowerAssertion");
}

- (BOOL)setDisplayFactor:(float)a3 transitionLength:(float)a4
{
  double v4;
  double v5;
  double v6;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  _BYTE __dst[48];
  _BYTE __b[48];
  os_log_type_t v13;
  os_log_t v14;
  char v15;
  float v16;
  float v17;
  SEL v18;
  CBAODModule *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = 0;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v14 = 0;
  if (v19->super._logHandle)
  {
    logHandle = v19->super._logHandle;
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
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v20, COERCE__INT64(v17), COERCE__INT64(v16));
    _os_log_impl(&dword_1B5291000, v14, v13, "Set brightness factor = %f fade = %f", v20, 0x16u);
  }
  *(float *)&v4 = v16;
  -[CBAODModule setModulesProperty:forKey:](v19, "setModulesProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("DisplayBrightnessFadePeriod"));
  *(float *)&v5 = v17;
  v15 = -[CBAODModule setModulesProperty:forKey:](v19, "setModulesProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("DisplayBrightnessFactorWithFade"));
  *(float *)&v6 = v17;
  if (v17 >= 1.0)
  {
    memset(__b, 0, sizeof(__b));
    __b[1] = 1;
    memcpy(__dst, __b, sizeof(__dst));
    -[CBAODModule copyAndHandleEventWithTransitionParameters:](v19, "copyAndHandleEventWithTransitionParameters:", __dst);
  }
  -[CBAODModule setModulesProperty:forKey:](v19, "setModulesProperty:forKey:", &unk_1E69168B0, CFSTR("ForceModuleUpdate"), v6);
  objc_autoreleasePoolPop(context);
  return v15 & 1;
}

- (BOOL)updateAODState:(unint64_t)a3 transitionParameters:(id *)a4 brightnessFactor:(float)a5 forDisplayMode:(int64_t)a6
{
  const char *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  uint8_t v22[15];
  os_log_type_t v23;
  os_log_t oslog;
  _BYTE v25[48];
  _BYTE v26[48];
  _BYTE __dst[51];
  os_log_type_t v28;
  os_log_t v29;
  char v30;
  int64_t v31;
  float v32;
  $9424C94D2D96C890884F5126E9ED469E *v33;
  unint64_t v34;
  SEL v35;
  CBAODModule *v36;
  uint8_t v37[56];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36 = self;
  v35 = a2;
  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = 0;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  if (v36->_aodEnabled)
  {
    if (-[CBAODState AODStateExternal](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODStateExternal") != v34)
    {
      -[CBAODState setAODStateExternal:](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "setAODStateExternal:", v34);
      v29 = 0;
      if (v36->super._logHandle)
      {
        logHandle = v36->super._logHandle;
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
      v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        if (v34)
          v6 = "Entering AOD";
        else
          v6 = "Exiting AOD";
        __os_log_helper_16_2_4_8_0_8_32_8_0_8_0((uint64_t)v37, v34, (uint64_t)v6, COERCE__INT64(a4->var4), COERCE__INT64(v32));
        _os_log_impl(&dword_1B5291000, v29, v28, "AOD State update (%lu), %s, transitionTime: %f, factor = %f", v37, 0x2Au);
      }
      if (-[CBAODState AODStateExternal](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODStateExternal") == 1)
      {
        -[CBAODModule prepareForEnterToAODRoutine](v36, "prepareForEnterToAODRoutine");
        if (v32 >= 0.0)
        {
          *(float *)&v7 = v32;
          LODWORD(v8) = 0;
          -[CBAODModule setDisplayFactor:transitionLength:](v36, "setDisplayFactor:transitionLength:", v7, v8);
        }
        memcpy(__dst, a4, 0x30uLL);
        -[CBAODModule enteringAODRoutineForDisplayMode:transitionParameters:](v36, "enteringAODRoutineForDisplayMode:transitionParameters:", v31, __dst);
      }
      else if (-[CBAODState AODStateExternal](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODStateExternal"))
      {
        if (-[CBAODState AODStateExternal](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODStateExternal") == 5)
        {
          -[CBAODModule prepareForEnterToAODRoutine](v36, "prepareForEnterToAODRoutine");
          if (v32 >= 0.0)
          {
            *(float *)&v11 = v32;
            LODWORD(v12) = 0;
            -[CBAODModule setDisplayFactor:transitionLength:](v36, "setDisplayFactor:transitionLength:", v11, v12);
          }
          memcpy(v25, a4, sizeof(v25));
          -[CBAODModule enteringSuppressedAODRoutineWithTransitionParameters:](v36, "enteringSuppressedAODRoutineWithTransitionParameters:", v25);
        }
      }
      else
      {
        if (v32 >= 0.0)
        {
          *(float *)&v9 = v32;
          LODWORD(v10) = 0;
          -[CBAODModule setDisplayFactor:transitionLength:](v36, "setDisplayFactor:transitionLength:", v9, v10);
        }
        memcpy(v26, a4, sizeof(v26));
        -[CBAODModule exitingAODRoutineForDisplayMode:transitionParameters:](v36, "exitingAODRoutineForDisplayMode:transitionParameters:", v31, v26);
      }
      v30 = 1;
    }
  }
  else
  {
    oslog = 0;
    if (v36->super._logHandle)
    {
      v17 = v36->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v16 = init_default_corebrightness_log();
      v17 = v16;
    }
    oslog = v17;
    v23 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v14 = oslog;
      v15 = v23;
      __os_log_helper_16_0_0(v22);
      _os_log_error_impl(&dword_1B5291000, v14, v15, "CB AOD support is disabled.", v22, 2u);
    }
  }
  objc_autoreleasePoolPop(context);
  return v30 & 1;
}

- (void)prepareForEnterToAODRoutine
{
  uint64_t v2;
  float v3;
  char v4;
  float v5;
  CBAODState *v6;
  double v7;
  NSDictionary *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *v21;
  float v22;
  id v23;
  uint8_t v24[7];
  os_log_type_t v25;
  NSObject *v26;
  SEL v27;
  CBAODModule *v28;
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = self;
  v27 = a2;
  v21 = (void *)MEMORY[0x1B5E4A8B0]();
  v26 = 0;
  if (v28->super._logHandle)
  {
    logHandle = v28->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v26 = logHandle;
  v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v26;
    type = v25;
    __os_log_helper_16_0_0(v24);
    _os_log_impl(&dword_1B5291000, log, type, "[AOD routine]: prepare to enter AOD", v24, 2u);
  }
  -[CBAODState acquirePowerAssertion](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "acquirePowerAssertion");
  -[CBAODModule setALSServiceProperty:forKey:](v28, "setALSServiceProperty:forKey:", *MEMORY[0x1E0C9AE50], CFSTR("AODALSMode"));
  -[CBAODModule loadAODCurveFromDefaults](v28, "loadAODCurveFromDefaults");
  -[CBAODModule updateModulesAODState:](v28, "updateModulesAODState:", 2);
  -[CBAODModule setModulesProperty:forKey:](v28, "setModulesProperty:forKey:", &unk_1E69168C8, CFSTR("DisplayBrightnessFadePeriodOverride"));
  v23 = -[CBAODModule copyModulesInfo:](v28, "copyModulesInfo:", 1);
  if (v28->super._logHandle)
  {
    v16 = v28->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v15 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v15 = init_default_corebrightness_log();
    v16 = v15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)v23);
    _os_log_impl(&dword_1B5291000, v16, OS_LOG_TYPE_DEFAULT, "Current modules info: \n %@", v32, 0xCu);
  }
  v2 = -[CBAODModule getIntegerValueFrom:key:](v28, "getIntegerValueFrom:key:", v23, CFSTR("AutoBrightnessLuxFilter"));
  v28->_ABLuxFilterBackup = v2;
  if (v28->super._logHandle)
  {
    v14 = v28->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v13 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v13 = init_default_corebrightness_log();
    v14 = v13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v31, v28->_ABLuxFilterBackup);
    _os_log_impl(&dword_1B5291000, v14, OS_LOG_TYPE_DEFAULT, "ALS lux filter backup %ld", v31, 0xCu);
  }
  -[CBAODModule getFloatValueFrom:key:](v28, "getFloatValueFrom:key:", v23, CFSTR("PendingDisplayNits"));
  v28->_displayBrightnessBackup = v3;
  if (v28->super._logHandle)
  {
    v12 = v28->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v11 = init_default_corebrightness_log();
    v12 = v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v30, COERCE__INT64(v28->_displayBrightnessBackup));
    _os_log_impl(&dword_1B5291000, v12, OS_LOG_TYPE_DEFAULT, "Display brightness backup %f Nits", v30, 0xCu);
  }
  -[CBAODModule setModulesProperty:forKey:](v28, "setModulesProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("CEEnable"));
  objc_msgSend(v23, "objectForKey:", CFSTR("DisplayBrightnessAuto"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("DisplayBrightnessAuto")), "BOOLValue");
    v28->_ABStateBackup = v4 & 1;
    if (!v28->_ABStateBackup)
    {
      -[CBAODModule getFloatValueFrom:key:](v28, "getFloatValueFrom:key:", v23, CFSTR("PendingDisplayNits"));
      v22 = v5;
      if (v28->super._logHandle)
      {
        v10 = v28->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v9 = init_default_corebrightness_log();
        v10 = v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v29, COERCE__INT64(v22));
        _os_log_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEFAULT, "AB is off -> backup AB state and set Nits cap to %f", v29, 0xCu);
      }
      v6 = +[CBAODState sharedInstance](CBAODState, "sharedInstance");
      *(float *)&v7 = v22;
      -[CBAODState setNitsCap:](v6, "setNitsCap:", v7);
    }
  }
  if (v28->_backupState)
  {

    v28->_backupState = 0;
  }
  v8 = (NSDictionary *)v23;
  v28->_backupState = v8;
  -[CBAODState setProperty:forKey:](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "setProperty:forKey:", objc_msgSend(v23, "objectForKey:"), CFSTR("AOTCurve"));
  -[CBAODTransitionController setInitialState:](v28->_transitionController, "setInitialState:", v23);

  objc_autoreleasePoolPop(v21);
}

- (void)enteringAODRoutineForDisplayMode:(int64_t)a3 transitionParameters:(id *)a4
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  CBAODModule *v9;
  CBAODTransitionController *transitionController;
  CBAODModule *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  uint8_t v24[7];
  os_log_type_t v25;
  os_log_t oslog;
  _BYTE v27[48];
  uint64_t v28;
  int v29;
  int v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  CBAODModule *v33;
  int64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  CBAODModule *v40;
  int64_t v41;
  char v42;
  os_log_type_t v43;
  os_log_t v44;
  id v45;
  id v46;
  uint8_t v47[15];
  os_log_type_t v48;
  NSObject *v49;
  _BYTE __dst[48];
  id v51;
  uint8_t v52[7];
  os_log_type_t v53;
  NSObject *v54;
  $9424C94D2D96C890884F5126E9ED469E *v55;
  int64_t v56;
  SEL v57;
  CBAODModule *v58;
  uint8_t v59[24];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v58 = self;
  v57 = a2;
  v56 = a3;
  v55 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v54 = 0;
  if (v58->super._logHandle)
  {
    logHandle = v58->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v54 = logHandle;
  v53 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v54;
    type = v53;
    __os_log_helper_16_0_0(v52);
    _os_log_impl(&dword_1B5291000, log, type, "[AOD routine]: entering AOD", v52, 2u);
  }
  -[CBAODModule setModulesProperty:forKey:](v58, "setModulesProperty:forKey:", &unk_1E69168C8, CFSTR("DynamicSliderEnable"));
  v51 = 0;
  v51 = -[CBAODTransitionController copyContext](v58->_transitionController, "copyContext");
  memcpy(__dst, a4, sizeof(__dst));
  -[CBAODModule updateModulesAODState:transitionParameters:context:](v58, "updateModulesAODState:transitionParameters:context:", 3, __dst, v51);

  if (!v58->_ABStateBackup)
  {
    v49 = 0;
    if (v58->super._logHandle)
    {
      v17 = v58->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v16 = init_default_corebrightness_log();
      v17 = v16;
    }
    v49 = v17;
    v48 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v49;
      v15 = v48;
      __os_log_helper_16_0_0(v47);
      _os_log_impl(&dword_1B5291000, v14, v15, "Override AB to ON in AOD.", v47, 2u);
    }
    -[CBAODModule setModulesProperty:forKey:](v58, "setModulesProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("DisplayBrightnessAuto"));
  }
  -[CBAODModule setModulesProperty:forKey:](v58, "setModulesProperty:forKey:", &unk_1E69168B0, CFSTR("ForceModuleUpdate"));
  v46 = -[CBAODModule copyModulesPropertyForKey:](v58, "copyModulesPropertyForKey:");
  -[CBAODState setProperty:forKey:](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "setProperty:forKey:", v46, CFSTR("AODDarkerCurve"));

  v45 = -[CBAODModule copyModulesInfo:](v58, "copyModulesInfo:", 0);
  v44 = 0;
  if (v58->super._logHandle)
  {
    v13 = v58->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v12 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v12 = init_default_corebrightness_log();
    v13 = v12;
  }
  v44 = v13;
  v43 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v45);
    _os_log_impl(&dword_1B5291000, v44, v43, "ENTERING AOD - Target modules info: \n %@", v59, 0xCu);
  }
  objc_msgSend(v45, "objectForKey:", CFSTR("TrustedLux"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v58;
    objc_msgSend((id)objc_msgSend(v45, "objectForKey:", CFSTR("TrustedLux")), "floatValue");
    -[CBAODModule reevaluatePThresholdsForLux:](v11, "reevaluatePThresholdsForLux:");
  }
  -[CBAODModule setModulesProperty:forKey:](v58, "setModulesProperty:forKey:", &unk_1E69168C8, CFSTR("Aggressivity"));
  v9 = v58;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CBAODState thresholdPCCLuxDelta](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdPCCLuxDelta");
  -[CBAODModule setModulesProperty:forKey:](v9, "setModulesProperty:forKey:", objc_msgSend(v8, "numberWithFloat:"), CFSTR("AAPLuxDelta"));
  v42 = 0;
  transitionController = v58->_transitionController;
  v35 = MEMORY[0x1E0C809B0];
  v36 = -1073741824;
  v37 = 0;
  v38 = __69__CBAODModule_enteringAODRoutineForDisplayMode_transitionParameters___block_invoke;
  v39 = &unk_1E68EA3D8;
  v40 = v58;
  v41 = v56;
  v28 = MEMORY[0x1E0C809B0];
  v29 = -1073741824;
  v30 = 0;
  v31 = __69__CBAODModule_enteringAODRoutineForDisplayMode_transitionParameters___block_invoke_191;
  v32 = &unk_1E68EA3D8;
  v33 = v58;
  v34 = v56;
  memcpy(v27, a4, sizeof(v27));
  v42 = -[CBAODTransitionController startTransition:transitionParameters:rampDoneCallback:rampCanceledCallback:](transitionController, "startTransition:transitionParameters:rampDoneCallback:rampCanceledCallback:", v45, v27, &v35, &v28);
  if (!v42)
  {
    oslog = 0;
    if (v58->super._logHandle)
    {
      v7 = v58->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    oslog = v7;
    v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v4 = oslog;
      v5 = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_impl(&dword_1B5291000, v4, v5, "This change doesn't trigger transition -> start AOD ON routine", v24, 2u);
    }
    -[CBAODModule onAODRoutineForDisplayMode:](v58, "onAODRoutineForDisplayMode:", v56, v4);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __69__CBAODModule_enteringAODRoutineForDisplayMode_transitionParameters___block_invoke(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = 0;
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
  v9 = v5;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "AOD enter transition is done -> start AOD ON routine", v7, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "onAODRoutineForDisplayMode:", *(_QWORD *)(a1 + 40));
}

uint64_t __69__CBAODModule_enteringAODRoutineForDisplayMode_transitionParameters___block_invoke_191(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = 0;
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
  v9 = v5;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "AOD enter transition was canceled -> start AOD ON routine", v7, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "onAODRoutineForDisplayMode:", *(_QWORD *)(a1 + 40));
}

- (void)onAODRoutineForDisplayMode:(int64_t)a3
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  uint8_t v8[15];
  os_log_type_t v9;
  NSObject *v10;
  int64_t v11;
  SEL v12;
  CBAODModule *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v10 = 0;
  if (v13->super._logHandle)
  {
    logHandle = v13->super._logHandle;
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
    _os_log_impl(&dword_1B5291000, log, type, "[AOD routine]: AOD is ON", v8, 2u);
  }
  -[CBAODModule setModulesProperty:forKey:](v13, "setModulesProperty:forKey:", &unk_1E69168C8, CFSTR("AutoBrightnessLuxFilter"));
  -[CBAODModule updateModulesAODState:](v13, "updateModulesAODState:", 1);
  -[CBAODModule didCompleteTransitionToDisplayMode:](v13, "didCompleteTransitionToDisplayMode:", v11);
  -[CBAODModule copyAndHandleEvent](v13, "copyAndHandleEvent");
  -[CBAODState releasePowerAssertion](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "releasePowerAssertion");
  objc_autoreleasePoolPop(context);
}

- (void)enteringSuppressedAODRoutineWithTransitionParameters:(id *)a3
{
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  CBAODModule *v8;
  CBAODTransitionController *transitionController;
  CBAODModule *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  uint8_t v23[15];
  os_log_type_t v24;
  os_log_t oslog;
  _BYTE v26[48];
  uint64_t v27;
  int v28;
  int v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  CBAODModule *v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  CBAODModule *v38;
  char v39;
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  uint8_t v43[7];
  os_log_type_t v44;
  NSObject *v45;
  _BYTE __dst[48];
  uint8_t v47[15];
  os_log_type_t v48;
  NSObject *v49;
  $9424C94D2D96C890884F5126E9ED469E *v50;
  SEL v51;
  CBAODModule *v52;
  uint8_t v53[24];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v52 = self;
  v51 = a2;
  v50 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v49 = 0;
  if (v52->super._logHandle)
  {
    logHandle = v52->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v49 = logHandle;
  v48 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v49;
    type = v48;
    __os_log_helper_16_0_0(v47);
    _os_log_impl(&dword_1B5291000, log, type, "[AOD routine]: entering Suppressed AOD", v47, 2u);
  }
  -[CBAODModule setModulesProperty:forKey:](v52, "setModulesProperty:forKey:", &unk_1E69168C8, CFSTR("DynamicSliderEnable"));
  memcpy(__dst, a3, sizeof(__dst));
  -[CBAODModule updateModulesAODState:transitionParameters:](v52, "updateModulesAODState:transitionParameters:", 3, __dst);
  if (!v52->_ABStateBackup)
  {
    v45 = 0;
    if (v52->super._logHandle)
    {
      v16 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v15 = init_default_corebrightness_log();
      v16 = v15;
    }
    v45 = v16;
    v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v45;
      v14 = v44;
      __os_log_helper_16_0_0(v43);
      _os_log_impl(&dword_1B5291000, v13, v14, "Override AB to ON in AOD.", v43, 2u);
    }
    -[CBAODModule setModulesProperty:forKey:](v52, "setModulesProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("DisplayBrightnessAuto"));
  }
  -[CBAODModule setModulesProperty:forKey:](v52, "setModulesProperty:forKey:", &unk_1E69168B0, CFSTR("ForceModuleUpdate"));
  v42 = -[CBAODModule copyModulesInfo:](v52, "copyModulesInfo:", 0);
  v41 = 0;
  if (v52->super._logHandle)
  {
    v12 = v52->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v11 = init_default_corebrightness_log();
    v12 = v11;
  }
  v41 = v12;
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v42);
    _os_log_impl(&dword_1B5291000, v41, v40, "ENTERING Suppressed AOD - Target modules info: \n %@", v53, 0xCu);
  }
  objc_msgSend(v42, "objectForKey:", CFSTR("TrustedLux"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v52;
    objc_msgSend((id)objc_msgSend(v42, "objectForKey:", CFSTR("TrustedLux")), "floatValue");
    -[CBAODModule reevaluatePThresholdsForLux:](v10, "reevaluatePThresholdsForLux:");
  }
  -[CBAODModule setModulesProperty:forKey:](v52, "setModulesProperty:forKey:", &unk_1E69168C8, CFSTR("Aggressivity"));
  v8 = v52;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CBAODState thresholdPCCLuxDelta](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdPCCLuxDelta");
  -[CBAODModule setModulesProperty:forKey:](v8, "setModulesProperty:forKey:", objc_msgSend(v7, "numberWithFloat:"), CFSTR("AAPLuxDelta"));
  v39 = 0;
  transitionController = v52->_transitionController;
  v33 = MEMORY[0x1E0C809B0];
  v34 = -1073741824;
  v35 = 0;
  v36 = __68__CBAODModule_enteringSuppressedAODRoutineWithTransitionParameters___block_invoke;
  v37 = &unk_1E68E9E60;
  v38 = v52;
  v27 = MEMORY[0x1E0C809B0];
  v28 = -1073741824;
  v29 = 0;
  v30 = __68__CBAODModule_enteringSuppressedAODRoutineWithTransitionParameters___block_invoke_192;
  v31 = &unk_1E68E9E60;
  v32 = v52;
  memcpy(v26, a3, sizeof(v26));
  v39 = -[CBAODTransitionController startTransition:transitionParameters:rampDoneCallback:rampCanceledCallback:](transitionController, "startTransition:transitionParameters:rampDoneCallback:rampCanceledCallback:", v42, v26, &v33, &v27);
  if (!v39)
  {
    oslog = 0;
    if (v52->super._logHandle)
    {
      v6 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v5 = init_default_corebrightness_log();
      v6 = v5;
    }
    oslog = v6;
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog;
      v4 = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_impl(&dword_1B5291000, v3, v4, "This change doesn't trigger transition -> start AOD ON + suppressed routine", v23, 2u);
    }
    -[CBAODModule onSuppresedAODRoutine](v52, "onSuppresedAODRoutine", v3);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __68__CBAODModule_enteringSuppressedAODRoutineWithTransitionParameters___block_invoke(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = 0;
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
  v9 = v5;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "AOD suppressed enter transition is done -> start AOD ON + suppressed routine", v7, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "onSuppresedAODRoutine");
}

uint64_t __68__CBAODModule_enteringSuppressedAODRoutineWithTransitionParameters___block_invoke_192(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = 0;
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
  v9 = v5;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "AOD suppressed enter transition was canceled -> start AOD ON + suppressed routine", v7, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "onSuppresedAODRoutine");
}

- (void)onSuppresedAODRoutine
{
  double v2;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *v7;
  uint8_t v8[7];
  os_log_type_t v9;
  NSObject *v10;
  SEL v11;
  CBAODModule *v12;

  v12 = self;
  v11 = a2;
  v7 = (void *)MEMORY[0x1B5E4A8B0]();
  v10 = 0;
  if (v12->super._logHandle)
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
    _os_log_impl(&dword_1B5291000, log, type, "[AOD routine]: AOD suppressed is ON", v8, 2u);
  }
  -[CBAODModule setModulesProperty:forKey:](v12, "setModulesProperty:forKey:", &unk_1E69168C8, CFSTR("AutoBrightnessLuxFilter"));
  -[CBAODModule updateModulesAODState:](v12, "updateModulesAODState:", 1);
  -[CBAODTransitionController setDisplayON:](v12->_transitionController, "setDisplayON:", 0);
  if (v12->_flipBookEnabled)
  {
    -[CBAODModule didCompleteTransitionToDisplayMode:](v12, "didCompleteTransitionToDisplayMode:", 2);
  }
  else
  {
    LODWORD(v2) = 1028443341;
    -[CBAODModule scheduleDisplayModeCompletionTimerIn:forDisplayMode:](v12, "scheduleDisplayModeCompletionTimerIn:forDisplayMode:", 2, v2);
  }
  -[CBAODState releasePowerAssertion](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "releasePowerAssertion");
  objc_autoreleasePoolPop(v7);
}

- (void)exitingAODRoutineForDisplayMode:(int64_t)a3 transitionParameters:(id *)a4
{
  double v4;
  CBAODState *v5;
  double v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  CBAODTransitionController *transitionController;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  uint8_t v31[7];
  os_log_type_t v32;
  os_log_t oslog;
  _BYTE v34[48];
  uint64_t v35;
  int v36;
  int v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  CBAODModule *v40;
  int64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  CBAODModule *v47;
  int64_t v48;
  char v49;
  os_log_type_t v50;
  os_log_t v51;
  id v52;
  id v53;
  os_log_type_t v54;
  os_log_t v55;
  uint8_t v56[15];
  os_log_type_t v57;
  NSObject *v58;
  _BYTE __dst[48];
  id v60;
  uint8_t v61[7];
  os_log_type_t v62;
  NSObject *v63;
  $9424C94D2D96C890884F5126E9ED469E *v64;
  int64_t v65;
  SEL v66;
  CBAODModule *v67;
  uint8_t v68[16];
  uint8_t v69[40];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v67 = self;
  v66 = a2;
  v65 = a3;
  v64 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v63 = 0;
  if (v67->super._logHandle)
  {
    logHandle = v67->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v63 = logHandle;
  v62 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v63;
    type = v62;
    __os_log_helper_16_0_0(v61);
    _os_log_impl(&dword_1B5291000, log, type, "[AOD routine]: exiting AOD", v61, 2u);
  }
  -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", &unk_1E69168B0, CFSTR("DynamicSliderEnable"));
  v60 = 0;
  v60 = -[CBAODTransitionController copyContext](v67->_transitionController, "copyContext");
  memcpy(__dst, a4, sizeof(__dst));
  -[CBAODModule updateModulesAODState:transitionParameters:context:](v67, "updateModulesAODState:transitionParameters:context:", 4, __dst, v60);

  if (!v67->_ABStateBackup)
  {
    v58 = 0;
    if (v67->super._logHandle)
    {
      v24 = v67->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v23 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v23 = init_default_corebrightness_log();
      v24 = v23;
    }
    v58 = v24;
    v57 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v58;
      v22 = v57;
      __os_log_helper_16_0_0(v56);
      _os_log_impl(&dword_1B5291000, v21, v22, "Set AB to OFF", v56, 2u);
    }
    -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("DisplayBrightnessAuto"));
    if (!v67->_dominoModeEnabled)
    {
      *(float *)&v4 = v67->_displayBrightnessBackup;
      -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("DisplayNitsKey"));
    }
  }
  if (v67->_backupState)
  {
    v55 = 0;
    if (v67->super._logHandle)
    {
      v20 = v67->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v19 = init_default_corebrightness_log();
      v20 = v19;
    }
    v55 = v20;
    v54 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:", CFSTR("ALSBrightenPdeltaFast"));
      v18 = -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:", CFSTR("ALSBrightenPdeltaSlow"));
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v69, v17, v18, (uint64_t)-[NSDictionary objectForKey:](v67->_backupState, "objectForKey:", CFSTR("ALSDimPdeltaSlow")));
      _os_log_impl(&dword_1B5291000, v55, v54, "AP thresholds: Recover P thresholds from backup: BrightenPdeltaFast = %@, BrightenPdeltaSlow = %@, DimPdeltaSlow = %@", v69, 0x20u);
    }
    v53 = 0;
    v16 = objc_alloc(MEMORY[0x1E0C99D80]);
    v15 = -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:");
    v14 = -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:");
    v53 = (id)objc_msgSend(v16, "initWithObjectsAndKeys:", v15, CFSTR("ALSBrightenPdeltaFast"), v14, CFSTR("ALSBrightenPdeltaSlow"), -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:"), CFSTR("ALSDimPdeltaSlow"), 0);
    -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", v53, CFSTR("ALSInternalSettings"));
    -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:", CFSTR("Aggressivity"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:"), CFSTR("Aggressivity"));
    -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:", CFSTR("AAPLuxDelta"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:"), CFSTR("AAPLuxDelta"));
    -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:", CFSTR("CEEnable"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:"), CFSTR("CEEnable"));

  }
  v5 = +[CBAODState sharedInstance](CBAODState, "sharedInstance");
  LODWORD(v6) = -1.0;
  -[CBAODState setNitsCap:](v5, "setNitsCap:", v6);
  v52 = -[CBAODModule copyModulesInfo:](v67, "copyModulesInfo:", 0);
  v51 = 0;
  if (v67->super._logHandle)
  {
    v13 = v67->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v12 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v12 = init_default_corebrightness_log();
    v13 = v12;
  }
  v51 = v13;
  v50 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v52);
    _os_log_impl(&dword_1B5291000, v51, v50, "EXITING AOD - Target modules info: \n %@", v68, 0xCu);
  }
  v49 = 0;
  transitionController = v67->_transitionController;
  v42 = MEMORY[0x1E0C809B0];
  v43 = -1073741824;
  v44 = 0;
  v45 = __68__CBAODModule_exitingAODRoutineForDisplayMode_transitionParameters___block_invoke;
  v46 = &unk_1E68EA3D8;
  v47 = v67;
  v48 = v65;
  v35 = MEMORY[0x1E0C809B0];
  v36 = -1073741824;
  v37 = 0;
  v38 = __68__CBAODModule_exitingAODRoutineForDisplayMode_transitionParameters___block_invoke_201;
  v39 = &unk_1E68EA3D8;
  v40 = v67;
  v41 = v65;
  memcpy(v34, a4, sizeof(v34));
  v49 = -[CBAODTransitionController startTransition:transitionParameters:rampDoneCallback:rampCanceledCallback:](transitionController, "startTransition:transitionParameters:rampDoneCallback:rampCanceledCallback:", v52, v34, &v42, &v35);
  if (!v49)
  {
    oslog = 0;
    if (v67->super._logHandle)
    {
      v10 = v67->super._logHandle;
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
    v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v32;
      __os_log_helper_16_0_0(v31);
      _os_log_impl(&dword_1B5291000, v7, v8, "This change doesn't trigger transition -> start AOD OFF routine", v31, 2u);
    }
    -[CBAODModule offAODRoutineForDisplayMode:](v67, "offAODRoutineForDisplayMode:", v65);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __68__CBAODModule_exitingAODRoutineForDisplayMode_transitionParameters___block_invoke(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = 0;
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
  v9 = v5;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "Exit transition done -> start AOD OFF routine", v7, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "offAODRoutineForDisplayMode:", *(_QWORD *)(a1 + 40));
}

uint64_t __68__CBAODModule_exitingAODRoutineForDisplayMode_transitionParameters___block_invoke_201(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = 0;
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
  v9 = v5;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "AOD exit transition was canceled -> start AOD OFF routine", v7, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "offAODRoutineForDisplayMode:", *(_QWORD *)(a1 + 40));
}

- (void)offAODRoutineForDisplayMode:(int64_t)a3
{
  double v3;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  id v9;
  uint8_t v10[15];
  os_log_type_t v11;
  NSObject *v12;
  int64_t v13;
  SEL v14;
  CBAODModule *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v12 = 0;
  if (v15->super._logHandle)
  {
    logHandle = v15->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v12 = logHandle;
  v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v12;
    type = v11;
    __os_log_helper_16_0_0(v10);
    _os_log_impl(&dword_1B5291000, log, type, "[AOD routine]: AOD is OFF", v10, 2u);
  }
  -[CBAODModule setModulesProperty:forKey:](v15, "setModulesProperty:forKey:", &unk_1E69176C8, CFSTR("ALSInternalSettings"));
  -[CBAODModule setModulesProperty:forKey:](v15, "setModulesProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15->_ABLuxFilterBackup), CFSTR("AutoBrightnessLuxFilter"));
  v9 = -[CBAODTransitionController copyContext](v15->_transitionController, "copyContext");
  -[CBAODModule updateModulesAODState:context:](v15, "updateModulesAODState:context:", 0, v9);

  -[CBAODModule setModulesProperty:forKey:](v15, "setModulesProperty:forKey:", &unk_1E69168E0, CFSTR("DisplayBrightnessFadePeriodOverride"));
  -[CBAODModule setALSServiceProperty:forKey:](v15, "setALSServiceProperty:forKey:", *MEMORY[0x1E0C9AE40], CFSTR("AODALSMode"));
  if (!v13 || v13 == 2)
    -[CBAODTransitionController setDisplayON:](v15->_transitionController, "setDisplayON:", 0);
  if (v15->_flipBookEnabled || v13)
  {
    -[CBAODModule didCompleteTransitionToDisplayMode:](v15, "didCompleteTransitionToDisplayMode:", v13);
  }
  else
  {
    LODWORD(v3) = 1028443341;
    -[CBAODModule scheduleDisplayModeCompletionTimerIn:forDisplayMode:](v15, "scheduleDisplayModeCompletionTimerIn:forDisplayMode:", 0, v3);
  }
  -[CBAODState releasePowerAssertion](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "releasePowerAssertion");
  objc_autoreleasePoolPop(context);
}

- (void)didCompleteTransitionToDisplayMode:(int64_t)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[7];
  char v11;
  NSObject *v12;
  os_log_type_t v13;
  os_log_t v14;
  id v15;
  int64_t v16;
  SEL v17;
  CBAODModule *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
  -[CBAODModule sendNotificationForKey:andValue:](v18, "sendNotificationForKey:andValue:", CFSTR("DisplayModeChangeComplete"), v15);

  v14 = 0;
  if (v18->super._logHandle)
  {
    logHandle = v18->super._logHandle;
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
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v16));
    _os_log_impl(&dword_1B5291000, v14, v13, "[Display Mode] didCompleteTransitionToDisplayMode %@", v19, 0xCu);
  }
  if (v16 == 2)
  {
    -[CBAODModule setALSServiceProperty:forKey:](v18, "setALSServiceProperty:forKey:", &unk_1E69168F8, CFSTR("ALSMedianHistorySize"));
  }
  else if (v16 == 1)
  {
    -[CBAODModule setALSServiceProperty:forKey:](v18, "setALSServiceProperty:forKey:", &unk_1E6916910, CFSTR("ALSMedianHistorySize"));
  }
  else if (v16 == 3 && v18->_flipBookEnabled)
  {
    v12 = 0;
    if (v18->super._logHandle)
    {
      v7 = v18->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    v12 = v7;
    v11 = 16;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v4 = v12;
      v5 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1B5291000, v4, v5, "Warning: Flipbook enabled in Active On mode.", v10, 2u);
    }
    -[CBAODModule setProperty:forKey:](v18, "setProperty:forKey:", &unk_1E6916928, CFSTR("FlipBookState"));
    -[CBAODModule setProperty:forKey:](v18, "setProperty:forKey:", &unk_1E6916940, v3);
  }
}

- (id)copyModulesInfo:(BOOL)a3
{
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  CBAODModule *v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  SEL v14;
  CBAODModule *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = 0;
  if (v13)
    v11 = -[CBAODModule copyModulesExtendedIdentifiers](v15, "copyModulesExtendedIdentifiers");
  else
    v11 = -[CBAODModule copyModulesIdentifiers](v15, "copyModulesIdentifiers");
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __31__CBAODModule_copyModulesInfo___block_invoke;
  v8 = &unk_1E68EA760;
  v9 = v15;
  v10 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v4);

  return v12;
}

void __31__CBAODModule_copyModulesInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "copyModulesPropertyForKey:", a2);
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, a2);

    }
  }
}

- (id)copyModulesIdentifiers
{
  SEL v3;
  CBAODModule *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("DisplayBrightness"), CFSTR("DisplayAAPFactor"), CFSTR("TrustedLux"), CFSTR("ColorRamp"), 0);
}

- (id)copyModulesExtendedIdentifiers
{
  SEL v3;
  CBAODModule *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("DisplayBrightness"), CFSTR("PendingDisplayNits"), CFSTR("DisplayPanelLuminanceMin"), CFSTR("DisplayPanelLuminanceMax"), CFSTR("DisplayBrightnessAuto"), CFSTR("DisplayAAPFactor"), CFSTR("TrustedLux"), CFSTR("DynamicSliderEnable"), CFSTR("ALSInternalSettings"), CFSTR("AOTCurve"), CFSTR("ALSBrightenPdeltaSlow"), CFSTR("ALSBrightenPdeltaFast"), CFSTR("ALSDimPdeltaSlow"), CFSTR("Aggressivity"), CFSTR("AAPLuxDelta"), CFSTR("AutoBrightnessLuxFilter"), CFSTR("ColorRamp"),
               CFSTR("CEEnable"),
               0);
}

- (void)updateModulesAODState:(unint64_t)a3
{
  _BYTE __dst[48];
  _BYTE __b[48];
  unint64_t v5;
  SEL v6;
  CBAODModule *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  memset(__b, 0, sizeof(__b));
  memcpy(__dst, __b, sizeof(__dst));
  -[CBAODModule updateModulesAODState:transitionParameters:](v7, "updateModulesAODState:transitionParameters:", v5, __dst);
}

- (void)updateModulesAODState:(unint64_t)a3 context:(id)a4
{
  _BYTE __dst[48];
  _BYTE __b[48];
  id v6;
  unint64_t v7;
  SEL v8;
  CBAODModule *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  memset(__b, 0, sizeof(__b));
  memcpy(__dst, __b, sizeof(__dst));
  -[CBAODModule updateModulesAODState:transitionParameters:context:](v9, "updateModulesAODState:transitionParameters:context:", v7, __dst, v6);
}

- (void)updateModulesAODState:(unint64_t)a3 transitionParameters:(id *)a4
{
  _BYTE __dst[48];
  $9424C94D2D96C890884F5126E9ED469E *v7;
  unint64_t v8;
  SEL v9;
  CBAODModule *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  memcpy(__dst, a4, sizeof(__dst));
  -[CBAODModule updateModulesAODState:transitionParameters:context:](self, "updateModulesAODState:transitionParameters:context:", a3, __dst, 0);
}

- (void)updateModulesAODState:(unint64_t)a3 transitionParameters:(id *)a4 context:(id)a5
{
  NSMutableArray *modules;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  _BYTE v15[48];
  os_log_type_t v16;
  os_log_t v17;
  id v18;
  $9424C94D2D96C890884F5126E9ED469E *v19;
  unint64_t v20;
  SEL v21;
  CBAODModule *v22;
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = self;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  v18 = a5;
  if (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") != a3)
  {
    -[CBAODState setAODState:](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "setAODState:", v20);
    v17 = 0;
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
    v17 = logHandle;
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v23, (uint64_t)-[CBAODState AODStateString](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODStateString"), -[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState"));
      _os_log_impl(&dword_1B5291000, v17, v16, "AOD %s (State update = %lu)", v23, 0x16u);
    }
    modules = v22->_modules;
    v9 = MEMORY[0x1E0C809B0];
    v10 = -1073741824;
    v11 = 0;
    v12 = __66__CBAODModule_updateModulesAODState_transitionParameters_context___block_invoke;
    v13 = &unk_1E68EAA58;
    memcpy(v15, a4, sizeof(v15));
    v14 = v18;
    -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:", &v9);
  }
}

uint64_t __66__CBAODModule_updateModulesAODState_transitionParameters_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  unint64_t v3;
  double v4;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12BA58);
  if ((result & 1) != 0)
  {
    v3 = -[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState");
    LODWORD(v4) = *(_DWORD *)(a1 + 44);
    return objc_msgSend(a2, "handleAODStateUpdate:transitionTime:context:", v3, *(_QWORD *)(a1 + 32), v4);
  }
  return result;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if ((-[__IOHIDServiceClient conformsToUsagePage:usage:](a3, "conformsToUsagePage:usage:", 65280, 4) & 1) != 0)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Received ALS service - save it! %@", v10, 0xCu);
    }
    if ((-[NSMutableArray containsObject:](self->_alsServiceClients, "containsObject:", a3) & 1) == 0)
      -[NSMutableArray addObject:](self->_alsServiceClients, "addObject:", a3);
    v7 = 1;
  }
  return (v7 & 1 | -[CBAODThresholdModule addHIDServiceClient:](self->_thresholdModule, "addHIDServiceClient:", a3)) != 0;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if ((-[NSMutableArray containsObject:](self->_alsServiceClients, "containsObject:", a3) & 1) != 0)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Remove ALS service! %@", v10, 0xCu);
    }
    -[NSMutableArray removeObject:](self->_alsServiceClients, "removeObject:", a3);
    v7 = 1;
  }
  return (v7 & 1 | -[CBAODThresholdModule removeHIDServiceClient:](self->_thresholdModule, "removeHIDServiceClient:", a3)) != 0;
}

- (BOOL)handleALSEvent:(id)a3 transitionParameters:(id *)a4
{
  double v4;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  _BYTE __dst[51];
  os_log_type_t v12;
  os_log_t v13;
  char v14;
  os_log_type_t v15;
  os_log_t v16;
  BOOL v17;
  $9424C94D2D96C890884F5126E9ED469E *v18;
  id v19;
  SEL v20;
  CBAODModule *v21;
  uint8_t v22[16];
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = 0;
  if (a3
    && (-[NSMutableArray containsObject:](v21->_alsServiceClients, "containsObject:", objc_msgSend(v19, "service")) & 1) != 0)
  {
    v16 = 0;
    if (v21->super._logHandle)
    {
      logHandle = v21->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v16 = logHandle;
    v15 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, (uint64_t)v19);
      _os_log_debug_impl(&dword_1B5291000, v16, v15, "Incoming event %@", v23, 0xCu);
    }
    v14 = 0;
    if (v21->_currentALSEvent)
    {
      v14 = 1;

      v21->_currentALSEvent = (CBALSEvent *)v19;
    }
    else
    {
      v21->_currentALSEvent = (CBALSEvent *)v19;
      v14 = 1;
    }
    -[CBALSEvent illuminance](v21->_currentALSEvent, "illuminance");
    *(float *)&v4 = v4;
    -[CBAODModule reevaluatePThresholdsForLux:](v21, "reevaluatePThresholdsForLux:", v4);
    if (!a4->var1 && ((v14 & 1) != 0 || a4->var0))
    {
      v13 = 0;
      if (v21->super._logHandle)
      {
        v7 = v21->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v6 = init_default_corebrightness_log();
        v7 = v6;
      }
      v13 = v7;
      v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)v21->_currentALSEvent);
        _os_log_impl(&dword_1B5291000, v13, v12, "Check modules update for ALS: %@", v22, 0xCu);
      }
      memcpy(__dst, a4, 0x30uLL);
      -[CBAODModule performUpdateWithTransitionParameters:](v21, "performUpdateWithTransitionParameters:", __dst);
    }
    return 1;
  }
  return v17;
}

- (BOOL)copyAndHandleEvent
{
  double v2;

  LODWORD(v2) = -1.0;
  return -[CBAODModule copyAndHandleEventWithTransitionLength:](self, "copyAndHandleEventWithTransitionLength:", v2, a2, self);
}

- (BOOL)copyAndHandleEventWithTransitionLength:(float)a3
{
  return -[CBAODModule copyAndHandleEventWithTransitionLength:forceUpdate:](self, "copyAndHandleEventWithTransitionLength:forceUpdate:", 0, *(double *)&a3);
}

- (BOOL)copyAndHandleEventWithTransitionLength:(float)a3 forceUpdate:(BOOL)a4
{
  _BYTE __dst[48];
  _DWORD __b[12];
  BOOL v7;
  float v8;
  SEL v9;
  CBAODModule *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  memset(__b, 0, sizeof(__b));
  LOBYTE(__b[0]) = v7;
  HIBYTE(__b[0]) = v8 >= 0.0;
  *(float *)&__b[1] = v8;
  memcpy(__dst, __b, sizeof(__dst));
  return -[CBAODModule copyAndHandleEventWithTransitionParameters:](v10, "copyAndHandleEventWithTransitionParameters:", __dst);
}

- (BOOL)copyAndHandleEventWithTransitionParameters:(id *)a3
{
  char v4;
  NSObject *v5;
  os_signpost_type_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  NSObject *v9;
  NSMutableArray *alsServiceClients;
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v17[8];
  unint64_t v18;
  char v19;
  os_log_t v20;
  uint64_t v21;
  int v22;
  int v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v25;
  CBAODModule *v26;
  uint64_t *v27;
  _BYTE v28[48];
  uint64_t v29;
  uint64_t *v30;
  int v31;
  int v32;
  char v33;
  uint8_t v34[16];
  unint64_t v35;
  char v36;
  NSObject *v37;
  $9424C94D2D96C890884F5126E9ED469E *v38;
  SEL v39;
  CBAODModule *v40;

  v40 = self;
  v39 = a2;
  v38 = a3;
  v37 = 0;
  if (self->super._logHandle)
  {
    logHandle = v40->super._logHandle;
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
  v36 = 1;
  v35 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    log = v37;
    type = v36;
    spid = v35;
    __os_log_helper_16_0_0(v34);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "copyAndHandleEvent", (const char *)&unk_1B546AB41, v34, 2u);
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x20000000;
  v32 = 32;
  v33 = 0;
  alsServiceClients = v40->_alsServiceClients;
  v21 = MEMORY[0x1E0C809B0];
  v22 = -1073741824;
  v23 = 0;
  v24 = __58__CBAODModule_copyAndHandleEventWithTransitionParameters___block_invoke;
  v25 = &unk_1E68EAA80;
  v26 = v40;
  memcpy(v28, a3, sizeof(v28));
  v27 = &v29;
  -[NSMutableArray enumerateObjectsUsingBlock:](alsServiceClients, "enumerateObjectsUsingBlock:", &v21);
  v20 = 0;
  if (v40->super._logHandle)
  {
    v9 = v40->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v8 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v8 = init_default_corebrightness_log();
    v9 = v8;
  }
  v20 = v9;
  v19 = 2;
  v18 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v9))
  {
    v5 = v20;
    v6 = v19;
    v7 = v18;
    __os_log_helper_16_0_0(v17);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v5, v6, v7, "copyAndHandleEvent", (const char *)&unk_1B546AB41, v17, 2u);
  }
  v4 = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v29, 8);
  return v4 & 1;
}

void __58__CBAODModule_copyAndHandleEventWithTransitionParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t inited;
  NSObject *v11;
  uint8_t v13[7];
  os_log_type_t v14;
  os_log_t v15;
  _BYTE __dst[48];
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  uint64_t v22;
  CFTypeRef v23;
  os_log_type_t type;
  os_log_t oslog;
  id v26;
  CFTypeRef cf;
  CFTypeRef VendorDefinedEvent;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t v34[184];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33 = a1;
  v32 = a2;
  v31 = a3;
  v30 = a4;
  v29 = a1;
  memset(&v34[15], 0, 0xA9uLL);
  mach_absolute_time();
  VendorDefinedEvent = (CFTypeRef)IOHIDEventCreateVendorDefinedEvent();
  if (VendorDefinedEvent)
  {
    cf = (CFTypeRef)IOHIDServiceClientCopyEvent();
    CFRelease(VendorDefinedEvent);
    if (cf)
    {
      v26 = 0;
      v26 = (id)objc_msgSend(*(id *)(a1 + 32), "copyModulesPropertyForKey:", CFSTR("ALSIntegrationMode"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || objc_msgSend(v26, "intValue") != 2 && objc_msgSend(v26, "intValue") != 1)
      {
        +[CBALSEvent replaceLuxWithFilteredLux:](CBALSEvent, "replaceLuxWithFilteredLux:", cf);
      }

      oslog = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
      {
        v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v11 = inited;
      }
      oslog = v11;
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)cf);
        _os_log_impl(&dword_1B5291000, oslog, type, "Copied event %@", v34, 0xCu);
      }
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v17 = MEMORY[0x1E0C809B0];
      v18 = -1073741824;
      v19 = 0;
      v20 = __58__CBAODModule_copyAndHandleEventWithTransitionParameters___block_invoke_229;
      v21 = &unk_1E68EA608;
      v23 = cf;
      v22 = v32;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v17);
      v9 = *(void **)(a1 + 32);
      memcpy(__dst, (const void *)(a1 + 48), sizeof(__dst));
      objc_msgSend(v9, "handleHIDEvent:from:transitionParameters:", cf, v32, __dst);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      CFRelease(cf);
    }
    else
    {
      v15 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
      {
        v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
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
      v14 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v5 = v15;
        v6 = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1B5291000, v5, v6, "Failed to copy kIOHIDEventTypeAmbientLightSensor event", v13, 2u);
      }
    }
  }
}

uint64_t __58__CBAODModule_copyAndHandleEventWithTransitionParameters___block_invoke_229(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "handleHIDEvent:from:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  return result;
}

- (float)getFloatValueFrom:(id)a3 key:(id)a4
{
  float v4;
  NSObject *oslog;
  void *v7;
  float v8;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0.0;
  v7 = (void *)objc_msgSend(a3, "objectForKey:", a4);
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "floatValue");
    return v4;
  }
  else
  {
    oslog = self->super._logHandle;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v11, (uint64_t)a4);
      _os_log_fault_impl(&dword_1B5291000, oslog, OS_LOG_TYPE_FAULT, "getFloatValueFrom error - invalid value for key %@", v11, 0xCu);
    }
  }
  return v8;
}

- (float)getFloatValueFrom:(id)a3 key:(id)a4 subkey:(id)a5
{
  float v5;
  NSObject *logHandle;
  NSObject *oslog;
  void *v9;
  void *v10;
  float v11;
  uint8_t v15[16];
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 0.0;
  v10 = (void *)objc_msgSend(a3, "objectForKey:", a4);
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = (void *)objc_msgSend(v10, "objectForKey:", a5);
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v9, "floatValue");
      return v5;
    }
    else
    {
      oslog = self->super._logHandle;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)a4);
        _os_log_fault_impl(&dword_1B5291000, oslog, OS_LOG_TYPE_FAULT, "getFloatValueFrom (subkey) error - invalid value for sub-key %@", v16, 0xCu);
      }
    }
  }
  else
  {
    logHandle = self->super._logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)a4);
      _os_log_fault_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_FAULT, "getFloatValueFrom (subkey)error - invalid value for key %@", v15, 0xCu);
    }
  }
  return v11;
}

- (int64_t)getIntegerValueFrom:(id)a3 key:(id)a4
{
  NSObject *oslog;
  void *v6;
  int64_t v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = (void *)objc_msgSend(a3, "objectForKey:", a4);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend(v6, "integerValue");
  }
  oslog = self->super._logHandle;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a4);
    _os_log_fault_impl(&dword_1B5291000, oslog, OS_LOG_TYPE_FAULT, "getIntValueFrom error - invalid value for %@", v10, 0xCu);
  }
  return v7;
}

- (BOOL)setALSServiceProperty:(void *)a3 forKey:(__CFString *)a4
{
  Boolean v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSMutableArray *obj;
  uint64_t v11;
  uint64_t inited;
  NSObject *logHandle;
  _QWORD __b[8];
  IOHIDServiceClientRef service;
  BOOL v16;
  os_log_type_t type;
  os_log_t oslog;
  __CFString *v19;
  CFTypeRef v20;
  SEL v21;
  CBAODModule *v22;
  _BYTE v23[128];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = self;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  oslog = 0;
  if (self->super._logHandle)
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
  oslog = logHandle;
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v24, (uint64_t)v19, (uint64_t)v20);
    _os_log_impl(&dword_1B5291000, oslog, type, "[ALS service] Set ALS service property %@ = %@", v24, 0x16u);
  }
  v16 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v22->_alsServiceClients;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      service = 0;
      service = *(IOHIDServiceClientRef *)(__b[1] + 8 * v8);
      v4 = IOHIDServiceClientSetProperty(service, v19, v20);
      v16 = (v16 | v4) != 0;
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
        if (!v9)
          break;
      }
    }
  }
  return v16;
}

- (void)loadAODCurveFromDefaults
{
  id v2;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *context;
  id v10;
  uint64_t v11;
  int j;
  int i;
  int v14;
  id v15;
  id v16;
  int v17;
  id v18;
  uint8_t v20[16];
  uint8_t v21[16];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v18 = -[CBAODModule copyArrayFromPrefsForKey:](self, "copyArrayFromPrefsForKey:", CFSTR("AOTCurve"));
  if (v18)
  {
    if (objc_msgSend(v18, "count") % 2uLL)
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v20, objc_msgSend(v18, "count"));
        _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "AOD curve stored in defaults has unexpected number of coordinates (%lu).", v20, 0xCu);
      }
    }
    else
    {
      v17 = (int)objc_msgSend(v18, "count") / 2;
      if (self->super._logHandle)
      {
        v8 = self->super._logHandle;
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
        __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v18);
        _os_log_impl(&dword_1B5291000, v8, OS_LOG_TYPE_DEFAULT, "Use AOD curve from defauls %@", v26, 0xCu);
      }
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = 0;
      for (i = 0; i < v17; ++i)
      {
        ++v14;
        objc_msgSend(v16, "addObject:", objc_msgSend(v18, "objectAtIndexedSubscript:"));
      }
      for (j = 0; j < v17; ++j)
      {
        ++v14;
        objc_msgSend(v15, "addObject:", objc_msgSend(v18, "objectAtIndexedSubscript:"));
      }
      v24[0] = CFSTR("lux");
      v25[0] = v16;
      v24[1] = CFSTR("nits");
      v25[1] = v15;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v22[0] = CFSTR("CurveLevelLow");
      v23[0] = v11;
      v22[1] = CFSTR("CurveLevelMed");
      v23[1] = v11;
      v22[2] = CFSTR("CurveLevelHigh");
      v23[2] = v11;
      v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
      v2 = v10;
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
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)v10);
        _os_log_impl(&dword_1B5291000, v6, OS_LOG_TYPE_DEFAULT, "AOTCurve: %@", v21, 0xCu);
      }
      -[CBAODModule setModulesProperty:forKey:](self, "setModulesProperty:forKey:", v10, CFSTR("AOTCurve"));

    }
  }

  objc_autoreleasePoolPop(context);
}

- (id)copyArrayFromPrefsForKey:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
  if (v7)
  {
    objc_msgSend(v7, "synchronize");
    v6 = objc_msgSend(v7, "objectForKey:", a3);
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v6);
    }

  }
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
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v11, (uint64_t)"-[CBAODModule copyArrayFromPrefsForKey:]", (uint64_t)a3, (uint64_t)v8);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "%s: %@ = %@ \n", v11, 0x20u);
  }
  return v8;
}

- (void)releaseDisplayModeCompletionTimer
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  SEL v9;
  CBAODModule *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  if (self->super._logHandle)
  {
    logHandle = v10->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v8 = logHandle;
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1B5291000, log, type, "Release scheduled display mode completion timer", v6, 2u);
  }
  if (v10->_displayModeCompletionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v10->_displayModeCompletionTimer);
    dispatch_release((dispatch_object_t)v10->_displayModeCompletionTimer);
    v10->_displayModeCompletionTimer = 0;
  }
}

- (void)scheduleDisplayModeCompletionTimerIn:(float)a3 forDisplayMode:(int64_t)a4
{
  dispatch_time_t v4;
  NSObject *displayModeCompletionTimer;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *source;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t handler;
  int v12;
  int v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  CBAODModule *v16;
  int64_t v17;
  float v18;
  int64_t v19;
  os_log_type_t v20;
  os_log_t v21;
  int64_t v22;
  float v23;
  SEL v24;
  CBAODModule *v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v21 = 0;
  if (self->super._logHandle)
  {
    logHandle = v25->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v21 = logHandle;
  v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v26, COERCE__INT64(v23), (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v22));
    _os_log_impl(&dword_1B5291000, v21, v20, "Schedule display mode completion timer in %f sec for %@ mode", v26, 0x16u);
  }
  v19 = (unint64_t)(float)(v23 * 1000000000.0);
  if (v25->_displayModeCompletionTimer)
  {
    source = v25->_displayModeCompletionTimer;
    v4 = dispatch_time(0, v19);
    dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    v25->_displayModeCompletionTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v25->super._queue);
    if (v25->_displayModeCompletionTimer)
    {
      displayModeCompletionTimer = v25->_displayModeCompletionTimer;
      handler = MEMORY[0x1E0C809B0];
      v12 = -1073741824;
      v13 = 0;
      v14 = __67__CBAODModule_scheduleDisplayModeCompletionTimerIn_forDisplayMode___block_invoke;
      v15 = &unk_1E68EAAA8;
      v16 = v25;
      v17 = v22;
      v18 = v23;
      dispatch_source_set_event_handler(displayModeCompletionTimer, &handler);
      v7 = v25->_displayModeCompletionTimer;
      v6 = dispatch_time(0, v19);
      dispatch_source_set_timer(v7, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  dispatch_activate((dispatch_object_t)v25->_displayModeCompletionTimer);
}

uint64_t __67__CBAODModule_scheduleDisplayModeCompletionTimerIn_forDisplayMode___block_invoke(uint64_t a1)
{
  uint64_t inited;
  NSObject *v3;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v3 = inited;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_0((uint64_t)v5, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", *(_QWORD *)(a1 + 40)), COERCE__INT64(*(float *)(a1 + 48)));
    _os_log_impl(&dword_1B5291000, v3, OS_LOG_TYPE_DEFAULT, "Call %@ mode completion after %f seconds.", v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteTransitionToDisplayMode:", *(_QWORD *)(a1 + 40));
}

- (void)reevaluatePThresholdsForLux:(float)a3
{
  id v3;

  v3 = -[CBAODThresholdModule copyPdeltaThresholdsForLux:](self->_thresholdModule, "copyPdeltaThresholdsForLux:", *(double *)&a3);
  -[CBAODModule setModulesProperty:forKey:](self, "setModulesProperty:forKey:", v3, CFSTR("ALSInternalSettings"));

}

- (id)stringForFlipbookMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
    __asm { BR              X8 }
  return CFSTR("Unknown");
}

- (BOOL)aodEnabled
{
  return self->_aodEnabled;
}

- (void)setAodEnabled:(BOOL)a3
{
  self->_aodEnabled = a3;
}

@end
