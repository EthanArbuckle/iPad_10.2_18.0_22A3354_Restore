@implementation CBAODTransitionController

- (CBAODTransitionController)initWithCBBrtControl:(id)a3 andThresholdModule:(id)a4 andQueue:(id)a5
{
  id v5;
  CBAODTransitionController *v8;

  v8 = -[CBAODTransitionController initWithCBBrtControl:andQueue:](self, "initWithCBBrtControl:andQueue:", a3, a5);
  if (v8)
  {
    *(_QWORD *)&v8->_currentFlipBookEntry.ammoliteLux = a4;
    v5 = *(id *)&v8->_currentFlipBookEntry.ammoliteLux;
  }
  return v8;
}

- (CBAODTransitionController)initWithCBBrtControl:(id)a3 andQueue:(id)a4
{
  CBBrightnessProxy *v4;
  unsigned int v5;
  id v6;
  os_log_t v7;
  CBRampManager *v8;
  CBRampManager *rampManager;
  CBRampManager *v10;
  float v11;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  NSObject *v22;
  _BYTE __b[79];
  os_log_type_t v24;
  os_log_t v25;
  id v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void *v31;
  CBAODTransitionController *v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void *v37;
  CBAODTransitionController *v38;
  uint8_t v39[7];
  os_log_type_t v40;
  NSObject *v41;
  uint8_t v42[7];
  char v43;
  NSObject *v44;
  id v45;
  objc_super v46;
  id v47;
  CBBrightnessProxy *v48;
  SEL v49;
  CBAODTransitionController *v50;
  uint8_t v51[24];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v50 = self;
  v49 = a2;
  v48 = (CBBrightnessProxy *)a3;
  v47 = a4;
  v46.receiver = self;
  v46.super_class = (Class)CBAODTransitionController;
  v50 = -[CBModule initWithQueue:](&v46, sel_initWithQueue_, a4);
  if (v50)
  {
    v50->_brtCtl = v48;
    v4 = v50->_brtCtl;
    v5 = -[CBBrightnessProxy getDisplayId](v50->_brtCtl, "getDisplayId");
    v50->_displayID = v5;
    v45 = 0;
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v45 = (id)objc_msgSend(v6, "initWithFormat:", CFSTR("com.apple.CoreBrightness.AOD.CBAODTransitionController.%lu"), v50->_displayID);
    if (v45)
      v7 = os_log_create((const char *)objc_msgSend(v45, "cStringUsingEncoding:", 1), "default");
    else
      v7 = os_log_create("com.apple.CoreBrightness.AOD.CBAODTransitionController", "default");
    v50->super._logHandle = (OS_os_log *)v7;
    if (!v50->super._logHandle)
    {
      v44 = 0;
      v22 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v44 = v22;
      v43 = 16;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        log = v44;
        type = v43;
        __os_log_helper_16_0_0(v42);
        _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create log handle", v42, 2u);
      }
    }

    if (-[CBAODTransitionController initAPEndpoint](v50, "initAPEndpoint"))
    {
      LOBYTE(v50->_targetWhitepoint.matrix[2][0]) = 0;
    }
    else
    {
      v41 = 0;
      if (v50->super._logHandle)
      {
        logHandle = v50->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v41 = logHandle;
      v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v41;
        v17 = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_impl(&dword_1B5291000, v16, v17, "Use live updates (CA) by default", v39, 2u);
      }
      LOBYTE(v50->_targetWhitepoint.matrix[2][0]) = 1;
    }
    v8 = objc_alloc_init(CBRampManager);
    v50->_rampManager = v8;
    -[CBRampManager scheduleWithDispatchQueue:](v50->_rampManager, "scheduleWithDispatchQueue:", v47);
    rampManager = v50->_rampManager;
    v15 = MEMORY[0x1E0C809B0];
    v33 = MEMORY[0x1E0C809B0];
    v34 = -1073741824;
    v35 = 0;
    v36 = __59__CBAODTransitionController_initWithCBBrtControl_andQueue___block_invoke;
    v37 = &unk_1E68EB158;
    v38 = v50;
    -[CBRampManager setClockHandler:](rampManager, "setClockHandler:", &v33);
    v10 = v50->_rampManager;
    v27 = v15;
    v28 = -1073741824;
    v29 = 0;
    v30 = __59__CBAODTransitionController_initWithCBBrtControl_andQueue___block_invoke_2;
    v31 = &unk_1E68EB158;
    v32 = v50;
    -[CBRampManager setRampDoneCallback:](v10, "setRampDoneCallback:", &v27);
    -[CBRampManager activate](v50->_rampManager, "activate");
    v50->_currentSDRBrightness = 0.0;
    v50->_targetSDRBrightness = 0.0;
    v50->_minNits = 0.0;
    v50->_maxNits = 0.0;
    v50->_rampDoneCallback = 0;
    v50->_edrRampDurationPerStop = 0.75;
    if (v50->_brtCtl)
    {
      v26 = 0;
      v26 = (id)-[CBBrightnessProxy getBrightnessCapabilities](v50->_brtCtl, "getBrightnessCapabilities");
      if (v26)
      {
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("EDRSecondsPerStopDefault"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("EDRSecondsPerStopDefault")), "floatValue");
          v50->_edrRampDurationPerStop = v11;
          v25 = 0;
          if (v50->super._logHandle)
          {
            v14 = v50->super._logHandle;
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
          v24 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_0_1_8_0((uint64_t)v51, COERCE__INT64(v50->_edrRampDurationPerStop));
            _os_log_impl(&dword_1B5291000, v25, v24, "AOD EDR transitions uses %f seconds per stop", v51, 0xCu);
          }
        }
      }
    }
    v50->_currentAAPFactor = 0.0;
    v50->_targetAAPFactor = 0.0;
    v50->_currentBrightnessLimit = 0.0;
    v50->_targetBrightnessLimit = 0.0;
    v50->_currentLumaBoostFactor = 0.0;
    v50->_targetLumaBoostFactor = 0.0;
    memset(__b, 0, sizeof(__b));
    memcpy(&v50->_currentFlipBookEntry, __b, 0x4FuLL);
    v50->_targetWhitepoint.matrix[2][1] = -1.0;
    v50->_currentFrequency = 60;
    v50->_currentTrustedLux = -1.0;
    BYTE1(v50->_targetWhitepoint.matrix[2][0]) = 1;
    *(_QWORD *)&v50->_currentFlipBookEntry.reserved[4] = 0;
    v50->_targetWhitepoint.xy.y = 0.0;
    -[CBAODTransitionController initColorEffects](v50, "initColorEffects");
    memcpy(&v50->_thresholdModule, &identityMatrix, 0x24uLL);
    memcpy(v50->_currentWhitepoint.matrix[2], &identityMatrix, 0x24uLL);
    -[CBAODTransitionController chromaticity:andIlluminance:fromMatrix:](v50, "chromaticity:andIlluminance:fromMatrix:", v50->_currentWhitepoint.matrix[1], &v50->_currentWhitepoint.matrix[1][2], &v50->_thresholdModule);
    -[CBAODTransitionController chromaticity:andIlluminance:fromMatrix:](v50, "chromaticity:andIlluminance:fromMatrix:", v50->_targetWhitepoint.matrix[1], &v50->_targetWhitepoint.matrix[1][2], v50->_currentWhitepoint.matrix[2]);
    -[CBAODTransitionController checkBootArgsConfiguration](v50, "checkBootArgsConfiguration");
  }
  return v50;
}

uint64_t __59__CBAODTransitionController_initWithCBBrtControl_andQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clockUpdateHandler:", a2);
}

uint64_t __59__CBAODTransitionController_initWithCBBrtControl_andQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rampsDoneCallback:", a2);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAODTransitionController *v4;

  v4 = self;
  v3 = a2;

  -[CBAODTransitionController releaseLastUpdateSwappedTimer](v4, "releaseLastUpdateSwappedTimer");
  if (v4->_rampDoneCallback)
  {
    _Block_release(v4->_rampDoneCallback);
    v4->_rampDoneCallback = 0;
  }
  if (v4->_rampCanceledCallback)
  {
    _Block_release(v4->_rampCanceledCallback);
    v4->_rampCanceledCallback = 0;
  }
  -[CBAODTransitionController setIndicator:](v4, "setIndicator:");
  -[CBAODTransitionController setTwilight:](v4, "setTwilight:", 0);
  -[CBAODTransitionController setAmmolite:](v4, "setAmmolite:", 0);
  if (v4->super._logHandle)

  if (v4->super._queue)
  {
    dispatch_release((dispatch_object_t)v4->super._queue);
    v4->super._queue = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAODTransitionController;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (BOOL)initAPEndpoint
{
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *log;
  os_log_type_t v10;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v13[15];
  os_log_type_t v14;
  os_log_t v15;
  os_log_type_t v16;
  os_log_t v17;
  BOOL v18;
  char *v19;
  size_t v20;
  uint8_t v21[15];
  os_log_type_t type;
  os_log_t oslog;
  char v24;
  SEL v25;
  CBAODTransitionController *v26;
  uint8_t v27[8];
  char v28[1024];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = self;
  v25 = a2;
  v24 = 1;
  self->_endpoint = -[CBAPEndpoint initWithServiceName:role:]([CBAPEndpoint alloc], "initWithServiceName:role:", CFSTR("cbroot-service"), CFSTR("DCP"));
  if (v26->_endpoint)
  {
    oslog = 0;
    if (v26->super._logHandle)
    {
      logHandle = v26->super._logHandle;
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
      log = oslog;
      v10 = type;
      __os_log_helper_16_0_0(v21);
      _os_log_impl(&dword_1B5291000, log, v10, "CBAPEndpoint initialization completed", v21, 2u);
    }
    bzero(v28, 0x400uLL);
    v20 = 1024;
    if (!sysctlbyname("kern.bootargs", v28, &v20, 0, 0))
    {
      v19 = strstr[abi:ne180100](v28, "cb_aod_enable_dcp_updates");
      if (v19)
      {
        v19 += 25;
        v18 = strtol(v19 + 1, 0, 0) != 0;
        v17 = 0;
        if (v26->super._logHandle)
        {
          v8 = v26->super._logHandle;
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
          __os_log_helper_16_0_1_4_0((uint64_t)v27, v18);
          _os_log_impl(&dword_1B5291000, v17, v16, "Boot arg override: enable DCP updates %d", v27, 8u);
        }
        -[CBAODTransitionController enableDCPFlipBookUpdates:](v26, "enableDCPFlipBookUpdates:", v18);
      }
    }
  }
  else
  {
    v15 = 0;
    if (v26->super._logHandle)
    {
      v6 = v26->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v5 = init_default_corebrightness_log();
      v6 = v5;
    }
    v15 = v6;
    v14 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v3 = v15;
      v4 = v14;
      __os_log_helper_16_0_0(v13);
      _os_log_error_impl(&dword_1B5291000, v3, v4, "CBAPEndpoint init failed", v13, 2u);
    }
    v24 = 0;
  }
  return v24 & 1;
}

- (void)checkBootArgsConfiguration
{
  const char *v2;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v5;
  char *v6;
  size_t v7[2];
  CBAODTransitionController *v8;
  uint8_t v9[24];
  char v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v7[1] = (size_t)a2;
  bzero(v10, 0x400uLL);
  v7[0] = 1024;
  if (!sysctlbyname("kern.bootargs", v10, v7, 0, 0))
  {
    v6 = strstr[abi:ne180100](v10, "cb_aod_force_live_updates");
    if (v6)
    {
      v5 = strtol(v6 + 26, 0, 0) != 0;
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
        if (v5)
          v2 = "Enable";
        else
          v2 = "Disable";
        __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v2);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Boot arg override live updates: %s.", v9, 0xCu);
      }
      -[CBAODTransitionController setLiveUpdatesOverride:](v8, "setLiveUpdatesOverride:", v5);
      -[CBAODTransitionController setLiveUpdates:](v8, "setLiveUpdates:", v5);
    }
  }
}

- (float)currentDisplayNits
{
  uint64_t inited;
  NSObject *logHandle;
  _BYTE __b[79];
  float currentSDRBrightness;
  SEL v7;
  CBAODTransitionController *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v7 = a2;
  currentSDRBrightness = 0.0;
  currentSDRBrightness = self->_currentSDRBrightness;
  memset(__b, 0, sizeof(__b));
  if (-[CBAODTransitionController currentFlipBookEntry:](v8, "currentFlipBookEntry:", __b) && (__b[4] & 1) != 0)
  {
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
      __os_log_helper_16_0_2_4_0_8_0((uint64_t)v9, *(int *)__b, COERCE__INT64(*(float *)&__b[5]));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Get last update applied[%d] = %f", v9, 0x12u);
    }
    return *(float *)&__b[5];
  }
  return currentSDRBrightness;
}

- (float)currentTwilightLux
{
  float v2;
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  _BYTE __b[79];
  float v8;
  SEL v9;
  CBAODTransitionController *v10;
  uint8_t v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = self;
  v9 = a2;
  v8 = 0.0;
  objc_msgSend(*(id *)&self->_liveUpdatesOverride, "lux");
  v8 = v2;
  memset(__b, 0, sizeof(__b));
  if (-[CBAODTransitionController currentFlipBookEntry:](v10, "currentFlipBookEntry:", __b)
    && ((__b[4] & 1) != 0 || (__b[56] & 1) != 0))
  {
    if (v10->super._logHandle)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if ((__b[56] & 1) != 0)
        v3 = "set";
      else
        v3 = "not set";
      __os_log_helper_16_2_4_4_0_8_0_8_0_8_32((uint64_t)v11, *(int *)__b, COERCE__INT64(*(float *)&__b[61]), COERCE__INT64(*(float *)&__b[57]), (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Get last update applied[%d] Twilight Lux = %f (Twilight strength = %f (%s))", v11, 0x26u);
    }
    return *(float *)&__b[61];
  }
  return v8;
}

- (float)currentAmmoliteLux
{
  float v2;
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  _BYTE __b[79];
  float v8;
  SEL v9;
  CBAODTransitionController *v10;
  uint8_t v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = self;
  v9 = a2;
  v8 = 0.0;
  objc_msgSend(*(id *)&self->_currentDisplayNits, "lux");
  v8 = v2;
  memset(__b, 0, sizeof(__b));
  if (-[CBAODTransitionController currentFlipBookEntry:](v10, "currentFlipBookEntry:", __b)
    && ((__b[4] & 1) != 0 || (__b[65] & 1) != 0))
  {
    if (v10->super._logHandle)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if ((__b[65] & 1) != 0)
        v3 = "set";
      else
        v3 = "not set";
      __os_log_helper_16_2_4_4_0_8_0_8_0_8_32((uint64_t)v11, *(int *)__b, COERCE__INT64(*(float *)&__b[70]), COERCE__INT64(*(float *)&__b[66]), (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Get last update applied[%d] Ammolite Lux = %f (Ammolite strength = %f (%s))", v11, 0x26u);
    }
    return *(float *)&__b[70];
  }
  return v8;
}

- (void)setDurationOfEDRRamp:(float)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v7, COERCE__INT64(a3));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "setDurationOfEDRRamp = %f", v7, 0xCu);
  }
  self->_edrRampDurationPerStop = a3;
}

- (void)setDisplayON:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((BYTE1(self->_targetWhitepoint.matrix[2][0]) & 1) != a3)
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
      if (v6)
        v3 = "ON";
      else
        v3 = "OFF";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Display is %s", v8, 0xCu);
    }
    BYTE1(self->_targetWhitepoint.matrix[2][0]) = v6;
  }
}

- (void)setInitialState:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v17[48];
  uint8_t v18[32];
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Initial state = %@", v19, 0xCu);
  }
  if (self->_currentState)

  self->_currentState = a3;
  -[CBAODTransitionController getFloatValueFrom:key:subkey:](self, "getFloatValueFrom:key:subkey:", a3);
  self->_targetEDRHeadroom = v3;
  self->_currentEDRHeadroom = v3;
  -[CBAODTransitionController getFloatValueFrom:key:subkey:](self, "getFloatValueFrom:key:subkey:", a3, CFSTR("DisplayBrightness"), CFSTR("NitsSDR"));
  self->_currentSDRBrightness = v4;
  self->_targetSDRBrightness = -1.0;
  -[CBAODTransitionController getFloatValueFrom:key:](self, "getFloatValueFrom:key:", a3, CFSTR("DisplayPanelLuminanceMin"));
  self->_minNits = v5;
  -[CBAODTransitionController getFloatValueFrom:key:](self, "getFloatValueFrom:key:", a3, CFSTR("DisplayPanelLuminanceMax"));
  self->_maxNits = v6;
  if (self->super._logHandle)
  {
    v12 = self->super._logHandle;
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
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v18, COERCE__INT64(self->_minNits), COERCE__INT64(self->_maxNits));
    _os_log_impl(&dword_1B5291000, v12, OS_LOG_TYPE_DEFAULT, "Panel luminance: Nits min = %f, max = %f", v18, 0x16u);
  }
  -[CBAODTransitionController processInitialColorMatrixFromState:](self, "processInitialColorMatrixFromState:", a3);
  -[CBAODTransitionController getFloatValueFrom:key:](self, "getFloatValueFrom:key:", a3, CFSTR("DisplayAAPFactor"));
  self->_currentAAPFactor = v7;
  self->_targetAAPFactor = -1.0;
  -[CBAODTransitionController getFloatValueFrom:key:subkey:](self, "getFloatValueFrom:key:subkey:", a3, CFSTR("DisplayBrightness"), CFSTR("NitsCap"));
  self->_currentBrightnessLimit = v8;
  self->_targetBrightnessLimit = -1.0;
  if (self->super._logHandle)
  {
    v10 = self->super._logHandle;
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
    __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v17, COERCE__INT64(self->_currentSDRBrightness), COERCE__INT64(self->_currentEDRHeadroom), COERCE__INT64(self->_currentAAPFactor), COERCE__INT64(self->_currentBrightnessLimit));
    _os_log_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEFAULT, "Normal mode SDR brightness = %f; EDR headroom = %f; AAP factor = %f; nitsCap = %f",
      v17,
      0x2Au);
  }
}

