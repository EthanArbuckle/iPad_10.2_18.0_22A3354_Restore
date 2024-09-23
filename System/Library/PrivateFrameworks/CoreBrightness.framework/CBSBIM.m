@implementation CBSBIM

- (void)setSdrBrightness:(float)a3
{
  self->_sdrBrightness = a3;
}

- (void)setCurrentHeadroom:(float)a3
{
  self->_currentHeadroom = a3;
}

- (CBSBIM)initWithQueue:(id)a3 andDisplayModule:(id)a4 andEDRModule:(id)a5
{
  os_log_t v5;
  id v6;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v25;
  uint8_t v26[7];
  os_log_type_t v27;
  NSObject *v28;
  uint8_t v29[7];
  char v30;
  NSObject *v31;
  uint8_t v32[15];
  char v33;
  NSObject *v34;
  os_log_type_t v35;
  os_log_t v36;
  int MainDisplay;
  uint8_t v38[7];
  char v39;
  NSObject *v40;
  objc_super v41;
  id v42;
  id v43;
  id v44;
  SEL v45;
  id v46;
  uint8_t v48[8];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v46 = self;
  v45 = a2;
  v44 = a3;
  v43 = a4;
  v42 = a5;
  v41.receiver = self;
  v41.super_class = (Class)CBSBIM;
  v46 = -[CBSBIM init](&v41, sel_init);
  if (v46)
  {
    v5 = os_log_create("com.apple.CoreBrightness.SBIM", "default");
    *((_QWORD *)v46 + 2) = v5;
    *((_QWORD *)v46 + 1) = v44;
    dispatch_retain(*((dispatch_object_t *)v46 + 1));
    *((_QWORD *)v46 + 3) = v43;
    v6 = v42;
    *((_QWORD *)v46 + 5) = v6;
    if (!+[CBSBIM needsSBIM](CBSBIM, "needsSBIM"))
    {
      v40 = 0;
      if (*((_QWORD *)v46 + 2))
      {
        v25 = *((_QWORD *)v46 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v25 = inited;
      }
      v40 = v25;
      v39 = 16;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        log = v40;
        type = v39;
        __os_log_helper_16_0_0(v38);
        _os_log_error_impl(&dword_1B5291000, log, type, "SBIM Initialization | Device does not use CoreBrightness SBIM", v38, 2u);
      }
LABEL_52:

      return 0;
    }
    MainDisplay = IOMobileFramebufferGetMainDisplay();
    if (MainDisplay)
    {
      v36 = 0;
      if (*((_QWORD *)v46 + 2))
      {
        v21 = *((_QWORD *)v46 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v20 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v20 = init_default_corebrightness_log();
        v21 = v20;
      }
      v36 = v21;
      v35 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v48, MainDisplay);
        _os_log_error_impl(&dword_1B5291000, v36, v35, "SBIM Initialization | Unable to obtain IOMFB display object | ErrorCode=0x%x", v48, 8u);
      }
      goto LABEL_52;
    }
    *((_DWORD *)v46 + 16) = IOMobileFramebufferGetServiceObject();
    if (!*((_DWORD *)v46 + 16))
    {
      v34 = 0;
      if (*((_QWORD *)v46 + 2))
      {
        v19 = *((_QWORD *)v46 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v18 = init_default_corebrightness_log();
        v19 = v18;
      }
      v34 = v19;
      v33 = 16;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v16 = v34;
        v17 = v33;
        __os_log_helper_16_0_0(v32);
        _os_log_error_impl(&dword_1B5291000, v16, v17, "SBIM Initialization | Unable to obtain IOMFB service object", v32, 2u);
      }
      goto LABEL_52;
    }
    if ((objc_msgSend(v46, "initialiseLimits") & 1) == 0)
    {
      v31 = 0;
      if (*((_QWORD *)v46 + 2))
      {
        v15 = *((_QWORD *)v46 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v14 = init_default_corebrightness_log();
        v15 = v14;
      }
      v31 = v15;
      v30 = 16;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v12 = v31;
        v13 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_error_impl(&dword_1B5291000, v12, v13, "SBIM Initialization | Unable to obtain SBIM tables", v29, 2u);
      }
      goto LABEL_52;
    }
    v28 = 0;
    if (*((_QWORD *)v46 + 2))
    {
      v11 = *((_QWORD *)v46 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v10 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v10 = init_default_corebrightness_log();
      v11 = v10;
    }
    v28 = v11;
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v28;
      v9 = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_impl(&dword_1B5291000, v8, v9, "SBIM Initialization | SBIM supported", v26, 2u);
    }
    *((float *)v46 + 55) = 1.0;
    *((float *)v46 + 56) = 1.0;
    *((_BYTE *)v46 + 32) = 1;
    *((_BYTE *)v46 + 33) = 0;
    *((_BYTE *)v46 + 48) = 0;
    objc_msgSend(v46, "resetMitigationState");
  }
  return (CBSBIM *)v46;
}

