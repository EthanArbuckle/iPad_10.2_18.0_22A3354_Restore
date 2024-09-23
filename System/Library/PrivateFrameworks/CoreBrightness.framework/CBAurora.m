@implementation CBAurora

- (void)setPropertyForKey:(id)a3 withValue:(id)a4
{
  double v4;
  double v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t inited;
  NSObject *log;
  CFTypeID v30;
  CFTypeID v31;
  CFTypeID TypeID;
  uint8_t v33[7];
  char v34;
  NSObject *v35;
  os_log_type_t v36;
  os_log_t v37;
  os_log_type_t v38;
  os_log_t v39;
  os_log_type_t v40;
  os_log_t v41;
  os_log_type_t v42;
  os_log_t v43;
  const __CFNumber *v44;
  int v45;
  const __CFNumber *Value;
  int valuePtr;
  id v48;
  id v49;
  SEL v50;
  CBAurora *v51;
  uint8_t v52[16];
  uint8_t v53[16];
  uint8_t v54[16];
  uint8_t v55[16];
  uint8_t v56[24];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v51 = self;
  v50 = a2;
  v49 = a3;
  v48 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v49, "isEqualToString:", CFSTR("AuroraEnabled")) & 1) != 0)
      -[CBAurora setIsEnabled:](v51, "setIsEnabled:", objc_msgSend(v48, "BOOLValue") & 1);
    if ((objc_msgSend(v49, "isEqualToString:", CFSTR("AuroraFactor")) & 1) != 0)
    {
      objc_msgSend(v48, "floatValue");
      -[CBAurora setCurrentScaler:](v51, "setCurrentScaler:");
    }
    if ((objc_msgSend(v49, "isEqualToString:", CFSTR("AuroraRampInProgress")) & 1) != 0)
    {
      -[CBAurora setRampInProgress:](v51, "setRampInProgress:", objc_msgSend(v48, "BOOLValue") & 1);
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("EcoMode")) & 1) != 0)
    {
      -[CBAurora setLowPowerModeIsEnabled:](v51, "setLowPowerModeIsEnabled:", objc_msgSend(v48, "BOOLValue") & 1);
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("DominoStateUpdate")) & 1) != 0)
    {
      -[CBAurora setDominoModeIsEnabled:](v51, "setDominoModeIsEnabled:", objc_msgSend(v48, "BOOLValue") & 1);
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("AmbientAdaptiveDimming")) & 1) != 0)
    {
      if (v48)
      {
        TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v48))
        {
          valuePtr = 0;
          Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v48, CFSTR("AmbientAdaptiveDimmingEnable"));
          if (Value)
          {
            v31 = CFNumberGetTypeID();
            if (v31 == CFGetTypeID(Value))
              CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
          }
          v45 = 0;
          v44 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v48, CFSTR("AmbientAdaptiveDimmingPeriod"));
          if (v44)
          {
            v30 = CFNumberGetTypeID();
            if (v30 == CFGetTypeID(v44))
              CFNumberGetValue(v44, kCFNumberFloatType, &v45);
          }
          LODWORD(v4) = v45;
          -[CBAurora setAutoDimRampLength:](v51, "setAutoDimRampLength:", v4);
          -[CBAurora setAutoDimIsEnabled:](v51, "setAutoDimIsEnabled:", valuePtr != 0);
        }
      }
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("CBDisplayPresetDisableAutoBrightness")) & 1) != 0)
    {
      -[CBAurora setAutoBrightnessIsAvailable:](v51, "setAutoBrightnessIsAvailable:", (objc_msgSend(v48, "BOOLValue") ^ 1) & 1);
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("DisplayOn")) & 1) != 0)
    {
      -[CBAurora setDisplayIsOn:](v51, "setDisplayIsOn:", objc_msgSend(v48, "BOOLValue") & 1);
      if ((objc_msgSend(v48, "BOOLValue") & 1) == 0)
      {
        LODWORD(v5) = 0;
        -[CBAurora setAutoDimRampLength:](v51, "setAutoDimRampLength:", v5);
        -[CBAurora setAutoDimIsEnabled:](v51, "setAutoDimIsEnabled:", 0);
      }
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("DisplayBrightnessAuto")) & 1) != 0)
    {
      -[CBAurora setAutoBrightnessIsEnabled:](v51, "setAutoBrightnessIsEnabled:", objc_msgSend(v48, "BOOLValue") & 1);
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("TrustedLux")) & 1) != 0
           || (objc_msgSend(v49, "isEqualToString:", CFSTR("AggregatedLux")) & 1) != 0)
    {
      objc_msgSend(v48, "floatValue");
      -[CBAurora setLux:](v51, "setLux:");
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("CPMS.CLTM.Cap")) & 1) != 0)
    {
      objc_msgSend(v48, "floatValue");
      -[CBAurora setCLTMCap:](v51, "setCLTMCap:");
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("CPMS.UPO.Cap")) & 1) != 0)
    {
      objc_msgSend(v48, "floatValue");
      -[CBAurora setUPOCap:](v51, "setUPOCap:");
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("AuroraGracePeriodDuration")) & 1) != 0)
    {
      v43 = 0;
      if (v51->_log)
      {
        log = v51->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        log = inited;
      }
      v43 = log;
      v42 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v48, "floatValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v56, COERCE__INT64(v6));
        _os_log_impl(&dword_1B5291000, v43, v42, "Aurora Override | GracePeriod.Duration=%f", v56, 0xCu);
      }
      objc_msgSend(v48, "floatValue");
      v51->_gracePeriod.length = v7;
      -[CBAurora evaluateEntryConditions](v51, "evaluateEntryConditions");
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("AuroraEnergyBudget")) & 1) != 0)
    {
      v41 = 0;
      if (v51->_log)
      {
        v27 = v51->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v26 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v26 = init_default_corebrightness_log();
        v27 = v26;
      }
      v41 = v27;
      v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v48, "floatValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v55, COERCE__INT64(v8));
        _os_log_impl(&dword_1B5291000, v41, v40, "Aurora Override | EnergyBudget=%f", v55, 0xCu);
      }
      objc_msgSend(v48, "floatValue");
      v51->_maximumEnergyConsumption = v9;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("AuroraRampUpTimeSecondsPerStopOverride")) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = 0;
        if (v51->_log)
        {
          v25 = v51->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v24 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v24 = init_default_corebrightness_log();
          v25 = v24;
        }
        v39 = v25;
        v38 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v48, "floatValue");
          __os_log_helper_16_0_1_8_0((uint64_t)v54, COERCE__INT64(v10));
          _os_log_impl(&dword_1B5291000, v39, v38, "Aurora Override | RampUpTimeSecondsPerStop=%f", v54, 0xCu);
        }
        objc_msgSend(v48, "floatValue");
        if (v11 >= 0.0)
        {
          objc_msgSend(v48, "floatValue");
          -[CBAurora setRampUpTimeSecondsPerStop:](v51, "setRampUpTimeSecondsPerStop:");
        }
      }
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("AuroraRampDownTimeSecondsPerStopOverride")) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = 0;
        if (v51->_log)
        {
          v23 = v51->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v22 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v22 = init_default_corebrightness_log();
          v23 = v22;
        }
        v37 = v23;
        v36 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v48, "floatValue");
          __os_log_helper_16_0_1_8_0((uint64_t)v53, COERCE__INT64(v12));
          _os_log_impl(&dword_1B5291000, v37, v36, "Aurora Override | RampDownTimeSecondsPerStop=%f", v53, 0xCu);
        }
        objc_msgSend(v48, "floatValue");
        if (v13 >= 0.0)
        {
          objc_msgSend(v48, "floatValue");
          -[CBAurora setRampDownTimeSecondsPerStop:](v51, "setRampDownTimeSecondsPerStop:");
        }
      }
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("BrightnessCurveLevel")) & 1) != 0)
    {
      if (CBU_IsWatch())
      {
        -[CBAurora setCurveLevel:](v51, "setCurveLevel:", objc_msgSend(v48, "intValue"));
      }
      else
      {
        v35 = 0;
        if (v51->_log)
        {
          v21 = v51->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v20 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v20 = init_default_corebrightness_log();
          v21 = v20;
        }
        v35 = v21;
        v34 = 2;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v18 = v35;
          v19 = v34;
          __os_log_helper_16_0_0(v33);
          _os_log_debug_impl(&dword_1B5291000, v18, v19, "Aurora Curve Level | Ignoring curve level on iOS", v33, 2u);
        }
      }
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("FrameInfoLoggingEnabled")) & 1) != 0)
    {
      -[CBFrameStats enableFrameInfoLogging:](v51->_frameStats, "enableFrameInfoLogging:", objc_msgSend(v48, "BOOLValue") & 1);
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("AuroraEDRDurationPerStop")) & 1) != 0)
    {
      if (v51->_log)
      {
        v17 = v51->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v16 = init_default_corebrightness_log();
        v17 = v16;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v48, "floatValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v52, COERCE__INT64(v14));
        _os_log_impl(&dword_1B5291000, v17, OS_LOG_TYPE_DEFAULT, "Aurora Override | setting CBAuroraEDRDurationPerStop = %f", v52, 0xCu);
      }
      objc_msgSend(v48, "floatValue");
      v51->_edrDurationPerStop = v15;
    }
  }
}