- (BOOL)startTransition:(id)a3 length:(float)a4 forceUpdate:(BOOL)a5 rampDoneCallback:(id)a6 rampCanceledCallback:(id)a7
{
  _BYTE __dst[48];
  _DWORD __b[12];
  id v10;
  id v11;
  BOOL v12;
  float v13;
  id v14;
  SEL v15;
  CBAODTransitionController *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12 = a5;
  v11 = a6;
  v10 = a7;
  memset(__b, 0, sizeof(__b));
  LOBYTE(__b[0]) = v12;
  if (v13 >= 0.0)
  {
    HIBYTE(__b[0]) = 1;
    *(float *)&__b[1] = v13;
  }
  memcpy(__dst, __b, sizeof(__dst));
  return -[CBAODTransitionController startTransition:transitionParameters:rampDoneCallback:rampCanceledCallback:](v16, "startTransition:transitionParameters:rampDoneCallback:rampCanceledCallback:", v14, __dst, v11, v10);
}

- (BOOL)startTransition:(id)a3 transitionParameters:(id *)a4 rampDoneCallback:(id)a5 rampCanceledCallback:(id)a6
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  float v23;
  double v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CBRampManager *rampManager;
  CBRampManager *v46;
  CBRampManager *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  int v66;
  int v67;
  double v68;
  double v69;
  double v70;
  double v71;
  int v72;
  int v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  CBRampManager *v80;
  int v81;
  CBRampManager *v82;
  int v83;
  uint64_t v84;
  NSObject *v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  uint64_t v94;
  NSObject *v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  NSObject *v99;
  float currentTrustedLux;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  NSObject *v106;
  float v107;
  float v108;
  float var12;
  float var14;
  float var10;
  float var8;
  float var6;
  void *v114;
  void *v115;
  uint64_t v116;
  NSObject *v117;
  uint64_t v118;
  NSObject *v119;
  char v120;
  char v121;
  void *v122;
  void *v123;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v127;
  int v128;
  int v129;
  uint64_t (*v130)(uint64_t, double);
  void *v131;
  CBAODTransitionController *v132;
  uint64_t v133;
  int v134;
  int v135;
  uint64_t (*v136)(uint64_t, double);
  void *v137;
  CBAODTransitionController *v138;
  float v139;
  id v140;
  os_log_type_t v141;
  os_log_t v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  int v148;
  int v149;
  uint64_t (*v150)(uint64_t, uint64_t, double);
  void *v151;
  CBAODTransitionController *v152;
  uint64_t v153;
  int v154;
  int v155;
  uint64_t (*v156)(uint64_t, uint64_t, double);
  void *v157;
  CBAODTransitionController *v158;
  uint64_t v159;
  int v160;
  int v161;
  uint64_t (*v162)(uint64_t, uint64_t, double);
  void *v163;
  CBAODTransitionController *v164;
  unint64_t v165;
  os_log_type_t v166;
  os_log_t v167;
  unint64_t v168;
  id v169;
  id v170;
  os_log_type_t v171;
  os_log_t v172;
  os_log_type_t v173;
  os_log_t v174;
  os_log_type_t v175;
  os_log_t v176;
  os_log_type_t v177;
  os_log_t v178;
  os_log_type_t v179;
  os_log_t v180;
  os_log_type_t v181;
  os_log_t v182;
  os_log_type_t v183;
  os_log_t v184;
  os_log_type_t v185;
  os_log_t v186;
  float v187;
  float v188;
  float v189;
  float v190;
  float v191;
  float v192;
  float v193;
  float v194;
  float var4;
  os_log_type_t v196;
  os_log_t v197;
  os_log_type_t v198[51];
  os_log_type_t v199;
  os_log_t v200;
  char v201;
  char v202;
  char v203;
  char v204;
  char v205;
  char v206;
  BOOL v207;
  char v208;
  char v209;
  os_log_type_t v210;
  os_log_t v211;
  os_log_type_t type;
  os_log_t oslog;
  float v214;
  char v215;
  size_t __n;
  uint64_t v217;
  uint64_t v218;
  float v219;
  float v220;
  float v221;
  float v222;
  BOOL var0;
  char v224;
  void *v225;
  void *aBlock;
  $9424C94D2D96C890884F5126E9ED469E *v227;
  id v228;
  SEL v229;
  CBAODTransitionController *v230;
  char v231;
  uint8_t v232[32];
  uint8_t v233[16];
  uint8_t v234[64];
  uint8_t v235[64];
  uint8_t v236[32];
  uint8_t v237[32];
  uint8_t v238[64];
  uint8_t v239[32];
  uint8_t v240[32];
  uint8_t v241[48];
  uint8_t v242[16];
  uint8_t v243[16];
  uint8_t v244[16];
  uint8_t v245[36];
  _BYTE __dst[36];
  uint64_t v247;

  v247 = *MEMORY[0x1E0C80C00];
  v230 = self;
  v229 = a2;
  v228 = a3;
  v227 = a4;
  aBlock = a5;
  v225 = a6;
  v224 = 0;
  var0 = 0;
  var0 = a4->var0;
  -[CBAODTransitionController getFloatValueFrom:key:subkey:](self, "getFloatValueFrom:key:subkey:", a3);
  v222 = v6;
  -[CBAODTransitionController getFloatValueFrom:key:subkey:](v230, "getFloatValueFrom:key:subkey:", v228, CFSTR("DisplayBrightness"), CFSTR("NitsSDR"));
  v221 = v7;
  -[CBAODTransitionController getFloatValueFrom:key:subkey:](v230, "getFloatValueFrom:key:subkey:", v228, CFSTR("DisplayBrightness"), CFSTR("NitsCap"));
  v220 = v8;
  -[CBAODTransitionController getFloatValueFrom:key:](v230, "getFloatValueFrom:key:", v228, CFSTR("DisplayAAPFactor"));
  v219 = v9;
  v218 = 36;
  v217 = 36;
  __n = 36;
  memcpy(__dst, &identityMatrix, sizeof(__dst));
  objc_msgSend(v228, "objectForKey:", CFSTR("ColorRamp"));
  objc_opt_class();
  v215 = objc_opt_isKindOfClass() & 1;
  if (v215)
    -[CBAODTransitionController colorMatrix:fromState:](v230, "colorMatrix:fromState:", __dst, v228);
  -[CBAODState nitsCap](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "nitsCap");
  v214 = v10;
  if (v10 > 0.0 && v221 > v214)
  {
    oslog = 0;
    if (v230->super._logHandle)
    {
      logHandle = v230->super._logHandle;
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
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v245, COERCE__INT64(v221), COERCE__INT64(v214));
      _os_log_impl(&dword_1B5291000, oslog, type, "Capping target SDR brightness %f -> %f", v245, 0x16u);
    }
    v221 = v214;
  }
  if (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") != 4)
  {
    -[CBAODState maxAODNits](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "maxAODNits");
    v220 = std::__math::fmin[abi:ne180100](v220, v11);
  }
  if (v230->_targetWhitepoint.matrix[2][1] >= 0.0)
    v221 = v230->_targetWhitepoint.matrix[2][1];
  -[CBAODTransitionController getFloatValueFrom:key:](v230, "getFloatValueFrom:key:", v228, CFSTR("TrustedLux"));
  v230->_currentTrustedLux = v12;
  if (v222 < 1.0)
  {
    v211 = 0;
    v211 = (os_log_t)v230->super._logHandle;
    v210 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(v211, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v244, COERCE__INT64(v222));
      _os_log_fault_impl(&dword_1B5291000, v211, v210, "Unexpected EDR Headroom target in AOD = %f < 1", v244, 0xCu);
    }
    v222 = 1.0;
  }
  v209 = 0;
  v208 = 0;
  v207 = 0;
  v207 = v222 < v230->_targetEDRHeadroom;
  v206 = 0;
  v205 = 0;
  v204 = 0;
  v203 = 0;
  v202 = 0;
  if (SLODWORD(v221) != SLODWORD(v230->_targetSDRBrightness) || var0)
    v209 = 1;
  if (SLODWORD(v220) != SLODWORD(v230->_targetBrightnessLimit) || var0)
    v205 = 1;
  if ((v215 & 1) != 0
    && (-[CBAODTransitionController shallUpdateWhitepointFrom:target:](v230, "shallUpdateWhitepointFrom:target:", v230->_currentWhitepoint.matrix[2], __dst)|| var0))
  {
    v208 = 1;
  }
  if (COERCE_INT(v219 * 100.0) != COERCE_INT(v230->_targetAAPFactor * 100.0))
    v206 = 1;
  if (*(_QWORD *)&v230->_liveUpdatesOverride)
  {
    v123 = *(void **)&v230->_liveUpdatesOverride;
    objc_msgSend(v123, "targetLux");
    if ((objc_msgSend(v123, "shouldRampFromStartLux:toTargetLux:") & 1) != 0)
    {
      *(float *)&v13 = v221;
      if ((objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "nitsAreInActiveRange:", v13) & 1) != 0
        || (*(float *)&v14 = v230->_targetSDRBrightness,
            (objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "nitsAreInActiveRange:", v14) & 1) != 0))
      {
        v203 = 1;
      }
    }
  }
  if (*(_QWORD *)&v230->_currentDisplayNits)
  {
    v122 = *(void **)&v230->_currentDisplayNits;
    objc_msgSend(v122, "targetLux");
    if ((objc_msgSend(v122, "shouldRampFromStartLux:toTargetLux:") & 1) != 0)
    {
      *(float *)&v15 = v221;
      if ((objc_msgSend(*(id *)&v230->_currentDisplayNits, "nitsAreInActiveRange:", v15) & 1) != 0
        || (*(float *)&v16 = v230->_targetSDRBrightness,
            (objc_msgSend(*(id *)&v230->_currentDisplayNits, "nitsAreInActiveRange:", v16) & 1) != 0))
      {
        v202 = 1;
      }
    }
  }
  if ((CBU_RampLumaBoostFactorInAOD() & 1) != 0
    && (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 3
     || -[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 4))
  {
    v204 = 1;
  }
  v201 = 0;
  v121 = 1;
  if ((v209 & 1) == 0)
  {
    v121 = 1;
    if ((v206 & 1) == 0)
    {
      v121 = 1;
      if ((v208 & 1) == 0)
      {
        v121 = 1;
        if (!v207)
          v121 = v204;
      }
    }
  }
  v201 = v121;
  v120 = 1;
  if ((v121 & 1) == 0)
  {
    v120 = 1;
    if ((v203 & 1) == 0)
      v120 = v202;
  }
  v201 = v120;
  if ((v120 & 1) != 0 && (BYTE1(v230->_targetWhitepoint.matrix[2][0]) & 1) == 0)
  {
    v200 = 0;
    if (v230->super._logHandle)
    {
      v119 = v230->super._logHandle;
    }
    else
    {
      v118 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      v119 = v118;
    }
    v200 = v119;
    v199 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v243, (uint64_t)v228);
      _os_log_error_impl(&dword_1B5291000, v200, v199, "Display is OFF -> discard AOD update %@", v243, 0xCu);
    }
  }
  if ((v201 & 1) == 0 || (BYTE1(v230->_targetWhitepoint.matrix[2][0]) & 1) == 0)
    goto LABEL_279;
  -[CBAODState acquirePowerAssertion](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "acquirePowerAssertion");
  memcpy(v198, a4, 0x30uLL);
  -[CBAODTransitionController logTransitionParameters:](v230, "logTransitionParameters:", v198);
  if (!*(_QWORD *)&v230->_currentFlipBookEntry.reserved[4])
  {
LABEL_82:
    -[CBAODTransitionController cancelTransition](v230, "cancelTransition");
    if (v230->_rampDoneCallback)
    {
      _Block_release(v230->_rampDoneCallback);
      v230->_rampDoneCallback = 0;
    }
    if (aBlock)
    {
      v21 = _Block_copy(aBlock);
      v230->_rampDoneCallback = v21;
    }
    if (v230->_rampCanceledCallback)
    {
      _Block_release(v230->_rampCanceledCallback);
      v230->_rampCanceledCallback = 0;
    }
    if (v225)
    {
      v22 = _Block_copy(v225);
      v230->_rampCanceledCallback = v22;
    }
    if ((v209 & 1) == 0 && v230->_currentSDRBrightness != v221)
      v209 = 1;
    if ((v205 & 1) == 0 && v230->_currentBrightnessLimit != v220)
      v209 = 1;
    if ((v215 & 1) != 0
      && (v208 & 1) == 0
      && -[CBAODTransitionController shallUpdateWhitepointFrom:target:](v230, "shallUpdateWhitepointFrom:target:", &v230->_thresholdModule, __dst))
    {
      v208 = 1;
    }
    if ((v206 & 1) == 0 && COERCE_INT(v219 * 1000.0) != COERCE_INT(v230->_currentAAPFactor * 1000.0))
      v206 = 1;
    if ((v203 & 1) == 0)
    {
      if (*(_QWORD *)&v230->_liveUpdatesOverride)
      {
        v115 = *(void **)&v230->_liveUpdatesOverride;
        objc_msgSend(v115, "lux");
        if ((objc_msgSend(v115, "shouldRampFromStartLux:toTargetLux:") & 1) != 0)
        {
          *(float *)&v18 = v221;
          if ((objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "nitsAreInActiveRange:", v18) & 1) != 0
            || (*(float *)&v18 = v230->_targetSDRBrightness,
                (objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "nitsAreInActiveRange:", v18) & 1) != 0))
          {
            v203 = 1;
          }
        }
      }
    }
    if ((v202 & 1) == 0)
    {
      if (*(_QWORD *)&v230->_currentDisplayNits)
      {
        v114 = *(void **)&v230->_currentDisplayNits;
        objc_msgSend(v114, "lux");
        if ((objc_msgSend(v114, "shouldRampFromStartLux:toTargetLux:") & 1) != 0)
        {
          *(float *)&v18 = v221;
          if ((objc_msgSend(*(id *)&v230->_currentDisplayNits, "nitsAreInActiveRange:", v18) & 1) != 0
            || (*(float *)&v18 = v230->_targetSDRBrightness,
                (objc_msgSend(*(id *)&v230->_currentDisplayNits, "nitsAreInActiveRange:", v18) & 1) != 0))
          {
            v202 = 1;
          }
        }
      }
    }
    v230->_currentFrequency = 60;
    var4 = 0.0;
    if (a4->var3)
    {
      var4 = a4->var4;
    }
    else
    {
      *(float *)&v18 = v230->_currentSDRBrightness;
      *(float *)&v19 = v221;
      -[CBAODTransitionController transitionDurationFromCurrent:toTarget:](v230, "transitionDurationFromCurrent:toTarget:", v18, v19);
      var4 = *(float *)&v18;
    }
    v194 = 0.0;
    if (a4->var5)
      var6 = a4->var6;
    else
      var6 = var4;
    v194 = var6;
    v193 = 0.0;
    if (a4->var7)
      var8 = a4->var8;
    else
      var8 = var4;
    v193 = var8;
    v192 = 0.0;
    if (a4->var9)
      var10 = a4->var10;
    else
      var10 = var4;
    v192 = var10;
    v191 = 0.0;
    if (a4->var5)
      var14 = a4->var14;
    else
      var14 = var4;
    v191 = var14;
    v190 = 0.0;
    if (a4->var11)
      var12 = a4->var12;
    else
      var12 = var4;
    v190 = var12;
    v189 = var4;
    v188 = 0.0;
    if (a4->var3)
    {
      v108 = a4->var4;
    }
    else
    {
      objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "aodRampDuration");
      v108 = *(float *)&v18;
    }
    v188 = v108;
    v187 = 0.0;
    if (a4->var3)
    {
      v107 = a4->var4;
    }
    else
    {
      objc_msgSend(*(id *)&v230->_currentDisplayNits, "aodRampDuration");
      v107 = *(float *)&v18;
    }
    v187 = v107;
    if ((v209 & 1) != 0)
    {
      *(float *)&v18 = v221;
      *(float *)&v19 = v220;
      *(float *)&v20 = v230->_currentTrustedLux;
      objc_msgSend(*(id *)&v230->_currentFlipBookEntry.ammoliteLux, "updateALSThresholdsWithBrightness:brightnessLimit:lux:", v18, v19, v20);
      v230->_targetSDRBrightness = v221;
      v186 = 0;
      if (v230->super._logHandle)
      {
        v106 = v230->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v105 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v105 = init_default_corebrightness_log();
        v106 = v105;
      }
      v186 = v106;
      v185 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v241, COERCE__INT64(v230->_currentSDRBrightness), COERCE__INT64(v221), COERCE__INT64(v194), COERCE__INT64(v230->_currentTrustedLux));
        _os_log_impl(&dword_1B5291000, v186, v185, "[AOD update] Update target with SDRBrightness %f -> %f, Length = %f, Lux = %f", v241, 0x2Au);
      }
      if (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 3
        && v221 > v230->_currentSDRBrightness)
      {
        v184 = 0;
        if (v230->super._logHandle)
        {
          v104 = v230->super._logHandle;
        }
        else
        {
          v103 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          v104 = v103;
        }
        v184 = v104;
        v183 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v240, COERCE__INT64(v230->_currentSDRBrightness), COERCE__INT64(v221));
          _os_log_error_impl(&dword_1B5291000, v184, v183, "SDR brightness is ramping up during AOD enter transition %f -> %f", v240, 0x16u);
        }
      }
      if (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 4
        && v221 < v230->_currentSDRBrightness)
      {
        v182 = 0;
        if (v230->super._logHandle)
        {
          v102 = v230->super._logHandle;
        }
        else
        {
          v101 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          v102 = v101;
        }
        v182 = v102;
        v181 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v239, COERCE__INT64(v230->_currentSDRBrightness), COERCE__INT64(v221));
          _os_log_error_impl(&dword_1B5291000, v182, v181, "SDR brightness is ramping down during AOD exit transition %f -> %f", v239, 0x16u);
        }
      }
    }
    if ((v208 & 1) != 0)
    {
      if (!a4->var7 && !a4->var3)
      {
        currentTrustedLux = v230->_currentTrustedLux;
        -[CBAODState whitepointTransitionLengthLuxThreshold](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "whitepointTransitionLengthLuxThreshold");
        v23 = *(float *)&v24;
        *(float *)&v24 = currentTrustedLux;
        if (currentTrustedLux <= v23)
          -[CBAODState whitepointTransitionLengthLowLux](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v24), "whitepointTransitionLengthLowLux");
        else
          -[CBAODState whitepointTransitionLength](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v24), "whitepointTransitionLength");
        v193 = v25;
      }
      -[CBAODTransitionController setTargetWhitepointFromMatrix:](v230, "setTargetWhitepointFromMatrix:", __dst);
      v180 = 0;
      if (v230->super._logHandle)
      {
        v99 = v230->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v98 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v98 = init_default_corebrightness_log();
        v99 = v98;
      }
      v180 = v99;
      v179 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v238, COERCE__INT64(v230->_currentWhitepoint.matrix[1][0]), COERCE__INT64(v230->_currentWhitepoint.matrix[1][1]), COERCE__INT64(v230->_targetWhitepoint.matrix[1][0]), COERCE__INT64(v230->_targetWhitepoint.matrix[1][1]), COERCE__INT64(v193));
        _os_log_impl(&dword_1B5291000, v180, v179, "[AOD update] Update target with Whitepoint (%f;%f) -> (%f;%f), Length = %f",
          v238,
          0x34u);
      }
    }
    if ((v206 & 1) != 0)
    {
      v178 = 0;
      if (v230->super._logHandle)
      {
        v97 = v230->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v96 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v96 = init_default_corebrightness_log();
        v97 = v96;
      }
      v178 = v97;
      v177 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v237, COERCE__INT64(v230->_currentAAPFactor), COERCE__INT64(v219), COERCE__INT64(v192));
        _os_log_impl(&dword_1B5291000, v178, v177, "[AOD update] Update target with AAPFactor %f -> %f, Length = %f", v237, 0x20u);
      }
      v230->_targetAAPFactor = v219;
    }
    if (v207)
    {
      if (!a4->var11)
      {
        *(float *)&v18 = v230->_currentEDRHeadroom;
        *(float *)&v19 = v222;
        *(float *)&v20 = v230->_edrRampDurationPerStop;
        +[CBEDR overallRampDuration:target:durationPerStop:](CBEDR, "overallRampDuration:target:durationPerStop:", v18, v19, v20);
        v190 = *(float *)&v18;
      }
      v191 = fmaxf(v190, v191);
    }
    if ((v205 & 1) != 0)
    {
      v230->_targetBrightnessLimit = v220;
      v176 = 0;
      if (v230->super._logHandle)
      {
        v95 = v230->super._logHandle;
      }
      else
      {
        v94 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v95 = v94;
      }
      v176 = v95;
      v175 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v236, COERCE__INT64(v230->_currentBrightnessLimit), COERCE__INT64(v230->_targetBrightnessLimit), COERCE__INT64(v191));
        _os_log_impl(&dword_1B5291000, v176, v175, "[AOD update] Update target with brightness limit %f -> %f, Length = %f", v236, 0x20u);
      }
    }
    if ((v203 & 1) != 0)
    {
      *(float *)&v18 = v230->_currentTrustedLux;
      objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "handleLuxUpdate:", v18);
      v174 = 0;
      if (v230->super._logHandle)
      {
        v93 = v230->super._logHandle;
      }
      else
      {
        v92 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v93 = v92;
      }
      v174 = v93;
      v173 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "lux");
        *(double *)&v91 = v26;
        objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "targetLux");
        __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v235, v91, COERCE__INT64(v27), COERCE__INT64(v230->_currentSDRBrightness), COERCE__INT64(v221), COERCE__INT64(v188));
        _os_log_impl(&dword_1B5291000, v174, v173, "[AOD update] Update target with Twilight lux %f -> %f, nits %f -> %f, Length = %f", v235, 0x34u);
      }
    }
    if ((v202 & 1) != 0)
    {
      *(float *)&v18 = v230->_currentTrustedLux;
      objc_msgSend(*(id *)&v230->_currentDisplayNits, "handleLuxUpdate:", v18);
      v172 = 0;
      if (v230->super._logHandle)
      {
        v90 = v230->super._logHandle;
      }
      else
      {
        v89 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v90 = v89;
      }
      v172 = v90;
      v171 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)&v230->_currentDisplayNits, "lux");
        *(double *)&v88 = v28;
        objc_msgSend(*(id *)&v230->_currentDisplayNits, "targetLux");
        __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v234, v88, COERCE__INT64(v29), COERCE__INT64(v230->_currentSDRBrightness), COERCE__INT64(v221), COERCE__INT64(v187));
        _os_log_impl(&dword_1B5291000, v172, v171, "[AOD update] Update target with Ammolite lux %f -> %f, nits %f -> %f, Length = %f", v234, 0x34u);
      }
    }
    if (-[CBRampManager liveUpdates](v230->_rampManager, "liveUpdates"))
    {
      *(float *)&v30 = v230->_currentTrustedLux;
      -[CBAODTransitionController updateAmbient:](v230, "updateAmbient:", v30);
    }
    else
    {

      *(_QWORD *)&v230->_currentFlipBookEntry.ammoliteStrength_set = 0;
      *(float *)&v31 = fmaxf(fmaxf(fmaxf(v194, v191), v192), v193);
      *(float *)&v32 = v230->_currentTrustedLux;
      -[CBAODTransitionController initialiseFlipBookWithLength:frequency:lux:](v230, "initialiseFlipBookWithLength:frequency:lux:", v230->_currentFrequency, v31, v32);
    }
    v170 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if ((v209 & 1) != 0)
    {
      v169 = 0;
      *(float *)&v33 = v194;
      *(float *)&v34 = (float)v230->_currentFrequency;
      *(float *)&v35 = v230->_currentSDRBrightness;
      *(float *)&v36 = v221;
      v169 = -[CBAODTransitionController copyRampStatsWithLength:frequency:origin:target:](v230, "copyRampStatsWithLength:frequency:origin:target:", v33, v34, v35, v36);
      if (v169)
      {
        objc_msgSend(v170, "setObject:forKeyedSubscript:", v169, CFSTR("SDRRampStats"));

      }
      if (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 3
        || -[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 4)
      {
        v168 = -[CBAODState AODTransitionProfile](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODTransitionProfile");
        v167 = 0;
        if (v230->super._logHandle)
        {
          v87 = v230->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v86 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v86 = init_default_corebrightness_log();
          v87 = v86;
        }
        v167 = v87;
        v166 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v233, v168);
          _os_log_impl(&dword_1B5291000, v167, v166, "AOD enter / exit - use specific profile (%lu) for animation", v233, 0xCu);
        }
        rampManager = v230->_rampManager;
        *(float *)&v41 = v230->_currentSDRBrightness;
        *(float *)&v42 = v221;
        *(float *)&v43 = v194;
        *(float *)&v44 = (float)v230->_currentFrequency;
        v159 = MEMORY[0x1E0C809B0];
        v160 = -1073741824;
        v161 = 0;
        v162 = __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke;
        v163 = &unk_1E68EB180;
        v164 = v230;
        v165 = v168;
        -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](rampManager, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, CFSTR("SDR_RAMP"), &v159, v41, v42, v43, v44);
      }
      else
      {
        v46 = v230->_rampManager;
        *(float *)&v37 = v230->_currentSDRBrightness;
        *(float *)&v38 = v221;
        *(float *)&v39 = v194;
        *(float *)&v40 = (float)v230->_currentFrequency;
        v153 = MEMORY[0x1E0C809B0];
        v154 = -1073741824;
        v155 = 0;
        v156 = __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_2;
        v157 = &unk_1E68EB1A8;
        v158 = v230;
        -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](v46, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, CFSTR("SDR_RAMP"), &v153, v37, v38, v39, v40);
      }
      if (a4->var2)
      {
        *(float *)&v33 = v230->_currentSDRBrightness;
        -[CBAODTransitionController commitBrightness:force:](v230, "commitBrightness:force:", 1, v33);
      }
    }
    if ((v205 & 1) != 0)
    {
      v47 = v230->_rampManager;
      *(float *)&v33 = v230->_currentBrightnessLimit;
      *(float *)&v34 = v230->_targetBrightnessLimit;
      *(float *)&v35 = v191;
      *(float *)&v36 = (float)v230->_currentFrequency;
      v147 = MEMORY[0x1E0C809B0];
      v148 = -1073741824;
      v149 = 0;
      v150 = __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_3;
      v151 = &unk_1E68EB1A8;
      v152 = v230;
      -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](v47, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, CFSTR("BRIGHTNESS_LIMIT_RAMP"), &v147, v33, v34, v35, v36);
    }
    if ((v208 & 1) != 0
      && (CFXSetTarget((uint64_t)v230->_flipbookCache, v230->_currentWhitepoint.matrix[2], 1, 1, v193, 1.0) & 1) != 0)
    {
      v146 = 0;
      *(float *)&v33 = v193;
      *(float *)&v34 = (float)v230->_currentFrequency;
      v145 = *(_QWORD *)&v230->_currentWhitepoint.matrix[1][0];
      v144 = *(_QWORD *)&v230->_targetWhitepoint.matrix[1][0];
      LODWORD(v36) = HIDWORD(v145);
      LODWORD(v35) = v145;
      LODWORD(v49) = HIDWORD(v144);
      LODWORD(v48) = v144;
      v146 = -[CBAODTransitionController copyColourRampStatsWithLength:frequency:origin:target:](v230, "copyColourRampStatsWithLength:frequency:origin:target:", v33, v34, v35, v36, v48, v49);
      if (v146)
      {
        objc_msgSend(v170, "setObject:forKeyedSubscript:", v146, CFSTR("ColourRampStats"));

      }
      *(float *)&v52 = v193;
      *(float *)&v53 = (float)v230->_currentFrequency;
      LODWORD(v50) = 0;
      LODWORD(v51) = 1.0;
      -[CBRampManager insertNewLinearRampOrigin:target:length:frequency:startRamp:identifier:](v230->_rampManager, "insertNewLinearRampOrigin:target:length:frequency:startRamp:identifier:", 0, CFSTR("COLOR_RAMP"), v50, v51, v52, v53);
    }
    if (v207)
    {
      v143 = 0;
      *(float *)&v33 = v190;
      *(float *)&v35 = v230->_currentEDRHeadroom;
      *(float *)&v36 = v222;
      LODWORD(v34) = 1123024896;
      v143 = -[CBAODTransitionController copyRampStatsWithLength:frequency:origin:target:](v230, "copyRampStatsWithLength:frequency:origin:target:", v33, v34, v35, v36);
      if (v143)
      {
        objc_msgSend(v170, "setObject:forKeyedSubscript:", v143, CFSTR("EDRRampStats"));

      }
      v142 = 0;
      if (v230->super._logHandle)
      {
        v85 = v230->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v84 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v84 = init_default_corebrightness_log();
        v85 = v84;
      }
      v142 = v85;
      v141 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v232, COERCE__INT64(v230->_currentEDRHeadroom), COERCE__INT64(v222), COERCE__INT64(v190));
        _os_log_impl(&dword_1B5291000, v142, v141, "[AOD update] Update target with EDR %f -> %f, length = %f", v232, 0x20u);
      }
      v230->_targetEDRHeadroom = v222;
      *(float *)&v54 = v230->_currentEDRHeadroom;
      *(float *)&v55 = v222;
      *(float *)&v56 = v190;
      LODWORD(v57) = 1123024896;
      -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](v230->_rampManager, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, CFSTR("EDR_RAMP"), &__block_literal_global_13, v54, v55, v56, v57);
    }
    if ((v206 & 1) != 0)
    {
      v140 = 0;
      *(float *)&v33 = v192;
      *(float *)&v34 = (float)v230->_currentFrequency;
      *(float *)&v35 = v230->_currentAAPFactor;
      *(float *)&v36 = v219;
      v140 = -[CBAODTransitionController copyRampStatsWithLength:frequency:origin:target:](v230, "copyRampStatsWithLength:frequency:origin:target:", v33, v34, v35, v36);
      if (v140)
      {
        objc_msgSend(v170, "setObject:forKeyedSubscript:", v140, CFSTR("AAPRampStats"));

      }
      *(float *)&v58 = v230->_currentAAPFactor;
      *(float *)&v59 = v219;
      *(float *)&v60 = v192;
      *(float *)&v61 = (float)v230->_currentFrequency;
      -[CBRampManager insertNewLinearRampOrigin:target:length:frequency:startRamp:identifier:](v230->_rampManager, "insertNewLinearRampOrigin:target:length:frequency:startRamp:identifier:", 0, CFSTR("AAP_RAMP"), v58, v59, v60, v61);
    }
    if ((v204 & 1) != 0)
    {
      v139 = 0.0;
      if (-[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 3)
        v139 = 1.0;
      *(float *)&v62 = v230->_currentLumaBoostFactor;
      *(float *)&v63 = v139;
      *(float *)&v64 = v189;
      *(float *)&v65 = (float)v230->_currentFrequency;
      -[CBRampManager insertNewLinearRampOrigin:target:length:frequency:identifier:](v230->_rampManager, "insertNewLinearRampOrigin:target:length:frequency:identifier:", CFSTR("LUMA_BOOST_FACTOR_RAMP"), v62, v63, v64, v65);
    }
    if ((v203 & 1) != 0)
    {
      v82 = v230->_rampManager;
      objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "lux");
      v83 = v66;
      objc_msgSend(*(id *)&v230->_liveUpdatesOverride, "targetLux");
      LODWORD(v68) = v67;
      LODWORD(v69) = v83;
      *(float *)&v70 = v188;
      *(float *)&v71 = (float)v230->_currentFrequency;
      v133 = MEMORY[0x1E0C809B0];
      v134 = -1073741824;
      v135 = 0;
      v136 = __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_2_130;
      v137 = &unk_1E68EB1A8;
      v138 = v230;
      -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](v82, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, CFSTR("TWILIGHT_RAMP"), &v133, v69, v68, v70, v71);
    }
    if ((v202 & 1) != 0)
    {
      v80 = v230->_rampManager;
      objc_msgSend(*(id *)&v230->_currentDisplayNits, "lux");
      v81 = v72;
      objc_msgSend(*(id *)&v230->_currentDisplayNits, "targetLux");
      LODWORD(v74) = v73;
      LODWORD(v75) = v81;
      *(float *)&v76 = v187;
      *(float *)&v77 = (float)v230->_currentFrequency;
      v127 = MEMORY[0x1E0C809B0];
      v128 = -1073741824;
      v129 = 0;
      v130 = __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_3_133;
      v131 = &unk_1E68EB1A8;
      v132 = v230;
      -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](v80, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, CFSTR("AMMOLITE_RAMP"), &v127, v75, v74, v76, v77);
    }
    -[CBRampManager startRamps](v230->_rampManager, "startRamps");
    v230->_targetWhitepoint.xy.y = 0.0;
    if (!-[CBRampManager liveUpdates](v230->_rampManager, "liveUpdates"))
      v78 = MEMORY[0x1E0C9AAB0];
    else
      v78 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v170, "setObject:forKeyedSubscript:", v78, CFSTR("isFlipbookActive"));
    -[CBAODTransitionController sendNotificationForKey:andValue:](v230, "sendNotificationForKey:andValue:", CFSTR("AODRampTelemetry"), v170);

    v224 = 1;
