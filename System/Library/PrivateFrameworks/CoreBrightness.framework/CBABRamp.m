@implementation CBABRamp

- (CBABRamp)initWithDisplayModule:(id)a3 andQueue:(id)a4
{
  os_log_t v4;
  os_log_t v5;
  id v6;
  int v7;
  NSObject *log;
  os_log_type_t type;
  NSObject *v11;
  id v12;
  uint8_t v13[7];
  char v14;
  NSObject *v15;
  objc_super v16;
  id v17;
  id v18;
  SEL v19;
  void *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CBABRamp;
  v20 = -[CBABRamp init](&v16, sel_init);
  if (v20)
  {
    v4 = os_log_create("com.apple.CoreBrightness.CBABRamp", "default");
    *((_QWORD *)v20 + 4) = v4;
    if (!*((_QWORD *)v20 + 4))
    {
      v15 = 0;
      v11 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v15 = v11;
      v14 = 16;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        log = v15;
        type = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create log handle", v13, 2u);
      }
    }
    *((_QWORD *)v20 + 2) = v17;
    dispatch_retain(*((dispatch_object_t *)v20 + 2));
    v5 = os_log_create("com.apple.CoreBrightness.ABRamp", "default");
    *((_QWORD *)v20 + 4) = v5;
    v6 = v18;
    *((_QWORD *)v20 + 1) = v6;
    *((float *)v20 + 10) = 1.0;
    *((_DWORD *)v20 + 11) = 981668463;
    v12 = (id)objc_msgSend(*((id *)v20 + 1), "copyPropertyForKey:", CFSTR("DisplayBrightnessLinearMin"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      *((_DWORD *)v20 + 11) = v7;
    }

  }
  return (CBABRamp *)v20;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBABRamp *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }
  dispatch_release((dispatch_object_t)v4->_queue);
  v4->_queue = 0;

  v2.receiver = v4;
  v2.super_class = (Class)CBABRamp;
  -[CBABRamp dealloc](&v2, sel_dealloc);
}

- (void)stopTransition
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  char v7;
  NSObject *v8;
  SEL v9;
  CBABRamp *v10;

  v10 = self;
  v9 = a2;
  if (self->_fadeTimer)
  {
    v8 = 0;
    if (v10->_logHandle)
    {
      logHandle = v10->_logHandle;
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
    v7 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v8;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_debug_impl(&dword_1B5291000, log, type, "Ramping module: stopping", v6, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)v10->_fadeTimer);
    v10->_fadeTimer = 0;
  }
}