+ (BOOL)needsSBIM
{
  if ((MGIsDeviceOneOfType() & 1) != 0)
    return 1;
  else
    return (MGIsDeviceOneOfType() & 1) != 0 || (MGIsDeviceOneOfType() & 1) != 0 || (MGIsDeviceOneOfType() & 1) != 0;
}

- (BOOL)initialiseLimits
{
  char v4;

  if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimits1;
    self->_limitsSize = 121;
    v4 = 1;
  }
  else if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimits2;
    self->_limitsSize = 161;
    v4 = 1;
  }
  else if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimits3;
    self->_limitsSize = 121;
    v4 = 1;
  }
  else if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimits4;
    self->_limitsSize = 121;
    v4 = 1;
  }
  else if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimits5;
    self->_limitsSize = 121;
    v4 = 1;
  }
  else if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimitsD9x;
    self->_limitsSize = 121;
    v4 = 1;
  }
  else if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimitsD4y;
    self->_limitsSize = 121;
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBSBIM *v4;

  v4 = self;
  v3 = a2;
  -[CBSBIM stopMonitoring](self, "stopMonitoring");

  if (v4->_queue)
    dispatch_release((dispatch_object_t)v4->_queue);
  if (v4->_log)

  v2.receiver = v4;
  v2.super_class = (Class)CBSBIM;
  -[CBSBIM dealloc](&v2, sel_dealloc);
}

- (void)dataTimerHandler
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t inited;
  NSObject *log;
  _OWORD v11[2];
  unsigned int i;
  os_log_type_t type;
  os_log_t oslog;
  int Block;
  __int128 v16;
  __int128 v17;
  _BOOL4 v18;
  SEL v19;
  CBSBIM *v20;
  uint8_t v21[96];
  uint8_t v22[8];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = self;
  v19 = a2;
  v18 = 0;
  v18 = self->mitigation.sbim_read_stage == 0;
  Block = IOMobileFramebufferGetBlock();
  if (Block)
  {
    oslog = 0;
    if (v20->_log)
    {
      log = v20->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      log = inited;
    }
    oslog = log;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v22, Block);
      _os_log_error_impl(&dword_1B5291000, oslog, type, "SBIM Sampling | Reading SBIM state from IOMFB failed | ErrorCode=0x%x", v22, 8u);
    }
  }
  else
  {
    for (i = 0; i < v20->mitigation.sbim_size; ++i)
      *((_DWORD *)&v16 + i + 2) *= 2;
    v11[0] = v16;
    HIDWORD(v4) = DWORD1(v17);
    v11[1] = v17;
    *(float *)&v4 = v20->_currentHeadroom;
    *(float *)&v2 = v20->_currentHeadroomRequest;
    *(float *)&v3 = v20->_sdrBrightness;
    -[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:](v20, "updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:", v11, v20->mitigation.sbim_read_stage == 1, v4, v2, v3);
    if (v20->_log)
    {
      v8 = v20->_log;
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
      v5 = -[CBSBIM mitigationStageToString:](v20, "mitigationStageToString:", v20->mitigation.stage);
      if (v20->mitigation.violation)
        v6 = "YES";
      else
        v6 = "NO";
      __os_log_helper_16_2_11_8_32_8_32_4_0_4_0_4_0_4_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v21, v5, (uint64_t)v6, v20->mitigation.sbim_above_max - v20->mitigation.sbim_above_num, SDWORD2(v16), SHIDWORD(v16), v17, *((uint64_t *)&v17 + 1), COERCE__INT64(v20->_sdrBrightness), COERCE__INT64(v20->_currentHeadroom), COERCE__INT64(v20->_currentHeadroomRequest), v20->mitigation.sbim_read_stage);
      _os_log_impl(&dword_1B5291000, v8, OS_LOG_TYPE_DEFAULT, "SBIM Sampling\n{\n\tState=%s\n\tViolation=%s\n\tConsecutiveViolations=%d\n\tRGB=(%u, %u, %u)\n\tDuration=%llu\n\tSDRBrightness=%f\n\tCurrentHeadroom=%f\n\tRequestedHeadroom=%f\n\tReadStage=%u\n}", v21, 0x5Cu);
    }
    v20->mitigation.sbim_read_stage = (v20->mitigation.sbim_read_stage + 1) % v20->mitigation.sbim_reset_frequency;
  }
}