LABEL_279:
    v231 = v224 & 1;
    return v231 & 1;
  }
  if (v230->_pendingState)
  {

    v230->_pendingState = 0;
  }
  if (var0)
  {
    -[CBAODTransitionController releaseLastUpdateSwappedTimer](v230, "releaseLastUpdateSwappedTimer");
    goto LABEL_82;
  }
  v17 = v228;
  v230->_pendingState = v17;
  v197 = 0;
  if (v230->super._logHandle)
  {
    v117 = v230->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v116 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v116 = init_default_corebrightness_log();
    v117 = v116;
  }
  v197 = v117;
  v196 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v242, COERCE__INT64(v221));
    _os_log_impl(&dword_1B5291000, v197, v196, "Last update was not swapped on the display -> pending update with Nits = %f", v242, 0xCu);
  }
  v231 = 0;
  return v231 & 1;
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sdrBrightnessProgressCallback:rampContext:profile:", a2, *(_QWORD *)(a1 + 40), a3, a1, a2);
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_2(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sdrBrightnessProgressCallback:rampContext:", a2, a3, a1, a2);
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_3(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "brightnessLimitProgressCallback:rampContext:", a2, a3, a1, a2);
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_121(float a1, uint64_t a2, void *a3)
{
  int v3;
  int v4;
  double v5;
  double v6;
  double v7;
  int v9;

  objc_msgSend(a3, "originalValue");
  v9 = v3;
  objc_msgSend(a3, "targetValue");
  LODWORD(v5) = v4;
  LODWORD(v6) = v9;
  *(float *)&v7 = a1;
  return +[CBEDR animatedHeadroomForOrigin:target:andProgress:](CBEDR, "animatedHeadroomForOrigin:target:andProgress:", v6, v5, v7);
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_2_130(uint64_t a1, double a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "updateRampWithProgress:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "lux");
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_3_133(uint64_t a1, double a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "updateRampWithProgress:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "lux");
}

- (id)copyColourRampStatsWithLength:(float)a3 frequency:(float)a4 origin:(id)a5 target:(id)a6
{
  id v6;
  double v7;
  id v8;
  double v9;
  id v10;
  double v11;
  id v12;
  double v13;
  id v14;
  double v15;
  id v16;
  double v17;
  id v18;
  id v19;
  unint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  unint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  float v35;
  float v36;
  SEL v37;
  CBAODTransitionController *v38;
  $94F468A8D4C62B317260615823C2B210 v39;
  $94F468A8D4C62B317260615823C2B210 v40;

  v40 = a5;
  v39 = a6;
  v38 = self;
  v37 = a2;
  v36 = a3;
  v35 = a4;
  v21 = 0x1E0CB3000uLL;
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v7 = v36;
  v34 = (id)objc_msgSend(v6, "initWithFloat:", v7);
  v8 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v9 = v35;
  v33 = (id)objc_msgSend(v8, "initWithFloat:", v9);
  v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (float)(v35 * v36));
  v10 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v11 = v40.var0;
  v31 = (id)objc_msgSend(v10, "initWithFloat:", v11);
  v12 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v13 = v40.var1;
  v30 = (id)objc_msgSend(v12, "initWithFloat:", v13);
  v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v15 = v39.var0;
  v29 = (id)objc_msgSend(v14, "initWithFloat:", v15);
  v16 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v17 = v39.var1;
  v28 = (id)objc_msgSend(v16, "initWithFloat:", v17);
  v27 = 0;
  v24 = 0x1E0C99000uLL;
  v22 = CFSTR("X");
  v23 = CFSTR("Y");
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v31, CFSTR("X"), v30, CFSTR("Y"), 0);
  v26 = 0;
  v18 = objc_alloc(*(Class *)(v24 + 3456));
  v26 = (id)objc_msgSend(v18, "initWithObjectsAndKeys:", v29, v22, v28, v23, 0);
  v25 = 0;
  v19 = objc_alloc(*(Class *)(v24 + 3456));
  v25 = (void *)objc_msgSend(v19, "initWithObjectsAndKeys:", v27, CFSTR("RampOrigin"), v26, CFSTR("RampTarget"), v34, CFSTR("RampLength"), v33, CFSTR("RampFrequency"), v32, CFSTR("NumberOfUpdates"), 0);

  return v25;
}

- (id)copyRampStatsWithLength:(float)a3 frequency:(float)a4 origin:(float)a5 target:(float)a6
{
  id v6;
  double v7;
  id v8;
  double v9;
  id v10;
  double v11;
  id v12;
  double v13;
  unint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  float v22;
  float v23;
  float v24;
  float v25;
  SEL v26;
  CBAODTransitionController *v27;

  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v15 = 0x1E0CB3000uLL;
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v7 = v25;
  v21 = (id)objc_msgSend(v6, "initWithFloat:", v7);
  v8 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v9 = v24;
  v20 = (id)objc_msgSend(v8, "initWithFloat:", v9);
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (float)(v24 * v25));
  v10 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v11 = v23;
  v18 = (id)objc_msgSend(v10, "initWithFloat:", v11);
  v12 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v13 = v22;
  v17 = (id)objc_msgSend(v12, "initWithFloat:", v13);
  v16 = 0;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v18, CFSTR("RampOrigin"), v17, CFSTR("RampTarget"), v21, CFSTR("RampLength"), v20, CFSTR("RampFrequency"), v19, CFSTR("NumberOfUpdates"), 0);

  return v16;
}