- (BOOL)isBoostingBrightness
{
  return !float_equal(self->_currentScaler, 1.0);
}

- (float)currentScaler
{
  return self->_currentScaler;
}

- (void)setCurrentNits:(float)a3
{
  self->_currentNits = a3;
}

- (void)setCurrentEDRHeadroom:(float)a3
{
  self->_currentEDRHeadroom = a3;
}

- (BOOL)rampInProgress
{
  return self->_rampInProgress;
}

- (void)setLux:(float)a3
{
  self->_lux = a3;
  -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
}

- (void)evaluateEntryConditions
{
  if (-[CBAurora entryConditionsSatisfied](self, "entryConditionsSatisfied"))
    -[CBAurora enter](self, "enter");
  else
    -[CBAurora exit](self, "exit");
}

- (BOOL)entryConditionsSatisfied
{
  float v2;
  float v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  float v15;
  double v16;
  double v17;
  uint64_t v19;
  NSObject *log;
  BOOL v21;
  BOOL v22;
  float v23;
  BOOL v24;
  float lux;
  BOOL autoBrightnessIsEnabled;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  BOOL displayIsOn;
  BOOL isEnabled;
  uint8_t v37[120];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  isEnabled = self->_isEnabled;
  displayIsOn = self->_displayIsOn;
  lux = self->_lux;
  -[CBAurora luxActivationThreshold](self, "luxActivationThreshold");
  v33 = lux >= v2;
  autoBrightnessIsEnabled = 0;
  if (self->_autoBrightnessIsAvailable)
    autoBrightnessIsEnabled = self->_autoBrightnessIsEnabled;
  v32 = !self->_lowPowerModeIsEnabled;
  v31 = !self->_dominoModeIsEnabled;
  v30 = !self->_autoDimIsEnabled;
  v24 = 1;
  if (self->_gracePeriod.active)
    v24 = (float)(mach_time_now_in_seconds() - self->_gracePeriod.start) > self->_gracePeriod.length;
  v29 = !self->_aodIsOn;
  v28 = self->_cpms.cltmCap > (float)(self->_cpms.activationThreshold * self->_cpms.entryDelta);
  v27 = self->_cpms.upoCap > (float)(self->_cpms.activationThreshold * self->_cpms.entryDelta);
  if (-[CBAurora isActive](self, "isActive"))
  {
    v28 = self->_cpms.cltmCap > self->_cpms.activationThreshold;
    v27 = self->_cpms.upoCap > self->_cpms.activationThreshold;
    v23 = self->_lux;
    -[CBAurora luxExitThreshold](self, "luxExitThreshold");
    v33 = v23 >= v3;
  }
  v22 = 0;
  if (isEnabled)
  {
    v22 = 0;
    if (displayIsOn)
    {
      v22 = 0;
      if (v33)
      {
        v22 = 0;
        if (autoBrightnessIsEnabled)
        {
          v22 = 0;
          if (v32)
          {
            v22 = 0;
            if (v31)
            {
              v22 = 0;
              if (v30)
              {
                v22 = 0;
                if (v24)
                {
                  v22 = 0;
                  if (v29)
                  {
                    v22 = 0;
                    if (v28)
                      v22 = v27;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v21 = 1;
  if (isEnabled == self->_entryConditions.auroraStateSatisfied)
  {
    v21 = 1;
    if (displayIsOn == self->_entryConditions.displayStateSatisfied)
    {
      v21 = 1;
      if (v33 == self->_entryConditions.luxSatisfied)
      {
        v21 = 1;
        if (autoBrightnessIsEnabled == self->_entryConditions.autoBrightnessSatisfied)
        {
          v21 = 1;
          if (v32 == self->_entryConditions.lowPowerModeSatisfied)
          {
            v21 = 1;
            if (v31 == self->_entryConditions.dominoModeSatisfied)
            {
              v21 = 1;
              if (v30 == self->_entryConditions.autoDimSatisfied)
              {
                v21 = 1;
                if (v24 == self->_entryConditions.gracePeriodSatisfied)
                {
                  v21 = 1;
                  if (v29 == self->_entryConditions.aodStateSatisfied)
                  {
                    v21 = 1;
                    if (v28 == self->_entryConditions.cltmSatisfied)
                      v21 = v27 != self->_entryConditions.upoSatisfied;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (self->_entryConditions.firstEvaluation || v21)
  {
    if (self->_log)
    {
      log = self->_log;
    }
    else
    {
      v19 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      log = v19;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v4 = "YES";
      if (isEnabled)
        v5 = "YES";
      else
        v5 = "NO";
      if (displayIsOn)
        v6 = "YES";
      else
        v6 = "NO";
      if (v33)
        v7 = "YES";
      else
        v7 = "NO";
      if (autoBrightnessIsEnabled)
        v8 = "YES";
      else
        v8 = "NO";
      if (v32)
        v9 = "YES";
      else
        v9 = "NO";
      if (v31)
        v10 = "YES";
      else
        v10 = "NO";
      if (v30)
        v11 = "YES";
      else
        v11 = "NO";
      if (v24)
        v12 = "YES";
      else
        v12 = "NO";
      if (v29)
        v13 = "YES";
      else
        v13 = "NO";
      if (v28)
        v14 = "YES";
      else
        v14 = "NO";
      if (!v27)
        v4 = "NO";
      __os_log_helper_16_2_11_8_32_8_32_8_32_8_32_8_32_8_32_8_32_8_32_8_32_8_32_8_32((uint64_t)v37, (uint64_t)v5, (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v4);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora Conditions\n{\n\tAuroraEnabled=%s\n\tDisplayOn=%s\n\tLuxOverThreshold=%s\n\tAutoBrightnessOn=%s\n\tLowPowerModeOff=%s\n\tDominoModeOff=%s\n\tAutoDimOff=%s\n\tGracePeriodInactive=%s\n\tAODOff=%s\n\tCLTMCapOverThreshold=%s\n\tUPOCapOverThreshold=%s\n}", v37, 0x70u);
    }
  }
  if (self->_entryConditions.cltmSatisfied && !v28 && -[CBAurora isBoostingBrightness](self, "isBoostingBrightness"))
  {
    -[CBAurora currentPreAuroraNits](self, "currentPreAuroraNits");
    *(float *)&v16 = fminf(v15, self->_cpms.cltmCap);
    *(float *)&v17 = self->_currentNits;
    +[CBAnalytics cltmBudgetUpdated:currentSDRBrightness:](CBAnalytics, "cltmBudgetUpdated:currentSDRBrightness:", v16, v17);
  }
  self->_entryConditions.auroraStateSatisfied = isEnabled;
  self->_entryConditions.displayStateSatisfied = displayIsOn;
  self->_entryConditions.luxSatisfied = v33;
  self->_entryConditions.autoBrightnessSatisfied = autoBrightnessIsEnabled;
  self->_entryConditions.lowPowerModeSatisfied = v32;
  self->_entryConditions.dominoModeSatisfied = v31;
  self->_entryConditions.autoDimSatisfied = v30;
  self->_entryConditions.gracePeriodSatisfied = v24;
  self->_entryConditions.aodStateSatisfied = v29;
  self->_entryConditions.cltmSatisfied = v28;
  self->_entryConditions.upoSatisfied = v27;
  self->_entryConditions.firstEvaluation = 0;
  return v22;
}

- (float)luxActivationThreshold
{
  return *(float *)std::array<float,3ul>::operator[][abi:ne180100]((uint64_t)&self->_luxActivationThreshold, self->_curveLevel);
}

- (BOOL)isActive
{
  return self->_isMonitoring;
}

- (void)exit
{
  double v2;
  double v3;
  float v4;
  dispatch_time_t v5;
  NSObject *queue;
  uint64_t v7;
  NSObject *v8;
  float v9;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v13;
  uint64_t block;
  int v15;
  int v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CBAurora *v19;
  os_log_type_t v20;
  os_log_t v21;
  float autoDimRampLength;
  uint8_t v23[7];
  os_log_type_t v24;
  NSObject *v25;
  SEL v26;
  CBAurora *v27;
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = self;
  v26 = a2;
  if (self->_isMonitoring)
  {
    v25 = 0;
    if (v27->_log)
    {
      v13 = v27->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v13 = inited;
    }
    v25 = v13;
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      log = v25;
      type = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_impl(&dword_1B5291000, log, type, "Aurora Exit | Start", v23, 2u);
    }
    -[CBAurora stopMonitoring](v27, "stopMonitoring");
    autoDimRampLength = 0.0;
    if (v27->_autoBrightnessIsAvailable)
    {
      *(float *)&v2 = v27->_currentScaler;
      LODWORD(v3) = 1.0;
      -[CBAurora calculateRampTimeForCurrentScaler:andRequestedScaler:](v27, "calculateRampTimeForCurrentScaler:andRequestedScaler:", v2, v3);
      v9 = v4;
    }
    else
    {
      v9 = 0.0;
    }
    autoDimRampLength = v9;
    if (v27->_autoDimIsEnabled)
      autoDimRampLength = v27->_autoDimRampLength;
    if (!v27->_displayIsOn)
    {
      autoDimRampLength = 0.0;
      v27->_edrHeadroomRestorePending = 0;
    }
    if (v27->_aodIsOn)
      autoDimRampLength = 0.0;
    if (!v27->_autoBrightnessIsEnabled && CBU_IsWatch())
      autoDimRampLength = 0.0;
    -[CBAurora setAuroraFactor:withFadePeriod:](v27, "setAuroraFactor:withFadePeriod:");
    if (float_equal(v27->_currentScaler, 1.0) && v27->_edrHeadroomRestorePending)
      -[CBAurora restoreEDRHeadroom](v27, "restoreEDRHeadroom");
    if (!v27->_ignoreSessionLimit && -[CBAurora energyConsumptionExceeded](v27, "energyConsumptionExceeded"))
    {
      v21 = 0;
      if (v27->_log)
      {
        v8 = v27->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v7 = init_default_corebrightness_log();
        v8 = v7;
      }
      v21 = v8;
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v28, COERCE__INT64(v27->_currentEnergyConsumption), COERCE__INT64(v27->_maximumEnergyConsumption));
        _os_log_impl(&dword_1B5291000, v21, v20, "Aurora GracePeriod | Start=YES EnergyConsumption=%.0f EnergyBudget=%.0f", v28, 0x16u);
      }
      v27->_gracePeriod.active = 1;
      v27->_gracePeriod.start = mach_time_now_in_seconds();
      v5 = dispatch_time(0, (uint64_t)(float)(v27->_gracePeriod.length * 1000000000.0));
      queue = v27->_queue;
      block = MEMORY[0x1E0C809B0];
      v15 = -1073741824;
      v16 = 0;
      v17 = __16__CBAurora_exit__block_invoke;
      v18 = &unk_1E68E9E60;
      v19 = v27;
      dispatch_after(v5, queue, &block);
    }
    v27->_rtplc.rampInProgress = 0;
    v27->_currentEnergyConsumption = 0.0;
  }
}

- (void)setCLTMCap:(float)a3
{
  uint64_t inited;
  NSObject *log;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!float_equal(self->_cpms.cltmCap, a3))
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v7, COERCE__INT64(a3));
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora CPMS | CLTM.Cap=%f", v7, 0xCu);
    }
    self->_cpms.cltmCap = a3;
    self->_cltmCap = a3;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)initializeMembers:(id)a3
{
  CBAurora *v3;
  CBAurora *v4;
  CBAurora *v5;
  char v6[8];
  uint64_t v7;
  float v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  char v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  char v27;
  char v28;
  char v29;
  NSDictionary *v30;
  SEL v31;
  CBAurora *v32;

  v32 = self;
  v31 = a2;
  v30 = (NSDictionary *)a3;
  self->_frameStats = 0;
  v32->_apceTimer = 0;
  v32->_lux = 0.0;
  v32->_isEnabled = 1;
  v32->_displayIsOn = 1;
  v32->_autoBrightnessIsEnabled = 1;
  v32->_lowPowerModeIsEnabled = 0;
  v32->_dominoModeIsEnabled = 0;
  v32->_autoDimIsEnabled = 0;
  v32->_autoBrightnessIsAvailable = 1;
  v32->_aodIsOn = 0;
  v32->_currentNits = 0.0;
  v32->_currentScaler = 1.0;
  v32->_autoDimRampLength = 0.0;
  v32->_isMonitoring = 0;
  v32->_lastFrameInfoReceivedTimestamp = 0.0;
  v32->_currentEDRHeadroom = 1.0;
  v32->_currentEDRHeadroomRequest = 1.0;
  v32->_edrHeadroomRestorePending = 0;
  v32->_rampInProgress = 0;
  v32->_lastRampTargetScaler = 1.0;
  v32->_minimumReactionNitsDelta = 65.0;
  v32->_curveLevel = 1;
  CBAuroraParams::CBAuroraParams((CBAuroraParams *)v6);
  CBAuroraParams::loadFromCapabilities((CBAuroraParams *)v6, v30);
  v3 = v32;
  *(_QWORD *)v32->_luxActivationThreshold.__elems_ = v7;
  v3->_luxActivationThreshold.__elems_[2] = v8;
  v4 = v32;
  *(_QWORD *)v32->_luxExitThreshold.__elems_ = v9;
  v4->_luxExitThreshold.__elems_[2] = v10;
  v5 = v32;
  *(_QWORD *)v32->_luxSaturationThreshold.__elems_ = v11;
  v5->_luxSaturationThreshold.__elems_[2] = v12;
  v32->_nitsMinimum = v14;
  v32->_nitsMaximum = v13;
  v32->_minimumScaler = 1.0;
  v32->_maximumScaler = v32->_nitsMaximum / v32->_nitsMinimum;
  v32->_apceSamplingRate = 1.0;
  v32->_averageAPCESamplingRate = v15;
  v32->_ignorePeakAPCE = v16 & 1;
  v32->_rampUpTimeSecondsPerStop = v17;
  v32->_rampDownTimeSecondsPerStop = v18;
  v32->_rampUpTapPointAPCEMinimum = v20;
  v32->_rampUpTapPointAPCEMaximum = v21;
  v32->_rampDownTapPointAPCEMinimum = v22;
  v32->_rampDownTapPointAPCEMaximum = v23;
  v32->_maximumEnergyConsumption = v26 * v32->_nitsMaximum;
  v32->_currentEnergyConsumption = 0.0;
  v32->_ignoreSessionLimit = v27 & 1;
  v32->_ignoreAPCE = v28 & 1;
  v32->_allowEDR = v29 & 1;
  v32->_edrDurationPerStop = v19;
  v32->_gracePeriod.active = 0;
  v32->_gracePeriod.start = 0.0;
  v32->_gracePeriod.length = 0.0;
  v32->_rtplc.targetMargin = 1.0;
  v32->_rtplc.rampInProgress = 0;
  v32->_rtplc.targetScaler = 1.0;
  v32->_rtplc.tripMaxBrightness = 0.0;
  *(_WORD *)&v32->_entryConditions.firstEvaluation = 1;
  v32->_entryConditions.displayStateSatisfied = 0;
  v32->_entryConditions.luxSatisfied = 0;
  v32->_entryConditions.autoBrightnessSatisfied = 0;
  v32->_entryConditions.lowPowerModeSatisfied = 0;
  v32->_entryConditions.dominoModeSatisfied = 0;
  v32->_entryConditions.autoDimSatisfied = 0;
  v32->_entryConditions.gracePeriodSatisfied = 0;
  v32->_entryConditions.aodStateSatisfied = 0;
  v32->_entryConditions.cltmSatisfied = 0;
  v32->_entryConditions.upoSatisfied = 0;
  v32->_cpms.cltmCap = v32->_nitsMaximum;
  v32->_cltmCap = v32->_nitsMaximum;
  v32->_cpms.upoCap = v32->_nitsMaximum;
  v32->_upoCap = v32->_nitsMaximum;
  v32->_cpms.activationThreshold = v24;
  v32->_cpms.entryDelta = v25;
}

- (CBAurora)initWithQueue:(id)a3 andDisplayModule:(id)a4 andBrtCapabilities:(id)a5
{
  CBFrameStats *v6;
  CBAurora *v11;

  v6 = -[CBFrameStats initWithQueue:]([CBFrameStats alloc], "initWithQueue:", a3);
  v11 = -[CBAurora initWithQueue:andDisplayModule:andBrtCapabilities:andFrameStats:](self, "initWithQueue:andDisplayModule:andBrtCapabilities:andFrameStats:", a3, a4, a5, v6);

  return v11;
}

- (CBAurora)initWithQueue:(id)a3 andDisplayModule:(id)a4 andBrtCapabilities:(id)a5 andFrameStats:(id)a6
{
  os_log_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  NSObject *log;
  os_log_type_t v13;
  uint64_t inited;
  NSObject *v15;
  uint8_t v16[7];
  os_log_type_t type;
  os_log_t oslog;
  objc_super v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;
  id v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CBAurora;
  v25 = -[CBAurora init](&v19, sel_init);
  if (v25)
  {
    v6 = os_log_create("com.apple.CoreBrightness.Aurora", "default");
    *((_QWORD *)v25 + 1) = v6;
    oslog = 0;
    if (*((_QWORD *)v25 + 1))
    {
      v15 = *((_QWORD *)v25 + 1);
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
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      v13 = type;
      __os_log_helper_16_0_0(v16);
      _os_log_impl(&dword_1B5291000, log, v13, "Aurora Initialization | Start", v16, 2u);
    }
    *((_QWORD *)v25 + 2) = v22;
    *((_QWORD *)v25 + 3) = v23;
    dispatch_retain(*((dispatch_object_t *)v25 + 3));
    objc_msgSend(v25, "initializeMembers:", v21);
    v7 = v20;
    *((_QWORD *)v25 + 4) = v7;
    objc_msgSend(*((id *)v25 + 4), "setMovingAverageDuration:", (float)(1.0 / *((float *)v25 + 30)));
    LODWORD(v8) = *((_DWORD *)v25 + 55);
    objc_msgSend(v25, "setCPMSActivationThreshold:", v8);
    LODWORD(v9) = *((_DWORD *)v25 + 33);
    objc_msgSend(v25, "setRampUpTimeSecondsPerStop:", v9);
    LODWORD(v10) = *((_DWORD *)v25 + 34);
    objc_msgSend(v25, "setRampDownTimeSecondsPerStop:", v10);
  }
  return (CBAurora *)v25;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAurora *v4;

  v4 = self;
  v3 = a2;
  if (self->_isMonitoring)
    -[CBAurora stopMonitoring](v4, "stopMonitoring");

  if (v4->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAurora;
  -[CBAurora dealloc](&v2, sel_dealloc);
}

- (void)enter
{
  double v2;
  BOOL v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v11;
  uint8_t v12[7];
  os_log_type_t v13;
  NSObject *v14;
  uint8_t v15[7];
  os_log_type_t v16;
  NSObject *v17;
  SEL v18;
  CBAurora *v19;

  v19 = self;
  v18 = a2;
  if (!self->_isMonitoring)
  {
    v17 = 0;
    if (v19->_log)
    {
      v11 = v19->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v11 = inited;
    }
    v17 = v11;
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      log = v17;
      type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1B5291000, log, type, "Aurora Entry | Start", v15, 2u);
    }
    if (!float_equal(v19->_currentEDRHeadroomRequest, 1.0))
    {
      v14 = 0;
      if (v19->_log)
      {
        v7 = v19->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v6 = init_default_corebrightness_log();
        v7 = v6;
      }
      v14 = v7;
      v13 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v14;
        v5 = v13;
        __os_log_helper_16_0_0(v12);
        _os_log_impl(&dword_1B5291000, v4, v5, "Aurora Entry | Ramping the EDR headroom to 1.0 before entering Aurora", v12, 2u);
      }
      LODWORD(v2) = 1.0;
      -[CBAurora sendEDRHeadroomRequest:](v19, "sendEDRHeadroomRequest:", v2);
    }
    v3 = float_equal(v19->_currentEDRHeadroomRequest, 1.0);
    v19->_edrHeadroomRestorePending = !v3;
    -[CBAurora startMonitoring](v19, "startMonitoring");
  }
}

uint64_t __16__CBAurora_exit__block_invoke(uint64_t a1)
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
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
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
    _os_log_impl(&dword_1B5291000, log, type, "Aurora GracePeriod | End", v7, 2u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 172) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "evaluateEntryConditions");
}

- (void)startMonitoring
{
  CBFrameStats *frameStats;
  dispatch_source_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v9;
  uint64_t handler;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  OS_dispatch_source *v15;
  uint64_t block;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  CBAurora *v21;
  dispatch_block_t v22;
  OS_dispatch_source *apceTimer;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(uint64_t, const void *);
  void *v28;
  CBAurora *v29;
  uint8_t v30[7];
  os_log_type_t v31;
  NSObject *v32;
  SEL v33;
  CBAurora *v34;

  v34 = self;
  v33 = a2;
  v32 = 0;
  if (self->_log)
  {
    v9 = v34->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v9 = inited;
  }
  v32 = v9;
  v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    log = v32;
    type = v31;
    __os_log_helper_16_0_0(v30);
    _os_log_impl(&dword_1B5291000, log, type, "Aurora Sampling | Start", v30, 2u);
  }
  if (!v34->_isMonitoring)
  {
    frameStats = v34->_frameStats;
    v24 = MEMORY[0x1E0C809B0];
    v25 = -1073741824;
    v26 = 0;
    v27 = __27__CBAurora_startMonitoring__block_invoke;
    v28 = &unk_1E68EBCF0;
    v29 = v34;
    -[CBFrameStats startMonitoring:](frameStats, "startMonitoring:", &v24);
    v34->_isMonitoring = 1;
  }
  if (!v34->_apceTimer)
  {
    v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v34->_queue);
    v34->_apceTimer = (OS_dispatch_source *)v3;
    if (v34->_apceTimer)
    {
      apceTimer = 0;
      apceTimer = v34->_apceTimer;
      dispatch_source_set_timer((dispatch_source_t)v34->_apceTimer, 0, (unint64_t)(float)((float)(1.0 / v34->_averageAPCESamplingRate) * 1000000000.0), 0);
      v22 = 0;
      v5 = MEMORY[0x1E0C809B0];
      block = MEMORY[0x1E0C809B0];
      v17 = -1073741824;
      v18 = 0;
      v19 = __27__CBAurora_startMonitoring__block_invoke_9;
      v20 = &unk_1E68E9E60;
      v21 = v34;
      v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
      v4 = v34->_apceTimer;
      handler = v5;
      v11 = -1073741824;
      v12 = 0;
      v13 = __27__CBAurora_startMonitoring__block_invoke_2_10;
      v14 = &unk_1E68E9E60;
      v15 = apceTimer;
      dispatch_source_set_cancel_handler(v4, &handler);
      if (v22)
      {
        dispatch_source_set_event_handler((dispatch_source_t)v34->_apceTimer, v22);
        _Block_release(v22);
      }
      dispatch_resume((dispatch_object_t)v34->_apceTimer);
    }
  }
}

void __27__CBAurora_startMonitoring__block_invoke(uint64_t a1, const void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  _BYTE v10[80];
  _BYTE __dst[80];
  uint64_t v12;
  const void *v13;
  uint64_t v14;

  v14 = a1;
  v13 = a2;
  v12 = a1;
  *(float *)(*(_QWORD *)(a1 + 32) + 52) = mach_time_now_in_milliseconds();
  memcpy(__dst, v13, sizeof(__dst));
  queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __27__CBAurora_startMonitoring__block_invoke_2;
  v8 = &unk_1E68EBCC8;
  memcpy(v10, __dst, sizeof(v10));
  v9 = *(_QWORD *)(a1 + 32);
  dispatch_async(queue, &v4);
}

uint64_t __27__CBAurora_startMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  float v2;
  double v3;
  const char *v4;
  const char *v5;
  double v6;
  double v7;
  _DWORD *v8;
  float v9;
  double v10;
  double v11;
  float v12;
  void *v14;
  float v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t inited;
  NSObject *v24;
  _BYTE __dst[80];
  float v27;
  char v28;
  os_log_type_t v29;
  os_log_t v30;
  float v31;
  os_log_type_t v32;
  os_log_t v33;
  os_log_type_t v34;
  os_log_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t v38[32];
  uint8_t v39[64];
  uint8_t v40[40];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v37 = a1;
  v36 = a1;
  if ((*(_BYTE *)(a1 + 86) & 1) == 0 && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 188) & 1) != 0)
  {
    v35 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v24 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v24 = inited;
    }
    v35 = v24;
    v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&v1 = *(float *)(*(_QWORD *)(a1 + 32) + 240);
      v22 = v1;
      LODWORD(v1) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 192);
      objc_msgSend(*(id *)(a1 + 32), "convertScalerToNits:", *(double *)&v1);
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v40, v22, COERCE__INT64(v2), COERCE__INT64(*(float *)(a1 + 92)));
      _os_log_impl(&dword_1B5291000, v35, v34, "Aurora RTPLC | CapReleased=YES CurrentNits=%f TargetNits=%f ScaleFactor=%f", v40, 0x20u);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 188) = 0;
  }
  if ((*(_BYTE *)(a1 + 86) & 1) != 0)
  {
    v33 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v21 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v20 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v20 = init_default_corebrightness_log();
      v21 = v20;
    }
    v33 = v21;
    v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if ((*(_BYTE *)(a1 + 85) & 1) != 0)
        v4 = "YES";
      else
        v4 = "NO";
      if ((*(_BYTE *)(a1 + 86) & 1) != 0)
        v5 = "YES";
      else
        v5 = "NO";
      __os_log_helper_16_2_5_8_32_8_32_8_0_8_0_8_0((uint64_t)v39, (uint64_t)v4, (uint64_t)v5, COERCE__INT64(*(float *)(a1 + 88)), COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 240)), COERCE__INT64(*(float *)(a1 + 92)));
      _os_log_impl(&dword_1B5291000, v33, v32, "Aurora RTPLC | Triggered=%s CapApplied=%s ReducedNits=%f CurrentNits=%f ScaleFactor=%f", v39, 0x34u);
    }
    *(float *)&v3 = *(float *)(a1 + 88) - *(float *)(*(_QWORD *)(a1 + 32) + 184);
    objc_msgSend(*(id *)(a1 + 32), "calculateRampTargetScalerForNits:", v3);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 192) = LODWORD(v6);
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 188) & 1) == 0
      || !float_equal(*(float *)(*(_QWORD *)(a1 + 32) + 56), *(float *)(*(_QWORD *)(a1 + 32) + 192)))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 188) = 1;
      v31 = 0.0;
      v8 = *(_DWORD **)(a1 + 32);
      LODWORD(v6) = v8[61];
      LODWORD(v7) = v8[48];
      objc_msgSend(v8, "calculateRampTimeForCurrentScaler:andRequestedScaler:", v6, v7);
      v31 = v9;
      LODWORD(v10) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 192);
      *(float *)&v11 = v31;
      objc_msgSend(*(id *)(a1 + 32), "setAuroraFactor:withFadePeriod:", v10, v11);
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 192);
      v30 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
      {
        v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      }
      else
      {
        v18 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v19 = v18;
      }
      v30 = v19;
      v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v38, COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 244)), COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 192)), COERCE__INT64(v31));
        _os_log_impl(&dword_1B5291000, v30, v29, "Aurora RTPLC | CatchUpRamp=YES CurrentScaler=%f TargetScaler=%f RampTime=%f", v38, 0x20u);
      }
    }
  }
  v28 = 0;
  v17 = 1;
  if ((*(_BYTE *)(a1 + 85) & 1) == 0)
    v17 = *(_BYTE *)(a1 + 86);
  v28 = v17 & 1;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "tripLength") && (v28 & 1) == 0)
  {
    v27 = 0.0;
    v15 = mach_time_now_in_seconds();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "currentTripStartTime");
    v27 = v15 - v12;
    v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "tripLength");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "tripMaxAPCE");
    +[CBAnalytics rtplcTriggeredWithLength:maxAPCE:durationInSeconds:sdrBrightness:referenceModeEnabled:](CBAnalytics, "rtplcTriggeredWithLength:maxAPCE:durationInSeconds:sdrBrightness:referenceModeEnabled:", v16, 0);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 196) = 0;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "tripLength") && (v28 & 1) != 0)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 196) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 240);
  if ((v28 & 1) != 0)
    *(float *)(*(_QWORD *)(a1 + 32) + 196) = fmaxf(*(float *)(*(_QWORD *)(a1 + 32) + 240), *(float *)(*(_QWORD *)(a1 + 32) + 196));
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  memcpy(__dst, (const void *)(a1 + 40), sizeof(__dst));
  return objc_msgSend(v14, "processFrameInfo:", __dst);
}