- (void)transitionToBrightness:(float)a3 force:(BOOL)a4 periodOverride:(BOOL)a5 period:(float)a6
{
  float v6;
  double v7;
  double v8;
  double v9;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v12;
  NSObject *v13;
  NSObject *log;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t v18[7];
  os_log_type_t type;
  os_log_t oslog;
  int v21;
  float v22;
  float v23;
  float v24;
  int v25;
  float v26;
  id v27;
  float v28;
  float v29;
  BOOL v30;
  BOOL v31;
  float v32;
  SEL v33;
  CBABRamp *v34;
  uint8_t v35[64];
  uint8_t v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = self;
  v33 = a2;
  v32 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v28 = 0.0;
  v27 = 0;
  v26 = 0.0;
  v25 = 0;
  v24 = 0.0;
  v23 = 0.0;
  v22 = 0.0;
  v21 = 0;
  v27 = -[CBDisplayModule copyPropertyForKey:](self->_displayModule, "copyPropertyForKey:", CFSTR("DisplayBrightnessLinear"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v27, "floatValue");
    v28 = v6;
    if (v31 || v28 == 0.0 || (float)(vabds_f32(v32, v28) / v28) >= 0.1)
    {
      v23 = linearBrightnessToPerceptualBrightness(v28);
      v22 = linearBrightnessToPerceptualBrightness(v32);
      if (v30)
      {
        v24 = v29;
      }
      else
      {
        v26 = v22 - v23;
        v25 = 11;
        if ((float)(v22 - v23) > -1.0)
        {
          if (v26 < *(float *)&AnimationRateTable[2 * v25 - 2])
          {
            while (v26 > *(float *)&AnimationRateTable[2 * v21])
              ++v21;
            v24 = timeLengthAtFromPointToPoint(v26, *(float *)&AnimationRateTable[2 * v21 - 2], *(float *)&AnimationRateTable[2 * v21 - 1], *(float *)&AnimationRateTable[2 * v21], *(float *)&AnimationRateTable[2 * v21 + 1]);
          }
          else
          {
            v24 = *(float *)&AnimationRateTable[2 * v25 - 1];
          }
        }
        else
        {
          v24 = 60.0;
        }
      }
      if (v34->_logHandle)
      {
        logHandle = v34->_logHandle;
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
        __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_4_0_8_0((uint64_t)v35, COERCE__INT64(v22), COERCE__INT64(v32), COERCE__INT64(v23), COERCE__INT64(v28), v31, COERCE__INT64(v24));
        _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "targetPerceptual=%f (targetLinear=%f) currentPerceptual=%f (currentLinear=%f) forced=%d period=%f", v35, 0x3Au);
      }
      *(float *)&v7 = v22;
      *(float *)&v8 = v24;
      *(float *)&v9 = v23;
      -[CBABRamp setPerceptualBrightnessWithFade:length:current:](v34, "setPerceptualBrightnessWithFade:length:current:", v7, v8, v9);
    }
    else
    {
      if (v34->_logHandle)
      {
        v13 = v34->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v12 = init_default_corebrightness_log();
        v13 = v12;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v36, COERCE__INT64((float)(vabds_f32(v32, v28) / v28)));
        _os_log_debug_impl(&dword_1B5291000, v13, OS_LOG_TYPE_DEBUG, "ALS.changeBrightness NOT CHANGING percent change is %f", v36, 0xCu);
      }
      -[CBABRamp stopTransition](v34, "stopTransition");
    }
  }
  else
  {
    oslog = 0;
    if (v34->_logHandle)
    {
      v17 = v34->_logHandle;
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
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v15 = type;
      __os_log_helper_16_0_0(v18);
      _os_log_error_impl(&dword_1B5291000, log, v15, "Get brightness failed", v18, 2u);
    }
  }

}

- (void)setPerceptualBrightnessWithFade:(float)a3 length:(float)a4 current:(float)a5
{
  float v5;
  float v6;
  dispatch_source_t v7;
  NSObject *fadeTimer;
  NSObject *v9;
  uint64_t v10;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t handler;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  CBABRamp *v24;
  uint64_t *v25;
  uint64_t *v26;
  float v27;
  float v28;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v31;
  uint64_t *v32;
  int v33;
  int v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  float *v44;
  int v45;
  int v46;
  int v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  SEL v55;
  CBABRamp *v56;
  uint8_t v57[40];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v56 = self;
  v55 = a2;
  v54 = a3;
  v53 = a4;
  v52 = a5;
  v51 = 0.0;
  v50 = 0.0;
  v49 = 0.0;
  v48 = 0.0;
  v43 = 0;
  v44 = (float *)&v43;
  v45 = 0x20000000;
  v46 = 32;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x20000000;
  v41 = 32;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 1375731712;
  v34 = 48;
  v35 = __Block_byref_object_copy__18;
  v36 = __Block_byref_object_dispose__18;
  v37 = 0;
  -[CBABRamp stopTransition](self, "stopTransition");
  v51 = v54 - v52;
  v5 = fabsf(v54 - v52) / 0.000978473581;
  *((_DWORD *)v39 + 6) = vcvtms_s32_f32(v5);
  v48 = 0.00097847;
  v50 = v53 / (float)*((int *)v39 + 6);
  v49 = 0.01;
  if (v50 < 0.01)
  {
    v50 = v49;
    *((_DWORD *)v39 + 6) = vcvtms_s32_f32(v53 / v49);
    v6 = fabs(v51) / (double)*((int *)v39 + 6);
    v48 = v6;
  }
  oslog = 0;
  if (v56->_logHandle)
  {
    logHandle = v56->_logHandle;
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
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_4_8_0_8_0_8_0_4_0((uint64_t)v57, COERCE__INT64(v52), COERCE__INT64(v54), COERCE__INT64(v53), *((_DWORD *)v39 + 6));
    _os_log_impl(&dword_1B5291000, oslog, type, "Ramping from %f to %f (perceptual) over %f seconds with %d steps", v57, 0x26u);
  }
  v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v56->_queue);
  v56->_fadeTimer = (OS_dispatch_source *)v7;
  if (v56->_fadeTimer)
  {
    v32[5] = (uint64_t)v56->_fadeTimer;
    v44[6] = v52;
    dispatch_source_set_timer((dispatch_source_t)v56->_fadeTimer, 0, (unint64_t)(float)(v50 * 1000000000.0), 0);
    fadeTimer = v56->_fadeTimer;
    v10 = MEMORY[0x1E0C809B0];
    handler = MEMORY[0x1E0C809B0];
    v20 = -1073741824;
    v21 = 0;
    v22 = __59__CBABRamp_setPerceptualBrightnessWithFade_length_current___block_invoke;
    v23 = &unk_1E68EBC78;
    v25 = &v38;
    v27 = v54;
    v24 = v56;
    v26 = &v43;
    v28 = v48;
    dispatch_source_set_event_handler(fadeTimer, &handler);
    v9 = v56->_fadeTimer;
    v13 = v10;
    v14 = -1073741824;
    v15 = 0;
    v16 = __59__CBABRamp_setPerceptualBrightnessWithFade_length_current___block_invoke_9;
    v17 = &unk_1E68E9ED8;
    v18 = &v31;
    dispatch_source_set_cancel_handler(v9, &v13);
    dispatch_resume((dispatch_object_t)v56->_fadeTimer);
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v43, 8);
}