- (void)mitigationTimerHandler
{
  double v2;
  float v3;
  const char *v4;
  const char *v5;
  double v6;
  uint64_t inited;
  NSObject *log;
  float v9;
  float v10;
  uint8_t v12[72];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CBSBIM mitigatedHeadroomFromRequestedHeadroom](self, "mitigatedHeadroomFromRequestedHeadroom");
  v10 = *(float *)&v2;
  +[CBEDR headroomToScalingFactor:](CBEDR, "headroomToScalingFactor:", v2);
  v9 = v3;
  if (self->_log)
  {
    log = self->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[CBSBIM mitigationStageToString:](self, "mitigationStageToString:", self->mitigation.stage);
    if (self->mitigation.violation)
      v5 = "YES";
    else
      v5 = "NO";
    __os_log_helper_16_2_6_8_32_8_32_4_0_8_0_8_0_8_0((uint64_t)v12, (uint64_t)v4, (uint64_t)v5, self->mitigation.sbim_above_max - self->mitigation.sbim_above_num, COERCE__INT64(self->_currentHeadroom), COERCE__INT64(self->_currentHeadroomRequest), COERCE__INT64(v10));
    _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "SBIM Mitigation\n{\n\tState=%s\n\tViolation=%s\n\tConsecutiveViolations=%d\n\tCurrentHeadroom=%f\n\tRequestedHeadroom=%f\n\tMitigatedHeadroom=%f\n}", v12, 0x3Au);
  }
  v6 = (float)(std::__math::fabs[abi:ne180100](self->mitigation.scalingFactor - v9) / self->mitigation.scalingFactor);
  if (self->mitigation.violation && v6 > 0.0001)
  {
    self->mitigation.scalingFactor = v9;
    self->_cap = v10;
    if (v10 < self->_currentHeadroom)
    {
      *(float *)&v6 = self->_cap;
      -[CBSBIM sendEDRHeadroomRequest:](self, "sendEDRHeadroomRequest:", v6);
    }
  }
}