uint64_t __27__CBAurora_startMonitoring__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processAPCESample", a1, a1);
}

void __27__CBAurora_startMonitoring__block_invoke_2_10(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (void)stopMonitoring
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  SEL v9;
  CBAurora *v10;

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
    _os_log_impl(&dword_1B5291000, log, type, "Aurora Sampling | Stop", v6, 2u);
  }
  if (v10->_apceTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v10->_apceTimer);
    v10->_apceTimer = 0;
  }
  -[CBFrameStats stopMonitoring](v10->_frameStats, "stopMonitoring");
  v10->_isMonitoring = 0;
  v10->_lastFrameInfoReceivedTimestamp = 0.0;
}

- (void)rampTo:(float)a3
{
  double v3;
  double v4;
  float v5;
  double v6;
  double v7;
  uint64_t inited;
  NSObject *log;
  float v10;
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(float *)&v4 = self->_currentScaler;
  *(float *)&v3 = a3;
  -[CBAurora calculateRampTimeForCurrentScaler:andRequestedScaler:](self, "calculateRampTimeForCurrentScaler:andRequestedScaler:", v4, v3);
  v10 = v5;
  if (!float_equal(self->_currentScaler, a3)
    && (!self->_rampInProgress || !float_equal(self->_lastRampTargetScaler, a3)))
  {
    *(float *)&v6 = a3;
    *(float *)&v7 = v10;
    -[CBAurora setAuroraFactor:withFadePeriod:](self, "setAuroraFactor:withFadePeriod:", v6, v7);
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
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v13, COERCE__INT64(self->_currentScaler), COERCE__INT64(a3), COERCE__INT64(v10));
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora Ramp | CurrentScaler=%f TargetScaler=%f RampTime=%f", v13, 0x20u);
    }
  }
  self->_lastRampTargetScaler = a3;
}