void __59__CBABRamp_setPerceptualBrightnessWithFade_length_current___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t inited;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *context;
  uint8_t v12[15];
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  os_log_t v16;
  char v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = a1;
  v19 = a1;
  v18 = 0.0;
  v17 = 1;
  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0)
  {
    if (*(float *)(a1 + 56) >= *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24)
                                                                 + *(float *)(a1 + 60);
    else
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24)
                                                                 - *(float *)(a1 + 60);
    v18 = fminf(fmaxf(perceptualBrightnessToLinearBrightness(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)), *(float *)(*(_QWORD *)(a1 + 32) + 44)), *(float *)(*(_QWORD *)(a1 + 32) + 40));
    v7 = (void *)MEMORY[0x1B5E4A8B0]();
    *(float *)&v2 = v18;
    v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2), CFSTR("DisplayBrightnessLinear")) & 1;
    objc_autoreleasePoolPop(v7);
    if ((v17 & 1) != 0)
    {
      --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    else
    {
      v14 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
      {
        v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v6 = inited;
      }
      v14 = v6;
      v13 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v3 = v14;
        v4 = v13;
        __os_log_helper_16_0_0(v12);
        _os_log_impl(&dword_1B5291000, v3, v4, "Unable to send update", v12, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "stopTransition", v3);
    }
  }
  else
  {
    v18 = fminf(fmaxf(perceptualBrightnessToLinearBrightness(*(float *)(a1 + 56)), *(float *)(*(_QWORD *)(a1 + 32) + 44)), *(float *)(*(_QWORD *)(a1 + 32) + 40));
    context = (void *)MEMORY[0x1B5E4A8B0]();
    *(float *)&v1 = v18;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1), CFSTR("DisplayBrightnessLinear"));
    objc_autoreleasePoolPop(context);
    v16 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    {
      v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v8 = init_default_corebrightness_log();
      v9 = v8;
    }
    v16 = v9;
    v15 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v21, COERCE__INT64(v18));
      _os_log_impl(&dword_1B5291000, v16, v15, "Ramp completed: last set = %f", v21, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "stopTransition");
  }
}

void __59__CBABRamp_setPerceptualBrightnessWithFade_length_current___block_invoke_9(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (float)getVersion
{
  return 1.0;
}

@end