- (float)mitigatedHeadroomFromRequestedHeadroom
{
  double v2;
  double v3;
  float v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  double v7;
  float result;
  unint64_t stage;
  float v10;

  *(float *)&v2 = self->_currentHeadroom;
  +[CBEDR headroomToStops:](CBEDR, "headroomToStops:", v2);
  *(float *)&v3 = self->_currentHeadroomRequest;
  +[CBEDR headroomToStops:](CBEDR, "headroomToStops:", v3);
  v10 = v4;
  if ((v5 & 1) == 0
  {
    *(float *)&-[CBSBIM mitigatedHeadroomFromRequestedHeadroom]::mitigationHRdelta = (float)self->mitigation.mitigation_timer_interval
                                                                                   / (float)(self->mitigation.minutes_per_stop_mitigate
                                                                                           * 60.0);
  }
  if ((v6 & 1) == 0
  {
    *(float *)&-[CBSBIM mitigatedHeadroomFromRequestedHeadroom]::recoveryHRdelta = (float)self->mitigation.mitigation_timer_interval
                                                                                 / (float)(self->mitigation.minutes_per_stop_recovery
                                                                                         * 60.0);
  }
  stage = self->mitigation.stage;
  if (stage <= 3)
    __asm { BR              X8 }
  *(float *)&v7 = std::__math::fmin[abi:ne180100](v10, 0.0);
  +[CBEDR stopsToHeadroom:](CBEDR, "stopsToHeadroom:", v7);
  return result;
}

- (void)startMonitoring
{
  const char *v2;
  dispatch_time_t v3;
  NSObject *dataTimer;
  dispatch_source_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *mitigationTimer;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *source;
  uint64_t inited;
  NSObject *log;
  uint8_t v20[15];
  os_log_type_t v21;
  os_log_t oslog;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  CBSBIM *v28;
  uint8_t v29[15];
  char v30;
  NSObject *v31;
  uint64_t handler;
  int v33;
  int v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  CBSBIM *v37;
  os_log_type_t v38;
  os_log_t v39;
  SEL v40;
  CBSBIM *v41;
  uint8_t v42[24];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v41 = self;
  v40 = a2;
  v39 = 0;
  if (self->_log)
  {
    log = v41->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    log = inited;
  }
  v39 = log;
  v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    if (v41->_isMonitoring)
      v2 = "YES";
    else
      v2 = "NO";
    __os_log_helper_16_2_1_8_32((uint64_t)v42, (uint64_t)v2);
    _os_log_impl(&dword_1B5291000, v39, v38, "SBIM Monitoring | Start=YES IsMonitoring=%s", v42, 0xCu);
  }
  if (!v41->_isMonitoring)
  {
    -[CBSBIM enableSBIM:](v41, "enableSBIM:", 1);
    -[CBSBIM resetMitigationState](v41, "resetMitigationState");
    v41->_dataTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v41->_queue);
    if (v41->_dataTimer)
    {
      source = v41->_dataTimer;
      v3 = dispatch_time(0, 3000000000);
      dispatch_source_set_timer(source, v3, 1000000000 * v41->mitigation.sbim_timer_interval, 1000000000 * v41->mitigation.sbim_timer_interval);
      dataTimer = v41->_dataTimer;
      handler = MEMORY[0x1E0C809B0];
      v33 = -1073741824;
      v34 = 0;
      v35 = __25__CBSBIM_startMonitoring__block_invoke;
      v36 = &unk_1E68E9E60;
      v37 = v41;
      dispatch_source_set_event_handler(dataTimer, &handler);
      dispatch_resume((dispatch_object_t)v41->_dataTimer);
      v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v41->_queue);
      v41->_mitigationTimer = (OS_dispatch_source *)v5;
      if (v41->_mitigationTimer)
      {
        mitigationTimer = v41->_mitigationTimer;
        v6 = dispatch_time(0, 3000000000);
        dispatch_source_set_timer(mitigationTimer, v6, 1000000000 * v41->mitigation.mitigation_timer_interval, 1000000000 * v41->mitigation.mitigation_timer_interval);
        v7 = v41->_mitigationTimer;
        v23 = MEMORY[0x1E0C809B0];
        v24 = -1073741824;
        v25 = 0;
        v26 = __25__CBSBIM_startMonitoring__block_invoke_39;
        v27 = &unk_1E68E9E60;
        v28 = v41;
        dispatch_source_set_event_handler(v7, &v23);
        dispatch_resume((dispatch_object_t)v41->_mitigationTimer);
        v41->_isMonitoring = 1;
      }
      else
      {
        oslog = 0;
        if (v41->_log)
        {
          v11 = v41->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v10 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v10 = init_default_corebrightness_log();
          v11 = v10;
        }
        oslog = v11;
        v21 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v8 = oslog;
          v9 = v21;
          __os_log_helper_16_0_0(v20);
          _os_log_error_impl(&dword_1B5291000, v8, v9, "SBIM Mitigation | Unable to create a timer", v20, 2u);
        }
        -[CBSBIM stopMonitoring](v41, "stopMonitoring");
      }
    }
    else
    {
      v31 = 0;
      if (v41->_log)
      {
        v16 = v41->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v15 = init_default_corebrightness_log();
        v16 = v15;
      }
      v31 = v16;
      v30 = 16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v13 = v31;
        v14 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_error_impl(&dword_1B5291000, v13, v14, "SBIM Data | Unable to create a timer", v29, 2u);
      }
      -[CBSBIM stopMonitoring](v41, "stopMonitoring");
    }
  }
}

uint64_t __25__CBSBIM_startMonitoring__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataTimerHandler", a1, a1);
}

uint64_t __25__CBSBIM_startMonitoring__block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mitigationTimerHandler", a1, a1);
}

- (void)stopMonitoring
{
  const char *v2;
  uint64_t inited;
  NSObject *log;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_log)
  {
    log = self->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isMonitoring)
      v2 = "YES";
    else
      v2 = "NO";
    __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)v2);
    _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "SBIM Monitoring | Stop=YES IsMonitoring=%s", v6, 0xCu);
  }
  if (self->_isMonitoring)
  {
    if (self->_dataTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_dataTimer);
      dispatch_release((dispatch_object_t)self->_dataTimer);
      self->_dataTimer = 0;
    }
    if (self->_mitigationTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_mitigationTimer);
      dispatch_release((dispatch_object_t)self->_mitigationTimer);
      self->_mitigationTimer = 0;
    }
    -[CBSBIM resetMitigationState](self, "resetMitigationState");
    -[CBSBIM enableSBIM:](self, "enableSBIM:", 0);
    self->_isMonitoring = 0;
  }
}