- (BOOL)cancelTransition
{
  float v2;
  BOOL v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t *v12;
  int v13;
  uint64_t *v14;
  double v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  CFAbsoluteTime Current;
  int *v26;
  double *v27;
  uint64_t *v28;
  uint64_t *v29;
  double v30;
  double v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  int v51;
  char v52;
  float *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  os_log_t v62;
  os_log_type_t v63[4];
  uint8_t *v64;
  NSObject *v65;
  os_log_t v66;
  os_log_t v67;
  os_log_type_t v68[4];
  uint8_t *v69;
  NSObject *v70;
  os_log_t v71;
  uint64_t *v72;
  os_log_t v73;
  os_log_type_t v74[4];
  uint8_t *v75;
  NSObject *v76;
  os_log_t v77;
  int *v78;
  int v79;
  _BYTE *v80;
  uint8_t *v81;
  int v82;
  id v83;
  os_log_t v84;
  os_log_type_t v85[4];
  id v86;
  NSObject *inited;
  os_log_t v88;
  float v89;
  id v90;
  id v91;
  id v92;
  _BOOL4 v93;
  id v94;
  _BYTE *v95;
  double v96;
  os_log_t log;
  os_log_type_t v98[4];
  uint8_t *buf;
  uint64_t v100;
  uint64_t v101;
  int *v102;
  int *v103;
  float v104;
  int *v105;
  float *v106;
  float v107;
  id v108;
  id v109;
  id v110;
  int v111;
  uint64_t *v112;
  int *v113;
  os_log_type_t v114;
  os_log_t v115;
  os_log_type_t v116;
  os_log_t v117;
  os_log_type_t v118;
  os_log_t v119;
  int v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  _BYTE v124[39];
  os_log_type_t v125;
  os_log_t oslog;
  uint64_t v127;
  unsigned __int16 v128;
  uint64_t v129;
  int v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  __int16 v134;
  uint64_t v135;
  char v136;
  _BYTE v137[79];
  os_log_type_t type;
  unsigned __int16 v139;
  uint64_t v140;
  unsigned int v141;
  uint64_t v142;
  _BYTE __b[83];
  BOOL v144;
  SEL v145;
  CBAODTransitionController *v146;
  _BYTE v147[80];
  uint8_t v148[16];
  _BYTE v149[176];
  uint8_t v150[16];
  uint8_t v151[24];
  uint64_t v152;

  v112 = &v127;
  v152 = *MEMORY[0x1E0C80C00];
  v146 = self;
  v145 = a2;
  v144 = 0;
  v113 = &OBJC_IVAR___BLControl__clientDisplayMap;
  -[CBRampManager remainingLength](self->_rampManager, "remainingLength");
  v146->_targetWhitepoint.xy.y = v2;
  v3 = -[CBAODTransitionController requestTransitionStopForIdentifier:](v146, "requestTransitionStopForIdentifier:", CFSTR("SDR_RAMP"));
  v111 = 1;
  v144 = v144 || v3;
  v4 = objc_msgSend((id)v112[42], "requestTransitionStopForIdentifier:", CFSTR("BRIGHTNESS_LIMIT_RAMP"));
  v144 = (v144 | v4 & 1) != 0;
  v5 = objc_msgSend((id)v112[42], "requestTransitionStopForIdentifier:", CFSTR("EDR_RAMP"));
  v144 = (v144 | v5 & 1) != 0;
  v6 = objc_msgSend((id)v112[42], "requestTransitionStopForIdentifier:", CFSTR("AAP_RAMP"));
  v144 = (v144 | v6 & 1) != 0;
  v7 = objc_msgSend((id)v112[42], "requestTransitionStopForIdentifier:", CFSTR("LUMA_BOOST_FACTOR_RAMP"));
  v144 = (v144 | v7 & 1) != 0;
  v8 = objc_msgSend((id)v112[42], "requestTransitionStopForIdentifier:", CFSTR("TWILIGHT_RAMP"));
  v144 = (v144 | v8 & 1) != 0;
  v9 = objc_msgSend((id)v112[42], "requestTransitionStopForIdentifier:", CFSTR("AMMOLITE_RAMP"));
  v144 = (v144 | v9 & 1) != 0;
  v10 = objc_msgSend((id)v112[42], "requestColorRampTransitionStop");
  v144 = (v144 | v10 & 1) != 0;
  if ((objc_msgSend(*(id *)(v112[42] + v113[79]), "liveUpdates") & 1) == 0)
  {
    v11 = objc_msgSend((id)v112[42], "cancelDCPTransition");
    v12 = v112;
    v144 = (v144 | v11 & 1) != 0;
    *((_DWORD *)v112 + 80) = 0;
    v13 = objc_msgSend((id)v12[42], "currentTransitionUpdateID");
    v14 = v112;
    *((_DWORD *)v112 + 80) = v13;
    if (*((_DWORD *)v14 + 80) == -1)
    {
      if (*(_QWORD *)(v112[42] + 248))
      {
        memset(__b, 0, 0x4CuLL);
        v110 = *(id *)(v112[42] + 248);
        if (v110)
          objc_msgSend(v110, "origin");
        else
          memset(__b, 0, 0x4CuLL);
        v109 = *(id *)(v112[42] + 248);
        if (v109)
        {
          objc_msgSend(v109, "header");
        }
        else
        {
          v16 = v112;
          v112[27] = 0;
          v16[28] = 0;
          v142 = 0;
        }
        v107 = (float)v141;
        v108 = *(id *)(v112[42] + 248);
        if (v108)
        {
          objc_msgSend(v108, "header");
        }
        else
        {
          v17 = v112;
          v112[24] = 0;
          v17[25] = 0;
          v140 = 0;
        }
        v18 = v112;
        v104 = 1.0;
        *(float *)(v112[42] + 392) = v107 * (float)(1.0 / (float)v139);
        v106 = (float *)__b;
        *(_DWORD *)(v18[42] + 92) = *((_DWORD *)v18 + 61);
        *(_DWORD *)(v18[42] + 124) = *((_DWORD *)v18 + 62);
        *(_DWORD *)(v18[42] + 116) = *((_DWORD *)v18 + 63);
        LODWORD(v15) = *((_DWORD *)v18 + 65);
        v19 = v18[42];
        v102 = &OBJC_IVAR___BLControl__clientDisplayMap;
        objc_msgSend(*(id *)(v19 + 400), "setLux:", v15);
        LODWORD(v20) = *((_DWORD *)v112 + 61);
        objc_msgSend(*(id *)(v112[42] + 400), "setNits:", v20);
        objc_msgSend(*(id *)(v112[42] + 400), "currentStrength");
        LODWORD(v21) = *((_DWORD *)v112 + 67);
        v22 = v112[42];
        v103 = &OBJC_IVAR___BLControl__clientDisplayMap;
        objc_msgSend(*(id *)(v22 + 408), "setLux:", v21);
        LODWORD(v23) = *((_DWORD *)v112 + 61);
        objc_msgSend(*(id *)(v112[42] + 408), "setNits:", v23);
        v24 = v112[42];
        v105 = &OBJC_IVAR___BLControl__clientDisplayMap;
        CFXSetTarget(*(_QWORD *)(v24 + 272), v106 + 7, 1, 1, 0.0, v104);
        v112[23] = 0;
        Current = CFAbsoluteTimeGetCurrent();
        v26 = v105;
        v27 = (double *)v112;
        *((CFAbsoluteTime *)v112 + 23) = Current;
        CFXUpdateColorFade(*(_QWORD *)(*((_QWORD *)v27 + 42) + v26[110]), v27[23]);
        memcpy((void *)(v112[42] + 280), v106 + 7, 0x30uLL);
        v28 = v112;
        v112[22] = 0;
        if (*(_QWORD *)(v28[42] + 16))
        {
          v101 = *(_QWORD *)(v112[42] + 16);
        }
        else
        {
          v100 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          v101 = v100;
        }
        v29 = v112;
        v112[22] = v101;
        type = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v29[22], OS_LOG_TYPE_DEFAULT))
        {
          log = (os_log_t)v112[22];
          *(_DWORD *)v98 = type;
          v96 = *((double *)v112 + 23);
          objc_msgSend(*(id *)(v112[42] + 248), "submissionTimestamp");
          buf = v151;
          __os_log_helper_16_0_1_8_0((uint64_t)v151, COERCE__INT64(v96 - v30));
          _os_log_impl(&dword_1B5291000, log, v98[0], "[Flipbook] No progress made on flipbook for %f sec", v151, 0xCu);
        }
      }
    }
    else
    {
      v95 = v137;
      memset(v137, 0, sizeof(v137));
      v136 = 0;
      v136 = objc_msgSend((id)v112[42], "flipBookEntryForID:entry:", *((unsigned int *)v112 + 80), v137) & 1;
      if (v136 && *(_QWORD *)(v112[42] + 248))
      {
        v32 = v112;
        *(_DWORD *)(v112[42] + 392) = 0;
        v94 = *(id *)(v32[42] + 248);
        if (v94)
        {
          objc_msgSend(v94, "header");
        }
        else
        {
          v33 = v112;
          v112[9] = 0;
          v33[10] = 0;
          v135 = 0;
        }
        v93 = 0;
        if (v134)
        {
          v92 = *(id *)(v112[42] + 248);
          if (v92)
          {
            objc_msgSend(v92, "header");
          }
          else
          {
            v34 = v112;
            v112[6] = 0;
            v34[7] = 0;
            v133 = 0;
          }
          v93 = v132 != 0;
        }
        if (v93)
        {
          v91 = *(id *)(v112[42] + 248);
          if (v91)
          {
            objc_msgSend(v91, "header");
          }
          else
          {
            v35 = v112;
            v112[3] = 0;
            v35[4] = 0;
            v131 = 0;
          }
          v89 = (float)(v130 - 1 - *((_DWORD *)v112 + 80));
          v90 = *(id *)(v112[42] + 248);
          if (v90)
          {
            objc_msgSend(v90, "header");
          }
          else
          {
            v127 = 0;
            v112[1] = 0;
            v129 = 0;
          }
          v36 = v112;
          *(float *)(v112[42] + 392) = v89 * (float)(1.0 / (float)v128);
          *(float *)(v36[42] + 392) = fminf(*(float *)(v36[42] + 392), 5.0);
        }
        else
        {
          oslog = 0;
          if (*(_QWORD *)(v112[42] + 16))
          {
            v88 = *(os_log_t *)(v112[42] + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              inited = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              inited = init_default_corebrightness_log();
            v88 = inited;
          }
          oslog = v88;
          v125 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          {
            v84 = oslog;
            *(_DWORD *)v85 = v125;
            v86 = *(id *)(v112[42] + 248);
            if (v86)
              objc_msgSend(v86, "header");
            else
              memset(&v124[16], 0, 23);
            v82 = *(unsigned __int16 *)&v124[29];
            v83 = *(id *)(v112[42] + 248);
            if (v83)
            {
              objc_msgSend(v83, "header");
            }
            else
            {
              v123 = 0;
              *(_QWORD *)v124 = 0;
              *(_QWORD *)&v124[7] = 0;
            }
            v81 = v150;
            __os_log_helper_16_0_2_4_0_4_0((uint64_t)v150, v82, *(int *)&v124[1]);
            _os_log_error_impl(&dword_1B5291000, v84, v85[0], "[Flipbook] Unexpected flipbook frequency = %d OR flipbook number of updates = %d", v150, 0xEu);
          }
        }
        if ((v137[4] & 1) != 0)
          *(_DWORD *)(v112[42] + 92) = *(_DWORD *)&v137[5];
        if ((v137[51] & 1) != 0)
          *(_DWORD *)(v112[42] + 124) = *((_DWORD *)v112 + 37);
        if ((v137[46] & 1) != 0)
          *(_DWORD *)(v112[42] + 116) = *(_DWORD *)&v137[47];
        LODWORD(v31) = *(_DWORD *)(v112[42] + 92);
        objc_msgSend(*(id *)(v112[42] + 400), "setNits:", v31);
        if ((v137[56] & 1) != 0 || (v137[4] & 1) != 0)
        {
          LODWORD(v37) = *(_DWORD *)&v137[61];
          objc_msgSend(*(id *)(v112[42] + 400), "setLux:", v37);
        }
        objc_msgSend(*(id *)(v112[42] + 400), "currentStrength");
        LODWORD(v38) = *(_DWORD *)(v112[42] + 92);
        objc_msgSend(*(id *)(v112[42] + 408), "setNits:", v38);
        if ((v137[65] & 1) != 0 || (v137[4] & 1) != 0)
        {
          LODWORD(v39) = *(_DWORD *)&v137[70];
          objc_msgSend(*(id *)(v112[42] + 408), "setLux:", v39);
        }
        v40 = v112[42];
        v78 = &OBJC_IVAR___BLControl__clientDisplayMap;
        v41 = *(_QWORD *)(v40 + 272);
        v80 = v137;
        v79 = 0;
        CFXSetTarget(v41, (float *)&v137[10], 1, 1, 0.0, 1.0);
        v122 = CFAbsoluteTimeGetCurrent();
        CFXUpdateColorFade(*(_QWORD *)(v112[42] + 272), v122);
        objc_msgSend((id)v112[42], "setCurrentWhitepointFromMatrix:", &v137[10]);
        v121 = 0;
        v120 = 0;
        objc_msgSend((id)v112[42], "chromaticity:andIlluminance:fromMatrix:", &v121, &v120, &v137[10]);
        v119 = 0;
        if (*(_QWORD *)(v112[42] + 16))
        {
          v77 = *(os_log_t *)(v112[42] + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v76 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v76 = init_default_corebrightness_log();
          v77 = v76;
        }
        v119 = v77;
        v118 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          v73 = v119;
          *(_DWORD *)v74 = v118;
          v42 = *((_DWORD *)v112 + 24);
          *(double *)&v43 = *(float *)(v112[42] + 392);
          v44 = "set";
          if ((v137[4] & 1) != 0)
            v45 = "set";
          else
            v45 = "not set";
          if ((v137[9] & 1) != 0)
            v46 = "set";
          else
            v46 = "not set";
          if ((v137[46] & 1) != 0)
            v47 = "set";
          else
            v47 = "not set";
          *(double *)&v48 = *((float *)v112 + 37);
          if ((v137[51] & 1) != 0)
            v49 = "set";
          else
            v49 = "not set";
          if ((v137[56] & 1) != 0)
            v50 = "set";
          else
            v50 = "not set";
          if ((v137[65] & 1) == 0)
            v44 = "not set";
          v72 = &v61;
          v75 = v149;
          __os_log_helper_16_2_17_4_0_8_0_8_0_8_32_8_0_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_0_8_32_8_0((uint64_t)v149, v42, v43, COERCE__INT64(*(float *)&v137[5]), (uint64_t)v45, COERCE__INT64(*(float *)&v121), COERCE__INT64(*((float *)&v121 + 1)), (uint64_t)v46, COERCE__INT64(*(float *)&v137[47]), (uint64_t)v47, v48, (uint64_t)v49, COERCE__INT64(*(float *)&v137[57]), (uint64_t)v50, COERCE__INT64(*(float *)&v137[61]), COERCE__INT64(*(float *)&v137[66]), (uint64_t)v44, COERCE__INT64(*(float *)&v137[70]));
          _os_log_impl(&dword_1B5291000, v73, v74[0], "[Flipbook] Last update applied[%d], remaining transition length = %f, brightness = %f (%s); WP = (%f; %f) (%"
            "s), pcc = %f (%s), brightness limit = %f (%s), twilight = %f (%s), twilightLux = %f, ammolite = %f (%s), ammoliteLux = %f",
            v75,
            0xA8u);
        }
      }
      else
      {
        v117 = 0;
        if (*(_QWORD *)(v112[42] + 16))
        {
          v71 = *(os_log_t *)(v112[42] + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v70 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v70 = init_default_corebrightness_log();
          v71 = v70;
        }
        v117 = v71;
        v116 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          v67 = v117;
          *(_DWORD *)v68 = v116;
          v51 = *((_DWORD *)v112 + 80);
          v69 = v148;
          __os_log_helper_16_0_1_4_0((uint64_t)v148, v51);
          _os_log_error_impl(&dword_1B5291000, v117, v116, "[Flipbook] currentID=%d (from DCP; adjusted) does not correspond to any entry",
            v148,
            8u);
        }
        *(_DWORD *)(v112[42] + 392) = 0;
      }
    }
  }
  if (*(_QWORD *)(v112[42] + 160))
    (*(void (**)(void))(*(_QWORD *)(v112[42] + 160) + 16))();
  objc_msgSend((id)v112[42], "releaseCallbacks");
  v115 = 0;
  if (*(_QWORD *)(v112[42] + 16))
  {
    v66 = *(os_log_t *)(v112[42] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v65 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v65 = init_default_corebrightness_log();
    v66 = v65;
  }
  v115 = v66;
  v114 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v62 = v115;
    *(_DWORD *)v63 = v114;
    v52 = objc_msgSend(*(id *)(v112[42] + 80), "liveUpdates");
    v53 = (float *)v112[42];
    *(double *)&v54 = v53[23];
    *(double *)&v55 = v53[79];
    *(double *)&v56 = v53[80];
    *(double *)&v57 = v53[27];
    *(double *)&v58 = v53[29];
    *(double *)&v59 = v53[98];
    v64 = v147;
    __os_log_helper_16_0_7_4_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v147, v52 & 1, v54, v55, v56, v57, v58, v59);
    _os_log_impl(&dword_1B5291000, v62, v63[0], "[AOD update] Cancel transition, liveUpdates=%d. Current SDR = %f, WP = (%f;%f), _currentEDRHeadroom = %f, AAP = %f"
      ", remaining transition length = %f",
      v64,
      0x44u);
  }
  return v144;
}