- (float)luxExitThreshold
{
  return *(float *)std::array<float,3ul>::operator[][abi:ne180100]((uint64_t)&self->_luxExitThreshold, self->_curveLevel);
}

- (float)luxSaturationThreshold
{
  return *(float *)std::array<float,3ul>::operator[][abi:ne180100]((uint64_t)&self->_luxSaturationThreshold, self->_curveLevel);
}

- (void)setAuroraFactor:(float)a3 withFadePeriod:(float)a4
{
  double v4;
  double v5;
  void *context;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v10[0] = CFSTR("AuroraFactor");
  *(float *)&v4 = a3;
  v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v10[1] = CFSTR("AuroraFadePeriod");
  *(float *)&v5 = a4;
  v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  -[CBDisplayModule setProperty:forKey:](self->_displayModule, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2), CFSTR("AuroraFactorWithFade"));
  objc_autoreleasePoolPop(context);
}

- (BOOL)energyConsumptionExceeded
{
  return self->_currentEnergyConsumption >= self->_maximumEnergyConsumption;
}

- (float)calculateEnergyConsumptionCap
{
  if (-[CBAurora energyConsumptionExceeded](self, "energyConsumptionExceeded"))
    return self->_nitsMinimum;
  else
    return self->_nitsMaximum;
}

