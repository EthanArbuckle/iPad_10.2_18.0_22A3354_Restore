@implementation CBChromaticCorrection

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  double v4;
  const char *v5;
  CBLuxBezierRamp *ramp;
  uint64_t inited;
  NSObject *log;
  char v10;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightnessAuto")) & 1) != 0)
  {
    v10 = objc_msgSend(a3, "BOOLValue") & 1;
    if (self->_autoBrightnessIsEnabled != v10)
    {
      self->_autoBrightnessIsEnabled = v10 & 1;
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
        if (self->_autoBrightnessIsEnabled)
          v5 = "YES";
        else
          v5 = "NO";
        __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)v5);
        _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "AutoBrightness | Enabled=%s", v14, 0xCu);
      }
      if (self->_aodIsOn)
      {
        -[CBLuxBezierRamp lux](self->_ramp, "lux");
        if ((std::__math::isnan[abi:ne180100]() & 1) != 0)
        {
          ramp = self->_ramp;
          -[CBChromaticCorrectionPolicy rampTargetLuxCap](self->_policy, "rampTargetLuxCap");
          -[CBLuxBezierRamp forceLux:](ramp, "forceLux:");
        }
      }
      else
      {
        *(float *)&v4 = self->_trustedLux;
        -[CBChromaticCorrection handleLuxUpdate:](self, "handleLuxUpdate:", v4);
      }
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", -[CBChromaticCorrectionPolicy isEnabledPropertyKey](self->_policy, "isEnabledPropertyKey")) & 1) != 0)
  {
    -[CBChromaticCorrection setEnabled:](self, "setEnabled:", objc_msgSend(a3, "BOOLValue") & 1);
  }
  return 1;
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  float v4;
  double v5;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TrustedLux")) & 1) != 0)
  {
    objc_msgSend(a4, "floatValue");
    self->_trustedLux = v4;
    if (-[CBChromaticCorrection enabled](self, "enabled") && !self->_aodIsOn)
    {
      *(float *)&v5 = self->_trustedLux;
      -[CBChromaticCorrection handleLuxUpdate:](self, "handleLuxUpdate:", v5);
    }
  }
}

- (float)luxAdjustedByInternalPolicies:(float)a3
{
  float v3;

  if (-[CBChromaticCorrection enabled](self, "enabled"))
    return a3;
  -[CBChromaticCorrectionPolicy rampTargetLuxCap](self->_policy, "rampTargetLuxCap");
  return v3;
}

- (BOOL)enabled
{
  BOOL v3;

  v3 = 0;
  if (self->_isEnabled)
    return self->_autoBrightnessIsEnabled;
  return v3;
}

- (void)setNits:(float)a3
{
  self->_nits = a3;
}

- (void)handleLuxUpdate:(float)a3
{
  double v3;
  int v4;
  double v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t inited;
  NSObject *log;
  CBLuxBezierRamp *ramp;
  float v21;
  int v22;
  int v24;
  uint8_t v26[56];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((std::__math::isnan[abi:ne180100]() & 1) == 0)
  {
    *(float *)&v3 = a3;
    -[CBChromaticCorrection luxAdjustedByInternalPolicies:](self, "luxAdjustedByInternalPolicies:", v3);
    v24 = v4;
    -[CBLuxBezierRamp lux](self->_ramp, "lux");
    if ((std::__math::isnan[abi:ne180100]() & 1) != 0)
    {
      ramp = self->_ramp;
      -[CBChromaticCorrectionPolicy rampTargetLuxCap](self->_policy, "rampTargetLuxCap");
      -[CBLuxBezierRamp forceLux:](ramp, "forceLux:");
    }
    LODWORD(v5) = v24;
    if (-[CBChromaticCorrection shouldRampForIncomingLux:](self, "shouldRampForIncomingLux:", v5))
    {
      v6 = -[CBLuxBezierRamp lux](self->_ramp, "lux");
      v22 = v7;
      v21 = ((float (*)(uint64_t))self->_currentTime)(v6);
      LODWORD(v9) = v22;
      LODWORD(v10) = v24;
      if (self->_aodIsOn)
      {
        -[CBChromaticCorrection handleRampResult:](self, "handleRampResult:", -[CBLuxBezierRamp rampFromLux:toLux:](self->_ramp, "rampFromLux:toLux:", v9, v10));
      }
      else
      {
        *(float *)&v8 = v21;
        -[CBChromaticCorrection handleRampResult:](self, "handleRampResult:", -[CBLuxBezierRamp rampTimedFromLux:toLux:atTime:](self->_ramp, "rampTimedFromLux:toLux:atTime:", v9, v10, v8));
      }
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
        -[CBLuxBezierRamp startTime](self->_ramp, "startTime");
        *(double *)&v15 = v11;
        -[CBLuxBezierRamp duration](self->_ramp, "duration");
        *(double *)&v16 = v12;
        -[CBLuxBezierRamp startLux](self->_ramp, "startLux");
        *(double *)&v17 = v13;
        -[CBLuxBezierRamp targetLux](self->_ramp, "targetLux");
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v26, v15, v16, v17, COERCE__INT64(v14));
        _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Lux | Ramp=YES StartTime=%f Duration=%f StartLux=%f TargetLux=%f", v26, 0x2Au);
      }
    }
  }
}