- (void)releaseCallbacks
{
  if (self->_rampDoneCallback)
  {
    _Block_release(self->_rampDoneCallback);
    self->_rampDoneCallback = 0;
  }
  if (self->_rampCanceledCallback)
  {
    _Block_release(self->_rampCanceledCallback);
    self->_rampCanceledCallback = 0;
  }
}

- (void)clockUpdateHandler:(id)a3
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
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  float v19;
  int v20;
  CBBrightnessProxy *brtCtl;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CBAODTransitionController *v38;
  CBAODTransitionController *v39;
  CBAODTransitionController *v40;
  CBAODTransitionController *v41;
  CBAODTransitionController *v42;
  CBAODTransitionController *v43;
  CBAODTransitionController *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  uint64_t inited;
  NSObject *logHandle;
  void *v59;
  _BYTE v60[79];
  _BYTE __dst[79];
  int v62;
  int v63;
  os_log_type_t __b[79];
  os_log_type_t v65;
  os_log_t v66;
  uint64_t v67;
  int v68;
  int v69;
  void (*v70)(uint64_t, uint64_t);
  void *v71;
  CBAODTransitionController *v72;
  _QWORD *v73;
  _QWORD v74[2];
  int v75;
  int v76;
  int v77;
  os_log_type_t v78;
  os_log_t v79;
  float v80;
  os_log_type_t type;
  os_log_t v82;
  char v83;
  uint64_t v84;
  float v85;
  int v86;
  int v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  SEL v97;
  CBAODTransitionController *v98;
  uint8_t v99[16];
  uint8_t v100[16];
  uint8_t v101[104];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v98 = self;
  v97 = a2;
  v96 = a3;
  v95 = (id)objc_msgSend(a3, "rampForIdentifier:", CFSTR("SDR_RAMP"));
  v94 = (id)objc_msgSend(v96, "rampForIdentifier:", CFSTR("COLOR_RAMP"));
  v93 = (id)objc_msgSend(v96, "rampForIdentifier:", CFSTR("EDR_RAMP"));
  v92 = (id)objc_msgSend(v96, "rampForIdentifier:", CFSTR("AAP_RAMP"));
  v91 = (id)objc_msgSend(v96, "rampForIdentifier:", CFSTR("BRIGHTNESS_LIMIT_RAMP"));
  v90 = (id)objc_msgSend(v96, "rampForIdentifier:", CFSTR("LUMA_BOOST_FACTOR_RAMP"));
  v89 = (id)objc_msgSend(v96, "rampForIdentifier:", CFSTR("TWILIGHT_RAMP"));
  v88 = (id)objc_msgSend(v96, "rampForIdentifier:", CFSTR("AMMOLITE_RAMP"));
  if (-[CBRampManager liveUpdates](v98->_rampManager, "liveUpdates"))
  {
    if (v95)
    {
      objc_msgSend(v95, "currentValue");
      -[CBAODTransitionController updateSDRBrightness:](v98, "updateSDRBrightness:", v3);
      objc_msgSend(v95, "currentValue");
      objc_msgSend(*(id *)&v98->_liveUpdatesOverride, "setNits:", v4);
      objc_msgSend(v95, "currentValue");
      objc_msgSend(*(id *)&v98->_currentDisplayNits, "setNits:", v5);
      if (*(_QWORD *)&v98->_remainingTransitionLength)
      {
        v59 = *(void **)&v98->_remainingTransitionLength;
        objc_msgSend(v95, "currentValue");
        objc_msgSend(v59, "setSdrBrightness:", v6);
        objc_msgSend(*(id *)&v98->_remainingTransitionLength, "updateRamp");
      }
    }
    if (v94)
      -[CBAODTransitionController updateColorRamp:](v98, "updateColorRamp:", v94);
    if (v93)
    {
      objc_msgSend(v93, "currentValue");
      -[CBAODTransitionController updateEDRHeadroom:](v98, "updateEDRHeadroom:", v7);
    }
    if (v92)
    {
      objc_msgSend(v92, "currentValue");
      -[CBAODTransitionController updateAAPFactor:](v98, "updateAAPFactor:", v8);
    }
    if (v91)
    {
      objc_msgSend(v91, "currentValue");
      -[CBAODTransitionController updateBrightnessLimit:](v98, "updateBrightnessLimit:", v9);
    }
    if (v90)
    {
      objc_msgSend(v90, "currentValue");
      -[CBAODTransitionController updateLumaBoostFactor:](v98, "updateLumaBoostFactor:", v10);
    }
    *(float *)&v87 = NAN;
    if (*(_QWORD *)&v98->_liveUpdatesOverride && (v95 || v89))
    {
      objc_msgSend(*(id *)&v98->_liveUpdatesOverride, "currentStrength");
      v87 = SLODWORD(v11);
      -[CBAODTransitionController updateTwilightStrength:](v98, "updateTwilightStrength:", v11);
    }
    *(float *)&v86 = NAN;
    if (*(_QWORD *)&v98->_currentDisplayNits && (v95 || v88))
    {
      objc_msgSend(*(id *)&v98->_currentDisplayNits, "currentStrength");
      v86 = SLODWORD(v12);
      -[CBAODTransitionController updateAmmoliteStrength:](v98, "updateAmmoliteStrength:", v12);
    }
    v85 = NAN;
    if (*(_QWORD *)&v98->_remainingTransitionLength
      && (CBU_IsSecureIndicatorSupported() & 1) != 0
      && (objc_msgSend(*(id *)&v98->_remainingTransitionLength, "shouldPushIndicatorBrightness") & 1) != 0)
    {
      objc_msgSend(*(id *)&v98->_remainingTransitionLength, "currentIndicatorBrightness");
      v85 = v13;
    }
    v84 = 0;
    v83 = 0;
    v82 = 0;
    if (v98->super._logHandle)
    {
      logHandle = v98->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v82 = logHandle;
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (v95)
      {
        objc_msgSend(v95, "currentValue");
        v56 = v14;
      }
      else
      {
        v56 = -1.0;
      }
      if (v93)
      {
        objc_msgSend(v93, "currentValue");
        v55 = v15;
      }
      else
      {
        v55 = -1.0;
      }
      if (v91)
      {
        objc_msgSend(v91, "currentValue");
        v54 = v16;
      }
      else
      {
        v54 = -1.0;
      }
      if (v92)
      {
        objc_msgSend(v92, "currentValue");
        v53 = v17;
      }
      else
      {
        v53 = -1.0;
      }
      if (v94)
        v52 = v98->_currentWhitepoint.matrix[1][0];
      else
        v52 = -1.0;
      if (v94)
        v51 = v98->_currentWhitepoint.matrix[1][1];
      else
        v51 = -1.0;
      if (v95 || v89)
        v50 = *(float *)&v87;
      else
        v50 = -1.0;
      if (v95 || v88)
        v49 = *(float *)&v86;
      else
        v49 = -1.0;
      __os_log_helper_16_0_10_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v101, COERCE__INT64(v56), COERCE__INT64(v55), COERCE__INT64(v54), COERCE__INT64(v53), COERCE__INT64(v52), COERCE__INT64(v51), COERCE__INT64(v50), COERCE__INT64(v49), COERCE__INT64(v85), COERCE__INT64(v98->_currentTrustedLux));
      _os_log_impl(&dword_1B5291000, v82, type, "[AOD update][CA] Pushing sdrBrightness: %f, capped _appliedHeadroom: %f, brightnessLimit: %f, PCC: %f, Whitepoint:(%f | %f), TwilightStrength: %f, AmmoliteStrength: %f, IndicatorBrightness: %f, Ambient: %f", v101, 0x66u);
    }
    if ((std::__math::isnan[abi:ne180100]() & 1) != 0)
    {
      *(float *)&v18 = v85;
    }
    else
    {
      v80 = 0.0;
      v80 = std::__math::fmax[abi:ne180100](v85, v98->_currentSDRBrightness);
      *(float *)&v18 = v80;
    }
    -[CBBrightnessProxy setIndicatorBrightness:](v98->_brtCtl, "setIndicatorBrightness:", v18);
    if (v95 && (objc_msgSend(v95, "isFinished") & 1) == 0
      || v94 && (objc_msgSend(v94, "isFinished") & 1) == 0
      || v93 && (objc_msgSend(v93, "isFinished") & 1) == 0
      || v92 && (objc_msgSend(v92, "isFinished") & 1) == 0
      || v91 && (objc_msgSend(v91, "isFinished") & 1) == 0)
    {
      v83 = -[CBBrightnessProxy commitBrightness:](v98->_brtCtl, "commitBrightness:", &v84) & 1;
    }
    else
    {
      v79 = 0;
      if (v98->super._logHandle)
      {
        v48 = v98->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v47 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v47 = init_default_corebrightness_log();
        v48 = v47;
      }
      v79 = v48;
      v78 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v95, "currentValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v100, COERCE__INT64(v19));
        _os_log_impl(&dword_1B5291000, v79, v78, "CommitBrightness: %f with swap done callback", v100, 0xCu);
      }
      v74[0] = 0;
      v74[1] = v74;
      v75 = 0x20000000;
      v76 = 32;
      v77 = 0;
      objc_msgSend(v95, "currentValue");
      v77 = v20;
      brtCtl = v98->_brtCtl;
      v67 = MEMORY[0x1E0C809B0];
      v68 = -1073741824;
      v69 = 0;
      v70 = __48__CBAODTransitionController_clockUpdateHandler___block_invoke;
      v71 = &unk_1E68EB1D0;
      v72 = v98;
      v73 = v74;
      v83 = -[CBBrightnessProxy commitBrightness:withBlock:](brtCtl, "commitBrightness:withBlock:", &v84, &v67) & 1;
      LODWORD(v22) = 0.5;
      -[CBAODTransitionController activateLastUpdateSwappedTimerWithTimeout:](v98, "activateLastUpdateSwappedTimerWithTimeout:", v22);
      _Block_object_dispose(v74, 8);
    }
    if ((v83 & 1) == 0 || v84)
    {
      v66 = 0;
      if (v98->super._logHandle)
      {
        v46 = v98->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v45 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v45 = init_default_corebrightness_log();
        v46 = v45;
      }
      v66 = v46;
      v65 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v99, v84);
        _os_log_error_impl(&dword_1B5291000, v66, v65, "failed to commit brightness update (%@)", v99, 0xCu);
      }
    }
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    memcpy(&v98->_currentFlipBookEntry, __b, 0x4FuLL);
    if (v95)
    {
      v44 = v98;
      objc_msgSend(v95, "currentValue");
      -[CBAODTransitionController updateFlipBookEntryWithBrightness:](v44, "updateFlipBookEntryWithBrightness:", v23);
    }
    if (v92)
    {
      v43 = v98;
      objc_msgSend(v92, "currentValue");
      -[CBAODTransitionController updateFlipBookEntryWithAAPFactor:](v43, "updateFlipBookEntryWithAAPFactor:", v24);
    }
    if (v91)
    {
      v42 = v98;
      objc_msgSend(v91, "currentValue");
      -[CBAODTransitionController updateFlipBookEntryWithBrightnessLimit:](v42, "updateFlipBookEntryWithBrightnessLimit:", v25);
    }
    if (*(_QWORD *)&v98->_liveUpdatesOverride && (v95 || v89))
    {
      v63 = 0;
      objc_msgSend(*(id *)&v98->_liveUpdatesOverride, "nits");
      v63 = v26;
      *(float *)&v27 = v98->_currentSDRBrightness;
      objc_msgSend(*(id *)&v98->_liveUpdatesOverride, "setNits:", v27);
      v41 = v98;
      objc_msgSend(*(id *)&v98->_liveUpdatesOverride, "lux");
      -[CBAODTransitionController updateFlipBookEntryWithTwilightLux:](v41, "updateFlipBookEntryWithTwilightLux:", v28);
      *(float *)&v29 = v98->_currentSDRBrightness;
      if ((objc_msgSend(*(id *)&v98->_liveUpdatesOverride, "nitsAreInActiveRange:", v29) & 1) != 0
        || (LODWORD(v30) = v63, (objc_msgSend(*(id *)&v98->_liveUpdatesOverride, "nitsAreInActiveRange:", v30) & 1) != 0))
      {
        v40 = v98;
        objc_msgSend(*(id *)&v98->_liveUpdatesOverride, "currentStrength");
        -[CBAODTransitionController updateFlipBookEntryWithTwilightStrength:](v40, "updateFlipBookEntryWithTwilightStrength:", v31);
      }
    }
    if (*(_QWORD *)&v98->_currentDisplayNits && (v95 || v88))
    {
      v62 = 0;
      objc_msgSend(*(id *)&v98->_currentDisplayNits, "nits");
      v62 = v32;
      *(float *)&v33 = v98->_currentSDRBrightness;
      objc_msgSend(*(id *)&v98->_currentDisplayNits, "setNits:", v33);
      v39 = v98;
      objc_msgSend(*(id *)&v98->_currentDisplayNits, "lux");
      -[CBAODTransitionController updateFlipBookEntryWithAmmoliteLux:](v39, "updateFlipBookEntryWithAmmoliteLux:", v34);
      *(float *)&v35 = v98->_currentSDRBrightness;
      if ((objc_msgSend(*(id *)&v98->_currentDisplayNits, "nitsAreInActiveRange:", v35) & 1) != 0
        || (LODWORD(v36) = v62, (objc_msgSend(*(id *)&v98->_currentDisplayNits, "nitsAreInActiveRange:", v36) & 1) != 0))
      {
        v38 = v98;
        objc_msgSend(*(id *)&v98->_currentDisplayNits, "currentStrength");
        -[CBAODTransitionController updateFlipBookEntryWithAmmoliteStrength:](v38, "updateFlipBookEntryWithAmmoliteStrength:", v37);
      }
    }
    -[CBAODTransitionController updateColorRamp:](v98, "updateColorRamp:", v94);
    memcpy(__dst, &v98->_currentFlipBookEntry, sizeof(__dst));
    -[CBAODTransitionController addFlipBookEntry:](v98, "addFlipBookEntry:", __dst);
    if (*(_QWORD *)&v98->_currentFlipBookEntry.ammoliteStrength_set
      && objc_msgSend(*(id *)&v98->_currentFlipBookEntry.ammoliteStrength_set, "entryCount") == 1)
    {
      memcpy(v60, &v98->_currentFlipBookEntry, sizeof(v60));
      -[CBAODTransitionController addFlipBookEntry:](v98, "addFlipBookEntry:", v60);
    }
  }

}