- (void)enable
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  SEL v9;
  CBSBIM *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  if (self->_log)
  {
    v5 = v10->_log;
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
    _os_log_impl(&dword_1B5291000, log, type, "SBIM State | Enabled=YES", v6, 2u);
  }
  v10->_sbimEnabled = 1;
  if (v10->_edrOn)
    -[CBSBIM startMonitoring](v10, "startMonitoring");
}

- (void)disable
{
  double v2;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v6;
  float cap;
  uint8_t v8[7];
  os_log_type_t v9;
  NSObject *v10;
  SEL v11;
  CBSBIM *v12;

  v12 = self;
  v11 = a2;
  v10 = 0;
  if (self->_log)
  {
    v6 = v12->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v6 = inited;
  }
  v10 = v6;
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1B5291000, log, type, "SBIM State | Disabled=YES", v8, 2u);
  }
  v12->_sbimEnabled = 0;
  if (v12->_edrOn)
  {
    -[CBSBIM stopMonitoring](v12, "stopMonitoring");
    cap = v12->_cap;
    -[CBEDR maxHeadroom](v12->_edr, "maxHeadroom");
    v12->_cap = *(float *)&v2;
    if (v12->_currentHeadroomRequest > cap)
    {
      *(float *)&v2 = v12->_currentHeadroomRequest;
      -[CBSBIM sendEDRHeadroomRequest:](v12, "sendEDRHeadroomRequest:", v2);
    }
  }
}

- (void)enterEDR
{
  self->_edrOn = 1;
  if (self->_sbimEnabled)
    -[CBSBIM startMonitoring](self, "startMonitoring");
}

- (void)exitEDR
{
  self->_edrOn = 0;
  if (self->_sbimEnabled)
    -[CBSBIM stopMonitoring](self, "stopMonitoring");
}

- (void)enableSBIM:(BOOL)a3
{
  const char *v3;
  kern_return_t v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int entry;
  uint64_t inited;
  NSObject *log;
  int v10;
  uint64_t v11;
  BOOL v12;
  uint8_t v14[32];
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v3 = "Enabling";
  if (!a3)
    v3 = "Disabling";
  v11 = (uint64_t)v3;
  if (self->_log)
  {
    log = self->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v15, v11);
    _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "SBIM IOMFB | %s SBIM", v15, 0xCu);
  }
  entry = self->_iomfbService;
  if (v12)
    v4 = IORegistryEntrySetCFProperty(entry, CFSTR("enableSBIM"), (CFTypeRef)*MEMORY[0x1E0C9AE50]);
  else
    v4 = IORegistryEntrySetCFProperty(entry, CFSTR("enableSBIM"), (CFTypeRef)*MEMORY[0x1E0C9AE40]);
  v10 = v4;
  if (v4)
  {
    if (self->_log)
    {
      v6 = self->_log;
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
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v14, v11, v10);
      _os_log_error_impl(&dword_1B5291000, v6, OS_LOG_TYPE_ERROR, "SBIM IOMFB | %s SBIM failed | ErrorCode=0x%x", v14, 0x12u);
    }
  }
}

- (void)resetMitigationState
{
  float v2;
  float v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t inited;
  NSObject *log;
  __int128 v10;
  __int128 v11;
  unsigned int i;
  unsigned int v13;
  SEL v14;
  CBSBIM *v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = self;
  v14 = a2;
  self->mitigation.scalingFactor = 0.0;
  -[CBEDR maxHeadroom](v15->_edr, "maxHeadroom");
  v15->_cap = v2;
  if (v15->mitigation.stage)
  {
    v13 = 0;
    v3 = mach_time_now_in_milliseconds();
    v4 = (double)(60 * v15->mitigation.sbim_timer_interval);
    v5 = (v3 - v15->mitigation.lastStateUpdate_) / v4;
    v13 = std::__math::fmin[abi:ne180100]<int,unsigned int,0>(6, vcvtad_u64_f64(v5), v5, v4);
    for (i = 0; i < v13; ++i)
    {
      v10 = *(_OWORD *)&v15->mitigation.lastSBIMBlock_.version;
      v11 = *(_OWORD *)&v15->mitigation.lastSBIMBlock_.var0.v1.sbim[2];
      LODWORD(v6) = 1.0;
      LODWORD(v7) = 1120403456;
      -[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:](v15, "updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:", &v10, 0, COERCE_DOUBLE(__PAIR64__(DWORD1(v11), 1.0)), v6, v7);
    }
    if (v15->_log)
    {
      log = v15->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)-[CBSBIM mitigationStageToString:](v15, "mitigationStageToString:", v15->mitigation.stage));
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "SBIM Reset | CurrentStage=%s", v16, 0xCu);
    }
  }
}