- (BOOL)shouldRampForIncomingLux:(float)a3
{
  -[CBLuxBezierRamp lux](self->_ramp, "lux");
  return -[CBChromaticCorrection shouldRampFromStartLux:toTargetLux:](self, "shouldRampFromStartLux:toTargetLux:");
}

- (float)currentStrength
{
  float v2;
  float v3;
  double v4;
  float v5;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  float nits;
  uint64_t v11;
  void *context;
  uint64_t v13;
  uint64_t inited;
  NSObject *log;
  float v16;
  uint8_t v19[32];
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((std::__math::isnan[abi:ne180100]() & 1) != 0
    || (-[CBLuxBezierRamp lux](self->_ramp, "lux"), (std::__math::isnan[abi:ne180100]() & 1) != 0))
  {
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(double *)&v13 = self->_nits;
      -[CBLuxBezierRamp lux](self->_ramp, "lux");
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v20, v13, COERCE__INT64(v2));
      _os_log_error_impl(&dword_1B5291000, log, OS_LOG_TYPE_ERROR, "Interpolation | UnexpectedValue=YES Nits=%f Lux=%f", v20, 0x16u);
    }
    return 0.0;
  }
  else if (-[CBChromaticCorrection isInActiveRange](self, "isInActiveRange"))
  {
    nits = self->_nits;
    -[CBLuxBezierRamp lux](self->_ramp, "lux");
    v16 = two_dimensional_interpolation((float *)-[CBFloatArray data](-[CBChromaticCorrectionParams nitsTable](self->_params, "nitsTable"), "data"), -[CBFloatArray count](-[CBChromaticCorrectionParams nitsTable](self->_params, "nitsTable"), "count"), (float *)-[CBFloatArray data](-[CBChromaticCorrectionParams luxTable](self->_params, "luxTable"), "data"), -[CBFloatArray count](-[CBChromaticCorrectionParams luxTable](self->_params, "luxTable"), "count"), (uint64_t)-[CBFloatArray data](-[CBChromaticCorrectionParams strengthTable](self->_params, "strengthTable"), "data"), nits, v3);
    context = (void *)MEMORY[0x1B5E4A8B0]();
    v11 = -[CBChromaticCorrectionPolicy strengthNotification](self->_policy, "strengthNotification");
    *(float *)&v4 = v16;
    -[CBModule sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4));
    objc_autoreleasePoolPop(context);
    if (self->_log)
    {
      v9 = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v8 = init_default_corebrightness_log();
      v9 = v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&v7 = self->_nits;
      -[CBLuxBezierRamp lux](self->_ramp, "lux");
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v19, v7, COERCE__INT64(v5), COERCE__INT64(v16));
      _os_log_debug_impl(&dword_1B5291000, v9, OS_LOG_TYPE_DEBUG, "Interpolation | Nits=%f Lux=%f Strength=%f", v19, 0x20u);
    }
    return v16;
  }
  else
  {
    return 0.0;
  }
}

- (BOOL)isInActiveRange
{
  double v2;
  CBChromaticCorrectionPolicy *policy;
  BOOL v5;

  policy = self->_policy;
  -[CBLuxBezierRamp lux](self->_ramp, "lux");
  v5 = 0;
  if ((-[CBChromaticCorrectionPolicy luxIsInActiveRange:](policy, "luxIsInActiveRange:") & 1) != 0)
  {
    *(float *)&v2 = self->_nits;
    return -[CBChromaticCorrection nitsAreInActiveRange:](self, "nitsAreInActiveRange:", v2);
  }
  return v5;
}

- (BOOL)nitsAreInActiveRange:(float)a3
{
  return -[CBChromaticCorrectionPolicy nitsAreInActiveRange:](self->_policy, "nitsAreInActiveRange:", *(double *)&a3) & 1;
}