void __48__CBAODTransitionController_clockUpdateHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = a1;
  v12 = a2;
  v11 = a1;
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __48__CBAODTransitionController_clockUpdateHandler___block_invoke_2;
  v8 = &unk_1E68EABC8;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  dispatch_async(v3, &block);
}

void __48__CBAODTransitionController_clockUpdateHandler___block_invoke_2(uint64_t a1)
{
  uint64_t inited;
  NSObject *v2;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "releaseLastUpdateSwappedTimer");
  objc_msgSend(*(id *)(a1 + 32), "applyPendingUpdates");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v2 = inited;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v4, COERCE__INT64(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
    _os_log_impl(&dword_1B5291000, v2, OS_LOG_TYPE_DEFAULT, "CommitBrightness: Last update with brightness (%f) has been swapped on the display", v4, 0xCu);
  }
}

- (void)rampsDoneCallback:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[15];
  os_log_type_t v8;
  NSObject *v9;
  id v10;
  SEL v11;
  CBAODTransitionController *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = 0;
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
  v9 = logHandle;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "Call ramps done callback", v7, 2u);
  }
  if (!-[CBRampManager liveUpdates](v12->_rampManager, "liveUpdates"))
    -[CBAODTransitionController sendCurrentFlipBook](v12, "sendCurrentFlipBook");
  if (v12->_rampDoneCallback)
    (*((void (**)(void))v12->_rampDoneCallback + 2))();
  -[CBAODTransitionController releaseCallbacks](v12, "releaseCallbacks");
}

- (void)releaseLastUpdateSwappedTimer
{
  if (*(_QWORD *)&self->_currentFlipBookEntry.reserved[4])
  {
    dispatch_source_cancel(*(dispatch_source_t *)&self->_currentFlipBookEntry.reserved[4]);
    dispatch_release(*(dispatch_object_t *)&self->_currentFlipBookEntry.reserved[4]);
    *(_QWORD *)&self->_currentFlipBookEntry.reserved[4] = 0;
  }
}

- (void)activateLastUpdateSwappedTimerWithTimeout:(float)a3
{
  dispatch_time_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  NSObject *source;
  uint64_t handler;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  CBAODTransitionController *v13;
  float v14;
  int64_t v15;
  float v16;
  SEL v17;
  CBAODTransitionController *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = (unint64_t)(float)(a3 * 1000000000.0);
  if (*(_QWORD *)&self->_currentFlipBookEntry.reserved[4])
  {
    source = *(NSObject **)&v18->_currentFlipBookEntry.reserved[4];
    v3 = dispatch_time(0, v15);
    dispatch_source_set_timer(source, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    *(_QWORD *)&v18->_currentFlipBookEntry.reserved[4] = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v18->super._queue);
    if (*(_QWORD *)&v18->_currentFlipBookEntry.reserved[4])
    {
      v4 = *(NSObject **)&v18->_currentFlipBookEntry.reserved[4];
      handler = MEMORY[0x1E0C809B0];
      v9 = -1073741824;
      v10 = 0;
      v11 = __71__CBAODTransitionController_activateLastUpdateSwappedTimerWithTimeout___block_invoke;
      v12 = &unk_1E68EB1F8;
      v13 = v18;
      v14 = v16;
      dispatch_source_set_event_handler(v4, &handler);
      v6 = *(NSObject **)&v18->_currentFlipBookEntry.reserved[4];
      v5 = dispatch_time(0, v15);
      dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  dispatch_activate(*(dispatch_object_t *)&v18->_currentFlipBookEntry.reserved[4]);
}

uint64_t __71__CBAODTransitionController_activateLastUpdateSwappedTimerWithTimeout___block_invoke(uint64_t a1)
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
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v5, COERCE__INT64(*(float *)(a1 + 40)));
    _os_log_error_impl(&dword_1B5291000, v3, OS_LOG_TYPE_ERROR, "Last update has not been swapped on display in timeout %f.", v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "releaseLastUpdateSwappedTimer");
  return objc_msgSend(*(id *)(a1 + 32), "applyPendingUpdates");
}

- (BOOL)applyPendingUpdates
{
  double v2;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_pendingState
    && -[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState") == 1)
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
      __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)self->_pendingState);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Apply pending update. %@", v7, 0xCu);
    }
    LODWORD(v2) = -1.0;
    -[CBAODTransitionController startTransition:length:forceUpdate:rampDoneCallback:rampCanceledCallback:](self, "startTransition:length:forceUpdate:rampDoneCallback:rampCanceledCallback:", self->_pendingState, 0, &__block_literal_global_154, 0, v2);
    if (self->_pendingState)
    {

      self->_pendingState = 0;
    }
  }
  return 0;
}

- (BOOL)commitBrightness:(float)a3 force:(BOOL)a4
{
  double v4;
  const char *v5;
  const char *v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t inited;
  NSObject *logHandle;
  char v12;
  uint64_t v13;
  os_log_type_t v14;
  os_log_t v15;
  BOOL v16;
  float v17;
  SEL v18;
  CBAODTransitionController *v19;
  uint8_t v20[32];
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = 0;
  if (self->super._logHandle)
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
  v15 = logHandle;
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    if (v16)
      v5 = "force ";
    else
      v5 = "";
    __os_log_helper_16_2_2_8_32_8_0((uint64_t)v21, (uint64_t)v5, COERCE__INT64(v17));
    _os_log_impl(&dword_1B5291000, v15, v14, "Update and %scommit CA SDR brightness %f", v21, 0x16u);
  }
  *(float *)&v4 = v17;
  -[CBBrightnessProxy setSDRBrightness:](v19->_brtCtl, "setSDRBrightness:", v4);
  v13 = 0;
  if (v16)
    v12 = -[CBBrightnessProxy forceCommitBrightness:withBlock:](v19->_brtCtl, "forceCommitBrightness:withBlock:", &v13, 0) & 1;
  else
    v12 = -[CBBrightnessProxy commitBrightness:](v19->_brtCtl, "commitBrightness:", &v13) & 1;
  if ((v12 & 1) == 0)
  {
    if (v19->super._logHandle)
    {
      v9 = v19->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v8 = init_default_corebrightness_log();
      v9 = v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (v16)
        v6 = "FORCE ";
      else
        v6 = "";
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v20, (uint64_t)v6, v13);
      _os_log_error_impl(&dword_1B5291000, v9, OS_LOG_TYPE_ERROR, "ERROR %sCOMMITING SDR BRIGHTNESS FROM CA! (%@)", v20, 0x16u);
    }
  }
  return v12 & 1;
}

- (BOOL)updateAllBrightnessFeaturesForced:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t inited;
  NSObject *v12;
  uint64_t v13;
  NSObject *logHandle;
  char v15;
  uint64_t v16;
  float v17;
  float v18;
  BOOL v19;
  SEL v20;
  CBAODTransitionController *v21;
  uint8_t v22[96];
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  v19 = a3;
  *(float *)&v3 = self->_currentSDRBrightness;
  -[CBAODTransitionController updateSDRBrightness:](self, "updateSDRBrightness:", v3);
  *(float *)&v4 = v21->_currentBrightnessLimit;
  -[CBAODTransitionController updateBrightnessLimit:](v21, "updateBrightnessLimit:", v4);
  *(float *)&v5 = v21->_currentAAPFactor;
  -[CBAODTransitionController updateAAPFactor:](v21, "updateAAPFactor:", v5);
  -[CBAODTransitionController updateWhitePoint:](v21, "updateWhitePoint:", &v21->_thresholdModule);
  *(float *)&v6 = v21->_currentTrustedLux;
  -[CBAODTransitionController updateAmbient:](v21, "updateAmbient:", v6);
  v18 = 0.0;
  if (*(_QWORD *)&v21->_liveUpdatesOverride)
  {
    objc_msgSend(*(id *)&v21->_liveUpdatesOverride, "currentStrength");
    v18 = *(float *)&v7;
    -[CBAODTransitionController updateTwilightStrength:](v21, "updateTwilightStrength:", v7);
  }
  v17 = 0.0;
  if (*(_QWORD *)&v21->_currentDisplayNits)
  {
    objc_msgSend(*(id *)&v21->_currentDisplayNits, "currentStrength");
    v17 = *(float *)&v8;
    -[CBAODTransitionController updateAmmoliteStrength:](v21, "updateAmmoliteStrength:", v8);
  }
  v16 = 0;
  if (v19)
    v15 = -[CBBrightnessProxy forceCommitBrightness:withBlock:](v21->_brtCtl, "forceCommitBrightness:withBlock:", &v16, 0) & 1;
  else
    v15 = -[CBBrightnessProxy commitBrightness:](v21->_brtCtl, "commitBrightness:", &v16) & 1;
  if ((v15 & 1) == 0)
  {
    if (v21->super._logHandle)
    {
      logHandle = v21->super._logHandle;
    }
    else
    {
      v13 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v13;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, v16);
      _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "ERROR: Force commiting CB features to CA failed! (%@)", v23, 0xCu);
    }
  }
  if (v21->super._logHandle)
  {
    v12 = v21->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v12 = inited;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v19)
      v9 = "Force ";
    else
      v9 = "";
    __os_log_helper_16_2_8_8_32_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v22, (uint64_t)v9, COERCE__INT64(v21->_currentSDRBrightness), COERCE__INT64(v21->_currentWhitepoint.matrix[1][0]), COERCE__INT64(v21->_currentWhitepoint.matrix[1][1]), COERCE__INT64(v21->_currentAAPFactor), COERCE__INT64(v21->_currentBrightnessLimit), COERCE__INT64(v18), COERCE__INT64(v17));
    _os_log_impl(&dword_1B5291000, v12, OS_LOG_TYPE_DEFAULT, "[AOD update][CA] Pushing: %scommit all features: brightness = %f; WP = (%f; %f), pcc = %f, brightness limit = %f, "
      "twilight = %f, ammolite = %f",
      v22,
      0x52u);
  }
  return v15 & 1;
}

- (void)updateWhitePoint:(float)a3[3][3]
{
  double v3;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  id v7;
  int j;
  int i;
  float (*__attribute__((__org_arrdim(0,3))) v10)[3];
  SEL v11;
  CBAODTransitionController *v12;
  uint8_t v13[16];
  _QWORD v14[10];

  v14[9] = *MEMORY[0x1E0C80C00];
  v12 = self;
  v11 = a2;
  v10 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  for (i = 0; i < 3; ++i)
  {
    for (j = 0; j < 3; ++j)
    {
      *(float *)&v3 = v10[i][j];
      v14[3 * i + j] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
    }
  }
  v7 = 0;
  if ((-[CBBrightnessProxy setWhitePoint:rampDuration:error:](v12->_brtCtl, "setWhitePoint:rampDuration:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 9), &v7, 0.0) & 1) == 0)
  {
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)v7);
      _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "failed to set whitepoint(%@)", v13, 0xCu);
    }
  }

  objc_autoreleasePoolPop(context);
}

- (void)updateSDRBrightness:(float)a3
{
  double v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "CA SDR brightness update %f", v8, 0xCu);
  }
  self->_currentSDRBrightness = a3;
  *(float *)&v3 = a3;
  -[CBBrightnessProxy setSDRBrightness:](self->_brtCtl, "setSDRBrightness:", v3);
}

- (void)updateBrightnessLimit:(float)a3
{
  double v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Brightness limit update %f", v8, 0xCu);
  }
  self->_currentBrightnessLimit = a3;
  *(float *)&v3 = a3;
  -[CBBrightnessProxy setBrightnessLimit:](self->_brtCtl, "setBrightnessLimit:", v3);
}

- (void)updateAAPFactor:(float)a3
{
  self->_currentAAPFactor = a3;
  -[CBBrightnessProxy setContrastEnhancer:](self->_brtCtl, "setContrastEnhancer:", *(double *)&a3);
}

- (void)updateLumaBoostFactor:(float)a3
{
  double v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "CA luma boost factor update %f", v8, 0xCu);
  }
  self->_currentLumaBoostFactor = a3;
  *(float *)&v3 = a3;
  -[CBBrightnessProxy setLowAmbientAdaptation:](self->_brtCtl, "setLowAmbientAdaptation:", v3);
}

- (void)updateTwilightStrength:(float)a3
{
  double v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "CA low ambient adaptation strength update %f", v8, 0xCu);
  }
  *(float *)&v3 = a3;
  -[CBBrightnessProxy setLowAmbientAdaptation:](self->_brtCtl, "setLowAmbientAdaptation:", v3);
}

- (void)updateAmmoliteStrength:(float)a3
{
  double v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "CA high ambient adaptation strength update %f", v8, 0xCu);
  }
  *(float *)&v3 = a3;
  -[CBBrightnessProxy setHighAmbientAdaptation:](self->_brtCtl, "setHighAmbientAdaptation:", v3);
}

- (void)updateAmbient:(float)a3
{
  double v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "CA ambient update %f lux", v8, 0xCu);
  }
  *(float *)&v3 = a3;
  -[CBBrightnessProxy setAmbient:](self->_brtCtl, "setAmbient:", v3);
}

- (float)sdrBrightnessProgressCallback:(float)a3 rampContext:(id)a4
{
  float result;

  -[CBAODTransitionController sdrBrightnessProgressCallback:rampContext:profile:](self, "sdrBrightnessProgressCallback:rampContext:profile:", a4, 0, *(double *)&a3, a4);
  return result;
}

- (float)sdrBrightnessProgressCallback:(float)a3 rampContext:(id)a4 profile:(unint64_t)a5
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v18;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  float v25;
  float v26;
  float v27;
  float v29;
  float v30;
  float v31;
  uint8_t v34[48];
  uint8_t v35[56];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  if (a3 < 1.0)
  {
    if (a5 == 2)
    {
      -[CBAODTransitionController calculateSpringProgressForLinearProgress:](self, "calculateSpringProgressForLinearProgress:", *(double *)&a3);
      v30 = v9;
      LODWORD(v10) = 1.0;
      -[CBAODTransitionController calculateSpringProgressForLinearProgress:](self, "calculateSpringProgressForLinearProgress:", v10);
      v29 = v30 / v11;
    }
    else if (a5 == 1)
    {
      -[CBAODTransitionController calculateSigmoidProgressForLinearProgress:](self, "calculateSigmoidProgressForLinearProgress:", *(double *)&a3);
      v29 = v12;
    }
    v31 = clamp(v29, 0.0, 1.0);
    objc_msgSend(a4, "originalValue");
    v27 = BULuminanceToPerceptual(v13, self->_minNits, self->_maxNits);
    objc_msgSend(a4, "targetValue");
    v26 = v27 - (float)((float)(v27 - BULuminanceToPerceptual(v14, self->_minNits, self->_maxNits)) * v31);
    v25 = BUPerceptualToLuminance(v26, self->_minNits, self->_maxNits);
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
      objc_msgSend(a4, "originalValue");
      *(double *)&v18 = v15;
      objc_msgSend(a4, "targetValue");
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v34, v18, COERCE__INT64(v16), COERCE__INT64((float)(v31 * 100.0)), COERCE__INT64(v25));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "SDR - perceptual ramp clocked: %f -> %f - %f%% (%f Nits)", v34, 0x2Au);
    }
    return v25;
  }
  else
  {
    if (self->super._logHandle)
    {
      v24 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v23 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v23 = init_default_corebrightness_log();
      v24 = v23;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a4, "originalValue");
      *(double *)&v21 = v5;
      objc_msgSend(a4, "targetValue");
      *(double *)&v22 = v6;
      objc_msgSend(a4, "targetValue");
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v35, v21, v22, COERCE__INT64((float)(v29 * 100.0)), COERCE__INT64(v7));
      _os_log_impl(&dword_1B5291000, v24, OS_LOG_TYPE_DEFAULT, "Ramp ended - SDR - perceptual ramp clocked: %f -> %f - %f%% (%f Nits)", v35, 0x2Au);
    }
    objc_msgSend(a4, "targetValue");
    return v8;
  }
}

- (float)brightnessLimitProgressCallback:(float)a3 rampContext:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  uint64_t v13;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  float v20;
  float v21;
  float v22;
  uint8_t v27[48];
  uint8_t v28[56];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3 < 1.0)
  {
    objc_msgSend(a4, "originalValue");
    v22 = BULuminanceToPerceptual(v8, self->_minNits, self->_maxNits);
    objc_msgSend(a4, "targetValue");
    v21 = v22 - (float)((float)(v22 - BULuminanceToPerceptual(v9, self->_minNits, self->_maxNits)) * a3);
    v20 = BUPerceptualToLuminance(v21, self->_minNits, self->_maxNits);
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
      objc_msgSend(a4, "originalValue");
      *(double *)&v13 = v10;
      objc_msgSend(a4, "targetValue");
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v27, v13, COERCE__INT64(v11), COERCE__INT64((float)(a3 * 100.0)), COERCE__INT64(v20));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Brightness limit - perceptual ramp clocked: %f -> %f - %f%% (%f Nits)", v27, 0x2Au);
    }
    return v20;
  }
  else
  {
    if (self->super._logHandle)
    {
      v19 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v18 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v18 = init_default_corebrightness_log();
      v19 = v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a4, "originalValue");
      *(double *)&v16 = v4;
      objc_msgSend(a4, "targetValue");
      *(double *)&v17 = v5;
      objc_msgSend(a4, "targetValue");
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v28, v16, v17, COERCE__INT64((float)(a3 * 100.0)), COERCE__INT64(v6));
      _os_log_impl(&dword_1B5291000, v19, OS_LOG_TYPE_INFO, "Ramp ended - Brightness limit - perceptual ramp clocked: %f -> %f - %f%% (%f Nits)", v28, 0x2Au);
    }
    objc_msgSend(a4, "targetValue");
    return v7;
  }
}