- (void)processAPCESample
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  double v6;
  float v7;
  double v8;
  double v9;
  float v10;
  BOOL v11;
  float v12;
  double v13;
  float v14;
  float v15;
  float v16;
  const char *v17;
  const char *v18;
  float v19;
  float v20;
  float v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  CBAurora *v26;
  float v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  os_log_t v47;
  os_log_type_t v48[4];
  uint8_t *v49;
  NSObject *v50;
  os_log_t v51;
  int v52;
  CBAurora *v53;
  _BOOL4 v54;
  float v55;
  _BOOL4 v56;
  int v57;
  _BOOL4 v58;
  int v59;
  float v60;
  os_log_t v61;
  os_log_type_t v62[4];
  uint8_t *v63;
  NSObject *inited;
  os_log_t v65;
  os_log_t log;
  os_log_type_t v67[4];
  uint8_t *buf;
  NSObject *v69;
  os_log_t v70;
  float v71;
  float nitsMaximum;
  os_log_type_t v73;
  os_log_t v74;
  float v75;
  float v76;
  float v77;
  BOOL v78;
  BOOL v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  os_log_type_t v86;
  os_log_t v87;
  uint8_t v88[7];
  os_log_type_t type;
  os_log_t oslog;
  SEL v91;
  CBAurora *v92;
  _BYTE v93[208];
  uint8_t v94[24];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v92 = self;
  v91 = a2;
  if (!self->_ignoreSessionLimit && v92->_currentNits > v92->_nitsMinimum)
    v92->_currentEnergyConsumption = v92->_currentEnergyConsumption
                                   + (float)(v92->_currentNits / v92->_averageAPCESamplingRate);
  if (v92->_allowEDR || float_equal(v92->_currentEDRHeadroom, 1.0))
  {
    if (v92->_rtplc.rampInProgress)
    {
      v87 = 0;
      if (v92->_log)
      {
        v65 = (os_log_t)v92->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v65 = inited;
      }
      v87 = v65;
      v86 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v61 = v87;
        *(_DWORD *)v62 = v86;
        *(double *)&v3 = v92->_currentScaler;
        *(double *)&v4 = v92->_rtplc.targetScaler;
        v63 = v94;
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v94, v3, v4);
        _os_log_impl(&dword_1B5291000, v87, v86, "Aurora Sampling | RTPLC catch-up in progress, not processing the APCE sample | CurrentScaler=%f TargetScaler=%f", v94, 0x16u);
      }
    }
    else
    {
      v85 = 0.0;
      if (v92->_ignoreAPCE)
      {
        v60 = 0.0;
      }
      else
      {
        -[CBFrameStats getMovingAverage](v92->_frameStats, "getMovingAverage");
        v59 = 1120403456;
        v60 = std::__math::round[abi:ne180100](v5 * 100.0) / 100.0;
      }
      v85 = v60;
      v57 = 0;
      v84 = 0.0;
      v84 = v92->_nitsMinimum * v92->_currentScaler;
      *(float *)&v2 = v60;
      -[CBAurora calculateCurrentRampUpTargetForAPCE:](v92, "calculateCurrentRampUpTargetForAPCE:", v2);
      v83 = *(float *)&v6;
      -[CBAurora calculateRampTargetScalerForNits:](v92, "calculateRampTargetScalerForNits:", v6);
      v82 = v7;
      *(float *)&v8 = v60;
      -[CBAurora calculateCurrentRampDownTargetForAPCE:](v92, "calculateCurrentRampDownTargetForAPCE:", v8);
      v81 = *(float *)&v9;
      -[CBAurora calculateRampTargetScalerForNits:](v92, "calculateRampTargetScalerForNits:", v9);
      v80 = v10;
      v79 = 0;
      v58 = 0;
      if (v83 > v84)
      {
        v58 = 0;
        if (v81 > v84)
        {
          v11 = abs[abi:ne180100](v83 - v84) > v92->_minimumReactionNitsDelta;
          v56 = 1;
          if (!v11)
          {
            v55 = v82;
            -[CBAurora calculateCurrentLuxTargetScaler](v92, "calculateCurrentLuxTargetScaler");
            v56 = float_equal(v82, v12);
          }
          v58 = v56;
        }
      }
      v79 = v58;
      v78 = 0;
      v54 = 0;
      if (v83 < v84)
      {
        v54 = 0;
        if (v81 < v84)
          v54 = abs[abi:ne180100](v81 - v84) > v92->_minimumReactionNitsDelta;
      }
      v78 = v54;
      v52 = 0;
      v77 = 0.0;
      -[CBFrameStats getPeakAPCECap](v92->_frameStats, "getPeakAPCECap");
      v77 = *(float *)&v13;
      -[CBAurora calculateRampTargetScalerForNits:](v92, "calculateRampTargetScalerForNits:", v13);
      v76 = v14;
      v53 = v92;
      -[CBAurora calculateEnergyConsumptionCap](v92, "calculateEnergyConsumptionCap");
      -[CBAurora calculateRampTargetScalerForNits:](v92, "calculateRampTargetScalerForNits:");
      v75 = v15;
      v74 = 0;
      if (v92->_log)
      {
        v51 = (os_log_t)v92->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v50 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v50 = init_default_corebrightness_log();
        v51 = v50;
      }
      v74 = v51;
      v73 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v47 = v74;
        *(_DWORD *)v48 = v73;
        *(double *)&v39 = v92->_currentNits;
        -[CBAurora currentPreAuroraNits](v92, "currentPreAuroraNits");
        *(double *)&v40 = v16;
        *(double *)&v41 = v92->_currentScaler;
        *(double *)&v42 = v92->_lux;
        *(double *)&v43 = v85;
        *(double *)&v44 = v83;
        *(double *)&v45 = v81;
        v17 = "YES";
        if (v79)
          v18 = "YES";
        else
          v18 = "NO";
        v28 = v18;
        if (!v78)
          v17 = "NO";
        v29 = v17;
        -[CBFrameStats getPeakAPCE](v92->_frameStats, "getPeakAPCE");
        *(double *)&v30 = v19;
        v31 = v77;
        *(double *)&v32 = v92->_currentEnergyConsumption;
        *(double *)&v33 = v92->_maximumEnergyConsumption;
        -[CBAurora calculateEnergyConsumptionCap](v92, "calculateEnergyConsumptionCap");
        *(double *)&v34 = v20;
        v35 = v82;
        v36 = v80;
        v37 = v76;
        v38 = v75;
        v21 = mach_time_now_in_milliseconds();
        *(double *)&v22 = v92->_lastFrameInfoReceivedTimestamp;
        v46 = &v25;
        v49 = v93;
        __os_log_helper_16_2_20_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_32_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v93, v39, v40, v41, v42, v43, v44, v45, (uint64_t)v28, (uint64_t)v29, v30, COERCE__INT64(v77), v32, v33, v34, COERCE__INT64(v82), COERCE__INT64(v80), COERCE__INT64(v76), COERCE__INT64(v75),
          COERCE__INT64(v21),
          v22);
        _os_log_impl(&dword_1B5291000, v47, v48[0], "Aurora Sampling\n{\n\tNits=%.0f\n\tPre=%.0f\n\tCurrentScaler=%f\n\tLux=%.0f\n\tAPCE=%.2f\n\tRampUp.Target=%.0f\n\tRampDown.Target=%.0f\n\tRampUp=%s\n\tRampDown=%s\n\tPeakAPCE=%.2f\n\tPeakAPCE.Cap=%.0f\n\tEnergyConsumption=%.0f\n\tEnergyConsumptionBudget=%.0f\n\tEnergyConsumption.Cap=%.0f\n"
          "\tRampUp.TargetScaler=%f\n"
          "\tRampDown.TargetScaler=%f\n"
          "\tPeakAPCE.TargetScaler=%f\n"
          "\tEnergyConsumption.TargetScaler=%f\n"
          "\tNow=%.0f\n"
          "\tLastFrameInfoReceivedTimestamp=%.0f\n"
          "}",
          v49,
          0xCAu);
      }
      nitsMaximum = 0.0;
      nitsMaximum = v92->_nitsMaximum;
      if (!v92->_ignorePeakAPCE)
        nitsMaximum = *std::min[abi:ne180100]<float>(&nitsMaximum, &v76);
      nitsMaximum = *std::min[abi:ne180100]<float>(&nitsMaximum, &v75);
      if (v79 || v78)
      {
        v71 = 0.0;
        if (v79)
          v27 = v82;
        else
          v27 = v80;
        v71 = v27;
        v26 = v92;
        *(float *)&v24 = *std::min[abi:ne180100]<float>(&nitsMaximum, &v71);
        -[CBAurora rampTo:](v26, "rampTo:", v24);
      }
      else if (v92->_currentScaler > nitsMaximum)
      {
        *(float *)&v23 = nitsMaximum;
        -[CBAurora rampTo:](v92, "rampTo:", v23);
      }
    }
  }
  else
  {
    oslog = 0;
    if (v92->_log)
    {
      v70 = (os_log_t)v92->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v69 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v69 = init_default_corebrightness_log();
      v70 = v69;
    }
    oslog = v70;
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      *(_DWORD *)v67 = type;
      buf = v88;
      __os_log_helper_16_0_0(v88);
      _os_log_impl(&dword_1B5291000, log, v67[0], "Aurora Sampling | We're still in EDR, not processing the APCE sample", v88, 2u);
    }
  }
}