- (BOOL)shouldRampFromStartLux:(float)a3 toTargetLux:(float)a4
{
  double v4;
  float v5;
  double v6;
  double v7;
  double v8;
  const char *v9;
  const char *v10;
  uint64_t v12;
  NSObject *v13;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v17;
  uint8_t v18[15];
  os_log_type_t v19;
  NSObject *v20;
  char v21;
  float v22;
  float v23;
  SEL v24;
  CBChromaticCorrection *v25;
  char v26;
  uint8_t v27[56];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = self;
  v24 = a2;
  v23 = a3;
  *(float *)&v4 = a4;
  -[CBChromaticCorrection luxAdjustedByInternalPolicies:](self, "luxAdjustedByInternalPolicies:", v4);
  v22 = v5;
  *(float *)&v6 = v23;
  if ((-[CBChromaticCorrectionPolicy luxIsInActiveRange:](v25->_policy, "luxIsInActiveRange:", v6) & 1) != 0
    || (*(float *)&v7 = v22,
        (-[CBChromaticCorrectionPolicy luxIsInActiveRange:](v25->_policy, "luxIsInActiveRange:", v7) & 1) != 0))
  {
    v21 = 0;
    *(float *)&v7 = v23;
    *(float *)&v8 = v22;
    v21 = -[CBLuxBezierRamp shouldRampFromStartLux:toTargetLux:](v25->_ramp, "shouldRampFromStartLux:toTargetLux:", v7, v8);
    if (v25->_aodIsOn && v25->_aodRampHandoffPending)
    {
      v20 = 0;
      if (v25->_log)
      {
        v17 = v25->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v17 = inited;
      }
      v20 = v17;
      v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        log = v20;
        type = v19;
        __os_log_helper_16_0_0(v18);
        _os_log_impl(&dword_1B5291000, log, type, "Lux | AOD.RampHandoffPending=YES", v18, 2u);
      }
      v21 = 1;
      v25->_aodRampHandoffPending = 0;
    }
    if (v25->_log)
    {
      v13 = v25->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v12 = init_default_corebrightness_log();
      v13 = v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (-[CBChromaticCorrection rampIsRunning](v25, "rampIsRunning"))
        v9 = "YES";
      else
        v9 = "NO";
      if ((v21 & 1) != 0)
        v10 = "YES";
      else
        v10 = "NO";
      __os_log_helper_16_2_4_8_32_8_0_8_0_8_32((uint64_t)v27, (uint64_t)v9, COERCE__INT64(v23), COERCE__INT64(v22), (uint64_t)v10);
      _os_log_impl(&dword_1B5291000, v13, OS_LOG_TYPE_DEFAULT, "Lux | RampIsRunning=%s StartLux=%.2f TargetLux=%.2f ShouldRamp=%s", v27, 0x2Au);
    }
    v26 = v21 & 1;
  }
  else
  {
    v26 = 0;
  }
  return v26 & 1;
}

- (BOOL)rampIsRunning
{
  return -[CBLuxBezierRamp rampIsRunning](self->_ramp, "rampIsRunning", a2, self);
}

- (void)updateRamp
{
  CBLuxBezierRamp *ramp;

  ramp = self->_ramp;
  ((void (*)(void))self->_currentTime)();
  -[CBChromaticCorrection handleRampResult:](self, "handleRampResult:", -[CBLuxBezierRamp updateTimedRamp:](ramp, "updateTimedRamp:"));
}

- (void)handleRampResult:(int)a3
{
  char v3;
  float v4;
  float v5;
  float v6;
  float v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *log;
  uint8_t v17[56];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3 || (a3 == 3 || a3 == 2 ? (v3 = 0) : (v3 = 1), (v3 & 1) == 0))
  {
    if (self->_log)
    {
      log = self->_log;
    }
    else
    {
      v13 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      log = v13;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = +[CBLuxBezierRamp luxRampStateToString:](CBLuxBezierRamp, "luxRampStateToString:", a3);
      -[CBLuxBezierRamp lux](self->_ramp, "lux");
      *(double *)&v11 = v4;
      -[CBLuxBezierRamp startLux](self->_ramp, "startLux");
      *(double *)&v12 = v5;
      -[CBLuxBezierRamp targetLux](self->_ramp, "targetLux");
      __os_log_helper_16_2_4_8_64_8_0_8_0_8_0((uint64_t)v17, (uint64_t)v10, v11, v12, COERCE__INT64(v6));
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Lux | RampState=%@ Lux=%f StartLux=%f TargetLux=%f", v17, 0x2Au);
    }
  }
  if (a3 > 1)
  {
    if (a3 == 2)
    {
      -[CBModule sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("ExternalRampIsRunning"), -[CBChromaticCorrectionPolicy rampIdentifier](self->_policy, "rampIdentifier"));
      if (!self->_aodIsOn)
      {
        v9 = (void *)MEMORY[0x1E0CB37E8];
        -[CBChromaticCorrectionParams rampUpdateRate](self->_params, "rampUpdateRate");
        *(float *)&v8 = 1.0 / v7;
        -[CBModule sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("DisplayDisplayStartFade"), objc_msgSend(v9, "numberWithFloat:", v8));
      }
    }
    else if (a3 == 3)
    {
      -[CBModule sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("ExternalRampHasFinished"), -[CBChromaticCorrectionPolicy rampIdentifier](self->_policy, "rampIdentifier"));
    }
  }
}