- (BOOL)requestTransitionStopForIdentifier:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[CBRampManager hasRampRunningForIdentifier:](self->_rampManager, "hasRampRunningForIdentifier:", a3))
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
      __os_log_helper_16_2_1_8_66((uint64_t)v8, (uint64_t)a3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "%{public}@ transition request - stop", v8, 0xCu);
    }
    -[CBRampManager removeRampWithIdentifier:](self->_rampManager, "removeRampWithIdentifier:", a3);
  }
  return 1;
}

- (void)initColorEffects
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[7];
  char v11;
  NSObject *v12;
  uint8_t v13[7];
  os_log_type_t v14;
  NSObject *v15;
  SEL v16;
  CBAODTransitionController *v17;

  v17 = self;
  v16 = a2;
  self->_flipbookCache = (CBAODFlipBookWrapper *)CFXCreate();
  if (v17->_flipbookCache)
  {
    v15 = 0;
    if (v17->super._logHandle)
    {
      logHandle = v17->super._logHandle;
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
      _os_log_impl(&dword_1B5291000, log, type, "Init ColorEffects for AOD", v13, 2u);
    }
    CFXInstallCallback((uint64_t)v17->_flipbookCache, (uint64_t)ColorRampCallback, (uint64_t)v17);
    CFXEnableFades((uint64_t)v17->_flipbookCache, 1);
    CFXSetMagicCoeff((uint64_t)v17->_flipbookCache, 0);
    CFXSetWhitePointType(v17->_flipbookCache, 1);
  }
  else
  {
    v12 = 0;
    if (v17->super._logHandle)
    {
      v5 = v17->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v4 = init_default_corebrightness_log();
      v5 = v4;
    }
    v12 = v5;
    v11 = 16;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v2 = v12;
      v3 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1B5291000, v2, v3, "Failed to create ColorEffects for AOD", v10, 2u);
    }
  }
}

- (void)colorRampRoutine:(id *)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t inited;
  NSObject *logHandle;
  CBBrightnessProxy *brtCtl;
  void *context;
  id v11;
  int i;
  float var0;
  const $9756FCCE715B982771B61E32206558DC *v14;
  SEL v15;
  CBAODTransitionController *v16;
  uint8_t v17[32];
  uint8_t v18[16];
  _QWORD v19[10];

  v19[9] = *MEMORY[0x1E0C80C00];
  v16 = self;
  v15 = a2;
  v14 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  if (v14)
  {
    var0 = 0.0;
    var0 = v14->var0;
    memcpy(&v16->_thresholdModule, v14->var1, 0x24uLL);
    -[CBAODTransitionController chromaticity:andIlluminance:fromMatrix:](v16, "chromaticity:andIlluminance:fromMatrix:", v16->_currentWhitepoint.matrix[1], &v16->_currentWhitepoint.matrix[1][2], &v16->_thresholdModule);
    if (-[CBRampManager liveUpdates](v16->_rampManager, "liveUpdates"))
    {
      for (i = 0; i < 9; ++i)
      {
        *(float *)&v3 = v14->var1[i];
        v19[i] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
      }
      v11 = 0;
      brtCtl = v16->_brtCtl;
      v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 9);
      if ((-[CBBrightnessProxy setWhitePoint:rampDuration:error:](brtCtl, "setWhitePoint:rampDuration:error:", v4, &v11, var0) & 1) == 0)
      {
        if (v16->super._logHandle)
        {
          logHandle = v16->super._logHandle;
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
          __os_log_helper_16_2_1_8_64((uint64_t)v18, (uint64_t)v11);
          _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "failed to set whitepoint(%@)", v18, 0xCu);
        }

      }
    }
    else
    {
      memcpy((char *)&v16->_currentFlipBookEntry.brightness + 2, v14->var1, 0x24uLL);
      BYTE1(v16->_currentFlipBookEntry.brightness) = 1;
    }
    if (v16->super._logHandle)
    {
      v6 = v16->super._logHandle;
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
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v17, COERCE__INT64(v14->var4.var0), COERCE__INT64(v14->var4.var1), COERCE__INT64(var0));
      _os_log_impl(&dword_1B5291000, v6, OS_LOG_TYPE_DEFAULT, "AOD Whitepoint update(%f | %f) and period: %f", v17, 0x20u);
    }
  }
  objc_autoreleasePoolPop(context);
}

- (void)updateColorRamp:(id)a3
{
  float v3;
  float v4;
  float v5;
  double v6;
  float v7;
  float v8;
  float v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v21[32];
  uint8_t v22[40];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!-[CBRampManager liveUpdates](self->_rampManager, "liveUpdates"))
    {
      if ((objc_msgSend(a3, "isFinished") & 1) != 0)
        memcpy(&self->_thresholdModule, self->_currentWhitepoint.matrix[2], 0x30uLL);
      memcpy((char *)&self->_currentFlipBookEntry.brightness + 2, &self->_thresholdModule, 0x24uLL);
      BYTE1(self->_currentFlipBookEntry.brightness) = 0;
    }
    if ((objc_msgSend(a3, "isFinished") & 1) != 0)
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
        objc_msgSend(a3, "originalValue");
        *(double *)&v15 = v3;
        objc_msgSend(a3, "targetValue");
        *(double *)&v16 = v4;
        objc_msgSend(a3, "currentValue");
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v22, v15, v16, COERCE__INT64(v5));
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Ramp ended - ColorRamp - perceptual ramp clocked: %f -> %f - %f", v22, 0x20u);
      }
      CFXSetTarget((uint64_t)self->_flipbookCache, self->_currentWhitepoint.matrix[2], 1, 1, 0.0, 1.0);
      objc_msgSend(a3, "currentAbsoluteTimestamp");
      CFXUpdateColorFade((uint64_t)self->_flipbookCache, v6);
    }
    else
    {
      if (self->super._logHandle)
      {
        v14 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v13 = init_default_corebrightness_log();
        v14 = v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a3, "originalValue");
        *(double *)&v11 = v7;
        objc_msgSend(a3, "targetValue");
        *(double *)&v12 = v8;
        objc_msgSend(a3, "currentValue");
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v21, v11, v12, COERCE__INT64(v9));
        _os_log_impl(&dword_1B5291000, v14, OS_LOG_TYPE_INFO, "Ramp clocked - ColorRamp - perceptual ramp clocked: %f -> %f - %f", v21, 0x20u);
      }
      objc_msgSend(a3, "currentAbsoluteTimestamp");
      CFXUpdateColorFade((uint64_t)self->_flipbookCache, v10);
    }
  }
  else
  {
    memcpy((char *)&self->_currentFlipBookEntry.brightness + 2, &self->_thresholdModule, 0x24uLL);
    BYTE1(self->_currentFlipBookEntry.brightness) = 0;
  }
}

- (BOOL)requestColorRampTransitionStop
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  SEL v10;
  CBAODTransitionController *v11;

  v11 = self;
  v10 = a2;
  if (-[CBRampManager hasRampRunningForIdentifier:](self->_rampManager, "hasRampRunningForIdentifier:", CFSTR("COLOR_RAMP")))
  {
    v9 = 0;
    if (v11->super._logHandle)
    {
      logHandle = v11->super._logHandle;
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
    v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v9;
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_impl(&dword_1B5291000, log, type, "ColorRamp transition request - stop", v7, 2u);
    }
    -[CBRampManager removeRampWithIdentifier:](v11->_rampManager, "removeRampWithIdentifier:", CFSTR("COLOR_RAMP"));
    CFXCancelColorFade((uint64_t)v11->_flipbookCache);
  }
  return 1;
}

- (void)processInitialColorMatrixFromState:(id)a3
{
  double Current;
  _BYTE __dst[36];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("ColorRamp"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    memcpy(__dst, &identityMatrix, sizeof(__dst));
    -[CBAODTransitionController colorMatrix:fromState:](self, "colorMatrix:fromState:", __dst, a3);
    -[CBAODTransitionController setCurrentWhitepointFromMatrix:](self, "setCurrentWhitepointFromMatrix:", __dst);
    -[CBAODTransitionController setTargetWhitepointFromMatrix:](self, "setTargetWhitepointFromMatrix:", __dst);
    CFXSetTarget((uint64_t)self->_flipbookCache, self->_currentWhitepoint.matrix[2], 1, 1, 0.0, 1.0);
    Current = CFAbsoluteTimeGetCurrent();
    CFXUpdateColorFade((uint64_t)self->_flipbookCache, Current);
  }
}

- (void)colorMatrix:(float)a3[3][3] fromState:(id)a4
{
  float v4;
  uint64_t inited;
  NSObject *logHandle;
  int j;
  int i;
  void *v9;
  void *v10;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("ColorRamp"));
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)v10);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "WP matrix from state = %@", v13, 0xCu);
    }
    v9 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("ColorRampTarget"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (int)objc_msgSend(v9, "count") >= 9)
    {
      for (i = 0; i < 3; ++i)
      {
        for (j = 0; j < 3; ++j)
        {
          objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 3 * i + j), "floatValue");
          (*a3)[3 * i + j] = v4;
        }
      }
    }
  }
}

- (void)chromaticity:(id *)a3 andIlluminance:(float *)a4 fromMatrix:(float)a5[3][3]
{
  CFXGetWPFromMatrix((uint64_t)self->_flipbookCache, (float *)a5, a3, a4);
}

- (void)setTargetWhitepointFromMatrix:(float)a3[3][3]
{
  -[CBAODTransitionController setWhitepoint:fromMatrix:](self, "setWhitepoint:fromMatrix:", self->_currentWhitepoint.matrix[2], a3);
}

- (void)setCurrentWhitepointFromMatrix:(float)a3[3][3]
{
  -[CBAODTransitionController setWhitepoint:fromMatrix:](self, "setWhitepoint:fromMatrix:", &self->_thresholdModule, a3);
}

- (void)setWhitepoint:(id *)a3 fromMatrix:(float)a4[3][3]
{
  memcpy(a3, a4, 0x24uLL);
  CFXGetWPFromMatrix((uint64_t)self->_flipbookCache, (float *)a4, &a3->var1, &a3->var2);
}

- (BOOL)shallUpdateWhitepointFrom:(float)a3[3][3] target:(float)a4[3][3]
{
  float v4;
  uint64_t inited;
  NSObject *logHandle;
  float v8;
  int v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  char v15;
  float *v16;
  float *v17;
  SEL v18;
  CBAODTransitionController *v19;
  uint8_t v20[88];
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = (float *)a3;
  v16 = (float *)a4;
  v15 = 0;
  -[CBAODState whitepointDeltaThreshold](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "whitepointDeltaThreshold");
  v14 = v4;
  v11 = 0.0;
  v10 = 0.0;
  v9 = 0;
  CFXGetWPFromMatrix((uint64_t)v19->_flipbookCache, v17, &v13, &v9);
  CFXChromaticity2uv((float *)&v13, &v21);
  v11 = CFXChromaticity2CCT((float *)&v13);
  CFXGetWPFromMatrix((uint64_t)v19->_flipbookCache, v16, &v12, &v9);
  CFXChromaticity2uv((float *)&v12, &v23);
  v10 = CFXChromaticity2CCT((float *)&v12);
  v8 = std::__math::sqrt[abi:ne180100]((float)((float)(v24 - v22) * (float)(v24 - v22)) + (float)((float)(v23 - v21)
                                                                                                * (float)(v23 - v21)));
  if (v8 >= v14)
    v15 = 1;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_8_4_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v20, v15 & 1, COERCE__INT64(v8), COERCE__INT64(*(float *)&v13), COERCE__INT64(*((float *)&v13 + 1)), COERCE__INT64(v11), COERCE__INT64(*(float *)&v12), COERCE__INT64(*((float *)&v12 + 1)), COERCE__INT64(v10));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "WP update = %d    delta uv = %f   current (%f;%f) CCT = %f -> target (%f;%f) CCT = %f",
      v20,
      0x4Eu);
  }
  return v15 & 1;
}

- (void)updateEDRHeadroom:(float)a3
{
  double v3;

  self->_currentEDRHeadroom = a3;
  *(float *)&v3 = self->_currentEDRHeadroom;
  -[CBBrightnessProxy setHeadroom:](self->_brtCtl, "setHeadroom:", v3);
}

- (void)initialiseFlipBookWithLength:(float)a3 frequency:(int)a4 lux:(float)a5
{
  int v5;
  int v6;
  int v7;
  int v8;
  CBAODFlipBookWrapper *v9;
  _BYTE __dst[76];
  _BYTE v11[23];
  _DWORD __b[19];
  _BYTE v13[23];
  float v14;
  int v15;
  float v16;
  SEL v17;
  CBAODTransitionController *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  *(_QWORD *)&v13[8] = 0;
  v13[0] = 2;
  *(_DWORD *)&v13[5] = 79;
  *(_DWORD *)&v13[1] = 23;
  *(_QWORD *)&v13[15] = __PAIR64__(LODWORD(a5), LODWORD(a3));
  *(_WORD *)&v13[13] = a4;
  memset(__b, 0, sizeof(__b));
  __b[0] = LODWORD(v18->_currentSDRBrightness);
  __b[1] = LODWORD(v18->_currentBrightnessLimit);
  __b[2] = LODWORD(v18->_currentAAPFactor);
  objc_msgSend(*(id *)&v18->_liveUpdatesOverride, "currentStrength");
  __b[3] = v5;
  objc_msgSend(*(id *)&v18->_liveUpdatesOverride, "lux");
  __b[4] = v6;
  objc_msgSend(*(id *)&v18->_currentDisplayNits, "currentStrength");
  __b[5] = v7;
  objc_msgSend(*(id *)&v18->_currentDisplayNits, "lux");
  __b[6] = v8;
  memcpy(&__b[7], &v18->_thresholdModule, 0x30uLL);
  v9 = [CBAODFlipBookWrapper alloc];
  *(_OWORD *)v11 = *(_OWORD *)v13;
  *(_QWORD *)&v11[15] = *(_QWORD *)&v13[15];
  memcpy(__dst, __b, sizeof(__dst));
  *(_QWORD *)&v18->_currentFlipBookEntry.ammoliteStrength_set = -[CBAODFlipBookWrapper initWithHeader:andOrigin:](v9, "initWithHeader:andOrigin:", v11, __dst);
}

- (void)updateFlipBookEntryWithBrightness:(float)a3
{
  self->_currentSDRBrightness = a3;
  *(float *)(&self->_currentFlipBookEntry.brightness_set + 1) = a3;
  self->_currentFlipBookEntry.brightness_set = 1;
}

- (void)updateFlipBookEntryWithBrightnessLimit:(float)a3
{
  self->_currentBrightnessLimit = a3;
  *(float *)&self->_currentFlipBookEntry.pccfactor_set = a3;
  HIBYTE(self->_currentFlipBookEntry.whitepoint[2][2]) = 1;
}

- (void)updateFlipBookEntryWithAAPFactor:(float)a3
{
  self->_currentAAPFactor = a3;
  *(float *)((char *)&self->_currentFlipBookEntry.whitepoint[2][1] + 3) = a3;
  BYTE2(self->_currentFlipBookEntry.whitepoint[2][1]) = 1;
}

- (void)updateFlipBookEntryWithTwilightLux:(float)a3
{
  *(float *)(&self->_currentFlipBookEntry.brightnessLimit_set + 1) = a3;
}

- (void)updateFlipBookEntryWithTwilightStrength:(float)a3
{
  *(float *)((char *)&self->_currentFlipBookEntry.pccfactor + 1) = a3;
  LOBYTE(self->_currentFlipBookEntry.pccfactor) = 1;
}

- (void)updateFlipBookEntryWithAmmoliteLux:(float)a3
{
  *(float *)(&self->_currentFlipBookEntry.lowAmbientAdaptationStrength_set + 2) = a3;
}

- (void)updateFlipBookEntryWithAmmoliteStrength:(float)a3
{
  *(float *)((char *)&self->_currentFlipBookEntry.brightnessLimit + 2) = a3;
  BYTE1(self->_currentFlipBookEntry.brightnessLimit) = 1;
}