- (const)mitigationStageToString:(int)a3
{
  if (a3 <= 3uLL)
    __asm { BR              X8 }
  return "UnknownMitigationStage";
}

- (void)updateMitigationStateWithData:(IOMFBShortTermBIM *)a3 andCurrentHeadroom:(float)a4 andRequestedHeadroom:(float)a5 andSDRBrightness:(float)a6 andReset:(BOOL)a7
{
  unsigned __int8 v7;
  CBSBIM *v8;
  unint64_t stage;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  NSObject *log;
  _DWORD *v24;
  float v25;
  __n128 v27;
  _QWORD v28[2];
  unsigned int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  __n128 v34;
  _BYTE v35[52];
  int v36;
  _BYTE v37[36];
  int i;
  uint64_t v39[2];
  float *v40[2];
  float v41;
  BOOL v42;
  float v43;
  float v44;
  float v45;
  IOMFBShortTermBIM *v46;
  SEL v47;
  CBSBIM *v48;
  uint8_t v49[136];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v48 = self;
  v47 = a2;
  v46 = a3;
  v45 = a4;
  v44 = a5;
  v43 = a6;
  v42 = a7;
  if ((v7 & 1) == 0
  {
    v41 = 0.0;
    std::valarray<float>::valarray(&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, &v41, v48->mitigation.sbim_size);
    __cxa_atexit((void (*)(void *))std::valarray<float>::~valarray, &-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, &dword_1B5291000);
  }
  std::valarray<float>::valarray(v40, v48->mitigation.sbim_size);
  std::valarray<float>::valarray(v39, v48->mitigation.sbim_size);
  for (i = 0; i < (unint64_t)std::valarray<float>::size[abi:ne180100](v39); ++i)
  {
    v25 = (float)a3->var0.v1.sbim[i];
    *(float *)std::valarray<float>::operator[][abi:ne180100](v39, i) = v25;
  }
  if (v42)
  {
    v36 = 1107296256;
    std::operator/[abi:ne180100]<std::valarray<float>,0>(v39, (uint64_t)&v36, (uint64_t)v37);
    std::valarray<float>::operator=<std::_BinaryOp<std::divides<float>,std::valarray<float>,std::__scalar_expr<float>>>(v40, (uint64_t)v37);
  }
  else
  {
    std::operator-[abi:ne180100]<std::valarray<float>,std::valarray<float>,0>((uint64_t)v39, (uint64_t)&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, &v34);
    v33 = 1107296256;
    std::operator/[abi:ne180100]<std::__val_expr<std::_BinaryOp<std::minus<float>,std::valarray<float>,std::valarray<float>>>,0>((uint64_t)&v34, (uint64_t)&v33, v35);
    std::valarray<float>::operator=<std::_BinaryOp<std::divides<float>,std::__val_expr<std::_BinaryOp<std::minus<float>,std::valarray<float>,std::valarray<float>>>,std::__scalar_expr<float>>>(v40, (uint64_t)v35);
  }
  v32 = 0;
  v31 = v48->_limitsSize - 1;
  v30 = 0;
  v29 = vcvtmd_s64_f64(v43 / 10.0 + 0.5);
  v24 = std::max[abi:ne180100]<int>(&v30, &v29);
  v32 = *std::min[abi:ne180100]<int>(&v31, v24);
  std::valarray<float>::valarray(v28, v48->_limits[v32], v48->mitigation.sbim_size);
  std::operator>[abi:ne180100]<std::valarray<float>,std::valarray<float>,0>((uint64_t)v40, (uint64_t)v28, &v27);
  v48->mitigation.violation = std::__val_expr<std::_BinaryOp<std::greater<float>,std::valarray<float>,std::valarray<float>>>::max[abi:ne180100]((uint64_t)&v27);
  if (v48->_log)
  {
    log = v48->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)&v21 = *(float *)std::valarray<float>::operator[][abi:ne180100](v39, 0);
    *(double *)&v20 = *(float *)std::valarray<float>::operator[][abi:ne180100](v39, 1);
    *(double *)&v19 = *(float *)std::valarray<float>::operator[][abi:ne180100](v39, 2);
    *(double *)&v18 = *(float *)std::valarray<float>::operator[][abi:ne180100](&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, 0);
    *(double *)&v17 = *(float *)std::valarray<float>::operator[][abi:ne180100](&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, 1);
    *(double *)&v16 = *(float *)std::valarray<float>::operator[][abi:ne180100](&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, 2);
    *(double *)&v15 = *(float *)std::valarray<float>::operator[][abi:ne180100](v40, 0);
    *(double *)&v14 = *(float *)std::valarray<float>::operator[][abi:ne180100](v40, 1);
    *(double *)&v13 = *(float *)std::valarray<float>::operator[][abi:ne180100](v40, 2);
    *(double *)&v12 = *(float *)std::valarray<float>::operator[][abi:ne180100](v28, 0);
    *(double *)&v10 = *(float *)std::valarray<float>::operator[][abi:ne180100](v28, 1);
    v11 = (float *)std::valarray<float>::operator[][abi:ne180100](v28, 2);
    __os_log_helper_16_0_12_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v49, v21, v20, v19, v18, v17, v16, v15, v14, v13, v12, v10, COERCE__INT64(*v11));
    _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "SBIM Data\n{\n\tCurrentAccumulatedSBIM=(%f, %f, %f)\n\tPreviousAccumulatedSBIM=(%f, %f, %f)\n\tCurrentSBIM=(%f, %f, %f)\n\tLimitSBIM=(%f, %f, %f)\n}", v49, 0x7Au);
  }
  std::valarray<float>::operator=((uint64_t *)&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, v39);
  stage = v48->mitigation.stage;
  if (stage <= 3)
    __asm { BR              X8 }
  v48->mitigation.lastStateUpdate_ = mach_time_now_in_milliseconds();
  v8 = v48;
  *(_OWORD *)&v48->mitigation.lastSBIMBlock_.version = *(_OWORD *)&a3->version;
  *(_OWORD *)&v8->mitigation.lastSBIMBlock_.var0.v1.sbim[2] = *(_OWORD *)&a3->var0.v1.sbim[2];
  std::valarray<float>::~valarray(v28);
  std::valarray<float>::~valarray(v39);
  std::valarray<float>::~valarray(v40);
}