- (CBChromaticCorrection)initWithBacklightParams:(id)a3 andPolicy:(id)a4
{
  os_log_t v4;
  CBChromaticCorrectionParams *v5;
  CBChromaticCorrectionPolicy *v6;
  CBLuxBezierRamp *v7;
  uint64_t v8;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v21;
  uint8_t v22[7];
  os_log_type_t v23;
  NSObject *v24;
  uint8_t v25[7];
  char v26;
  NSObject *v27;
  uint8_t v28[15];
  char v29;
  NSObject *v30;
  objc_super v31;
  id v32;
  id v33;
  SEL v34;
  CBChromaticCorrection *v35;

  v35 = self;
  v34 = a2;
  v33 = a3;
  v32 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CBChromaticCorrection;
  v35 = -[CBChromaticCorrection init](&v31, sel_init);
  if (v35)
  {
    if (v32)
      v4 = os_log_create("com.apple.CoreBrightness.ChromaticCorrection", (const char *)objc_msgSend(v32, "name"));
    else
      v4 = os_log_create("com.apple.CoreBrightness.ChromaticCorrection", "default");
    v35->_log = (OS_os_log *)v4;
    if (!v33)
    {
      v30 = 0;
      if (v35->_log)
      {
        v21 = v35->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v21 = inited;
      }
      v30 = v21;
      v29 = 16;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        log = v30;
        type = v29;
        __os_log_helper_16_0_0(v28);
        _os_log_error_impl(&dword_1B5291000, log, type, "Initialization | Error=YES Params=nil", v28, 2u);
      }
LABEL_34:

      v35 = 0;
      return 0;
    }
    if (!v32)
    {
      v27 = 0;
      if (v35->_log)
      {
        v17 = v35->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v16 = init_default_corebrightness_log();
        v17 = v16;
      }
      v27 = v17;
      v26 = 16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v14 = v27;
        v15 = v26;
        __os_log_helper_16_0_0(v25);
        _os_log_error_impl(&dword_1B5291000, v14, v15, "Initialization | Error=YES Policy=nil", v25, 2u);
      }
      goto LABEL_34;
    }
    v35->_isEnabled = 1;
    v35->_autoBrightnessIsEnabled = 1;
    v5 = (CBChromaticCorrectionParams *)v33;
    v35->_params = v5;
    v6 = (CBChromaticCorrectionPolicy *)v32;
    v35->_policy = v6;
    -[CBChromaticCorrectionPolicy setParams:](v35->_policy, "setParams:", v33);
    v7 = [CBLuxBezierRamp alloc];
    v8 = -[CBLuxBezierRamp initWithParams:andPolicy:](v7, "initWithParams:andPolicy:", v35->_params, v35->_policy);
    v35->_ramp = (CBLuxBezierRamp *)v8;
    v35->_nits = NAN;
    v35->_trustedLux = NAN;
    v35->_currentTime = mach_time_now_in_seconds;
    v35->_aodIsOn = 0;
    v35->_aodRampHandoffPending = 0;
    v24 = 0;
    if (v35->_log)
    {
      v13 = v35->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v12 = init_default_corebrightness_log();
      v13 = v12;
    }
    v24 = v13;
    v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v24;
      v11 = v23;
      __os_log_helper_16_0_0(v22);
      _os_log_impl(&dword_1B5291000, v10, v11, "Initialization | Start", v22, 2u);
    }
  }
  return v35;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBChromaticCorrection *v4;

  v4 = self;
  v3 = a2;

  v4->_params = 0;
  v4->_policy = 0;

  v4->_ramp = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBChromaticCorrection;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (float)aodRampDuration
{
  float result;

  -[CBChromaticCorrectionParams aodRampDuration](self->_params, "aodRampDuration", a2, self);
  return result;
}