- (void)restoreEDRHeadroom
{
  double v2;
  uint64_t inited;
  NSObject *log;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_edrHeadroomRestorePending)
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v6, COERCE__INT64(self->_currentEDRHeadroomRequest));
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora Exit | Restoring EDR headroom to %f", v6, 0xCu);
    }
    *(float *)&v2 = self->_currentEDRHeadroomRequest;
    -[CBAurora sendEDRHeadroomRequest:](self, "sendEDRHeadroomRequest:", v2);
    self->_edrHeadroomRestorePending = 0;
  }
}

- (void)setCurrentScaler:(float)a3
{
  self->_currentScaler = a3;
  if (!-[CBAurora isActive](self, "isActive")
    && float_equal(self->_currentScaler, 1.0)
    && self->_edrHeadroomRestorePending)
  {
    -[CBAurora restoreEDRHeadroom](self, "restoreEDRHeadroom");
  }
}

- (void)setCurrentEDRHeadroomRequest:(float)a3
{
  _BOOL4 v3;

  self->_currentEDRHeadroomRequest = a3;
  if (-[CBAurora isActive](self, "isActive")
    || (LOBYTE(v3) = 0, -[CBAurora isBoostingBrightness](self, "isBoostingBrightness")))
  {
    v3 = !float_equal(self->_currentEDRHeadroomRequest, 1.0);
  }
  self->_edrHeadroomRestorePending = v3;
}