- (void)addFlipBookEntry:(id *)a3
{
  int var0;
  uint64_t v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_t v18;
  os_log_type_t v19[4];
  NSObject *v20;
  os_log_t v21;
  uint64_t *v22;
  os_log_t log;
  os_log_type_t v24[4];
  uint8_t *buf;
  NSObject *inited;
  os_log_t v27;
  $7D12C9F9DF7F825FC3F2BA39AA26C9BC *v28;
  uint8_t v29[15];
  os_log_type_t v30;
  os_log_t v31;
  os_log_type_t type;
  os_log_t oslog;
  int v34;
  _QWORD v35[3];
  id *p_isa;
  _BYTE v37[168];
  uint64_t v38;

  v28 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  p_isa = (id *)&self->super.super.isa;
  v35[2] = a2;
  v35[1] = a3;
  if (*(_QWORD *)&self->_currentFlipBookEntry.ammoliteStrength_set)
  {
    objc_msgSend(p_isa[31], "appendFlipBookEntry:", v28);
    v35[0] = 0;
    v34 = 0;
    objc_msgSend(p_isa, "chromaticity:andIlluminance:fromMatrix:", v35, &v34, (char *)&v28->var2 + 2);
    oslog = 0;
    if (p_isa[2])
    {
      v27 = (os_log_t)p_isa[2];
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v27 = inited;
    }
    oslog = v27;
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      *(_DWORD *)v24 = type;
      var0 = v28->var0;
      *(double *)&v4 = *(float *)(&v28->var1 + 1);
      v5 = "set";
      if (v28->var1)
        v6 = "set";
      else
        v6 = "not set";
      if ((BYTE1(v28->var2) & 1) != 0)
        v7 = "set";
      else
        v7 = "not set";
      *(double *)&v8 = *(float *)((char *)&v28->var4[2][1] + 3);
      if ((BYTE2(v28->var4[2][1]) & 1) != 0)
        v9 = "set";
      else
        v9 = "not set";
      *(double *)&v10 = *(float *)&v28->var5;
      if ((HIBYTE(v28->var4[2][2]) & 1) != 0)
        v11 = "set";
      else
        v11 = "not set";
      *(double *)&v12 = *(float *)((char *)&v28->var6 + 1);
      if ((LOBYTE(v28->var6) & 1) != 0)
        v13 = "set";
      else
        v13 = "not set";
      *(double *)&v14 = *(float *)(&v28->var7 + 1);
      *(double *)&v15 = *(float *)((char *)&v28->var8 + 2);
      if ((BYTE1(v28->var8) & 1) == 0)
        v5 = "not set";
      *(double *)&v16 = *(float *)(&v28->var9 + 2);
      v22 = &v17;
      buf = v37;
      __os_log_helper_16_2_16_4_0_8_0_8_32_8_0_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_0_8_32_8_0((uint64_t)v37, var0, v4, (uint64_t)v6, COERCE__INT64(*(float *)v35), COERCE__INT64(*((float *)v35 + 1)), (uint64_t)v7, v8, (uint64_t)v9, v10, (uint64_t)v11, v12, (uint64_t)v13, v14, v15, (uint64_t)v5, v16);
      _os_log_impl(&dword_1B5291000, log, v24[0], "[AOD update][DCP] Pushing FB entry[%d], brightness = %f (%s); WP = (%f; %f) (%s), pcc = %f (%s), brightness limi"
        "t = %f (%s), twilight = %f (%s), twilightLux = %f, ammolite = %f (%s), ammoliteLux = %f",
        buf,
        0x9Eu);
    }
  }
  else
  {
    v31 = 0;
    if (p_isa[2])
    {
      v21 = (os_log_t)p_isa[2];
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v20 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v20 = init_default_corebrightness_log();
      v21 = v20;
    }
    v31 = v21;
    v30 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v18 = v31;
      v19[0] = v30;
      __os_log_helper_16_0_0(v29);
      _os_log_error_impl(&dword_1B5291000, v18, v19[0], "[AOD update][DCP] Flipbook cache doesn't exists. failed to add Flipbook entry.", v29, 2u);
    }
  }
}

- (BOOL)sendCurrentFlipBook
{
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v12[15];
  os_log_type_t v13;
  os_log_t oslog;
  uint64_t v15;
  _BYTE v16[39];
  os_log_type_t v17;
  os_log_t v18;
  id v19;
  char v20;
  SEL v21;
  CBAODTransitionController *v22;
  uint8_t v23[40];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = self;
  v21 = a2;
  v20 = 0;
  if (*(_QWORD *)&self->_currentFlipBookEntry.ammoliteStrength_set)
  {
    v19 = 0;
    v19 = (id)objc_msgSend(*(id *)&v22->_currentFlipBookEntry.ammoliteStrength_set, "newFlipBookData");
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
    v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v19, "length");
      v9 = *(void **)&v22->_currentFlipBookEntry.ammoliteStrength_set;
      if (v9)
        objc_msgSend(v9, "header");
      else
        memset(&v16[16], 0, 23);
      v7 = *(void **)&v22->_currentFlipBookEntry.ammoliteStrength_set;
      if (v7)
      {
        objc_msgSend(v7, "header");
      }
      else
      {
        v15 = 0;
        *(_QWORD *)v16 = 0;
        *(_QWORD *)&v16[7] = 0;
      }
      __os_log_helper_16_0_3_8_0_4_0_8_0((uint64_t)v23, v8, *(int *)&v16[25], COERCE__INT64(*(float *)&v16[7]));
      _os_log_impl(&dword_1B5291000, v18, v17, "[AOD update][DCP] Sending FlipBook to DCP (size = %lu), number of updates = %d, transition length = %f", v23, 0x1Cu);
    }
    -[CBAPEndpoint sendOOBCommand:inputBuffer:inputBufferSize:](v22->_endpoint, "sendOOBCommand:inputBuffer:inputBufferSize:", 236, objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"));
    objc_msgSend(*(id *)&v22->_currentFlipBookEntry.ammoliteStrength_set, "setSubmissionTimestamp:", CFAbsoluteTimeGetCurrent());

  }
  else
  {
    oslog = 0;
    if (v22->super._logHandle)
    {
      v6 = v22->super._logHandle;
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
    v13 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v3 = oslog;
      v4 = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_error_impl(&dword_1B5291000, v3, v4, "[AOD update][DCP] Flipbook cache doesn't exists. failed to send Flipbook data to DCP.", v12, 2u);
    }
  }
  return v20 & 1;
}

- (BOOL)flipBookEntryForID:(int)a3 entry:(id *)a4
{
  BOOL v5;

  v5 = 0;
  if (*(_QWORD *)&self->_currentFlipBookEntry.ammoliteStrength_set)
    return objc_msgSend(*(id *)&self->_currentFlipBookEntry.ammoliteStrength_set, "getEntry:forID:", a4, a3) & 1;
  return v5;
}

- (BOOL)currentFlipBookEntry:(id *)a3
{
  BOOL v4;

  v4 = 0;
  if (!-[CBRampManager liveUpdates](self->_rampManager, "liveUpdates"))
    return -[CBAODTransitionController flipBookEntryForID:entry:](self, "flipBookEntryForID:entry:", -[CBAODTransitionController currentTransitionUpdateID](self, "currentTransitionUpdateID"), a3);
  return v4;
}

- (BOOL)liveUpdates
{
  return -[CBRampManager liveUpdates](self->_rampManager, "liveUpdates", a2, self);
}

- (void)setLiveUpdates:(BOOL)a3
{
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v8;
  uint8_t v10[16];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((LOBYTE(self->_targetWhitepoint.matrix[2][0]) & 1) != 0)
  {
    v8 = 1;
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
      __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"enabled");
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Live updates overrided to %s", v11, 0xCu);
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      v5 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v4 = init_default_corebrightness_log();
      v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
        v3 = "enabled";
      else
        v3 = "disabled";
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEFAULT, "Live updates %s", v10, 0xCu);
    }
  }
  if (v8 != -[CBRampManager liveUpdates](self->_rampManager, "liveUpdates"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CBBrightnessProxy setAllowUpdates:](self->_brtCtl, "setAllowUpdates:", v8);
    -[CBRampManager setLiveUpdates:](self->_rampManager, "setLiveUpdates:", v8);

    *(_QWORD *)&self->_currentFlipBookEntry.ammoliteStrength_set = 0;
    -[CBBrightnessProxy setBrightnessControlDisabled:](self->_brtCtl, "setBrightnessControlDisabled:", !v8);
  }
}

- (BOOL)cancelDCPTransition
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v8[7];
  os_log_type_t v9;
  NSObject *v10;
  SEL v11;
  CBAODTransitionController *v12;

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
    _os_log_impl(&dword_1B5291000, log, type, "Cancel DCP transition", v8, 2u);
  }
  v7 = 1;
  -[CBAPEndpoint sendCommand:inputBuffer:inputBufferSize:](v12->_endpoint, "sendCommand:inputBuffer:inputBufferSize:", 230, &v7, 1);
  return v7 & 1;
}

- (void)enableDCPFlipBookUpdates:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v6;
  SEL v7;
  CBAODTransitionController *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v7 = a2;
  v6 = a3;
  if (self->super._logHandle)
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
    if (v6)
      v3 = "Enable";
    else
      v3 = "Disable";
    __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "%s DCP Flipbook updates", v9, 0xCu);
  }
  -[CBAPEndpoint sendCommand:inputBuffer:inputBufferSize:](v8->_endpoint, "sendCommand:inputBuffer:inputBufferSize:", 237, &v6, 1);
}

- (int)currentTransitionUpdateID
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  uint64_t inited;
  NSObject *logHandle;
  id v8;
  int v9;
  uint8_t v11[16];
  uint8_t v12[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = -1;
  v8 = -[CBAPEndpoint copyProperty:](self->_endpoint, "copyProperty:", CFSTR("CurrentFlipBookUpdateID"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "intValue");
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
      __os_log_helper_16_0_1_4_0((uint64_t)v12, v9);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Current update ID of DCP transition is %d", v12, 8u);
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      v5 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v4 = init_default_corebrightness_log();
      v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v2 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      __os_log_helper_16_2_1_8_32((uint64_t)v11, v2);
      _os_log_error_impl(&dword_1B5291000, v5, OS_LOG_TYPE_ERROR, "Returned property is not an NSNumber!, class: %s", v11, 0xCu);
    }
  }

  return v9;
}

- (float)transitionDurationFromCurrent:(float)a3 toTarget:(float)a4
{
  int i;
  float v6;
  float v7;
  float v8;

  v8 = 0.0;
  v7 = BULuminanceToPerceptual(a3, self->_minNits, self->_maxNits);
  v6 = BULuminanceToPerceptual(a4, self->_minNits, self->_maxNits) - v7;
  for (i = 0; i < 13; ++i)
  {
    if (v6 <= _timeContantTable[2 * i])
    {
      if (i)
        return _timeContantTable[2 * i - 1]
             + (float)((float)((float)(v6 - _timeContantTable[2 * i - 2])
                             / (float)(_timeContantTable[2 * i] - _timeContantTable[2 * i - 2]))
                     * (float)(_timeContantTable[2 * i + 1] - _timeContantTable[2 * i - 1]));
      else
        return 5.0;
    }
  }
  return v8;
}

- (id)copyContext
{
  double v2;
  double v3;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v7;
  id v8;
  void *v9;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  *(float *)&v2 = self->_currentSDRBrightness;
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  *(float *)&v3 = self->_currentEDRHeadroom;
  v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v7, CFSTR("NitsPhysical"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3), CFSTR("EDRHeadroom"), 0);
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
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v11, COERCE__INT64(self->_currentSDRBrightness), COERCE__INT64(self->_currentEDRHeadroom));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Captured context, current Nits = %f, _currentEDRHeadroom = %f", v11, 0x16u);
  }
  return v9;
}

- (float)getFloatValueFrom:(id)a3 key:(id)a4
{
  float v4;
  void *v6;
  float v7;

  v7 = 0.0;
  v6 = (void *)objc_msgSend(a3, "objectForKey:", a4);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      return v4;
    }
  }
  return v7;
}

- (float)getFloatValueFrom:(id)a3 key:(id)a4 subkey:(id)a5
{
  float v5;
  void *v7;
  void *v8;
  float v9;

  v9 = 0.0;
  v8 = (void *)objc_msgSend(a3, "objectForKey:", a4);
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v8, "objectForKey:", a5);
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "floatValue");
          return v5;
        }
      }
    }
  }
  return v9;
}

- (void)logTransitionParameters:(id *)a3
{
  float v3;
  float v4;
  float var14;
  float v6;
  float v7;
  float var12;
  float var10;
  float var8;
  float var6;
  float var4;
  _BOOL4 var0;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v18[88];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    var0 = a3->var0;
    if (a3->var3)
      var4 = a3->var4;
    else
      var4 = -1.0;
    if (a3->var5)
      var6 = a3->var6;
    else
      var6 = -1.0;
    if (a3->var7)
      var8 = a3->var8;
    else
      var8 = -1.0;
    if (a3->var9)
      var10 = a3->var10;
    else
      var10 = -1.0;
    if (a3->var11)
      var12 = a3->var12;
    else
      var12 = -1.0;
    if (*(_QWORD *)&self->_liveUpdatesOverride)
    {
      objc_msgSend(*(id *)&self->_liveUpdatesOverride, "aodRampDuration");
      v7 = v3;
    }
    else
    {
      v7 = NAN;
    }
    if (*(_QWORD *)&self->_currentDisplayNits)
    {
      objc_msgSend(*(id *)&self->_currentDisplayNits, "aodRampDuration");
      v6 = v4;
    }
    else
    {
      v6 = NAN;
    }
    if (a3->var13)
      var14 = a3->var14;
    else
      var14 = -1.0;
    __os_log_helper_16_0_9_4_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v18, var0, COERCE__INT64(var4), COERCE__INT64(var6), COERCE__INT64(var8), COERCE__INT64(var10), COERCE__INT64(var12), COERCE__INT64(v7), COERCE__INT64(v6), COERCE__INT64(var14));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "[Transition Parameters] force update = %d, transition lengths: general = %f, brightness = %f, whitepoint = %f, pcc = %f, EDR = %f, Twilight = %f, Ammolite = %f, brightness limit = %f", v18, 0x58u);
  }
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (float)calculateSpringProgressForLinearProgress:(float)a3
{
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
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint8_t v23[72];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CBAODState AODTransitionProfileSpring_mass](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODTransitionProfileSpring_mass");
  v18 = v3;
  -[CBAODState AODTransitionProfileSpring_stiffness](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODTransitionProfileSpring_stiffness");
  v17 = v4;
  -[CBAODState AODTransitionProfileSpring_velocity](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODTransitionProfileSpring_velocity");
  v16 = v5;
  -[CBAODState AODTransitionProfileSpring_damping](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODTransitionProfileSpring_damping");
  v15 = v6;
  v13 = std::__math::sqrt[abi:ne180100](v17 / v18);
  v14 = v15 / (float)(2.0 * std::__math::sqrt[abi:ne180100](v17 * v18));
  if (v14 >= 1.0)
  {
    v19 = (float)((float)((float)(v13 - v16) * a3) + 1.0) * std::__math::exp[abi:ne180100](-(float)(a3 * v13));
  }
  else
  {
    v12 = v13 * std::__math::sqrt[abi:ne180100](1.0 - (float)(v14 * v14));
    v11 = std::__math::exp[abi:ne180100]((float)-(float)(a3 * v14) * v13);
    v10 = std::__math::cos[abi:ne180100](v12 * a3);
    v19 = v11
        * (float)((float)((float)((float)-(float)(v16 - (float)(v14 * v13)) / v12)
                        * std::__math::sin[abi:ne180100](v12 * a3))
                + (float)(1.0 * v10));
  }
  v20 = 1.0 - v19;
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
    __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v23, COERCE__INT64(v18), COERCE__INT64(v17), COERCE__INT64(v16), COERCE__INT64(v15), COERCE__INT64(v20), COERCE__INT64(a3));
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "spring (mass=%f | stiff=%f | vel=%f | damp=%f) = %f for input = %f", v23, 0x3Eu);
  }
  return v20;
}

- (float)calculateSigmoidProgressForLinearProgress:(float)a3
{
  double v3;
  float v4;
  float v5;
  double v6;
  float v7;
  float v8;
  uint64_t inited;
  NSObject *logHandle;
  float v12;
  float v13;
  float v14;
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CBAODState AODTransitionProfileEaseInOut_K](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODTransitionProfileEaseInOut_K");
  v14 = *(float *)&v3;
  -[CBAODTransitionController sigmoidFunction:](self, "sigmoidFunction:", v3);
  v5 = 0.5 / v4;
  v12 = v5;
  *(float *)&v6 = -(float)(v14 * (float)((float)(2.0 * a3) + -1.0));
  -[CBAODTransitionController sigmoidFunction:](self, "sigmoidFunction:", v6);
  v8 = 1.0 - ((float)(v12 * v7) + 0.5);
  v13 = v8;
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
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v17, COERCE__INT64(v14), COERCE__INT64(v13), COERCE__INT64(a3));
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "sigmoid (K=%f) = %f for input = %f", v17, 0x20u);
  }
  return v13;
}

- (float)sigmoidFunction:(float)a3
{
  return (float)(1.0 / (float)(std::__math::exp[abi:ne180100](-a3) + 1.0)) - 0.5;
}

- (BOOL)liveUpdatesOverride
{
  return LOBYTE(self->_targetWhitepoint.matrix[2][0]) & 1;
}

- (void)setLiveUpdatesOverride:(BOOL)a3
{
  LOBYTE(self->_targetWhitepoint.matrix[2][0]) = a3;
}

- (float)nitsOverride
{
  return self->_targetWhitepoint.matrix[2][1];
}

- (void)setNitsOverride:(float)a3
{
  self->_targetWhitepoint.matrix[2][1] = a3;
}

- (void)setCurrentDisplayNits:(float)a3
{
  self->_targetWhitepoint.matrix[2][2] = a3;
}

- (float)brightnessFactor
{
  return self->_targetWhitepoint.xy.x;
}

- (void)setBrightnessFactor:(float)a3
{
  self->_targetWhitepoint.xy.x = a3;
}

- (BOOL)displayON
{
  return BYTE1(self->_targetWhitepoint.matrix[2][0]) & 1;
}

- (float)remainingTransitionLength
{
  return self->_targetWhitepoint.xy.y;
}

- (void)setRemainingTransitionLength:(float)a3
{
  self->_targetWhitepoint.xy.y = a3;
}

- (CBTwilight)twilight
{
  return (CBTwilight *)objc_getProperty(self, a2, 400, 1);
}

- (void)setTwilight:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (CBAmmolite)ammolite
{
  return (CBAmmolite *)objc_getProperty(self, a2, 408, 1);
}

- (void)setAmmolite:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (CBIndicatorBrightnessModule)indicator
{
  return (CBIndicatorBrightnessModule *)objc_getProperty(self, a2, 416, 1);
}

- (void)setIndicator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

@end