- (void)sendEDRHeadroomRequest:(float)a3
{
  CFAllocatorRef *v3;
  uint64_t inited;
  NSObject *log;
  int i;
  CFDictionaryRef cf;
  float valuePtr;
  SEL v9;
  CBSBIM *v10;
  CFNumberRef v11;
  const void *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = self;
  v9 = a2;
  valuePtr = a3;
  if (self->_log)
  {
    log = v10->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v13, COERCE__INT64(valuePtr));
    _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "SBIM EDR | Sending headroom request with headroom=%f", v13, 0xCu);
  }
  v12 = 0;
  v12 = (const void *)*MEMORY[0x1E0CD29A8];
  v11 = 0;
  v3 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloat32Type, &valuePtr);
  cf = CFDictionaryCreate(*v3, &v12, (const void **)&v11, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (cf)
  {
    -[CBDisplayModuleiOS setProperty:forKey:](v10->_displayModule, "setProperty:forKey:", cf, CFSTR("EDRHeadroomRequest"));
    CFRelease(cf);
  }
  for (i = 0; i < 1; ++i)
  {
    if (*(&v11 + i))
      CFRelease(*(&v11 + i));
  }
}

- (float)sdrBrightness
{
  return self->_sdrBrightness;
}

- (float)currentHeadroom
{
  return self->_currentHeadroom;
}

- (float)currentHeadroomRequest
{
  return self->_currentHeadroomRequest;
}

- (void)setCurrentHeadroomRequest:(float)a3
{
  self->_currentHeadroomRequest = a3;
}

- (float)cap
{
  return self->_cap;
}

- (id).cxx_construct
{
  CoreBrightness::MitigationState::MitigationState((CoreBrightness::MitigationState *)&self->mitigation);
  return self;
}

@end