- (void)setIsEnabled:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *log;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_isEnabled != a3)
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v3 = "YES";
      else
        v3 = "NO";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora State | Enabled=%s", v8, 0xCu);
    }
    self->_isEnabled = v6;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)setDisplayIsOn:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *log;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_displayIsOn != a3)
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v3 = "YES";
      else
        v3 = "NO";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora Display | On=%s", v8, 0xCu);
    }
    self->_displayIsOn = v6;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)setAODIsOn:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *log;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_aodIsOn != a3)
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v3 = "YES";
      else
        v3 = "NO";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora AOD | On=%s", v8, 0xCu);
    }
    self->_aodIsOn = v6;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)setAutoBrightnessIsEnabled:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *log;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_autoBrightnessIsEnabled != a3)
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v3 = "YES";
      else
        v3 = "NO";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora AutoBrightness | Enabled=%s", v8, 0xCu);
    }
    self->_autoBrightnessIsEnabled = v6;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)setCurveLevel:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v8;
  uint8_t v9[15];
  char v10;
  NSObject *v11;
  int v12;
  int v13;
  SEL v14;
  CBAurora *v15;
  uint8_t v16[8];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = self;
  v14 = a2;
  v13 = a3;
  v12 = 1;
  if (a3 > 2)
  {
    v11 = 0;
    if (v15->_log)
    {
      v8 = v15->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v8 = inited;
    }
    v11 = v8;
    v10 = 16;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      log = v11;
      type = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_error_impl(&dword_1B5291000, log, type, "Aurora Curve Level | Invalid curve level - using default.", v9, 2u);
    }
    v12 = 1;
  }
  else
  {
    v12 = v13;
  }
  if (v12 != v15->_curveLevel)
  {
    v15->_curveLevel = v12;
    if (v15->_log)
    {
      v4 = v15->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v3 = init_default_corebrightness_log();
      v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v16, v15->_curveLevel);
      _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEFAULT, "Aurora Curve Level | Curve level set to %d", v16, 8u);
    }
    -[CBAurora evaluateEntryConditions](v15, "evaluateEntryConditions");
  }
}

- (void)setLowPowerModeIsEnabled:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *log;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_lowPowerModeIsEnabled != a3)
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v3 = "YES";
      else
        v3 = "NO";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora LowPowerMode | Enabled=%s", v8, 0xCu);
    }
    self->_lowPowerModeIsEnabled = v6;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)setDominoModeIsEnabled:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *log;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_dominoModeIsEnabled != a3)
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v3 = "YES";
      else
        v3 = "NO";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora DominoMode | Enabled=%s", v8, 0xCu);
    }
    self->_dominoModeIsEnabled = v6;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)setAutoDimIsEnabled:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *log;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_autoDimIsEnabled != a3)
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v3 = "YES";
      else
        v3 = "NO";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora AutoDim | Enabled=%s", v8, 0xCu);
    }
    self->_autoDimIsEnabled = v6;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)setAutoBrightnessIsAvailable:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *log;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_autoBrightnessIsAvailable != a3)
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v3 = "YES";
      else
        v3 = "NO";
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora AutoBrightnessAvailable | Available=%s", v8, 0xCu);
    }
    self->_autoBrightnessIsAvailable = v6;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)setUPOCap:(float)a3
{
  uint64_t inited;
  NSObject *log;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!float_equal(self->_cpms.upoCap, a3))
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v7, COERCE__INT64(a3));
      _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora CPMS | UPO.Cap=%f", v7, 0xCu);
    }
    self->_cpms.upoCap = a3;
    self->_upoCap = a3;
    -[CBAurora evaluateEntryConditions](self, "evaluateEntryConditions");
  }
}

- (void)setCPMSActivationThreshold:(float)a3
{
  id v3;
  double v4;
  id v5;

  self->_cpms.activationThreshold = a3;
  v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v4 = self->_cpms.activationThreshold;
  v5 = (id)objc_msgSend(v3, "initWithFloat:", v4);
  -[CBDisplayModule setProperty:forKey:](self->_displayModule, "setProperty:forKey:", v5, CFSTR("AuroraCLTMActivationThreshold"));

}

- (void)setRampUpTimeSecondsPerStop:(float)a3
{
  id v3;
  double v4;
  id v5;

  self->_rampUpTimeSecondsPerStop = a3;
  v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v4 = self->_rampUpTimeSecondsPerStop;
  v5 = (id)objc_msgSend(v3, "initWithFloat:", v4);
  -[CBDisplayModule setProperty:forKey:](self->_displayModule, "setProperty:forKey:", v5, CFSTR("AuroraRampUpTimeSecondsPerStop"));

}