- (float)lux
{
  float result;

  -[CBLuxBezierRamp lux](self->_ramp, "lux", a2, self);
  return result;
}

- (float)targetLux
{
  float result;

  -[CBLuxBezierRamp targetLux](self->_ramp, "targetLux", a2, self);
  return result;
}

- (void)setLux:(float)a3
{
  -[CBLuxBezierRamp forceLux:](self->_ramp, "forceLux:", *(double *)&a3);
}

- (void)updateRampWithProgress:(float)a3
{
  -[CBChromaticCorrection handleRampResult:](self, "handleRampResult:", -[CBLuxBezierRamp updateRampWithProgress:](self->_ramp, "updateRampWithProgress:", *(double *)&a3));
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  int v5;
  int v6;
  double v7;
  double v8;
  int v9;
  uint64_t v10;
  int v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *log;
  CBLuxBezierRamp *v28;
  int v29;
  int v30;
  CBLuxBezierRamp *ramp;
  int v32;
  char v33;
  uint8_t v35[56];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  if (a3)
  {
    if (a3 == 3)
    {
      self->_aodIsOn = 1;
      if (-[CBLuxBezierRamp rampIsRunning](self->_ramp, "rampIsRunning"))
      {
        ramp = self->_ramp;
        -[CBLuxBezierRamp lux](ramp, "lux");
        v32 = v5;
        -[CBLuxBezierRamp targetLux](self->_ramp, "targetLux");
        LODWORD(v7) = v6;
        LODWORD(v8) = v32;
        -[CBChromaticCorrection handleRampResult:](self, "handleRampResult:", -[CBLuxBezierRamp rampFromLux:toLux:forceRamp:](ramp, "rampFromLux:toLux:forceRamp:", 1, v8, v7));
        self->_aodRampHandoffPending = 1;
        v33 = 1;
      }
    }
  }
  else
  {
    self->_aodIsOn = 0;
    if (-[CBLuxBezierRamp rampIsRunning](self->_ramp, "rampIsRunning"))
    {
      v28 = self->_ramp;
      -[CBLuxBezierRamp lux](v28, "lux");
      v30 = v9;
      v10 = -[CBLuxBezierRamp targetLux](self->_ramp, "targetLux");
      v29 = v11;
      v12 = ((double (*)(uint64_t))self->_currentTime)(v10);
      LODWORD(v13) = v29;
      LODWORD(v14) = LODWORD(v12);
      LODWORD(v12) = v30;
      -[CBChromaticCorrection handleRampResult:](self, "handleRampResult:", -[CBLuxBezierRamp rampTimedFromLux:toLux:atTime:forceRamp:](v28, "rampTimedFromLux:toLux:atTime:forceRamp:", 1, v12, v13, v14));
      v33 = 1;
    }
  }
  if ((v33 & 1) != 0)
  {
    if (self->_log)
    {
      log = self->_log;
    }
    else
    {
      v26 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      log = v26;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v15 = "YES";
      if (!self->_aodIsOn)
        v15 = "NO";
      v22 = (uint64_t)v15;
      -[CBLuxBezierRamp startTime](self->_ramp, "startTime", 0x1EF0FB000uLL);
      *(double *)&v23 = v16;
      objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v21 + 3376)), "duration");
      *(double *)&v24 = v17;
      objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v21 + 3376)), "startLux");
      *(double *)&v25 = v18;
      objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v21 + 3376)), "targetLux");
      __os_log_helper_16_2_5_8_32_8_0_8_0_8_0_8_0((uint64_t)v35, v22, v23, v24, v25, COERCE__INT64(v19));
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Lux | RampHandoff=YES AOD.IsOn=%s StartTime=%f Duration=%f StartLux=%f TargetLux=%f", v35, 0x34u);
    }
  }
  return 1;
}

- (void)setEnabled:(BOOL)a3
{
  double v3;
  const char *v4;
  uint64_t inited;
  NSObject *log;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
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
      if (self->_isEnabled)
        v4 = "YES";
      else
        v4 = "NO";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v4);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "State | Enabled=%s", v8, 0xCu);
    }
    if (!self->_aodIsOn)
    {
      *(float *)&v3 = self->_trustedLux;
      -[CBChromaticCorrection handleLuxUpdate:](self, "handleLuxUpdate:", v3);
    }
  }
}

- (id)copyPropertyForKey:(id)a3
{
  return 0;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (CBChromaticCorrectionParams)params
{
  return self->_params;
}

- (float)nits
{
  return self->_nits;
}

- (void)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(void *)a3
{
  self->_currentTime = a3;
}

@end