- (void)setRampDownTimeSecondsPerStop:(float)a3
{
  id v3;
  double v4;
  id v5;

  self->_rampDownTimeSecondsPerStop = a3;
  v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v4 = self->_rampDownTimeSecondsPerStop;
  v5 = (id)objc_msgSend(v3, "initWithFloat:", v4);
  -[CBDisplayModule setProperty:forKey:](self->_displayModule, "setProperty:forKey:", v5, CFSTR("AuroraRampDownTimeSecondsPerStop"));

}

- (float)currentPreAuroraNits
{
  return self->_currentNits / self->_currentScaler;
}

- (float)calculateNumberOfStopsForCurrentScaler:(float)a3 andRequestedScaler:(float)a4
{
  return fabsf(log2f(a4 / a3));
}

- (float)calculateRampTimeForCurrentScaler:(float)a3 andRequestedScaler:(float)a4
{
  float v4;
  float rampDownTimeSecondsPerStop;

  if (a4 <= a3)
    rampDownTimeSecondsPerStop = self->_rampDownTimeSecondsPerStop;
  else
    rampDownTimeSecondsPerStop = self->_rampUpTimeSecondsPerStop;
  -[CBAurora calculateNumberOfStopsForCurrentScaler:andRequestedScaler:](self, "calculateNumberOfStopsForCurrentScaler:andRequestedScaler:", *(double *)&a3, *(double *)&a4);
  return v4 * rampDownTimeSecondsPerStop;
}

- (float)clampScaler:(float)a3
{
  return clamp(a3, self->_minimumScaler, self->_maximumScaler);
}

- (float)calculateLuxTargetScaler:(float)a3
{
  float v3;
  float v4;
  double v5;
  float result;
  float v7;
  float minimumScaler;

  -[CBAurora luxActivationThreshold](self, "luxActivationThreshold");
  v7 = v3;
  minimumScaler = self->_minimumScaler;
  -[CBAurora luxSaturationThreshold](self, "luxSaturationThreshold");
  *(float *)&v5 = linear_interpolation(a3, v7, minimumScaler, v4, self->_maximumScaler);
  -[CBAurora clampScaler:](self, "clampScaler:", v5);
  return result;
}

- (float)calculateCurrentLuxTargetScaler
{
  double v2;
  float result;

  *(float *)&v2 = self->_lux;
  -[CBAurora calculateLuxTargetScaler:](self, "calculateLuxTargetScaler:", v2, a2, self);
  return result;
}

- (float)calculateRampTargetScalerForNits:(float)a3
{
  double v3;
  float result;

  *(float *)&v3 = a3 / self->_nitsMinimum;
  -[CBAurora clampScaler:](self, "clampScaler:", v3);
  return result;
}

- (float)calculateRampTargetForNits:(float)a3 andAPCE:(float)a4 withTapPointAPCEMinimum:(float)a5 andTapPointAPCEMaximum:(float)a6
{
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  SEL v12;
  CBAurora *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  v9 = a5;
  v8 = a6;
  if (a4 < a5)
    return v11;
  if (v10 > v8)
    return v13->_nitsMinimum;
  v7 = linear_interpolation(v10, v8, v13->_nitsMinimum, v9, v13->_nitsMaximum);
  return *std::min[abi:ne180100]<float>(&v11, &v7);
}

- (float)calculateRampUpTargetForNits:(float)a3 andAPCE:(float)a4
{
  double v4;
  double v5;
  float result;

  *(float *)&v4 = self->_rampUpTapPointAPCEMinimum;
  *(float *)&v5 = self->_rampUpTapPointAPCEMaximum;
  -[CBAurora calculateRampTargetForNits:andAPCE:withTapPointAPCEMinimum:andTapPointAPCEMaximum:](self, "calculateRampTargetForNits:andAPCE:withTapPointAPCEMinimum:andTapPointAPCEMaximum:", *(double *)&a3, *(double *)&a4, v4, v5);
  return result;
}

- (float)calculateCurrentRampUpTargetForAPCE:(float)a3
{
  float result;

  -[CBAurora calculateCurrentLuxTargetScaler](self, "calculateCurrentLuxTargetScaler");
  -[CBAurora convertScalerToNits:](self, "convertScalerToNits:");
  -[CBAurora calculateRampUpTargetForNits:andAPCE:](self, "calculateRampUpTargetForNits:andAPCE:");
  return result;
}

- (float)calculateRampDownTargetForNits:(float)a3 andAPCE:(float)a4
{
  double v4;
  double v5;
  float result;

  *(float *)&v4 = self->_rampDownTapPointAPCEMinimum;
  *(float *)&v5 = self->_rampDownTapPointAPCEMaximum;
  -[CBAurora calculateRampTargetForNits:andAPCE:withTapPointAPCEMinimum:andTapPointAPCEMaximum:](self, "calculateRampTargetForNits:andAPCE:withTapPointAPCEMinimum:andTapPointAPCEMaximum:", *(double *)&a3, *(double *)&a4, v4, v5);
  return result;
}

- (float)calculateCurrentRampDownTargetForAPCE:(float)a3
{
  float result;

  -[CBAurora calculateCurrentLuxTargetScaler](self, "calculateCurrentLuxTargetScaler");
  -[CBAurora convertScalerToNits:](self, "convertScalerToNits:");
  -[CBAurora calculateRampDownTargetForNits:andAPCE:](self, "calculateRampDownTargetForNits:andAPCE:");
  return result;
}

- (float)convertScalerToNits:(float)a3
{
  return a3 * self->_nitsMinimum;
}

- (void)sendEDRHeadroomRequest:(float)a3
{
  id v3;
  double v4;
  double v5;
  id v6;
  uint64_t inited;
  NSObject *log;
  void *v9;
  void *v10;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v13, COERCE__INT64(a3), COERCE__INT64(self->_edrDurationPerStop));
    _os_log_impl(&dword_1B5291000, log, OS_LOG_TYPE_DEFAULT, "Aurora EDR | Sending headroom request with headroom=%f and duration per stop = %f", v13, 0x16u);
  }
  v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v4 = a3;
  v10 = (void *)objc_msgSend(v3, "initWithFloat:", v4);
  if (v10)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D80]);
    *(float *)&v5 = self->_edrDurationPerStop;
    v9 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E0CD29A8], *MEMORY[0x1E0C9AE50], CFSTR("AuroraEDRHeadroomRequest"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("EDRSecondsPerStop"), 0);

    if (v9)
    {
      -[CBDisplayModule setProperty:forKey:](self->_displayModule, "setProperty:forKey:", v9, CFSTR("EDRHeadroomRequest"));

    }
  }
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)displayIsOn
{
  return self->_displayIsOn;
}

- (BOOL)aodIsOn
{
  return self->_aodIsOn;
}

- (BOOL)autoBrightnessIsEnabled
{
  return self->_autoBrightnessIsEnabled;
}

- (int)curveLevel
{
  return self->_curveLevel;
}

- (BOOL)lowPowerModeIsEnabled
{
  return self->_lowPowerModeIsEnabled;
}

- (BOOL)dominoModeIsEnabled
{
  return self->_dominoModeIsEnabled;
}

- (BOOL)autoDimIsEnabled
{
  return self->_autoDimIsEnabled;
}

- (BOOL)autoBrightnessIsAvailable
{
  return self->_autoBrightnessIsAvailable;
}

- (void)setRampInProgress:(BOOL)a3
{
  self->_rampInProgress = a3;
}

- (float)currentNits
{
  return self->_currentNits;
}

- (float)currentEDRHeadroom
{
  return self->_currentEDRHeadroom;
}

- (float)currentEDRHeadroomRequest
{
  return self->_currentEDRHeadroomRequest;
}

- (float)cltmCap
{
  return self->_cltmCap;
}

- (float)upoCap
{
  return self->_upoCap;
}

- (float)lux
{
  return self->_lux;
}

- (float)autoDimRampLength
{
  return self->_autoDimRampLength;
}

- (void)setAutoDimRampLength:(float)a3
{
  self->_autoDimRampLength = a3;
}

@end
