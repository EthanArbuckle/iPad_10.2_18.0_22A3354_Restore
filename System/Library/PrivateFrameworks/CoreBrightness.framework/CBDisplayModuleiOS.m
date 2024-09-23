@implementation CBDisplayModuleiOS

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  float v4;
  double v5;
  id v6;
  double v7;
  float v8;
  float v9;
  float v10;
  double v11;
  float v12;
  float v13;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  CBDisplayModuleiOS *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  CFTypeID v28;
  CFTypeID v29;
  CFTypeID v30;
  BOOL v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *context;
  CFTypeID TypeID;
  uint64_t displayInternal;
  float v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t inited;
  NSObject *logHandle;
  id v47;
  char v48;
  id v49;
  const __CFNumber *v50;
  int v51;
  CFTypeRef cf;
  int valuePtr;
  os_log_type_t v54;
  os_log_t oslog;
  id v56;
  os_log_type_t v57;
  os_log_t v58;
  Boolean Value;
  uint64_t v60;
  id v61;
  id v62;
  int v63;
  os_log_type_t v64;
  os_log_t v65;
  os_log_type_t type;
  os_log_t v67;
  BOOL v68;
  id v69;
  id v70;
  SEL v71;
  CBDisplayModuleiOS *v72;
  char v73;
  uint8_t v74[16];
  _QWORD v75[2];
  _QWORD v76[2];
  uint8_t v77[16];
  uint8_t v78[16];
  _QWORD v79[2];
  _QWORD v80[2];
  uint8_t v81[16];
  uint8_t v82[16];
  _QWORD v83[2];
  _QWORD v84[2];
  uint8_t v85[16];
  uint8_t v86[16];
  uint8_t v87[24];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v72 = self;
  v71 = a2;
  v70 = a3;
  v69 = a4;
  v68 = 0;
  v67 = 0;
  if (self->super.super._logHandle)
  {
    logHandle = v72->super.super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v67 = logHandle;
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v87, (uint64_t)v69, (uint64_t)v70);
    _os_log_debug_impl(&dword_1B5291000, v67, type, "Set property for key = %@ property = %@", v87, 0x16u);
  }
  -[CBAurora setPropertyForKey:withValue:](v72->_aurora, "setPropertyForKey:withValue:", v69, v70);
  -[CBChromaticCorrection setProperty:forKey:](v72->_twilight, "setProperty:forKey:", v70, v69);
  -[CBChromaticCorrection setProperty:forKey:](v72->_ammolite, "setProperty:forKey:", v70, v69);
  -[CBIndicatorBrightnessModule setProperty:forKey:](v72->_indicatorBrightnessModule, "setProperty:forKey:", v70, v69);
  if ((objc_msgSend(v69, "isEqualToString:", CFSTR("EDRHeadroomRequest")) & 1) != 0)
  {
    if (v72->_nitsSDR > 0.0
      || objc_msgSend(v70, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessNotificationPowerOff](v72->_brtCtl, "brightnessNotificationPowerOff")))
    {
      -[CBDisplayModuleiOS handleEDRHeadroomRequest:](v72, "handleEDRHeadroomRequest:", v70);
    }
    else
    {
      v65 = 0;
      if (v72->super.super._logHandle)
      {
        v44 = v72->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v43 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v43 = init_default_corebrightness_log();
        v44 = v43;
      }
      v65 = v44;
      v64 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_msgSend(v70, "objectForKey:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v86, COERCE__INT64(v4));
        _os_log_impl(&dword_1B5291000, v65, v64, "EDR Headroom request received while SDR is 0: EDR: %f, caching request", v86, 0xCu);
      }
      if (!v72->_cachedProperties)
        v72->_cachedProperties = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (!v72->_cachedKeys)
        v72->_cachedKeys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableArray addObject:](v72->_cachedProperties, "addObject:", v70);
      -[NSMutableArray addObject:](v72->_cachedKeys, "addObject:", v69);
    }
    goto LABEL_162;
  }
  if (v72->_brtCtl
    && (objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationRequestEDR](v72->_brtCtl, "brightnessNotificationRequestEDR")) & 1) != 0)
  {

    v72->_lastEDRHeadroomRequestFromCA = v70;
    goto LABEL_162;
  }
  if ((objc_msgSend(v69, "isEqualToString:", CFSTR("EDRSecondsPerStop")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v70, "floatValue");
      v63 = LODWORD(v5);
      -[CBEDR setSecondsPerStop:](v72->_edr, "setSecondsPerStop:", v5);
    }
    goto LABEL_162;
  }
  if (v72->_brtCtl
    && (objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationAttached](v72->_brtCtl, "brightnessNotificationAttached")) & 1) != 0)
  {
    -[CBDisplayModuleiOS handleAttachedNotification](v72, "handleAttachedNotification");
    v73 = 1;
  }
  else if (v72->_brtCtl
         && (objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationPowerOff](v72->_brtCtl, "brightnessNotificationPowerOff")) & 1) != 0)
  {
    if (!v72->_referenceModeIsActive)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
      LODWORD(v7) = 1.0;
      v62 = (id)objc_msgSend(v6, "initWithFloat:", v7);
      if (v62)
      {
        v61 = 0;
        v42 = objc_alloc(MEMORY[0x1E0C99D80]);
        v41 = -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom");
        v61 = (id)objc_msgSend(v42, "initWithObjectsAndKeys:", v62, v41, *MEMORY[0x1E0C9AE50], -[CBBrightnessProxy brightnessNotificationPowerOff](v72->_brtCtl, "brightnessNotificationPowerOff"), 0);

        if (v61)
        {
          -[CBDisplayModuleiOS setProperty:forKey:](v72, "setProperty:forKey:", v61, CFSTR("EDRHeadroomRequest"));

        }
      }
    }
    v72->_autoDimActive = 0;
    DisplaySetProperty((uint64_t)v72->_displayInternal, (uint64_t)CFSTR("DisplayPowerOff"), *MEMORY[0x1E0C9AE50]);
    v73 = 1;
  }
  else if (v72->_brtCtl
         && ((objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationSecureIndicatorOn](v72->_brtCtl, "brightnessNotificationSecureIndicatorOn")) & 1) != 0|| (objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationSecureIndicatorOff](v72->_brtCtl, "brightnessNotificationSecureIndicatorOff")) & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_162;
    v60 = 0;
    v60 = objc_msgSend(v70, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessSecureIndicatorActiveCount](v72->_brtCtl, "brightnessSecureIndicatorActiveCount"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CBDisplayModuleiOS setProperty:forKey:](v72, "setProperty:forKey:", v60, CFSTR("SecureIndicatorActiveCount"));
    v73 = 1;
  }
  else
  {
    if ((objc_msgSend(v69, "isEqualToString:", CFSTR("SecureIndicatorState")) & 1) != 0)
    {
      -[CBDisplayModuleiOS sendNotificationForKey:withValue:](v72, "sendNotificationForKey:withValue:", CFSTR("SecureIndicatorState"), v70);
      goto LABEL_162;
    }
    if ((objc_msgSend(v69, "isEqualToString:", CFSTR("DisplayBrightness")) & 1) == 0 || v72->_brightnessControlEnabled)
    {
      if ((objc_msgSend(v69, "isEqualToString:", CFSTR("SBIMEnabled")) & 1) != 0)
      {
        if (CFBooleanGetValue((CFBooleanRef)v70))
          -[CBSBIM enable](v72->_sbim, "enable");
        else
          -[CBSBIM disable](v72->_sbim, "disable");
        v73 = 1;
      }
      else if ((objc_msgSend(v69, "isEqualToString:", CFSTR("FrameInfoLoggingEnabled")) & 1) != 0)
      {
        -[CBFrameStats enableFrameInfoLogging:](v72->_frameStats, "enableFrameInfoLogging:", CFBooleanGetValue((CFBooleanRef)v70) != 0);
        v73 = 1;
      }
      else
      {
        if ((objc_msgSend(v69, "isEqualToString:", CFSTR("AuroraFactorWithFade")) & 1) == 0)
        {
          if ((objc_msgSend(v69, "isEqualToString:", CFSTR("TwilightStrength")) & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[CBDisplayModuleiOS sendNotificationForKey:withValue:](v72, "sendNotificationForKey:withValue:", CFSTR("TwilightStrength"), v70);
          }
          else
          {
            if (CFEqual(v69, CFSTR("DominoStateUpdate")))
            {
              TypeID = CFBooleanGetTypeID();
              if (TypeID == CFGetTypeID(v70))
              {
                Value = CFBooleanGetValue((CFBooleanRef)v70);
                if (v72->_dominoMode != Value)
                {
                  v72->_dominoMode = Value != 0;
                  if (v72->_dominoMode)
                  {
                    if (-[CBDisplayModuleiOS edrIsEngaged](v72, "edrIsEngaged"))
                    {
                      context = (void *)MEMORY[0x1B5E4A8B0]();
                      v58 = 0;
                      if (v72->super.super._logHandle)
                      {
                        v36 = v72->super.super._logHandle;
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT)
                          v35 = _COREBRIGHTNESS_LOG_DEFAULT;
                        else
                          v35 = init_default_corebrightness_log();
                        v36 = v35;
                      }
                      v58 = v36;
                      v57 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                      {
                        __os_log_helper_16_0_1_8_0((uint64_t)v85, 0x3FF0000000000000);
                        _os_log_error_impl(&dword_1B5291000, v58, v57, "Domino EDR | Entering Domino, reducing EDR headroom to %f", v85, 0xCu);
                      }
                      v83[0] = CFSTR("DominoHeadroomRequest");
                      v84[0] = MEMORY[0x1E0C9AAB0];
                      v83[1] = -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom");
                      v84[1] = &unk_1E6917648;
                      -[CBDisplayModuleiOS setProperty:forKey:](v72, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2), CFSTR("EDRHeadroomRequest"));
                      objc_autoreleasePoolPop(context);
                    }
                  }
                  else if (v72->_lastEDRHeadroomRequestFromCA)
                  {
                    v34 = (void *)MEMORY[0x1B5E4A8B0]();
                    v56 = 0;
                    v56 = (id)objc_msgSend(v72->_lastEDRHeadroomRequestFromCA, "mutableCopy");
                    objc_msgSend(v56, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("DominoHeadroomRequest"));
                    oslog = 0;
                    if (v72->super.super._logHandle)
                    {
                      v33 = v72->super.super._logHandle;
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                        v32 = _COREBRIGHTNESS_LOG_DEFAULT;
                      else
                        v32 = init_default_corebrightness_log();
                      v33 = v32;
                    }
                    oslog = v33;
                    v54 = OS_LOG_TYPE_DEFAULT;
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend((id)objc_msgSend(v56, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
                      __os_log_helper_16_0_1_8_0((uint64_t)v82, COERCE__INT64(v10));
                      _os_log_impl(&dword_1B5291000, oslog, v54, "Domino EDR | Domino is exiting Restoring EDR headroom after exiting to %f", v82, 0xCu);
                    }
                    -[CBDisplayModuleiOS setProperty:forKey:](v72, "setProperty:forKey:", v56, CFSTR("EDRHeadroomRequest"));
                    objc_autoreleasePoolPop(v34);
                  }
                  v31 = 0;
                  if (v72->_brightnessControlEnabled)
                    v31 = !v72->_dominoMode;
                  -[CBDisplayModuleiOS sendNotificationForKey:withValue:](v72, "sendNotificationForKey:withValue:", CFSTR("CBBrightnessControlAvailable"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31));
                }
              }
            }
            else
            {
              if (CFEqual(v69, CFSTR("AmbientAdaptiveDimming")))
              {
                if (v70)
                {
                  v30 = CFDictionaryGetTypeID();
                  if (v30 == CFGetTypeID(v70))
                  {
                    valuePtr = 0;
                    cf = CFDictionaryGetValue((CFDictionaryRef)v70, CFSTR("AmbientAdaptiveDimmingEnable"));
                    if (cf)
                    {
                      v29 = CFNumberGetTypeID();
                      if (v29 == CFGetTypeID(cf))
                        CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
                    }
                    v51 = 0;
                    v50 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v70, CFSTR("AmbientAdaptiveDimmingPeriod"));
                    if (v50)
                    {
                      v28 = CFNumberGetTypeID();
                      if (v28 == CFGetTypeID(v50))
                        CFNumberGetValue(v50, kCFNumberFloatType, &v51);
                    }
                    if (v72->_autoDimActive != valuePtr)
                    {
                      v72->_autoDimActive = valuePtr != 0;
                      if (v72->_autoDimActive)
                      {
                        if (-[CBDisplayModuleiOS edrIsEngaged](v72, "edrIsEngaged"))
                        {
                          v27 = (void *)MEMORY[0x1B5E4A8B0]();
                          if (v72->super.super._logHandle)
                          {
                            v26 = v72->super.super._logHandle;
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                              v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                            else
                              v25 = init_default_corebrightness_log();
                            v26 = v25;
                          }
                          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                          {
                            __os_log_helper_16_0_1_8_0((uint64_t)v81, COERCE__INT64(v72->_appliedHeadroom));
                            _os_log_impl(&dword_1B5291000, v26, OS_LOG_TYPE_DEFAULT, "AutoDim EDR | Entering AutoDim, freezing EDR headroom to %f", v81, 0xCu);
                          }
                          v24 = v72;
                          v79[0] = CFSTR("AutoDimHeadroomRequest");
                          v80[0] = MEMORY[0x1E0C9AAB0];
                          v79[1] = -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom");
                          *(float *)&v11 = v72->_appliedHeadroom;
                          v80[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
                          -[CBDisplayModuleiOS setProperty:forKey:](v24, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2), CFSTR("EDRHeadroomRequest"));
                          objc_autoreleasePoolPop(v27);
                        }
                      }
                      else if (v72->_lastEDRHeadroomRequestFromCA)
                      {
                        v23 = (void *)MEMORY[0x1B5E4A8B0]();
                        v49 = (id)objc_msgSend(v72->_lastEDRHeadroomRequestFromCA, "mutableCopy");
                        objc_msgSend(v49, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("AutoDimHeadroomRequest"));
                        if (v72->super.super._logHandle)
                        {
                          v22 = v72->super.super._logHandle;
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
                          objc_msgSend((id)objc_msgSend(v49, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
                          __os_log_helper_16_0_1_8_0((uint64_t)v78, COERCE__INT64(v12));
                          _os_log_impl(&dword_1B5291000, v22, OS_LOG_TYPE_DEFAULT, "AutoDim EDR | AutoDim is exiting, restoring EDR headroom to %f", v78, 0xCu);
                        }
                        -[CBDisplayModuleiOS setProperty:forKey:](v72, "setProperty:forKey:", v49, CFSTR("EDRHeadroomRequest"));
                        objc_autoreleasePoolPop(v23);
                      }
                    }
                    v68 = DisplaySetProperty((uint64_t)v72->_displayInternal, (uint64_t)v69, (uint64_t)v70) != 0;
                  }
                }
                goto LABEL_162;
              }
              if (v72->_brtCtl)
              {
                if ((objc_msgSend(v69, "isEqualToString:", CFSTR("EcoMode")) & 1) != 0)
                {
                  v48 = objc_msgSend(v70, "BOOLValue") & 1;
                  if (v72->_ecoMode != v48)
                  {
                    v72->_ecoMode = v48 != 0;
                    if (v72->_ecoMode)
                    {
                      if (-[CBDisplayModuleiOS edrIsEngaged](v72, "edrIsEngaged"))
                      {
                        v20 = (void *)MEMORY[0x1B5E4A8B0]();
                        if (v72->super.super._logHandle)
                        {
                          v19 = v72->super.super._logHandle;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v18 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v18 = init_default_corebrightness_log();
                          v19 = v18;
                        }
                        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v77, 0x3FF0000000000000);
                          _os_log_impl(&dword_1B5291000, v19, OS_LOG_TYPE_DEFAULT, "EcoMode EDR | Entering EcoMode Reducing EDR headroom to %f", v77, 0xCu);
                        }
                        v75[0] = CFSTR("EcoModeHeadroomRequest");
                        v76[0] = MEMORY[0x1E0C9AAB0];
                        v75[1] = -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom");
                        v76[1] = &unk_1E6917648;
                        -[CBDisplayModuleiOS setProperty:forKey:](v72, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2), CFSTR("EDRHeadroomRequest"));
                        objc_autoreleasePoolPop(v20);
                      }
                    }
                    else if (v72->_lastEDRHeadroomRequestFromCA)
                    {
                      v17 = (void *)MEMORY[0x1B5E4A8B0]();
                      v47 = (id)objc_msgSend(v72->_lastEDRHeadroomRequestFromCA, "mutableCopy");
                      objc_msgSend(v47, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("EcoModeHeadroomRequest"));
                      if (v72->super.super._logHandle)
                      {
                        v16 = v72->super.super._logHandle;
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
                        objc_msgSend((id)objc_msgSend(v72->_lastEDRHeadroomRequestFromCA, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
                        __os_log_helper_16_0_1_8_0((uint64_t)v74, COERCE__INT64(v13));
                        _os_log_impl(&dword_1B5291000, v16, OS_LOG_TYPE_DEFAULT, "EcoMode EDR | EcoMode is exiting Restoring EDR headroom after exiting to %f", v74, 0xCu);
                      }
                      -[CBDisplayModuleiOS setProperty:forKey:](v72, "setProperty:forKey:", v47, CFSTR("EDRHeadroomRequest"));
                      objc_autoreleasePoolPop(v17);
                    }
                  }
                }
              }
            }
            v68 = DisplaySetProperty((uint64_t)v72->_displayInternal, (uint64_t)v69, (uint64_t)v70) != 0;
          }
LABEL_162:
          v73 = v68;
          return v73 & 1;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_162;
        objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("AuroraFactor"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_162;
        objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("AuroraFadePeriod"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_162;
        displayInternal = (uint64_t)v72->_displayInternal;
        objc_msgSend((id)objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("AuroraFactor")), "floatValue");
        v40 = v8;
        objc_msgSend((id)objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("AuroraFadePeriod")), "floatValue");
        DisplaySetAuroraFactorWithFade(displayInternal, v40, v9);
        v73 = 1;
      }
    }
    else
    {
      v73 = 1;
    }
  }
  return v73 & 1;
}

uint64_t __42__CBDisplayModuleiOS_handleHIDEvent_from___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "handleHIDEvent:from:", a1[5], a1[6]);
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) & 1 | result & 1) != 0;
  }
  return result;
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  float v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v19;
  float v20;
  os_log_type_t v21;
  os_log_t v22;
  os_log_type_t v23;
  os_log_t v24;
  float v25;
  id v26;
  char v27;
  os_log_type_t v28;
  os_log_t v29;
  id v30;
  id v31;
  SEL v32;
  CBDisplayModuleiOS *v33;
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t v36[16];
  uint8_t v37[16];
  uint8_t v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = self;
  v32 = a2;
  v31 = a3;
  v30 = a4;
  v29 = 0;
  if (self->super.super._logHandle)
  {
    logHandle = v33->super.super._logHandle;
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
  v28 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v38, (uint64_t)v31, (uint64_t)v30);
    _os_log_debug_impl(&dword_1B5291000, v29, v28, "Handle notification for key = %@ and property = %@", v38, 0x16u);
  }
  v27 = 0;
  v27 = -[CBAurora isBoostingBrightness](v33->_aurora, "isBoostingBrightness");
  -[CBAurora setPropertyForKey:withValue:](v33->_aurora, "setPropertyForKey:withValue:", v31, v30);
  -[CBChromaticCorrection handleNotificationForKey:withProperty:](v33->_twilight, "handleNotificationForKey:withProperty:", v31, v30);
  -[CBChromaticCorrection handleNotificationForKey:withProperty:](v33->_ammolite, "handleNotificationForKey:withProperty:", v31, v30);
  -[CBIndicatorBrightnessModule handleNotificationForKey:withProperty:](v33->_indicatorBrightnessModule, "handleNotificationForKey:withProperty:", v31, v30);
  if ((objc_msgSend(v31, "isEqualToString:", CFSTR("CBTargetWhitePoint")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("YWP"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v26, "floatValue");
        v25 = 1.0 / v4;
        DisplaySetEDRForTargetYcompensation((uint64_t)v33->_displayInternal, 1.0 / v4);
      }
    }
  }
  else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("BlueReductionEnabled")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33->_blrEnabled = objc_msgSend(v30, "BOOLValue") & 1;
      v24 = 0;
      if (v33->super.super._logHandle)
      {
        v16 = v33->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v15 = init_default_corebrightness_log();
        v16 = v15;
      }
      v24 = v16;
      v23 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v37, (uint64_t)v30);
        _os_log_impl(&dword_1B5291000, v24, v23, "Set BLR enabled = %{public}@", v37, 0xCu);
      }
      DisplaySetBLREnabled((uint64_t)v33->_displayInternal, v33->_blrEnabled);
    }
  }
  else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("ColorAdaptationActive")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33->_harmonyEnabled = objc_msgSend(v30, "BOOLValue") & 1;
      v22 = 0;
      if (v33->super.super._logHandle)
      {
        v14 = v33->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v13 = init_default_corebrightness_log();
        v14 = v13;
      }
      v22 = v14;
      v21 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v36, (uint64_t)v30);
        _os_log_impl(&dword_1B5291000, v22, v21, "Set Harmony enabled = %{public}@", v36, 0xCu);
      }
      DisplaySetHarmonyEnabled((uint64_t)v33->_displayInternal, v33->_harmonyEnabled);
    }
  }
  else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("TrustedLux")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v30, "floatValue");
      v20 = *(float *)&v5;
      -[CBDisplayModuleiOS updateBDMWithLux:](v33, "updateBDMWithLux:", v5);
      v33->_trustedLux = v20;
      if (v33->_brtCtl)
      {
        if (!-[CBAODState isAODActive](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODActive"))
        {
          *(float *)&v6 = v33->_trustedLux;
          -[CBBrightnessProxy setAmbient:](v33->_brtCtl, "setAmbient:", v6);
          v19 = 0;
          if ((-[CBBrightnessProxy commitBrightness:](v33->_brtCtl, "commitBrightness:", &v19) & 1) == 0)
          {
            if (v33->super.super._logHandle)
            {
              v12 = v33->super.super._logHandle;
            }
            else
            {
              v11 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
              v12 = v11;
            }
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v35, v19);
              _os_log_error_impl(&dword_1B5291000, v12, OS_LOG_TYPE_ERROR, "ERROR COMMITING LUX FROM CA!!!!!!! (%@)", v35, 0xCu);
            }
          }
          if (v33->super.super._logHandle)
          {
            v10 = v33->super.super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v9 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v9 = init_default_corebrightness_log();
            v10 = v9;
          }
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_0_1_8_0((uint64_t)v34, COERCE__INT64(v33->_trustedLux));
            _os_log_impl(&dword_1B5291000, v10, OS_LOG_TYPE_INFO, "Set trusted lux = %f", v34, 0xCu);
          }
        }
      }
    }
  }
  else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("FrameSynchronizedBrightnessTransaction")) & 1) != 0)
  {
    -[CBDisplayModuleiOS handleDisplayBrightnessUpdate:](v33, "handleDisplayBrightnessUpdate:", v30);
  }
  else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("CPMS.CLTM.Cap")) & 1) != 0 && (v27 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v30, "floatValue");
      if (*(float *)&v7 < v33->_nitsSDR)
      {
        *(float *)&v8 = v33->_nitsSDR;
        +[CBAnalytics cltmBudgetUpdated:currentSDRBrightness:](CBAnalytics, "cltmBudgetUpdated:currentSDRBrightness:", v7, v8);
      }
    }
  }
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  NSMutableArray *subModules;
  char v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(_QWORD *, void *);
  void *v11;
  uint64_t *v12;
  __IOHIDEvent *v13;
  __IOHIDServiceClient *v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  char v19;
  __IOHIDServiceClient *v20;
  __IOHIDEvent *v21;
  SEL v22;
  CBDisplayModuleiOS *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x20000000;
  v18 = 32;
  v19 = 0;
  subModules = self->_subModules;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __42__CBDisplayModuleiOS_handleHIDEvent_from___block_invoke;
  v11 = &unk_1E68EA0B8;
  v12 = &v15;
  v13 = a3;
  v14 = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](subModules, "enumerateObjectsUsingBlock:", &v7);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v6 & 1;
}

- (void)handleDisplayBrightnessUpdate:(id)a3
{
  os_log_type_t *v3;
  os_log_type_t *v4;
  int v5;
  int v6;
  int v7;
  os_log_type_t *v8;
  int v9;
  int v10;
  int v11;
  os_log_type_t *v12;
  int v13;
  os_log_type_t *v14;
  int v15;
  double v16;
  os_log_type_t *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  os_log_type_t *v22;
  os_log_type_t *v23;
  os_log_type_t *v24;
  os_log_type_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_log_type_t *v31;
  uint64_t v32;
  os_log_type_t *v33;
  os_log_type_t *v34;
  uint64_t v35;
  double v36;
  os_log_type_t *v37;
  int v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  os_log_type_t *v48;
  os_log_type_t *v49;
  os_log_type_t *v50;
  os_log_type_t *v51;
  double v52;
  os_log_type_t *v53;
  os_log_type_t *v54;
  os_log_type_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  os_log_type_t *v61;
  os_log_type_t *v62;
  os_log_type_t *v63;
  os_log_type_t *v64;
  uint64_t v65;
  uint64_t v66;
  os_log_type_t *v67;
  os_log_type_t *v68;
  os_log_type_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  os_log_type_t *v75;
  os_log_type_t *v76;
  uint64_t v77;
  uint64_t v78;
  os_log_type_t *v79;
  os_log_type_t *v80;
  os_log_type_t *v81;
  uint64_t v82;
  uint64_t v83;
  os_log_type_t *v84;
  os_log_type_t *v85;
  os_log_type_t *v86;
  os_log_type_t *v87;
  os_log_type_t *v88;
  uint64_t v89;
  float v90;
  uint64_t v91;
  os_log_type_t *v92;
  _QWORD *v93;
  uint64_t v94;
  int v95;
  os_log_type_t *v96;
  int v97;
  os_log_type_t *v98;
  int v99;
  os_log_type_t *v100;
  int v101;
  os_log_type_t *v102;
  os_log_type_t *v103;
  double v104;
  uint64_t v105;
  float v106;
  float v107;
  uint64_t v108;
  float v109;
  char v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  float v119;
  uint64_t v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  os_log_type_t *v128;
  float v129;
  os_log_type_t *v130;
  double v131;
  uint64_t v132;
  os_log_type_t *v133;
  double v134;
  uint64_t v135;
  void *v136;
  char v137;
  void *v138;
  unint64_t v139;
  os_log_type_t *v140;
  double v141;
  uint64_t v142;
  unint64_t v143;
  os_log_type_t *v144;
  void *v145;
  float v146;
  uint64_t v147;
  double v148;
  uint64_t v149;
  unint64_t v150;
  unint64_t v151;
  os_log_type_t *v152;
  double v153;
  uint64_t v154;
  unint64_t v155;
  os_log_type_t *v156;
  double v157;
  uint64_t v158;
  unint64_t v159;
  os_log_type_t *v160;
  double v161;
  uint64_t v162;
  unint64_t v163;
  os_log_type_t *v164;
  double v165;
  uint64_t v166;
  unint64_t v167;
  os_log_type_t *v168;
  double v169;
  uint64_t v170;
  unint64_t v171;
  os_log_type_t *v172;
  double v173;
  uint64_t v174;
  unint64_t v175;
  os_log_type_t *v176;
  double v177;
  uint64_t v178;
  unint64_t v179;
  os_log_type_t *v180;
  uint64_t v181;
  char *v182;
  char *v183;
  os_log_type_t *v184;
  const __CFString *v185;
  uint64_t v186;
  os_log_type_t *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  os_log_type_t *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196[16];
  os_log_type_t v197[4];
  NSObject *inited;
  os_log_t v199;
  unint64_t v200;
  unint64_t v201;
  uint64_t v202;
  os_log_t v203;
  os_log_type_t v204[4];
  uint8_t *v205;
  NSObject *v206;
  os_log_t v207;
  id v208;
  id v209;
  uint64_t v210;
  id v211;
  void *context;
  os_log_type_t *v213;
  unint64_t v214;
  unint64_t v215;
  id v216;
  char *v217;
  char *v218;
  const __CFString *v219;
  void *v220;
  int v221;
  id v222;
  unint64_t v223;
  unint64_t v224;
  unint64_t v225;
  const char *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t *v243;
  os_log_t v244;
  os_log_type_t v245[4];
  uint8_t *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  unint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  os_log_t v257;
  os_log_type_t v258[4];
  uint8_t *v259;
  uint64_t v260;
  uint64_t v261;
  os_log_t v262;
  os_log_type_t v263[4];
  uint8_t *v264;
  uint64_t v265;
  uint64_t v266;
  os_log_t v267;
  os_log_type_t v268[4];
  uint8_t *v269;
  uint64_t v270;
  uint64_t v271;
  os_log_t v272;
  os_log_type_t v273[4];
  uint8_t *v274;
  uint64_t v275;
  uint64_t v276;
  os_log_t v277;
  os_log_type_t v278[4];
  uint8_t *v279;
  uint64_t v280;
  uint64_t v281;
  os_log_t v282;
  os_log_type_t v283[4];
  uint8_t *v284;
  uint64_t v285;
  uint64_t v286;
  os_log_t v287;
  os_log_type_t v288[4];
  uint8_t *v289;
  uint64_t v290;
  uint64_t v291;
  os_log_t v292;
  os_log_type_t v293[4];
  uint8_t *v294;
  uint64_t v295;
  uint64_t v296;
  unint64_t v297;
  unint64_t v298;
  unint64_t v299;
  unint64_t v300;
  os_log_t v301;
  os_log_type_t v302[4];
  uint8_t *v303;
  uint64_t v304;
  uint64_t v305;
  os_log_t log;
  os_log_type_t v307[4];
  uint8_t *buf;
  uint64_t v309;
  uint64_t v310;
  unint64_t v311;
  int v312;
  os_log_type_t *v313;
  id v314;
  os_log_type_t v315;
  os_log_t v316;
  uint64_t v317;
  int v318;
  int v319;
  void (*v320)(uint64_t, uint64_t, uint64_t);
  void *v321;
  uint64_t v322;
  os_log_type_t v323;
  os_log_t oslog;
  char v325;
  uint64_t v326;
  uint64_t v327;
  int v328;
  int v329;
  void (*v330)(uint64_t, void *);
  void *v331;
  uint64_t v332;
  uint64_t v333;
  char v334;
  os_log_type_t v335[15];
  os_log_type_t v336;
  os_log_type_t v337;
  uint8_t v338[7];
  os_log_type_t v339;
  os_log_type_t v340;
  os_log_type_t v341;
  os_log_type_t v342;
  os_log_type_t v343;
  uint8_t v344[7];
  os_log_type_t v345;
  os_log_type_t v346;
  os_log_type_t v347;
  os_log_type_t type;
  id v349;
  SEL v350;
  CBDisplayModuleiOS *v351;
  uint8_t v352[16];
  _BYTE v353[16];
  char v354;
  char v355;
  _BYTE v356[224];
  uint8_t v357[96];
  uint8_t v358[32];
  uint8_t v359[32];
  uint8_t v360[64];
  uint8_t v361[32];
  uint8_t v362[64];
  uint8_t v363[16];
  uint8_t v364[56];
  uint64_t v365;

  v313 = v335;
  v365 = *MEMORY[0x1E0C80C00];
  v351 = self;
  v350 = a2;
  v349 = a3;
  v314 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v313;
    v312 = 0;
    *((_DWORD *)v313 + 61) = 0;
    objc_msgSend((id)objc_msgSend(*((id *)v3 + 31), "objectForKey:", CFSTR("NitsPhysical")), "floatValue");
    v4 = v313;
    v6 = v5;
    v7 = v312;
    *((_DWORD *)v313 + 61) = v6;
    *((_DWORD *)v4 + 60) = v7;
    objc_msgSend((id)objc_msgSend(*((id *)v4 + 31), "objectForKey:", CFSTR("EDRHeadroom")), "floatValue");
    v8 = v313;
    v10 = v9;
    v11 = v312;
    *((_DWORD *)v313 + 60) = v10;
    *((_DWORD *)v8 + 59) = v11;
    objc_msgSend((id)objc_msgSend(*((id *)v8 + 31), "objectForKey:", CFSTR("NitsCap")), "floatValue");
    v12 = v313;
    *((_DWORD *)v313 + 59) = v13;
    objc_msgSend((id)objc_msgSend(*((id *)v12 + 31), "objectForKey:", CFSTR("DynSliderCap")), "floatValue");
    v14 = v313;
    *(_DWORD *)(*((_QWORD *)v313 + 33) + 112) = v15;
    v16 = *((float *)v14 + 61);
    if (v16 < 0.0)
    {
      v316 = 0;
      if (*(_QWORD *)(*((_QWORD *)v313 + 33) + 16))
      {
        v199 = *(os_log_t *)(*((_QWORD *)v313 + 33) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v199 = inited;
      }
      v316 = v199;
      v315 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
      {
        v196[15] = (uint64_t)v316;
        *(_DWORD *)v197 = v315;
        __os_log_helper_16_0_1_8_0((uint64_t)v352, COERCE__INT64(*((float *)v313 + 61)));
        _os_log_impl(&dword_1B5291000, v316, v315, "Unexpected SDR brightness: %f, ignore", v352, 0xCu);
      }
    }
    else
    {
      v17 = v313;
      *(_DWORD *)(*((_QWORD *)v313 + 33) + 108) = *((_DWORD *)v313 + 61);
      LODWORD(v16) = *((_DWORD *)v17 + 61);
      v18 = *((_QWORD *)v17 + 33);
      v311 = 0x1EF0FB000uLL;
      objc_msgSend(*(id *)(v18 + 128), "setSdrBrightness:", v16);
      LODWORD(v19) = *((_DWORD *)v313 + 59);
      objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 128), "setBrightnessCap:", v19);
      LODWORD(v20) = *((_DWORD *)v313 + 61);
      objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 136), "setSdrBrightness:", v20);
      if (objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 288), "rtplc"))
      {
        if (*(_QWORD *)(*((_QWORD *)v313 + 33) + 224) == 2
          || *(_QWORD *)(*((_QWORD *)v313 + 33) + 224) == 1
          || *(_QWORD *)(*((_QWORD *)v313 + 33) + 224) == 3)
        {
          v22 = v313;
          *((_DWORD *)v313 + 58) = 0;
          *(float *)&v21 = DisplayGetCurrentRTPLCHeadroomCap(*(_QWORD *)(*((_QWORD *)v22 + 33) + 280));
          v23 = v313;
          *((_DWORD *)v313 + 58) = LODWORD(v21);
          *(float *)(*((_QWORD *)v23 + 33) + 216) = fminf(*((float *)v23 + 58), *(float *)(*((_QWORD *)v23 + 33) + 100));
        }
        *(float *)&v21 = fminf(*(float *)(*((_QWORD *)v313 + 33) + 216), *((float *)v313 + 59));
        objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 128), "setBrightnessCap:", v21);
        v24 = v313;
        *((_QWORD *)v313 + 28) = 0;
        if (*(_QWORD *)(*((_QWORD *)v24 + 33) + 16))
        {
          v310 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v309 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v309 = init_default_corebrightness_log();
          v310 = v309;
        }
        v25 = v313;
        *((_QWORD *)v313 + 28) = v310;
        type = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(*((os_log_t *)v25 + 28), OS_LOG_TYPE_INFO))
        {
          log = (os_log_t)*((_QWORD *)v313 + 28);
          *(_DWORD *)v307 = type;
          v26 = objc_msgSend(*((id *)v313 + 33), "rtplcStateToString:", *(_QWORD *)(*((_QWORD *)v313 + 33) + 224));
          *(double *)&v27 = *(float *)(*((_QWORD *)v313 + 33) + 216);
          *(double *)&v28 = *((float *)v313 + 59);
          *(double *)&v29 = *(float *)(*((_QWORD *)v313 + 33) + 112);
          *(double *)&v30 = *(float *)(*((_QWORD *)v313 + 33) + 108);
          buf = v364;
          __os_log_helper_16_2_5_8_32_8_0_8_0_8_0_8_0((uint64_t)v364, v26, v27, v28, v29, v30);
          _os_log_impl(&dword_1B5291000, log, v307[0], "HDR CAPS | RTPLC: [%s] %f, currentNitCap: %f, dynSliderCap: %f, Nits: %f", v364, 0x34u);
        }
      }
      v31 = v313;
      *((_QWORD *)v313 + 26) = 0;
      v32 = objc_msgSend(*(id *)(*((_QWORD *)v31 + 33) + 128), "copyStatusInfo");
      v33 = v313;
      *((_QWORD *)v313 + 26) = v32;
      *((_QWORD *)v33 + 25) = 0;
      if (*(_QWORD *)(*((_QWORD *)v33 + 33) + 16))
      {
        v305 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v304 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v304 = init_default_corebrightness_log();
        v305 = v304;
      }
      v34 = v313;
      *((_QWORD *)v313 + 25) = v305;
      v347 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(*((os_log_t *)v34 + 25), OS_LOG_TYPE_INFO))
      {
        v301 = (os_log_t)*((_QWORD *)v313 + 25);
        *(_DWORD *)v302 = v347;
        v35 = *((_QWORD *)v313 + 26);
        v303 = v363;
        __os_log_helper_16_2_1_8_64((uint64_t)v363, v35);
        _os_log_impl(&dword_1B5291000, v301, v302[0], "CBEDR statusInfo: %@", v363, 0xCu);
      }

      LODWORD(v36) = *((_DWORD *)v313 + 60);
      objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 128), "cappedHeadroomFromUncapped:", v36);
      v37 = v313;
      *(_DWORD *)(*((_QWORD *)v313 + 33) + 144) = v38;
      *((_DWORD *)v37 + 48) = 0;
      *((_DWORD *)v37 + 48) = *(_DWORD *)(*((_QWORD *)v37 + 33) + 100);
      if ((objc_msgSend(*(id *)(*((_QWORD *)v37 + 33) + 48), "isBoostingBrightness") & 1) != 0)
        *((_DWORD *)v313 + 48) = *(_DWORD *)(*((_QWORD *)v313 + 33) + 104);
      LODWORD(v39) = *((_DWORD *)v313 + 61);
      v40 = *((_QWORD *)v313 + 33);
      v300 = 0x1EF0FB000uLL;
      objc_msgSend(*(id *)(v40 + 48), "setCurrentNits:", v39);
      LODWORD(v41) = *(_DWORD *)(*((_QWORD *)v313 + 33) + 144);
      objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 48), "setCurrentEDRHeadroom:", v41);
      if (!-[CBAODState isAODActive](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODActive"))
      {
        LODWORD(v42) = *((_DWORD *)v313 + 61);
        v43 = *((_QWORD *)v313 + 33);
        v298 = 0x1EF0FB000uLL;
        objc_msgSend(*(id *)(v43 + 56), "setNits:", v42);
        LODWORD(v44) = *((_DWORD *)v313 + 61);
        v45 = *((_QWORD *)v313 + 33);
        v299 = 0x1EF0FB000uLL;
        objc_msgSend(*(id *)(v45 + 64), "setNits:", v44);
        objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 56), "updateRamp");
        objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 64), "updateRamp");
      }
      if (!-[CBAODState isAODActive](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODActive"))
      {
        v47 = *((_QWORD *)v313 + 33);
        v297 = 0x1EF0FB000uLL;
        LODWORD(v46) = *((_DWORD *)v313 + 61);
        objc_msgSend(*(id *)(v47 + 72), "setSdrBrightness:", v46);
        objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 72), "updateRamp");
      }
      LODWORD(v46) = *(_DWORD *)(*((_QWORD *)v313 + 33) + 144);
      objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 136), "setCurrentHeadroom:", v46);
      v48 = v313;
      *((_DWORD *)v313 + 47) = 0;
      if ((*(_BYTE *)(*((_QWORD *)v48 + 33) + 152) & 1) != 0)
      {
        *((_DWORD *)v313 + 47) = *((_DWORD *)v313 + 59);
      }
      else if ((objc_msgSend(*((id *)v313 + 33), "shouldForceCapRamp") & 1) != 0)
      {
        v49 = v313;
        *(float *)(*((_QWORD *)v313 + 33) + 116) = fminf((float)(*(float *)(*((_QWORD *)v313 + 33) + 108)* *(float *)(*((_QWORD *)v313 + 33) + 144))* *(float *)(*((_QWORD *)v313 + 33) + 180), *((float *)v313 + 48));
        *((_DWORD *)v49 + 47) = *(_DWORD *)(*((_QWORD *)v49 + 33) + 116);
        DisplayClockCapRamp(*(_QWORD *)(*((_QWORD *)v49 + 33) + 280));
        *(_BYTE *)(*((_QWORD *)v313 + 33) + 120) = 1;
      }
      else if ((*(_BYTE *)(*((_QWORD *)v313 + 33) + 120) & 1) != 0)
      {
        if ((float)(*(float *)(*((_QWORD *)v313 + 33) + 116) - 10.0) <= *(float *)(*((_QWORD *)v313 + 33) + 112)
          || *(_QWORD *)(*((_QWORD *)v313 + 33) + 168) == 1)
        {
          DisplayStopCapRamp(*(_QWORD *)(*((_QWORD *)v313 + 33) + 280));
          v50 = v313;
          *((float *)v313 + 47) = fmaxf(*(float *)(*((_QWORD *)v313 + 33) + 112), *(float *)(*((_QWORD *)v313 + 33) + 116) - 10.0);
          *(_BYTE *)(*((_QWORD *)v50 + 33) + 120) = 0;
        }
        else
        {
          v51 = v313;
          *((float *)v313 + 47) = *(float *)(*((_QWORD *)v313 + 33) + 116) - 10.0;
          *(float *)(*((_QWORD *)v51 + 33) + 116) = *(float *)(*((_QWORD *)v51 + 33) + 116) - 10.0;
        }
      }
      else
      {
        *((float *)v313 + 47) = fminf(*((float *)v313 + 59), fmaxf(*(float *)(*((_QWORD *)v313 + 33) + 112), fminf((float)(*(float *)(*((_QWORD *)v313 + 33) + 108)* *(float *)(*((_QWORD *)v313 + 33) + 144))* *(float *)(*((_QWORD *)v313 + 33) + 180), *((float *)v313 + 48))));
      }
      if (objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 288), "rtplc"))
      {
        v53 = v313;
        *((_DWORD *)v313 + 46) = 0;
        *((float *)v53 + 46) = (float)(*(float *)(*((_QWORD *)v53 + 33) + 108)
                                     * *(float *)(*((_QWORD *)v53 + 33) + 144))
                             * *(float *)(*((_QWORD *)v53 + 33) + 180);
        *((_DWORD *)v53 + 45) = 0;
        *((float *)v53 + 45) = *((float *)v53 + 46) / *(float *)(*((_QWORD *)v53 + 33) + 108);
        if (*(_QWORD *)(*((_QWORD *)v53 + 33) + 224) == 2)
        {
          v54 = v313;
          *((_QWORD *)v313 + 21) = 0;
          if (*(_QWORD *)(*((_QWORD *)v54 + 33) + 16))
          {
            v296 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v295 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v295 = init_default_corebrightness_log();
            v296 = v295;
          }
          v55 = v313;
          *((_QWORD *)v313 + 21) = v296;
          v346 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(*((os_log_t *)v55 + 21), OS_LOG_TYPE_DEBUG))
          {
            v292 = (os_log_t)*((_QWORD *)v313 + 21);
            *(_DWORD *)v293 = v346;
            *(double *)&v56 = *((float *)v313 + 46);
            *(double *)&v57 = *((float *)v313 + 45);
            *(double *)&v58 = *((float *)v313 + 60);
            *(double *)&v59 = *(float *)(*((_QWORD *)v313 + 33) + 148);
            *(double *)&v60 = *(float *)(*((_QWORD *)v313 + 33) + 216);
            v294 = v362;
            __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v362, v56, v57, v58, v59, v60);
            _os_log_debug_impl(&dword_1B5291000, v292, v293[0], "HDR RTPLC RECOVERY: hdrBrightness = %f, hdrHeadroom = %f, currentHeadroom = %f, _requestedHeadroom = %f, rtplcCap = %f", v362, 0x34u);
          }
          if (*((float *)v313 + 46) < *(float *)(*((_QWORD *)v313 + 33) + 100))
          {
            if (*((float *)v313 + 45) >= *(float *)(*((_QWORD *)v313 + 33) + 148)
              && *((float *)v313 + 46) < *(float *)(*((_QWORD *)v313 + 33) + 216)
              && *((float *)v313 + 60) <= *((float *)v313 + 45))
            {
              v63 = v313;
              *((_QWORD *)v313 + 17) = 0;
              if (*(_QWORD *)(*((_QWORD *)v63 + 33) + 16))
              {
                v286 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v285 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v285 = init_default_corebrightness_log();
                v286 = v285;
              }
              v64 = v313;
              *((_QWORD *)v313 + 17) = v286;
              v343 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(*((os_log_t *)v64 + 17), OS_LOG_TYPE_DEFAULT))
              {
                v282 = (os_log_t)*((_QWORD *)v313 + 17);
                *(_DWORD *)v283 = v343;
                *(double *)&v65 = *(float *)(*((_QWORD *)v313 + 33) + 216);
                *(double *)&v66 = *(float *)(*((_QWORD *)v313 + 33) + 100);
                v284 = v361;
                __os_log_helper_16_0_2_8_0_8_0((uint64_t)v361, v65, v66);
                _os_log_impl(&dword_1B5291000, v282, v283[0], "HDR RTPLC RECOVERY COMPLETE -> EXITING RTPLC: ramp cap: %f --> %f", v361, 0x16u);
              }
              objc_msgSend(*((id *)v313 + 33), "deleteAPCEMonitor");
              v67 = v313;
              *(_QWORD *)(*((_QWORD *)v313 + 33) + 224) = 3;
              DisplayStartRTPLCEDRCapRamp(*(_QWORD *)(*((_QWORD *)v67 + 33) + 280), 0, *(float *)(*((_QWORD *)v67 + 33) + 216), *(float *)(*((_QWORD *)v67 + 33) + 100), 4.0);
            }
          }
          else
          {
            v61 = v313;
            *(_DWORD *)(*((_QWORD *)v313 + 33) + 216) = *(_DWORD *)(*((_QWORD *)v313 + 33) + 100);
            *(_QWORD *)(*((_QWORD *)v61 + 33) + 224) = 0;
            *((_QWORD *)v61 + 19) = 0;
            if (*(_QWORD *)(*((_QWORD *)v61 + 33) + 16))
            {
              v291 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v290 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v290 = init_default_corebrightness_log();
              v291 = v290;
            }
            v62 = v313;
            *((_QWORD *)v313 + 19) = v291;
            v345 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(*((os_log_t *)v62 + 19), OS_LOG_TYPE_DEFAULT))
            {
              v287 = (os_log_t)*((_QWORD *)v313 + 19);
              *(_DWORD *)v288 = v345;
              v289 = v344;
              __os_log_helper_16_0_0(v344);
              _os_log_impl(&dword_1B5291000, v287, v288[0], "HDR RTPLC RECOVERY COMPLETE!!", v344, 2u);
            }
            objc_msgSend(*((id *)v313 + 33), "deleteAPCEMonitor");
          }
        }
        else if (*(_QWORD *)(*((_QWORD *)v313 + 33) + 224) == 1)
        {
          v68 = v313;
          *((_QWORD *)v313 + 15) = 0;
          if (*(_QWORD *)(*((_QWORD *)v68 + 33) + 16))
          {
            v281 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v280 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v280 = init_default_corebrightness_log();
            v281 = v280;
          }
          v69 = v313;
          *((_QWORD *)v313 + 15) = v281;
          v342 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(*((os_log_t *)v69 + 15), OS_LOG_TYPE_DEBUG))
          {
            v277 = (os_log_t)*((_QWORD *)v313 + 15);
            *(_DWORD *)v278 = v342;
            *(double *)&v70 = *((float *)v313 + 46);
            *(double *)&v71 = *(float *)(*((_QWORD *)v313 + 33) + 216);
            *(double *)&v72 = *((float *)v313 + 45);
            *(double *)&v73 = *((float *)v313 + 60);
            *(double *)&v74 = *(float *)(*((_QWORD *)v313 + 33) + 148);
            v279 = v360;
            __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v360, v70, v71, v72, v73, v74);
            _os_log_debug_impl(&dword_1B5291000, v277, v278[0], "HDR RTPLC ACTION: hdrBrightness = %f, rtplcCap = %f, hdrHeadroom = %f, currentHeadroom = %f, _requestedHeadroom = %f", v360, 0x34u);
          }
          if (float_equal(*(float *)(*((_QWORD *)v313 + 33) + 148), 1.0)
            && *((float *)v313 + 46) < *(float *)(*((_QWORD *)v313 + 33) + 216))
          {
            v75 = v313;
            *(_BYTE *)(*((_QWORD *)v313 + 33) + 208) = 0;
            *((_QWORD *)v75 + 13) = 0;
            if (*(_QWORD *)(*((_QWORD *)v75 + 33) + 16))
            {
              v276 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v275 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v275 = init_default_corebrightness_log();
              v276 = v275;
            }
            v76 = v313;
            *((_QWORD *)v313 + 13) = v276;
            v341 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(*((os_log_t *)v76 + 13), OS_LOG_TYPE_DEFAULT))
            {
              v272 = (os_log_t)*((_QWORD *)v313 + 13);
              *(_DWORD *)v273 = v341;
              *(double *)&v77 = *(float *)(*((_QWORD *)v313 + 33) + 216);
              *(double *)&v78 = *(float *)(*((_QWORD *)v313 + 33) + 100);
              v274 = v359;
              __os_log_helper_16_0_2_8_0_8_0((uint64_t)v359, v77, v78);
              _os_log_impl(&dword_1B5291000, v272, v273[0], "HDR RTPLC RELEASED AND RECOVERY COMPLETE -> EXITING RTPLC: ramp cap: %f --> %f", v359, 0x16u);
            }
            objc_msgSend(*((id *)v313 + 33), "deleteAPCEMonitor");
            v79 = v313;
            *(_QWORD *)(*((_QWORD *)v313 + 33) + 224) = 3;
            DisplayStartRTPLCEDRCapRamp(*(_QWORD *)(*((_QWORD *)v79 + 33) + 280), 0, *(float *)(*((_QWORD *)v79 + 33) + 216), *(float *)(*((_QWORD *)v79 + 33) + 100), 4.0);
          }
        }
        else if (*(_QWORD *)(*((_QWORD *)v313 + 33) + 224) == 3)
        {
          v80 = v313;
          *((_QWORD *)v313 + 11) = 0;
          if (*(_QWORD *)(*((_QWORD *)v80 + 33) + 16))
          {
            v271 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v270 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v270 = init_default_corebrightness_log();
            v271 = v270;
          }
          v81 = v313;
          *((_QWORD *)v313 + 11) = v271;
          v340 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(*((os_log_t *)v81 + 11), OS_LOG_TYPE_DEBUG))
          {
            v267 = (os_log_t)*((_QWORD *)v313 + 11);
            *(_DWORD *)v268 = v340;
            *(double *)&v82 = *(float *)(*((_QWORD *)v313 + 33) + 216);
            *(double *)&v83 = *(float *)(*((_QWORD *)v313 + 33) + 100);
            v269 = v358;
            __os_log_helper_16_0_2_8_0_8_0((uint64_t)v358, v82, v83);
            _os_log_debug_impl(&dword_1B5291000, v267, v268[0], "HDR RTPLC EXIT: _rtplcCap = %f (_maxNitsEDR = %f)", v358, 0x16u);
          }
          if (float_equal(*(float *)(*((_QWORD *)v313 + 33) + 216), *(float *)(*((_QWORD *)v313 + 33) + 100)))
          {
            v84 = v313;
            *((_QWORD *)v313 + 9) = 0;
            if (*(_QWORD *)(*((_QWORD *)v84 + 33) + 16))
            {
              v266 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v265 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v265 = init_default_corebrightness_log();
              v266 = v265;
            }
            v85 = v313;
            *((_QWORD *)v313 + 9) = v266;
            v339 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(*((os_log_t *)v85 + 9), OS_LOG_TYPE_DEFAULT))
            {
              v262 = (os_log_t)*((_QWORD *)v313 + 9);
              *(_DWORD *)v263 = v339;
              v264 = v338;
              __os_log_helper_16_0_0(v338);
              _os_log_impl(&dword_1B5291000, v262, v263[0], "RTPLC EXIT COMPLETE!!", v338, 2u);
            }
            *(_QWORD *)(*((_QWORD *)v313 + 33) + 224) = 0;
          }
        }
        if (float_equal(*(float *)(*((_QWORD *)v313 + 33) + 144), 1.0))
        {
          v86 = v313;
          *(_DWORD *)(*((_QWORD *)v313 + 33) + 216) = *(_DWORD *)(*((_QWORD *)v313 + 33) + 100);
          *(_QWORD *)(*((_QWORD *)v86 + 33) + 224) = 0;
        }
      }
      LODWORD(v52) = *((_DWORD *)v313 + 60);
      objc_msgSend(*((id *)v313 + 33), "updateEDRStateForEvent:andHeadroom:", 4, v52);
      if (!-[CBAODState isAODActive](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODActive"))
      {
        v87 = v313;
        *((_QWORD *)v313 + 7) = 0;
        if (*(_QWORD *)(*((_QWORD *)v87 + 33) + 16))
        {
          v261 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v260 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v260 = init_default_corebrightness_log();
          v261 = v260;
        }
        v88 = v313;
        *((_QWORD *)v313 + 7) = v261;
        v337 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(*((os_log_t *)v88 + 7), OS_LOG_TYPE_DEFAULT))
        {
          v257 = (os_log_t)*((_QWORD *)v313 + 7);
          *(_DWORD *)v258 = v337;
          *(double *)&v251 = *((float *)v313 + 61);
          v89 = *((_QWORD *)v313 + 33);
          v250 = 0x1EF0FB000uLL;
          *(double *)&v252 = *(float *)(v89 + 144);
          *(double *)&v253 = *((float *)v313 + 47);
          objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 128), "maxHeadroom");
          *(double *)&v254 = v90;
          *(double *)&v255 = *(float *)(*((_QWORD *)v313 + 33) + 32);
          *(double *)&v256 = (float)(*((float *)v313 + 61) * *(float *)(*((_QWORD *)v313 + 33) + 144));
          v91 = objc_msgSend(*((id *)v313 + 33), "rtplcStateToString:", *(_QWORD *)(*((_QWORD *)v313 + 33) + 224));
          *(double *)v196 = *(float *)(*((_QWORD *)v313 + 33) + 216);
          v259 = v357;
          __os_log_helper_16_2_8_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_0((uint64_t)v357, v251, v252, v253, v254, v255, v256, v91, v196[0]);
          _os_log_impl(&dword_1B5291000, v257, v258[0], "Pushing sdrBrightness: %f, capped _appliedHeadroom: %f, brightnessLimit: %f, potentialHeadroom: %f, Ambient: %f to CA, HDRBrightness: %f, [%s] rtplcCap: %f", v357, 0x52u);
        }
        v92 = v313;
        *((_QWORD *)v313 + 5) = 0;
        v93 = (_QWORD *)(*((_QWORD *)v92 + 33) + 232);
        v94 = (*v93)++;
        *((_QWORD *)v92 + 5) = v94;
        *((_DWORD *)v92 + 9) = 0;
        *((_DWORD *)v92 + 9) = 2143289344;
        v249 = objc_msgSend(*((id *)v92 + 31), "objectForKey:", CFSTR("ContrastEnhancerStrength"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)objc_msgSend(*((id *)v313 + 31), "objectForKey:", CFSTR("ContrastEnhancerStrength")), "floatValue");
          *((_DWORD *)v313 + 9) = v95;
        }
        v96 = v313;
        *((_DWORD *)v313 + 8) = 0;
        *((_DWORD *)v96 + 8) = 2143289344;
        if (*(_QWORD *)(*((_QWORD *)v96 + 33) + 56))
        {
          objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 56), "currentStrength");
          *((_DWORD *)v313 + 8) = v97;
        }
        v98 = v313;
        *((_DWORD *)v313 + 7) = 0;
        *((_DWORD *)v98 + 7) = 2143289344;
        if (*(_QWORD *)(*((_QWORD *)v98 + 33) + 64))
        {
          objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 64), "currentStrength");
          *((_DWORD *)v313 + 7) = v99;
        }
        v100 = v313;
        *((_DWORD *)v313 + 6) = 0;
        *((_DWORD *)v100 + 6) = 2143289344;
        if (*(_QWORD *)(*((_QWORD *)v100 + 33) + 72)
          && (CBU_IsSecureIndicatorSupported() & 1) != 0
          && (objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 72), "shouldPushIndicatorBrightness") & 1) != 0)
        {
          objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 72), "currentIndicatorBrightness");
          *((_DWORD *)v313 + 6) = v101;
        }
        v102 = v313;
        *((_QWORD *)v313 + 2) = 0;
        if (*(_QWORD *)(*((_QWORD *)v102 + 33) + 16))
        {
          v248 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v247 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v247 = init_default_corebrightness_log();
          v248 = v247;
        }
        v103 = v313;
        *((_QWORD *)v313 + 2) = v248;
        v336 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(*((os_log_t *)v103 + 2), OS_LOG_TYPE_DEFAULT))
        {
          v244 = (os_log_t)*((_QWORD *)v313 + 2);
          *(_DWORD *)v245 = v336;
          v236 = *((_QWORD *)v313 + 5);
          *(double *)&v237 = *((float *)v313 + 61);
          v105 = *((_QWORD *)v313 + 33);
          v106 = *(float *)(v105 + 108);
          v224 = 0x1EF0FB000uLL;
          *(double *)&v238 = (float)(v106 * *(float *)(v105 + 144));
          v239 = objc_msgSend(*((id *)v313 + 33), "edrStateToString:", *(_QWORD *)(*((_QWORD *)v313 + 33) + 168));
          *(double *)&v240 = *((float *)v313 + 47);
          *(double *)&v241 = *((float *)v313 + 6);
          *(double *)&v242 = *(float *)(*((_QWORD *)v313 + 33) + 144);
          objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 128), "maxHeadroom");
          *(double *)&v228 = v107;
          *(double *)&v229 = *(float *)(*((_QWORD *)v313 + 33) + 180);
          v108 = *((_QWORD *)v313 + 33);
          v225 = 0x1EF0FB000uLL;
          objc_msgSend(*(id *)(v108 + 48), "currentScaler");
          *(double *)&v230 = v109;
          v110 = objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 48), "rampInProgress");
          v226 = "NO";
          v111 = "YES";
          v227 = "YES";
          if ((v110 & 1) == 0)
            v111 = "NO";
          v231 = v111;
          *(double *)&v232 = *(float *)(*((_QWORD *)v313 + 33) + 32);
          v112 = objc_msgSend(*((id *)v313 + 33), "rtplcStateToString:", *(_QWORD *)(*((_QWORD *)v313 + 33) + 224));
          v113 = (uint64_t)v227;
          v233 = v112;
          *(double *)&v234 = *(float *)(*((_QWORD *)v313 + 33) + 216);
          if ((*(_BYTE *)(*((_QWORD *)v313 + 33) + 208) & 1) == 0)
            v113 = (uint64_t)v226;
          v235 = v113;
          objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 248), "getPeakAPCE");
          *(double *)&v114 = *((float *)v313 + 59);
          *(double *)&v115 = *(float *)(*((_QWORD *)v313 + 33) + 112);
          *(double *)&v116 = *((float *)v313 + 8);
          *(double *)&v117 = *((float *)v313 + 7);
          *(double *)&v118 = *((float *)v313 + 9);
          v243 = v196;
          v246 = v356;
          __os_log_helper_16_2_21_8_0_8_0_8_0_8_32_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v356, v236, v237, v238, v239, v240, v241, v242, v228, v229, v230, (uint64_t)v231, v232, v233, v234, v235, COERCE__INT64(v119), v114, v115,
            v116,
            v117,
            v118);
          _os_log_impl(&dword_1B5291000, v244, v245[0], "SyncDBV Transaction | ID=%llu SDR.Nits=%.0f HDR.Nits=%.0f HDR.State=%s BrightnessLimit=%f IndicatorBrightness.Nits=%.0f Headroom.Current=%f Headroom.Maximum=%f AppliedCompensations=%f Aurora.Factor=%f Aurora.RampInProgress=%s Lux=%.0f RTPLC.State=%s RTPLC.Cap=%.0f RTPLC.CapApplied=%s PeakAPCE.Cap=%f Nits.Cap=%f DynamicSlider.Cap=%f Twilight.Strength=%f Ammolite.Strength=%f ContrastEnhancer.Strength=%f", v246, 0xD4u);
        }
        v120 = *((_QWORD *)v313 + 33);
        v223 = 0x1EF0FB000uLL;
        LODWORD(v104) = *((_DWORD *)v313 + 61);
        objc_msgSend(*(id *)(v120 + 40), "setSDRBrightness:", v104);
        v222 = *(id *)(*((_QWORD *)v313 + 33) + *(int *)(v223 + 1928));
        objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 128), "maxHeadroom");
        objc_msgSend(v222, "setPotentialHeadroom:");
        LODWORD(v121) = *(_DWORD *)(*((_QWORD *)v313 + 33) + 144);
        objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + *(int *)(v223 + 1928)), "setHeadroom:", v121);
        LODWORD(v122) = *(_DWORD *)(*((_QWORD *)v313 + 33) + 32);
        objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + *(int *)(v223 + 1928)), "setAmbient:", v122);
        LODWORD(v123) = *((_DWORD *)v313 + 47);
        objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + *(int *)(v223 + 1928)), "setBrightnessLimit:", v123);
        if ((std::__math::isnan[abi:ne180100]() & 1) == 0)
        {
          LODWORD(v124) = *((_DWORD *)v313 + 9);
          objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 40), "setContrastEnhancer:", v124);
        }
        if ((std::__math::isnan[abi:ne180100]() & 1) == 0)
        {
          LODWORD(v125) = *((_DWORD *)v313 + 8);
          objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 40), "setLowAmbientAdaptation:", v125);
        }
        if ((std::__math::isnan[abi:ne180100]() & 1) == 0)
        {
          LODWORD(v126) = *((_DWORD *)v313 + 7);
          objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 40), "setHighAmbientAdaptation:", v126);
        }
        if ((std::__math::isnan[abi:ne180100]() & 1) != 0)
        {
          LODWORD(v127) = *((_DWORD *)v313 + 6);
          v132 = objc_msgSend(*(id *)(*((_QWORD *)v313 + 33) + 40), "setIndicatorBrightness:", v127);
        }
        else
        {
          v128 = v313;
          *((_DWORD *)v313 + 2) = 0;
          *((_DWORD *)v128 + 2) = *((_DWORD *)v128 + 6);
          v129 = std::__math::fmax[abi:ne180100](*((float *)v128 + 2), *((float *)v128 + 61));
          v130 = v313;
          *((float *)v313 + 2) = v129;
          LODWORD(v131) = *((_DWORD *)v130 + 2);
          v132 = objc_msgSend(*(id *)(*((_QWORD *)v130 + 33) + 40), "setIndicatorBrightness:", v131);
        }
        v133 = v313;
        v213 = v335;
        *(_QWORD *)v313 = 0;
        *(_QWORD *)v133 = 0;
        context = (void *)MEMORY[0x1B5E4A8B0](v132);
        v211 = *(id *)(*((_QWORD *)v313 + 33) + 240);
        v215 = 0x1E0CB3000uLL;
        v209 = (id)MEMORY[0x1E0CB37E8];
        *(float *)&v134 = mach_time_now_in_milliseconds();
        v210 = objc_msgSend(v209, "numberWithFloat:", v134);
        v135 = objc_msgSend(*(id *)(v215 + 2024), "numberWithUnsignedLongLong:", *((_QWORD *)v313 + 5));
        objc_msgSend(v211, "setObject:forKey:", v210, v135);
        objc_autoreleasePoolPop(context);
        v334 = 0;
        v136 = *(void **)(*((_QWORD *)v313 + 33) + 40);
        v327 = MEMORY[0x1E0C809B0];
        v328 = -1073741824;
        v329 = 0;
        v330 = __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke;
        v331 = &unk_1E68EA040;
        v332 = *((_QWORD *)v313 + 33);
        v333 = *((_QWORD *)v313 + 5);
        v137 = objc_msgSend(v136, "commitBrightness:withBlock:", v213, &v327);
        v221 = 1;
        v334 = v137 & 1;
        v138 = (void *)MEMORY[0x1B5E4A8B0]();
        v139 = v215;
        v140 = v313;
        v220 = v138;
        v326 = 0;
        v218 = &v354;
        *((_QWORD *)v313 + 38) = CFSTR("SDR.Nits");
        LODWORD(v141) = *((_DWORD *)v140 + 61);
        v142 = objc_msgSend(*(id *)(v139 + 2024), "numberWithFloat:", v141);
        v143 = v215;
        v144 = v313;
        v217 = &v355;
        *((_QWORD *)v313 + 49) = v142;
        *((_QWORD *)v144 + 39) = CFSTR("HDR.Nits");
        v145 = *(void **)(v143 + 2024);
        v146 = *(float *)(*((_QWORD *)v144 + 33) + 108);
        v147 = *((_QWORD *)v144 + 33);
        v214 = 0x1EF0FB000uLL;
        *(float *)&v148 = v146 * *(float *)(v147 + 144);
        v149 = objc_msgSend(v145, "numberWithFloat:", v148);
        v150 = v214;
        v151 = v215;
        v152 = v313;
        *((_QWORD *)v313 + 50) = v149;
        *((_QWORD *)v152 + 40) = CFSTR("HDR.Headroom");
        LODWORD(v153) = *(_DWORD *)(*((_QWORD *)v152 + 33) + *(int *)(v150 + 2000));
        v154 = objc_msgSend(*(id *)(v151 + 2024), "numberWithFloat:", v153);
        v155 = v215;
        v156 = v313;
        *((_QWORD *)v313 + 51) = v154;
        *((_QWORD *)v156 + 41) = CFSTR("BrightnessLimit");
        LODWORD(v157) = *((_DWORD *)v156 + 47);
        v158 = objc_msgSend(*(id *)(v155 + 2024), "numberWithFloat:", v157);
        v159 = v215;
        v160 = v313;
        *((_QWORD *)v313 + 52) = v158;
        *((_QWORD *)v160 + 42) = CFSTR("Lux");
        LODWORD(v161) = *(_DWORD *)(*((_QWORD *)v160 + 33) + 32);
        v162 = objc_msgSend(*(id *)(v159 + 2024), "numberWithFloat:", v161);
        v163 = v215;
        v164 = v313;
        *((_QWORD *)v313 + 53) = v162;
        *((_QWORD *)v164 + 43) = CFSTR("Twilight.Strength");
        LODWORD(v165) = *((_DWORD *)v164 + 8);
        v166 = objc_msgSend(*(id *)(v163 + 2024), "numberWithFloat:", v165);
        v167 = v215;
        v168 = v313;
        *((_QWORD *)v313 + 54) = v166;
        *((_QWORD *)v168 + 44) = CFSTR("Ammolite.Strength");
        LODWORD(v169) = *((_DWORD *)v168 + 7);
        v170 = objc_msgSend(*(id *)(v167 + 2024), "numberWithFloat:", v169);
        v171 = v215;
        v172 = v313;
        *((_QWORD *)v313 + 55) = v170;
        *((_QWORD *)v172 + 45) = CFSTR("IndicatorBrightness.Nits");
        LODWORD(v173) = *((_DWORD *)v172 + 6);
        v174 = objc_msgSend(*(id *)(v171 + 2024), "numberWithFloat:", v173);
        v175 = v215;
        v176 = v313;
        *((_QWORD *)v313 + 56) = v174;
        *((_QWORD *)v176 + 46) = CFSTR("ContrastEnhancer.Strength");
        LODWORD(v177) = *((_DWORD *)v176 + 9);
        v178 = objc_msgSend(*(id *)(v175 + 2024), "numberWithFloat:", v177);
        v179 = v215;
        v180 = v313;
        *((_QWORD *)v313 + 57) = v178;
        *((_QWORD *)v180 + 47) = CFSTR("Aurora.Factor");
        v216 = *(id *)(v179 + 2024);
        objc_msgSend(*(id *)(*((_QWORD *)v180 + 33) + 48), "currentScaler");
        v181 = objc_msgSend(v216, "numberWithFloat:");
        v182 = v217;
        v183 = v218;
        v184 = v313;
        *((_QWORD *)v313 + 58) = v181;
        *((_QWORD *)v184 + 48) = CFSTR("Result");
        v185 = CFSTR("Success");
        if ((v334 & 1) == 0)
          v185 = CFSTR("Error");
        *((_QWORD *)v184 + 59) = v185;
        v326 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v182, v183, 11);
        v186 = *(_QWORD *)(*((_QWORD *)v313 + 33) + 280);
        v219 = CFSTR("BrightnessTransaction");
        _DisplaySetInternalDictionaryProperty(v186, (uint64_t)CFSTR("BrightnessTransaction"), v326);
        objc_msgSend(*((id *)v313 + 33), "sendNotificationForKey:withValue:", v219, v326);
        objc_autoreleasePoolPop(v220);
        v325 = 0;
        v325 = (*((float *)v313 + 61) < 100.0) & v221;
        if ((*(_BYTE *)(*((_QWORD *)v313 + 33) + 272) & 1) != (v325 & 1))
        {
          v187 = v313;
          *(_BYTE *)(*((_QWORD *)v313 + 33) + 272) = v325 & 1;
          v208 = (id)*((_QWORD *)v187 + 33);
          v188 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*((_QWORD *)v187 + 33) + 272) & 1);
          objc_msgSend(v208, "sendNotificationForKey:withValue:", CFSTR("CBBrightnessIsUnderAutoDimThreshold"), v188);
        }
        if ((v334 & 1) != 0)
        {
          objc_msgSend(*((id *)v313 + 33), "sendNotificationForKey:withValue:", CFSTR("CBCACommit"), *((_QWORD *)v313 + 31));
        }
        else
        {
          oslog = 0;
          if (*(_QWORD *)(*((_QWORD *)v313 + 33) + 16))
          {
            v207 = *(os_log_t *)(*((_QWORD *)v313 + 33) + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v206 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v206 = init_default_corebrightness_log();
            v207 = v206;
          }
          oslog = v207;
          v323 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
          {
            v203 = oslog;
            *(_DWORD *)v204 = v323;
            v189 = *(_QWORD *)v313;
            v205 = v353;
            __os_log_helper_16_2_1_8_64((uint64_t)v353, v189);
            _os_log_error_impl(&dword_1B5291000, v203, v204[0], "ERROR COMMITING BRIGHTNESS FROM CA!!!!!!! (%@)", v205, 0xCu);
          }
        }
      }
      if (*(float *)(*((_QWORD *)v313 + 33) + 108) > 0.0)
      {
        v190 = *((_QWORD *)v313 + 33);
        v200 = 0x1EF0FB000uLL;
        v191 = *(void **)(v190 + 264);
        v317 = MEMORY[0x1E0C809B0];
        v318 = -1073741824;
        v319 = 0;
        v320 = __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke_202;
        v321 = &unk_1E68EA068;
        v322 = *((_QWORD *)v313 + 33);
        objc_msgSend(v191, "enumerateObjectsUsingBlock:", &v317);

        v192 = v313;
        v193 = *((_QWORD *)v313 + 33);
        v194 = *(int *)(v200 + 2068);
        v202 = 0;
        *(_QWORD *)(v193 + v194) = 0;
        v195 = *((_QWORD *)v192 + 33);
        v201 = 0x1EF0FB000uLL;

        *(_QWORD *)(*((_QWORD *)v313 + 33) + *(int *)(v201 + 2072)) = v202;
      }
    }
  }
}

- (const)rtplcStateToString:(unint64_t)a3
{
  if (a3 <= 3)
    __asm { BR              X8 }
  return "Unknown";
}

- (void)updateEDRStateForEvent:(unint64_t)a3 andHeadroom:(float)a4
{
  if (a3 <= 4)
    __asm { BR              X8 }
}

- (const)edrStateToString:(unint64_t)a3
{
  if (a3 <= 3)
    __asm { BR              X8 }
  return "Unknown";
}

- (id)copyPropertyForKey:(id)a3
{
  return -[CBDisplayModuleiOS copyPropertyInternalForKey:](self, "copyPropertyInternalForKey:", a3);
}

- (id)copyPropertyInternalForKey:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  BOOL v7;
  uint64_t inited;
  NSObject *logHandle;
  id v10;
  CBTwilight *v11;
  uint8_t v15[32];
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Copy property for key = %@", v16, 0xCu);
  }
  v11 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("StatusInfo")) & 1) != 0)
  {
    v10 = +[CBStatusInfoHelper copyStatusInfoFor:](CBStatusInfoHelper, "copyStatusInfoFor:", self);
    if (v10)
      v11 = (CBTwilight *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("CBDisplayModuleiOS"), 0);

LABEL_27:
    if (self->super.super._logHandle)
    {
      v5 = self->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v4 = init_default_corebrightness_log();
      v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)a3, (uint64_t)v11);
      _os_log_debug_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEBUG, "key=%@ result=%@", v15, 0x16u);
    }
    return v11;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBBrightnessControlAvailable")) & 1) == 0)
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBBrightnessIsUnderAutoDimThreshold")) & 1) != 0)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_brightnessIsUnderAutoDimThresholdCurrentValue);
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TwilightModule")) & 1) != 0)
    {
      v11 = self->_twilight;
    }
    else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AmmoliteModule")) & 1) != 0)
    {
      v11 = self->_ammolite;
    }
    else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IndicatorModule")) & 1) != 0)
    {
      v11 = self->_indicatorBrightnessModule;
    }
    else
    {
      v11 = -[CBIndicatorBrightnessModule copyPropertyForKey:](self->_indicatorBrightnessModule, "copyPropertyForKey:", a3);
      if (!v11)
        v11 = (CBTwilight *)DisplayCopyProperty((uint64_t)self->_displayInternal, (uint64_t)a3);
    }
    goto LABEL_27;
  }
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v7 = 0;
  if (self->_brightnessControlEnabled)
    v7 = !self->_dominoMode;
  return (id)objc_msgSend(v6, "initWithBool:", v7);
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super.super._notificationBlock)
    (*((void (**)(void))self->super.super._notificationBlock + 2))();
}

void __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *context;
  uint64_t block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2;
  v14 = a1;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v2 = v15;
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke_2;
  v10 = &unk_1E68EA018;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v12 = v15;
  dispatch_async(v3, &block);
  objc_autoreleasePoolPop(context);
}

- (BOOL)shouldForceCapRamp
{
  const char *v2;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v6;
  BOOL v7;
  float v8;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = -(float)(self->_dynSliderCap - (float)((float)(self->_nitsSDR * self->_appliedHeadroom) * self->_appliedComp));
  v7 = 0;
  if (self->_appliedComp > 1.0)
  {
    v7 = 0;
    if (self->_edrState == 3)
    {
      v7 = 0;
      if (float_equal(self->_appliedHeadroom, self->_requestedHeadroom))
      {
        v6 = 1;
        if (!float_equal(self->_dynSliderCap, self->_nitsSDR))
          v6 = v8 >= 30.0;
        v7 = v6;
      }
    }
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
    if (v7)
      v2 = "YES";
    else
      v2 = "NO";
    __os_log_helper_16_2_2_8_0_8_32((uint64_t)v10, self->_edrState, (uint64_t)v2);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "HDR | _edrState: %lu, forceRamp: %s", v10, 0x16u);
  }
  return v7;
}

void __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke_2(uint64_t a1)
{
  float v1;
  uint64_t v2;
  float v3;
  uint64_t inited;
  NSObject *v5;
  void *v7;
  void *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48)));
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CD29B8]);
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = mach_time_to_milliseconds(objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v8, "floatValue");
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v9, v2, COERCE__INT64((float)(v3 - v1)));
    _os_log_debug_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEBUG, "SyncDBV Telemetry | Transaction.ID=%llu Latency=%.0fms", v9, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48)));

}

- (void)updateBDMWithLux:(float)a3
{
  int v3;
  double v4;
  double v5;
  double v6;
  float v7;
  uint64_t inited;
  NSObject *logHandle;
  float v10;
  int v11;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_displayRequiresBDM
    && !self->_referenceModeIsActive
    && -[CBDisplayModuleiOS luxHasCrossedBDMThreshold:](self, "luxHasCrossedBDMThreshold:", *(double *)&a3))
  {
    DisplaySetCurrentEDRHeadroom((uint64_t)self->_displayInternal, self->_appliedHeadroom);
    -[CBEDR secondsPerStop](self->_edr, "secondsPerStop");
    v11 = v3;
    *(float *)&v4 = self->_appliedHeadroom;
    *(float *)&v5 = self->_requestedHeadroom;
    LODWORD(v6) = v11;
    +[CBEDR overallRampDuration:target:durationPerStop:](CBEDR, "overallRampDuration:target:durationPerStop:", v4, v5, v6);
    v10 = v7;
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v13, COERCE__INT64(v10));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Starting SBD (BDM) EDR ramp over %f seconds", v13, 0xCu);
    }
    DisplayStartFastEDRRamp((uint64_t)self->_displayInternal, self->_requestedHeadroom, v10);
  }
}

- (BOOL)luxHasCrossedBDMThreshold:(float)a3
{
  char v4;
  char v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v8 = 0;
  if (self->_bdmLux1 <= a3)
    v8 = a3 <= self->_bdmLux2;
  v7 = 0;
  if (self->_lastBDMLux > self->_bdmLux1)
    v7 = a3 < self->_bdmLux1;
  v6 = 0;
  if (self->_lastBDMLux < self->_bdmLux2)
    v6 = a3 > self->_bdmLux2;
  v5 = 0;
  if (a3 != self->_lastBDMLux)
  {
    v4 = 1;
    if (!v8)
    {
      v4 = 1;
      if (!v7)
        v4 = v6;
    }
    v5 = v4;
  }
  self->_lastBDMLux = a3;
  return v5 & 1;
}

- (CBDisplayModuleiOS)initWithBacklight:(unsigned int)a3 queue:(id)a4 display:(id)a5
{
  os_log_t v5;
  os_log_t v6;
  CFTypeRef v7;
  CFTypeRef v8;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *log;
  os_log_type_t type;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *inited;
  uint8_t v31[7];
  char v32;
  NSObject *v33;
  uint8_t v34[7];
  char v35;
  NSObject *v36;
  uint8_t v37[7];
  os_log_type_t v38;
  NSObject *v39;
  os_log_type_t v40;
  os_log_t v41;
  uint8_t v42[7];
  char v43;
  NSObject *v44;
  objc_super v45;
  uint8_t v46[7];
  char v47;
  NSObject *v48;
  id v49;
  id v50;
  unsigned int v51;
  SEL v52;
  id v53;
  uint8_t v55[8];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v53 = self;
  v52 = a2;
  v51 = a3;
  v50 = a4;
  v49 = a5;
  if (!a4 || !v51)
  {
    v48 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v48 = inited;
    v47 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      v28 = v48;
      v29 = v47;
      __os_log_helper_16_0_0(v46);
      _os_log_error_impl(&dword_1B5291000, v28, v29, "invalid arguments", v46, 2u);
    }
LABEL_60:

    v53 = 0;
    return 0;
  }
  v45.receiver = v53;
  v45.super_class = (Class)CBDisplayModuleiOS;
  v53 = -[CBModule initWithQueue:](&v45, sel_initWithQueue_, v50);
  if (v53)
  {
    *((_BYTE *)v53 + 272) = 0;
    *((_BYTE *)v53 + 176) = 1;
    *((_BYTE *)v53 + 186) = 0;
    *((_BYTE *)v53 + 185) = 0;
    if (v49)
    {
      v27 = (void *)MEMORY[0x1B5E4A8B0]();
      v5 = os_log_create("com.apple.CoreBrightness.ARMDisplay", (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v49, "displayId")), "UTF8String"));
      *((_QWORD *)v53 + 2) = v5;
      objc_autoreleasePoolPop(v27);
    }
    else
    {
      v6 = os_log_create("com.apple.CoreBrightness.ARMDisplay", "default");
      *((_QWORD *)v53 + 2) = v6;
    }
    if (!*((_QWORD *)v53 + 2))
    {
      v44 = 0;
      v26 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v44 = v26;
      v43 = 16;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        log = v44;
        type = v43;
        __os_log_helper_16_0_0(v42);
        _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v42, 2u);
      }
    }
    if (v49)
    {
      v41 = 0;
      if (*((_QWORD *)v53 + 2))
      {
        v23 = *((_QWORD *)v53 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v22 = init_default_corebrightness_log();
        v23 = v22;
      }
      v41 = v23;
      v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v55, objc_msgSend(v49, "displayId"));
        _os_log_impl(&dword_1B5291000, v41, v40, "create display with display ID (%u)", v55, 8u);
      }
      v7 = DisplayCreateWithID(*MEMORY[0x1E0C9AE00], v51, 0, objc_msgSend(v49, "displayId"));
      *((_QWORD *)v53 + 35) = v7;
    }
    else
    {
      v39 = 0;
      if (*((_QWORD *)v53 + 2))
      {
        v21 = *((_QWORD *)v53 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v20 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v20 = init_default_corebrightness_log();
        v21 = v20;
      }
      v39 = v21;
      v38 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v39;
        v19 = v38;
        __os_log_helper_16_0_0(v37);
        _os_log_impl(&dword_1B5291000, v18, v19, "create display without display ID", v37, 2u);
      }
      v8 = DisplayCreate(*MEMORY[0x1E0C9AE00], v51, 0);
      *((_QWORD *)v53 + 35) = v8;
    }
    if (!*((_QWORD *)v53 + 35))
    {
      v36 = 0;
      if (*((_QWORD *)v53 + 2))
      {
        v17 = *((_QWORD *)v53 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v16 = init_default_corebrightness_log();
        v17 = v16;
      }
      v36 = v17;
      v35 = 16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v14 = v36;
        v15 = v35;
        __os_log_helper_16_0_0(v34);
        _os_log_error_impl(&dword_1B5291000, v14, v15, "failed to create DisplayRef", v34, 2u);
      }
      goto LABEL_60;
    }
    if (!DisplayOpen(*((char **)v53 + 35), (uint64_t)DisplayRefPropertyChangedCallback, (uint64_t)v53))
    {
      v33 = 0;
      if (*((_QWORD *)v53 + 2))
      {
        v13 = *((_QWORD *)v53 + 2);
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
      v32 = 16;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v10 = v33;
        v11 = v32;
        __os_log_helper_16_0_0(v31);
        _os_log_error_impl(&dword_1B5291000, v10, v11, "failed to open the DisplayRef", v31, 2u);
      }
      goto LABEL_60;
    }
    DisplaySetProperty(*((_QWORD *)v53 + 35), (uint64_t)CFSTR("DisplayBrightnessAuto"), *MEMORY[0x1E0C9AE40]);
    *((_QWORD *)v53 + 5) = 0;
  }
  return (CBDisplayModuleiOS *)v53;
}

- (CBDisplayModuleiOS)initWithBacklight:(unsigned int)a3 queue:(id)a4 brtCtl:(id)a5
{
  id v5;
  id v6;
  os_log_t v7;
  CFTypeRef v8;
  CBBacklightNode *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  CBIndicatorBrightnessModule *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  NSObject *v27;
  CBAmmolite *v28;
  CBTwilight *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint8_t v42[7];
  os_log_type_t v43;
  os_log_t oslog;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t (*v48)(uint64_t, uint64_t, uint64_t);
  void *v49;
  id v50;
  id v51;
  id v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t (*v58)(uint64_t, uint64_t, uint64_t);
  void *v59;
  id v60;
  uint64_t v61;
  int v62;
  int v63;
  uint64_t (*v64)(uint64_t, uint64_t, uint64_t);
  void *v65;
  id v66;
  uint8_t v67[7];
  char v68;
  NSObject *v69;
  uint8_t v70[15];
  char v71;
  NSObject *v72;
  id v73;
  objc_super v74;
  uint8_t v75[7];
  char v76;
  NSObject *v77;
  id v78;
  id v79;
  unsigned int v80;
  SEL v81;
  id v82;

  v82 = self;
  v81 = a2;
  v80 = a3;
  v79 = a4;
  v78 = a5;
  if (!a4 || !v80)
  {
    v77 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v77 = inited;
    v76 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v77;
      type = v76;
      __os_log_helper_16_0_0(v75);
      _os_log_error_impl(&dword_1B5291000, log, type, "invalid arguments", v75, 2u);
    }
LABEL_48:

    v82 = 0;
    return 0;
  }
  v74.receiver = v82;
  v74.super_class = (Class)CBDisplayModuleiOS;
  v82 = -[CBModule initWithQueue:](&v74, sel_initWithQueue_, v79);
  if (v82)
  {
    *((_BYTE *)v82 + 272) = 0;
    *((_BYTE *)v82 + 176) = 1;
    *((_BYTE *)v82 + 186) = 0;
    *((_BYTE *)v82 + 185) = 0;
    v5 = v78;
    *((_QWORD *)v82 + 5) = v5;
    *((_QWORD *)v82 + 29) = 0;
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v82 + 30) = v6;
    v73 = 0;
    v38 = objc_alloc(MEMORY[0x1E0CB3940]);
    v37 = objc_msgSend((id)objc_msgSend(v82, "className"), "cStringUsingEncoding:");
    v73 = (id)objc_msgSend(v38, "initWithFormat:", CFSTR("%s.%s.%u"), "com.apple.CoreBrightness", v37, objc_msgSend(*((id *)v82 + 5), "getDisplayId"));
    v7 = os_log_create((const char *)objc_msgSend(v73, "cStringUsingEncoding:", 1), "default");
    *((_QWORD *)v82 + 2) = v7;
    if (!*((_QWORD *)v82 + 2))
    {
      v72 = 0;
      v36 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v72 = v36;
      v71 = 16;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v34 = v72;
        v35 = v71;
        __os_log_helper_16_0_0(v70);
        _os_log_error_impl(&dword_1B5291000, v34, v35, "failed to create log handle", v70, 2u);
      }
    }

    v8 = DisplayCreate(*MEMORY[0x1E0C9AE00], v80, 0);
    *((_QWORD *)v82 + 35) = v8;
    if (!*((_QWORD *)v82 + 35))
    {
      v69 = 0;
      if (*((_QWORD *)v82 + 2))
      {
        v33 = *((_QWORD *)v82 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v32 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v32 = init_default_corebrightness_log();
        v33 = v32;
      }
      v69 = v33;
      v68 = 16;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v30 = v69;
        v31 = v68;
        __os_log_helper_16_0_0(v67);
        _os_log_error_impl(&dword_1B5291000, v30, v31, "failed to create DisplayRef", v67, 2u);
      }
      goto LABEL_48;
    }
    v9 = [CBBacklightNode alloc];
    v10 = -[CBBacklightNode initWithService:](v9, "initWithService:", v80);
    *((_QWORD *)v82 + 36) = v10;
    objc_msgSend(v82, "initialiseSDR");
    objc_msgSend(v82, "initialiseEDR");
    objc_msgSend(v82, "initialiseAurora");
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v82 + 10) = v11;
    v29 = [CBTwilight alloc];
    v12 = -[CBTwilight initWithParams:](v29, "initWithParams:", objc_msgSend(*((id *)v82 + 36), "twilight"));
    *((_QWORD *)v82 + 7) = v12;
    if (*((_QWORD *)v82 + 7))
    {
      v13 = (void *)*((_QWORD *)v82 + 7);
      v61 = MEMORY[0x1E0C809B0];
      v62 = -1073741824;
      v63 = 0;
      v64 = __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke;
      v65 = &unk_1E68E9F38;
      v66 = v82;
      objc_msgSend(v13, "registerNotificationBlock:", &v61);
      objc_msgSend(*((id *)v82 + 10), "addObject:", *((_QWORD *)v82 + 7));
    }
    v28 = [CBAmmolite alloc];
    v14 = -[CBAmmolite initWithParams:](v28, "initWithParams:", objc_msgSend(*((id *)v82 + 36), "ammolite"));
    *((_QWORD *)v82 + 8) = v14;
    if (*((_QWORD *)v82 + 8))
    {
      v15 = (void *)*((_QWORD *)v82 + 8);
      v55 = MEMORY[0x1E0C809B0];
      v56 = -1073741824;
      v57 = 0;
      v58 = __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke_2;
      v59 = &unk_1E68E9F38;
      v60 = v82;
      objc_msgSend(v15, "registerNotificationBlock:", &v55);
      objc_msgSend(*((id *)v82 + 10), "addObject:", *((_QWORD *)v82 + 8));
    }
    v54 = 0;
    v54 = *((_DWORD *)v82 + 22);
    v53 = 0;
    v53 = *((_DWORD *)v82 + 24);
    v52 = 0;
    v52 = (id)DisplayCopyProperty(*((_QWORD *)v82 + 35), (uint64_t)CFSTR("DisplayProductLuminanceMin"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v52, "floatValue");
      v54 = v16;
    }

    v51 = 0;
    v51 = (id)DisplayCopyProperty(*((_QWORD *)v82 + 35), (uint64_t)CFSTR("DisplayProductLuminanceMax"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v51, "floatValue");
      v53 = v17;
    }

    v18 = [CBIndicatorBrightnessModule alloc];
    LODWORD(v19) = v54;
    LODWORD(v20) = v53;
    v21 = -[CBIndicatorBrightnessModule initWithQueue:min:andMax:](v18, "initWithQueue:min:andMax:", *((_QWORD *)v82 + 3), v19, v20);
    *((_QWORD *)v82 + 9) = v21;
    if (*((_QWORD *)v82 + 9))
    {
      v22 = (void *)*((_QWORD *)v82 + 9);
      v45 = MEMORY[0x1E0C809B0];
      v46 = -1073741824;
      v47 = 0;
      v48 = __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke_3;
      v49 = &unk_1E68E9F38;
      v50 = v82;
      objc_msgSend(v22, "registerNotificationBlock:", &v45);
      objc_msgSend(*((id *)v82 + 10), "addObject:", *((_QWORD *)v82 + 9));
    }
    if (!DisplayOpen(*((char **)v82 + 35), (uint64_t)DisplayRefPropertyChangedCallback, (uint64_t)v82))
    {
      oslog = 0;
      if (*((_QWORD *)v82 + 2))
      {
        v27 = *((_QWORD *)v82 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v26 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v26 = init_default_corebrightness_log();
        v27 = v26;
      }
      oslog = v27;
      v43 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v24 = oslog;
        v25 = v43;
        __os_log_helper_16_0_0(v42);
        _os_log_error_impl(&dword_1B5291000, v24, v25, "failed to open the DisplayRef", v42, 2u);
      }
      goto LABEL_48;
    }
    DisplaySetProperty(*((_QWORD *)v82 + 35), (uint64_t)CFSTR("DisplayBrightnessAuto"), *MEMORY[0x1E0C9AE40]);
    DisplaySetProperty(*((_QWORD *)v82 + 35), (uint64_t)CFSTR("DisplaySyncBrightnessTransactions"), *MEMORY[0x1E0C9AE50]);
  }
  return (CBDisplayModuleiOS *)v82;
}

uint64_t __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", a3, a2, a1, a3, a2, a1);
}

uint64_t __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", a3, a2, a1, a3, a2, a1);
}

uint64_t __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", a3, a2, a1, a3, a2, a1);
}

- (void)updateSDRLimits:(id)a3
{
  float v3;
  float v4;

  if (a3)
  {
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MinNits")), "floatValue");
    self->_minNits = v3;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxNits")), "floatValue");
    self->_maxNits = v4;
  }
  else
  {
    self->_dynSliderCap = 600.0;
    self->_maxNits = 600.0;
    self->_minNits = 2.0;
  }
}

- (void)initialiseSDR
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v5[40];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[CBDisplayModuleiOS updateSDRLimits:](self, "updateSDRLimits:", -[CBBrightnessProxy getBrightnessCapabilities](self->_brtCtl, "getBrightnessCapabilities"));
  self->_nitsSDR = self->_minNits;
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
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v5, COERCE__INT64(self->_maxNits), COERCE__INT64(self->_minNits), COERCE__INT64(self->_nitsSDR));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "SDR: max=%f nits | min=%f nits | curent=%f nits", v5, 0x20u);
  }
}

- (void)initialiseEDR
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  CBEDR *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CBFrameStats *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t inited;
  NSObject *v22;
  uint64_t v23;
  NSObject *logHandle;
  void *context;
  uint8_t v26[7];
  char v27;
  NSObject *v28;
  os_log_type_t v29;
  os_log_t v30;
  CBEDRModulator *v31;
  id v32;
  id v33;
  float v34;
  float v35;
  float v36;
  float v37;
  NSDictionary *v38;
  SEL v39;
  CBDisplayModuleiOS *v40;
  uint8_t v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v40 = self;
  v39 = a2;
  v38 = 0;
  v38 = (NSDictionary *)-[CBBrightnessProxy getBrightnessCapabilities](self->_brtCtl, "getBrightnessCapabilities");
  v37 = 0.0;
  v36 = 0.0;
  v35 = 0.5;
  v34 = 0.75;
  if (v38)
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", CFSTR("EDRPotentialHeadroom")), "floatValue");
    v37 = v2;
    v36 = v2;
    if (-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", CFSTR("EDRReferenceHeadroom")))
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", CFSTR("EDRReferenceHeadroom")), "floatValue");
      v36 = v3;
    }
    if (-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", CFSTR("EDRSecondsPerStopDefault")))
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", CFSTR("EDRSecondsPerStopDefault")), "floatValue");
      v35 = v4;
    }
    if (-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", CFSTR("EDRExitSecondsPerStop")))
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", CFSTR("EDRExitSecondsPerStop")), "floatValue");
      v34 = v5;
    }
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", CFSTR("MaxNitsEDR")), "floatValue");
    v40->_maxNitsEDR = v6;
  }
  else
  {
    v37 = 16.0;
    v36 = 10.0;
    v40->_maxNitsEDR = 1600.0;
  }
  v40->_capToCAIsRamping = 0;
  v40->_currentCapToCA = v40->_maxNitsEDR;
  v40->_edrState = 0;
  v40->_appliedHeadroom = 1.0;
  v40->_requestedHeadroom = 1.0;
  v40->_appliedComp = 1.0;
  v40->_trustedLux = 300.0;
  v40->_lastEDRHeadroomRequestFromCA = 0;
  v40->_lastBDMLux = 300.0;
  v40->_bdmLux2 = 0.0;
  v40->_bdmLux1 = 0.0;
  v40->_displayRequiresBDM = DisplayRequiresBDM((uint64_t)v40->_displayInternal) & 1;
  if (v40->_displayRequiresBDM)
  {
    v33 = 0;
    v33 = (id)DisplayCopyProperty((uint64_t)v40->_displayInternal, (uint64_t)CFSTR("BrightDotsMitigationParameters"));
    if (v33)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)objc_msgSend(v33, "objectForKey:", CFSTR("brightDotsMitigationLux1")), "floatValue");
        v40->_bdmLux1 = v7;
        objc_msgSend((id)objc_msgSend(v33, "objectForKey:", CFSTR("brightDotsMitigationLux2")), "floatValue");
        v40->_bdmLux2 = v8;
      }

    }
  }
  v9 = [CBEDR alloc];
  *(float *)&v10 = v37;
  *(float *)&v11 = v36;
  v40->_edr = -[CBEDR initWithRampPolicy:potentialHeadroom:andReferenceHeadroom:](v9, "initWithRampPolicy:potentialHeadroom:andReferenceHeadroom:", 0, v10, v11);
  v40->_sbim = -[CBSBIM initWithQueue:andDisplayModule:andEDRModule:]([CBSBIM alloc], "initWithQueue:andDisplayModule:andEDRModule:", v40->super.super._queue, v40, v40->_edr);
  if (v40->_edr)
  {
    *(float *)&v12 = v40->_maxNitsEDR;
    -[CBEDR setPanelMax:](v40->_edr, "setPanelMax:", v12);
    *(float *)&v13 = v40->_maxNitsEDR;
    -[CBEDR setBrightnessCap:](v40->_edr, "setBrightnessCap:", v13);
    *(float *)&v14 = v40->_nitsSDR;
    -[CBEDR setSdrBrightness:](v40->_edr, "setSdrBrightness:", v14);
    *(float *)&v15 = v35;
    -[CBEDR setSecondsPerStop:](v40->_edr, "setSecondsPerStop:", v15);
    *(float *)&v16 = v34;
    context = (void *)MEMORY[0x1B5E4A8B0](-[CBEDR setSecondsPerStopExit:](v40->_edr, "setSecondsPerStopExit:", v16));
    v32 = +[CBPreferencesHandler copyPreferenceForAllUsersMultiple:](CBPreferencesHandler, "copyPreferenceForAllUsersMultiple:", &unk_1E6917450);
    if (v32)
    {
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("EDRModulatorNitsConfig"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("EDRModulatorHeadroomConfig"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = objc_alloc_init(CBEDRModulator);
          -[CBEDRModulator setNitsDataPointsConfig:](v31, "setNitsDataPointsConfig:", objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("EDRModulatorNitsConfig")));
          -[CBEDRModulator setHeadroomDataPointsConfig:](v31, "setHeadroomDataPointsConfig:", objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("EDRModulatorHeadroomConfig")));
          -[CBEDRModulator setEnabled:](v31, "setEnabled:", v40->_brightnessControlEnabled);
          -[CBEDR setHeadroomModulator:](v40->_edr, "setHeadroomModulator:", v31);
          v30 = 0;
          if (v40->super.super._logHandle)
          {
            logHandle = v40->super.super._logHandle;
          }
          else
          {
            v23 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            logHandle = v23;
          }
          v30 = logHandle;
          v29 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v31);
            _os_log_impl(&dword_1B5291000, v30, v29, "EDR modulator initialised: %@", v41, 0xCu);
          }
        }
      }
    }
    objc_autoreleasePoolPop(context);
  }
  if (!isBrightnessAdjustmentPossible(v38))
  {
    v28 = 0;
    if (v40->super.super._logHandle)
    {
      v22 = v40->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v22 = inited;
    }
    v28 = v22;
    v27 = 1;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v19 = v28;
      v20 = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_impl(&dword_1B5291000, v19, v20, "Presets: staring up already enabled", v26, 2u);
    }
    -[CBDisplayModuleiOS updatePresetState:](v40, "updatePresetState:", 1, v19);
  }
  v40->_apceTimer = 0;
  v40->_rtplcState = 0;
  v40->_rtplcCapApplied = 0;
  v40->_currentRTPLCTarget = v40->_maxNitsEDR;
  v40->_rtplcCap = v40->_maxNitsEDR;
  v40->_frameStats = 0;
  if (-[CBBacklightNode rtplc](v40->_backlightParams, "rtplc"))
  {
    v17 = [CBFrameStats alloc];
    v18 = -[CBFrameStats initWithQueue:](v17, "initWithQueue:", v40->super.super._queue);
    v40->_frameStats = (CBFrameStats *)v18;
    -[CBFrameStats setMovingAverageDuration:](v40->_frameStats, "setMovingAverageDuration:", 1.0);
    DisplayInitializeRTPLCEDRRamp((uint64_t)v40->_displayInternal);
  }
  DisplayInitializeFastEDR((uint64_t)v40->_displayInternal);
}

- (void)initialiseAurora
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
  id v11;
  char v12;
  SEL v13;
  CBDisplayModuleiOS *v14;

  v14 = self;
  v13 = a2;
  v12 = 0;
  v11 = 0;
  v11 = (id)DisplayCopyProperty((uint64_t)self->_displayInternal, (uint64_t)CFSTR("AuroraSupported"));
  if (v11)
  {
    v12 = objc_msgSend(v11, "BOOLValue") & 1;

  }
  if ((v12 & 1) != 0)
  {
    v7 = (void *)-[CBBrightnessProxy getBrightnessCapabilities](v14->_brtCtl, "getBrightnessCapabilities");
    if (v7)
    {
      objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxNitsPanel")), "floatValue");
      v14->_maxNitsPanel = *(float *)&v2;
    }
    else
    {
      v14->_maxNitsPanel = 2175.0;
    }
    if (v14->_edr)
    {
      *(float *)&v2 = v14->_maxNitsPanel;
      -[CBEDR setPanelMax:](v14->_edr, "setPanelMax:", v2);
    }
    v14->_aurora = -[CBAurora initWithQueue:andDisplayModule:andBrtCapabilities:]([CBAurora alloc], "initWithQueue:andDisplayModule:andBrtCapabilities:", v14->super.super._queue, v14, v7);
  }
  else
  {
    v10 = 0;
    if (v14->super.super._logHandle)
    {
      logHandle = v14->super.super._logHandle;
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
      _os_log_impl(&dword_1B5291000, log, type, "Aurora not supported", v8, 2u);
    }
  }
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBDisplayModuleiOS *v4;

  v4 = self;
  v3 = a2;
  if (self->_displayInternal)
  {
    DisplayClose((uint64_t)v4->_displayInternal);
    CFRelease(v4->_displayInternal);
    v4->_displayInternal = 0;
  }

  if (v4->super.super._logHandle)
  {

    v4->super.super._logHandle = 0;
  }
  if (v4->_apceTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v4->_apceTimer);
    dispatch_release((dispatch_object_t)v4->_apceTimer);
    v4->_apceTimer = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBDisplayModuleiOS;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (void)start
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_subModules, "enumerateObjectsUsingBlock:", &__block_literal_global_0, a2, self);
}

uint64_t __27__CBDisplayModuleiOS_start__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "start");
}

- (void)stop
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_subModules, "enumerateObjectsUsingBlock:", &__block_literal_global_61, a2, self);
}

uint64_t __26__CBDisplayModuleiOS_stop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)updatePresetState:(BOOL)a3
{
  double v3;
  double v4;
  const char *v5;
  const char *v6;
  float v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t inited;
  NSObject *logHandle;
  void *v14;
  BOOL v15;
  uint8_t v17[32];
  uint8_t v18[8];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v14 = (void *)MEMORY[0x1B5E4A8B0]();
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
    __os_log_helper_16_0_1_4_0((uint64_t)v18, v15);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Presets: setting status of pro mode to: %d", v18, 8u);
  }
  self->_brightnessControlEnabled = !v15;
  self->_referenceModeIsActive = v15;
  if (self->_brightnessControlEnabled)
  {
    v11 = 0;
  }
  else
  {
    *(float *)&v3 = self->_minNits;
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  }
  -[CBDisplayModuleiOS setProperty:forKey:](self, "setProperty:forKey:", v11, CFSTR("kCoreBrightnessDisplayPresetNitsOverride"));
  v10 = 0;
  if (self->_brightnessControlEnabled)
    v10 = !self->_dominoMode;
  -[CBDisplayModuleiOS sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("CBBrightnessControlAvailable"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10));
  if (v15)
  {
    -[CBSBIM disable](self->_sbim, "disable");
  }
  else
  {
    *(float *)&v4 = self->_trustedLux;
    -[CBDisplayModuleiOS updateBDMWithLux:](self, "updateBDMWithLux:", v4);
    -[CBSBIM enable](self->_sbim, "enable");
  }
  if (self->_edr && -[CBEDR headroomModulator](self->_edr, "headroomModulator"))
  {
    -[CBEDRModulator setEnabled:](-[CBEDR headroomModulator](self->_edr, "headroomModulator"), "setEnabled:", self->_brightnessControlEnabled);
    if (self->super.super._logHandle)
    {
      v9 = self->super.super._logHandle;
    }
    else
    {
      v8 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      v9 = v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_brightnessControlEnabled)
        v5 = "enabled";
      else
        v5 = "disabled";
      if (self->_brightnessControlEnabled)
        v6 = "enabled";
      else
        v6 = "disabled";
      __os_log_helper_16_2_2_8_32_8_32((uint64_t)v17, (uint64_t)v5, (uint64_t)v6);
      _os_log_impl(&dword_1B5291000, v9, OS_LOG_TYPE_DEFAULT, "Presets: Brightness updates are %s; EDR modulator is %s",
        v17,
        0x16u);
    }
  }
  v7 = 0.0;
  if (!v15)
    v7 = -1.0;
  DisplaySetCabalFactorOverride((uint64_t)self->_displayInternal, v7);
  -[CBChromaticCorrection setEnabled:](self->_twilight, "setEnabled:", !v15);
  -[CBChromaticCorrection setEnabled:](self->_ammolite, "setEnabled:", !v15);
  objc_autoreleasePoolPop(v14);
}

- (void)handleAttachedNotification
{
  float v2;
  double v3;
  void *context;
  BOOL v5;
  NSDictionary *v6;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  v6 = (NSDictionary *)-[CBBrightnessProxy getBrightnessCapabilities](self->_brtCtl, "getBrightnessCapabilities");
  if (v6)
  {
    v5 = isBrightnessAdjustmentPossible(v6);
    -[CBDisplayModuleiOS updateSDRLimits:](self, "updateSDRLimits:", v6);
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("MaxNitsEDR")), "floatValue");
    self->_maxNitsEDR = v2;
    *(float *)&v3 = self->_maxNitsEDR;
    -[CBEDR setBrightnessCap:](self->_edr, "setBrightnessCap:", v3);
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("EDRPotentialHeadroom")), "floatValue");
    -[CBEDR setMaxHeadroom:](self->_edr, "setMaxHeadroom:");
    if (self->_brightnessControlEnabled != v5)
      -[CBDisplayModuleiOS updatePresetState:](self, "updatePresetState:", !v5);
  }
  objc_autoreleasePoolPop(context);
}

- (void)handleEDRHeadroomRequest:(id)a3
{
  double v3;
  double v4;
  float v5;
  float v6;
  float v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  float v18;
  int v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  CBEDR *edr;
  float requestedHeadroom;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t displayInternal;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  NSObject *v41;
  char v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  NSObject *v46;
  char v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  NSObject *v51;
  char v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  NSObject *v56;
  char v57;
  NSObject *v58;
  os_log_type_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t inited;
  NSObject *logHandle;
  float v65;
  void *v66;
  float v67;
  char v68;
  double v69;
  float v70;
  char v71;
  uint64_t v72;
  int v73;
  int v74;
  void (*v75)(uint64_t, const void *);
  void *v76;
  CBDisplayModuleiOS *v77;
  _QWORD *v78;
  uint64_t *v79;
  _QWORD v80[2];
  int v81;
  int v82;
  void (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  CBDisplayModuleiOS *v85;
  uint8_t v86[15];
  os_log_type_t v87;
  NSObject *v88;
  char v89;
  uint8_t v90[15];
  os_log_type_t v91;
  NSObject *v92;
  char v93;
  uint8_t v94[15];
  os_log_type_t v95;
  NSObject *v96;
  char v97;
  BOOL v98;
  uint8_t v99[15];
  os_log_type_t v100;
  NSObject *v101;
  char v102;
  uint8_t v103[7];
  os_log_type_t v104;
  NSObject *v105;
  os_log_type_t v106;
  os_log_t v107;
  float v108;
  char v109;
  id v110;
  SEL v111;
  CBDisplayModuleiOS *v112;
  uint8_t v113[32];
  uint8_t v114[32];
  uint8_t v115[16];
  uint8_t v116[16];
  uint8_t v117[16];
  uint8_t v118[24];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v112 = self;
  v111 = a2;
  v110 = a3;
  v109 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v108 = 0.0;
    objc_msgSend((id)objc_msgSend(v110, "objectForKey:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v112->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
    v108 = *(float *)&v3;
    -[CBEDR clampHeadroom:](v112->_edr, "clampHeadroom:", v3);
    v108 = *(float *)&v4;
    -[CBSBIM setCurrentHeadroomRequest:](v112->_sbim, "setCurrentHeadroomRequest:", v4);
    if (v112->_sbim)
    {
      -[CBSBIM cap](v112->_sbim, "cap");
      if (v108 > v5)
      {
        v107 = 0;
        if (v112->super.super._logHandle)
        {
          logHandle = v112->super.super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          logHandle = inited;
        }
        v107 = logHandle;
        v106 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
        {
          -[CBSBIM cap](v112->_sbim, "cap");
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v118, COERCE__INT64(v108), COERCE__INT64(v6));
          _os_log_impl(&dword_1B5291000, v107, v106, "EDR headroom is being capped by SBIM: request=%f cap=%f", v118, 0x16u);
        }
        -[CBSBIM cap](v112->_sbim, "cap");
        v108 = v7;
      }
    }
    v62 = objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("AuroraEDRHeadroomRequest"));
    if (v62 != *MEMORY[0x1E0C9AE50]
      && ((*(float *)&v8 = v108,
           -[CBAurora setCurrentEDRHeadroomRequest:](v112->_aurora, "setCurrentEDRHeadroomRequest:", v8),
           -[CBAurora isActive](v112->_aurora, "isActive"))
       || -[CBAurora isBoostingBrightness](v112->_aurora, "isBoostingBrightness")))
    {
      v105 = 0;
      if (v112->super.super._logHandle)
      {
        v61 = v112->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v60 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v60 = init_default_corebrightness_log();
        v61 = v60;
      }
      v105 = v61;
      v104 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v58 = v105;
        v59 = v104;
        __os_log_helper_16_0_0(v103);
        _os_log_impl(&dword_1B5291000, v58, v59, "Discarding EDR headroom request, Aurora is active", v103, 2u);
      }
    }
    else
    {
      v102 = 0;
      objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("AODEDRHeadroomRequest"));
      objc_opt_class();
      v57 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v57 = objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("AODEDRHeadroomRequest")), "BOOLValue");
      v102 = v57 & 1;
      if (!-[CBAODState isAODActive](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODActive")|| (v102 & 1) != 0)
      {
        v98 = float_equal(v108, 1.0);
        v97 = 0;
        objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("EcoModeHeadroomRequest"));
        objc_opt_class();
        v52 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v52 = objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("EcoModeHeadroomRequest")), "BOOLValue");
        v97 = v52 & 1;
        if (!v112->_ecoMode || v112->_referenceModeIsActive || (v97 & 1) != 0 || v98)
        {
          v93 = 0;
          objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("DominoHeadroomRequest"));
          objc_opt_class();
          v47 = 0;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v47 = objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("DominoHeadroomRequest")), "BOOLValue");
          v93 = v47 & 1;
          if (!v112->_dominoMode || (v93 & 1) != 0)
          {
            v89 = 0;
            objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("AutoDimHeadroomRequest"));
            objc_opt_class();
            v42 = 0;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v42 = objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("AutoDimHeadroomRequest")), "BOOLValue");
            v89 = v42 & 1;
            if (!v112->_autoDimActive || (v89 & 1) != 0 || v98)
            {
              if (v112->_requestedHeadroom == 1.0 && v108 > 1.0)
              {
                if (v112->_referenceModeIsActive)
                {
                  LODWORD(v9) = 1.0;
                  -[CBEDR setAppliedCompensation:](v112->_edr, "setAppliedCompensation:", v9);
                  v112->_appliedComp = 1.0;
                }
                else
                {
                  -[CBDisplayModuleiOS computeBrightnessCompensation](v112, "computeBrightnessCompensation");
                  v112->_appliedComp = v10;
                  *(float *)&v11 = v112->_appliedComp;
                  -[CBEDR setAppliedCompensation:](v112->_edr, "setAppliedCompensation:", v11);
                }
                if (-[CBBacklightNode rtplc](v112->_backlightParams, "rtplc"))
                {
                  v80[0] = 0;
                  v80[1] = v80;
                  v81 = 1375731712;
                  v82 = 48;
                  v83 = __Block_byref_object_copy_;
                  v84 = __Block_byref_object_dispose_;
                  v85 = v112;
                  v72 = MEMORY[0x1E0C809B0];
                  v73 = -1073741824;
                  v74 = 0;
                  v75 = __47__CBDisplayModuleiOS_handleEDRHeadroomRequest___block_invoke;
                  v76 = &unk_1E68E9FF0;
                  v78 = v80;
                  v77 = v112;
                  v79 = &v72;
                  -[CBFrameStats startMonitoring:](v112->_frameStats, "startMonitoring:", &v72);
                  if (v112->_rtplcState == 2 || v112->_rtplcState == 1)
                  {
                    LODWORD(v12) = 0.5;
                    -[CBDisplayModuleiOS createAPCEMonitorWithFrequency:](v112, "createAPCEMonitorWithFrequency:", v12);
                  }
                  _Block_object_dispose(v80, 8);
                }
                -[CBSBIM enterEDR](v112->_sbim, "enterEDR");
                *(float *)&v13 = v108;
                -[CBDisplayModuleiOS updateEDRStateForEvent:andHeadroom:](v112, "updateEDRStateForEvent:andHeadroom:", 2, v13);
              }
              if (v98)
              {
                if (-[CBBacklightNode rtplc](v112->_backlightParams, "rtplc"))
                {
                  -[CBFrameStats stopMonitoring](v112->_frameStats, "stopMonitoring");
                  -[CBDisplayModuleiOS deleteAPCEMonitor](v112, "deleteAPCEMonitor");
                }
                -[CBSBIM exitEDR](v112->_sbim, "exitEDR");
                *(float *)&v14 = v108;
                -[CBDisplayModuleiOS updateEDRStateForEvent:andHeadroom:](v112, "updateEDRStateForEvent:andHeadroom:", 3, v14);
              }
              v71 = -[CBDisplayModuleiOS edrIsEngaged](v112, "edrIsEngaged");
              displayInternal = (uint64_t)v112->_displayInternal;
              if (v71)
                DisplaySetProperty(displayInternal, (uint64_t)CFSTR("DisplayFasterEDREngaged"), *MEMORY[0x1E0C9AE50]);
              else
                DisplaySetProperty(displayInternal, (uint64_t)CFSTR("DisplayFasterEDREngaged"), *MEMORY[0x1E0C9AE40]);
              v112->_requestedHeadroom = v108;
              v70 = 1.0;
              v69 = 0.0;
              objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("EDRSecondsPerStop"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("EDRSecondsPerStop")), "floatValue");
                v67 = v15;
                if (v112->super.super._logHandle)
                {
                  v36 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v35 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v35 = init_default_corebrightness_log();
                  v36 = v35;
                }
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  __os_log_helper_16_0_1_8_0((uint64_t)v117, COERCE__INT64(v67));
                  _os_log_impl(&dword_1B5291000, v36, OS_LOG_TYPE_DEFAULT, "HDR | Transition is using the seconds per stop specified in request = %f", v117, 0xCu);
                }
                *(float *)&v16 = v112->_requestedHeadroom;
                *(float *)&v17 = v67;
                v68 = -[CBEDR shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:](v112->_edr, "shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:", &v70, &v69, v16, v17);
              }
              else if (v98)
              {
                if (v112->super.super._logHandle)
                {
                  v34 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v33 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v33 = init_default_corebrightness_log();
                  v34 = v33;
                }
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  -[CBEDR secondsPerStopExit](v112->_edr, "secondsPerStopExit");
                  __os_log_helper_16_0_1_8_0((uint64_t)v116, COERCE__INT64(v18));
                  _os_log_impl(&dword_1B5291000, v34, OS_LOG_TYPE_DEFAULT, "HDR | Exit transition is using the exit duration per stop = %f", v116, 0xCu);
                }
                edr = v112->_edr;
                requestedHeadroom = v112->_requestedHeadroom;
                -[CBEDR secondsPerStopExit](edr, "secondsPerStopExit");
                LODWORD(v20) = v19;
                *(float *)&v21 = requestedHeadroom;
                v68 = -[CBEDR shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:](edr, "shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:", &v70, &v69, v21, v20);
              }
              else
              {
                if (v112->super.super._logHandle)
                {
                  v30 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v29 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v29 = init_default_corebrightness_log();
                  v30 = v29;
                }
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  -[CBEDR secondsPerStop](v112->_edr, "secondsPerStop");
                  __os_log_helper_16_0_1_8_0((uint64_t)v115, COERCE__INT64(v23));
                  _os_log_impl(&dword_1B5291000, v30, OS_LOG_TYPE_DEFAULT, "HDR | Transition is using the default duration per stop = %f", v115, 0xCu);
                }
                *(float *)&v22 = v112->_requestedHeadroom;
                v68 = -[CBEDR shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:](v112->_edr, "shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:", &v70, &v69, v22);
              }
              if (objc_msgSend(v110, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessNotificationPowerOff](v112->_brtCtl, "brightnessNotificationPowerOff")))
              {
                v68 = 1;
                -[CBEDR resetRequestedHeadroom](v112->_edr, "resetRequestedHeadroom");
              }
              v66 = (void *)objc_msgSend(v110, "objectForKey:", -[CBBrightnessProxy brightnessRequestRampDuration](v112->_brtCtl, "brightnessRequestRampDuration"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v66, "floatValue");
                v65 = v24;
                if (v112->super.super._logHandle)
                {
                  v28 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v27 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v27 = init_default_corebrightness_log();
                  v28 = v27;
                }
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v114, COERCE__INT64(v112->_requestedHeadroom), COERCE__INT64(v112->_appliedHeadroom), COERCE__INT64(v65));
                  _os_log_impl(&dword_1B5291000, v28, OS_LOG_TYPE_DEFAULT, "HDR | CA request for headroom: %f, currrent headroom: %f, transitionTime: %f", v114, 0x20u);
                }
                DisplayStartFastEDRRamp((uint64_t)v112->_displayInternal, v112->_requestedHeadroom, v65);
              }
              else if ((v68 & 1) != 0)
              {
                if (v112->super.super._logHandle)
                {
                  v26 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v25 = init_default_corebrightness_log();
                  v26 = v25;
                }
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v113, COERCE__INT64(v112->_requestedHeadroom), *(uint64_t *)&v69, COERCE__INT64(v70));
                  _os_log_impl(&dword_1B5291000, v26, OS_LOG_TYPE_DEFAULT, "HDR | Received EDRHeadroomRequest: %f, evaluated ramp time: %f, targetHeadroom: %f", v113, 0x20u);
                }
                DisplayStartFastEDRRamp((uint64_t)v112->_displayInternal, v70, v69);
              }
            }
            else
            {
              v88 = 0;
              if (v112->super.super._logHandle)
              {
                v41 = v112->super.super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v40 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v40 = init_default_corebrightness_log();
                v41 = v40;
              }
              v88 = v41;
              v87 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                v38 = v88;
                v39 = v87;
                __os_log_helper_16_0_0(v86);
                _os_log_impl(&dword_1B5291000, v38, v39, "AutoDim EDR | Discarding AutoDim EDR headroom request, AutoDim is on", v86, 2u);
              }
            }
          }
          else
          {
            v92 = 0;
            if (v112->super.super._logHandle)
            {
              v46 = v112->super.super._logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v45 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v45 = init_default_corebrightness_log();
              v46 = v45;
            }
            v92 = v46;
            v91 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              v43 = v92;
              v44 = v91;
              __os_log_helper_16_0_0(v90);
              _os_log_impl(&dword_1B5291000, v43, v44, "Domino EDR | Discarding Domino EDR headroom request, Domino is on", v90, 2u);
            }
          }
        }
        else
        {
          v96 = 0;
          if (v112->super.super._logHandle)
          {
            v51 = v112->super.super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v50 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v50 = init_default_corebrightness_log();
            v51 = v50;
          }
          v96 = v51;
          v95 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v48 = v96;
            v49 = v95;
            __os_log_helper_16_0_0(v94);
            _os_log_impl(&dword_1B5291000, v48, v49, "EcoMode EDR | Discarding EDR headroom request, EcoMode is on", v94, 2u);
          }
        }
      }
      else
      {
        v101 = 0;
        if (v112->super.super._logHandle)
        {
          v56 = v112->super.super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v55 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v55 = init_default_corebrightness_log();
          v56 = v55;
        }
        v101 = v56;
        v100 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v53 = v101;
          v54 = v100;
          __os_log_helper_16_0_0(v99);
          _os_log_impl(&dword_1B5291000, v53, v54, "AOD EDR | Discarding EDR headroom request, AOD is on", v99, 2u);
        }
      }
    }
  }
}

void __47__CBDisplayModuleiOS_handleEDRHeadroomRequest___block_invoke(uint64_t a1, const void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(_QWORD *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[80];
  _BYTE __dst[80];
  uint64_t v13;
  const void *v14;
  uint64_t v15;

  v15 = a1;
  v14 = a2;
  v13 = a1;
  memcpy(__dst, a2, sizeof(__dst));
  queue = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 24);
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __47__CBDisplayModuleiOS_handleEDRHeadroomRequest___block_invoke_2;
  v8 = &unk_1E68E9FC8;
  v10 = *(_QWORD *)(a1 + 40);
  memcpy(v11, __dst, sizeof(v11));
  v9 = *(_QWORD *)(a1 + 32);
  dispatch_async(queue, &v4);
}

uint64_t __47__CBDisplayModuleiOS_handleEDRHeadroomRequest___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v4;
  _BYTE v5[80];
  _BYTE __dst[80];
  _QWORD *v7;
  _QWORD *v8;

  v8 = a1;
  v7 = a1;
  v2 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  memcpy(__dst, a1 + 6, sizeof(__dst));
  objc_msgSend(v2, "handleFrameInfo:", __dst);
  v4 = *(void **)(a1[4] + 248);
  memcpy(v5, a1 + 6, sizeof(v5));
  return objc_msgSend(v4, "processFrameInfo:", v5);
}

void __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke_202(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  NSObject *v4;
  uint64_t v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "objectAtIndex:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", v6, a2);
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v8, v6);
    _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_INFO, "Restoring cached %@ property", v8, 0xCu);
  }
}

- (float)computeBrightnessCompensation
{
  float v2;
  float nitsSDR;
  float v5;

  if (self->_blrEnabled)
  {
    v5 = 1.8;
  }
  else if (self->_harmonyEnabled)
  {
    v5 = 1.3;
  }
  else
  {
    v5 = 1.0;
  }
  nitsSDR = self->_nitsSDR;
  if (-[CBAurora isBoostingBrightness](self->_aurora, "isBoostingBrightness"))
  {
    -[CBAurora currentPreAuroraNits](self->_aurora, "currentPreAuroraNits");
    nitsSDR = v2;
  }
  return clamp(self->_dynSliderCap / nitsSDR, 1.0, v5);
}

- (void)handleFrameInfo:(id *)a3
{
  double v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL var9;
  uint8_t v17[7];
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  os_log_t v21;
  float currentRTPLCTarget;
  float v23;
  os_log_type_t v24;
  os_log_t v25;
  float v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  float v31;
  float v32;
  $09E7307E27FD6DFE57B7AC9266EAB79E *v33;
  SEL v34;
  CBDisplayModuleiOS *v35;
  uint8_t v36[32];
  uint8_t v37[56];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35 = self;
  v34 = a2;
  v33 = a3;
  v32 = 1.0;
  v31 = 0.0;
  v31 = a3->var10 - 1.0;
  v30 = 0;
  var9 = 0;
  if (!self->_rtplcCapApplied)
    var9 = a3->var9;
  v30 = var9;
  v29 = 0;
  v15 = 0;
  if (v35->_rtplcCapApplied)
  {
    v15 = 0;
    if (a3->var9)
      v15 = v31 != v35->_currentRTPLCTarget;
  }
  v29 = v15;
  v28 = 0;
  v14 = 0;
  if (v35->_rtplcCapApplied)
    v14 = !a3->var9;
  v28 = v14;
  v27 = 0;
  v13 = 1;
  if (!a3->var8)
    v13 = a3->var9;
  v27 = v13;
  v35->_rtplcCapApplied = a3->var9;
  if (v30 || v29)
  {
    -[CBDisplayModuleiOS deleteAPCEMonitor](v35, "deleteAPCEMonitor");
    v35->_rtplcState = 1;
    v35->_currentRTPLCTarget = v31;
    v26 = 0.0;
    v26 = v35->_currentRTPLCTarget / v35->_nitsSDR;
    v25 = 0;
    if (v35->super.super._logHandle)
    {
      logHandle = v35->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v25 = logHandle;
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v37, COERCE__INT64(v35->_currentRTPLCTarget), COERCE__INT64(v26), COERCE__INT64(v35->_appliedHeadroom), COERCE__INT64(v35->_nitsSDR), COERCE__INT64(v35->_currentCapToCA));
      _os_log_impl(&dword_1B5291000, v25, v24, "RTPLC TRIGGER!! RTPLCBrightness: %f, reducedHeadroom: %f, current(_applied): %f, _nitsSDR: %f, _currentCapToCA = %f", v37, 0x34u);
    }
    v23 = 0.0;
    v23 = (float)(v35->_nitsSDR * v35->_appliedHeadroom) * v35->_appliedComp;
    currentRTPLCTarget = 0.0;
    currentRTPLCTarget = v35->_currentRTPLCTarget;
    v21 = 0;
    if (v35->super.super._logHandle)
    {
      v10 = v35->super.super._logHandle;
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
    v20 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v36, COERCE__INT64(v23), COERCE__INT64(currentRTPLCTarget));
      _os_log_impl(&dword_1B5291000, v21, v20, "RTPLC ACTION: StartRTPLCRamp, ramp Cap: %f--->%f", v36, 0x16u);
    }
    DisplayStartRTPLCEDRCapRamp((uint64_t)v35->_displayInternal, 0, v23, currentRTPLCTarget, 4.0);
  }
  else if (v28)
  {
    v19 = 0;
    if (v35->super.super._logHandle)
    {
      v8 = v35->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    v19 = v8;
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v19;
      v6 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_impl(&dword_1B5291000, v5, v6, "RTPLC RELEASED!", v17, 2u);
    }
    LODWORD(v3) = 0.5;
    -[CBDisplayModuleiOS createAPCEMonitorWithFrequency:](v35, "createAPCEMonitorWithFrequency:", v3);
  }
  if (-[CBFrameStats tripLength](v35->_frameStats, "tripLength") && !v27)
  {
    mach_time_now_in_seconds();
    -[CBFrameStats currentTripStartTime](v35->_frameStats, "currentTripStartTime");
    v4 = -[CBFrameStats tripLength](v35->_frameStats, "tripLength");
    -[CBFrameStats tripMaxAPCE](v35->_frameStats, "tripMaxAPCE");
    +[CBAnalytics rtplcTriggeredWithLength:maxAPCE:durationInSeconds:sdrBrightness:referenceModeEnabled:](CBAnalytics, "rtplcTriggeredWithLength:maxAPCE:durationInSeconds:sdrBrightness:referenceModeEnabled:", v4, v35->_referenceModeIsActive);
    v35->_rtplcTripMaxBrightness = 0.0;
  }
  if (!-[CBFrameStats tripLength](v35->_frameStats, "tripLength") && v27)
    v35->_rtplcTripMaxBrightness = v35->_nitsSDR;
  if (v27)
    v35->_rtplcTripMaxBrightness = fmaxf(v35->_nitsSDR, v35->_rtplcTripMaxBrightness);
}

- (void)createAPCEMonitorWithFrequency:(float)a3
{
  uint64_t block;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  CBDisplayModuleiOS *v8;
  dispatch_block_t handler;
  dispatch_object_t v10;
  uint64_t v11;
  float v12;
  SEL v13;
  CBDisplayModuleiOS *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = (unint64_t)(float)((float)(1.0 / a3) * 1000000000.0);
  if (self->_apceTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)v14->_apceTimer, 0, v11, 0);
  }
  else
  {
    v10 = 0;
    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v14->super.super._queue);
    if (v10)
    {
      dispatch_source_set_timer(v10, 0, v11, 0);
      handler = 0;
      block = MEMORY[0x1E0C809B0];
      v4 = -1073741824;
      v5 = 0;
      v6 = __53__CBDisplayModuleiOS_createAPCEMonitorWithFrequency___block_invoke;
      v7 = &unk_1E68E9E60;
      v8 = v14;
      handler = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, &block);
      if (handler)
      {
        dispatch_source_set_event_handler(v10, handler);
        _Block_release(handler);
      }
      v14->_apceTimer = (OS_dispatch_source *)v10;
      dispatch_activate(v10);
    }
  }
}

uint64_t __53__CBDisplayModuleiOS_createAPCEMonitorWithFrequency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "apceTimerCallback", a1, a1);
}

- (void)deleteAPCEMonitor
{
  if (self->_apceTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_apceTimer);
    dispatch_release((dispatch_object_t)self->_apceTimer);
    self->_apceTimer = 0;
  }
}

- (void)apceTimerCallback
{
  float v2;
  float v3;
  float v4;
  double v5;
  double v6;
  float v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t inited;
  NSObject *logHandle;
  float rtplcCap;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  uint8_t v19[32];
  uint8_t v20[56];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CBFrameStats getMovingAverage](self->_frameStats, "getMovingAverage");
  v14 = v2;
  -[CBFrameStats getPeakAPCECap](self->_frameStats, "getPeakAPCECap");
  v13 = v3;
  -[CBFrameStats scaleFactor](self->_frameStats, "scaleFactor");
  v15 = v4;
  *(float *)&v5 = v14;
  *(float *)&v6 = v15;
  -[CBDisplayModuleiOS computeTargetHDRBrightnessForAPCE:andScale:](self, "computeTargetHDRBrightnessForAPCE:andScale:", v5, v6);
  v16 = v7;
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
    __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v20, COERCE__INT64(v16), COERCE__INT64(v14), COERCE__INT64(self->_currentRTPLCTarget), COERCE__INT64(v15), COERCE__INT64(v13));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "RTPLC RECOVERY: target HDR Brightness= %f for APCE = %f, current RTPLC target: %f, scaleFactor: %f, peakAPCECap: %f", v20, 0x34u);
  }
  v17 = fminf(v16, v13);
  if (v17 > self->_currentRTPLCTarget)
  {
    self->_rtplcState = 2;
    rtplcCap = self->_rtplcCap;
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
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v19, COERCE__INT64(rtplcCap), COERCE__INT64(v17), COERCE__INT64(self->_currentCapToCA));
      _os_log_impl(&dword_1B5291000, v9, OS_LOG_TYPE_DEFAULT, "RTPLC RECOVERY RAMP! ramp Cap: %f ---> %f (currentCapToCA = %f)", v19, 0x20u);
    }
    DisplayStartRTPLCEDRCapRamp((uint64_t)self->_displayInternal, 0, rtplcCap, v17, 16.0);
  }
}

- (float)computeTargetHDRBrightnessForAPCE:(float)a3 andScale:(float)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  float v13;
  float v14;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  float v20;
  float v21;
  float v22;
  int i;
  float v24;
  uint8_t v25[7];
  char v26;
  NSObject *v27;
  float v28;
  float v29;
  SEL v30;
  CBDisplayModuleiOS *v31;

  v31 = self;
  v30 = a2;
  v29 = a3;
  v28 = a4;
  if (-[CBFloatArray count](-[CBRTPLCRecoveryCurveParams nits](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](self->_backlightParams, "rtplc"), "recoveryCurve"), "nits"), "count"))
  {
    -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams nits](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "nits"), "get:", 0);
    v24 = v4;
    for (i = 0;
          i < -[CBFloatArray count](-[CBRTPLCRecoveryCurveParams apce](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "apce"), "count");
          ++i)
    {
      if (i + 1 >= -[CBFloatArray count](-[CBRTPLCRecoveryCurveParams apce](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "apce"), "count"))
      {
        -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams nits](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "nits"), "get:", i);
        v24 = v14;
        return v24 / v28;
      }
      -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams apce](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "apce"), "get:", i);
      if (v29 > v5)
      {
        -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams apce](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "apce"), "get:", i + 1);
        if (v29 < v6)
        {
          -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams apce](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "apce"), "get:", i);
          v22 = v7;
          -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams apce](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "apce"), "get:", i + 1);
          v21 = v8;
          -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams nits](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "nits"), "get:", i);
          v20 = v9;
          -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams nits](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "nits"), "get:", i + 1);
          v24 = linear_interpolation(v29, v22, v20, v21, v10);
          return v24 / v28;
        }
      }
      -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams apce](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc"), "recoveryCurve"), "apce"), "get:", i);
      v11 = *(float *)&v12;
      *(float *)&v12 = v29;
      if (v29 <= v11)
      {
        -[CBFloatArray get:](-[CBRTPLCRecoveryCurveParams nits](-[CBRTPLCParams recoveryCurve](-[CBBacklightNode rtplc](v31->_backlightParams, "rtplc", v12), "recoveryCurve"), "nits"), "get:", i);
        v24 = v13;
        return v24 / v28;
      }
    }
    return v24 / v28;
  }
  else
  {
    v27 = 0;
    if (v31->super.super._logHandle)
    {
      logHandle = v31->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v27 = logHandle;
    v26 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v27;
      type = v26;
      __os_log_helper_16_0_0(v25);
      _os_log_error_impl(&dword_1B5291000, log, type, "RTPLC | Empty Table", v25, 2u);
    }
    return v31->_maxNitsEDR;
  }
}

- (BOOL)edrIsEngaged
{
  BOOL v3;

  v3 = 1;
  if (self->_edrState != 1)
    return self->_edrState == 2;
  return v3;
}

- (id)copyIdentifiers
{
  SEL v3;
  CBDisplayModuleiOS *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("DisplayBrightnessAuto"), CFSTR("DisplayBrightnessFactor"), CFSTR("DisplayBrightnessFactorWithFade"), CFSTR("PreStrobeBrightnessRatio"), CFSTR("EventTimestampDisplayOn"), CFSTR("EventTimestampDisplayOff"), CFSTR("DisplayBrightness"), CFSTR("BrightnessGlobalScalar"), CFSTR("DisplayPanelLuminanceMin"), CFSTR("DisplayPanelLuminanceMid"), CFSTR("DisplayPanelLuminanceMax"), CFSTR("DisplayProductLuminanceMin"), CFSTR("DisplayProductLuminanceMid"), CFSTR("DisplayProductLuminanceMax"), CFSTR("BrightnessRestrictions"), CFSTR("DisplayBackLightArchitecture"), CFSTR("FreezeBrightness"),
               CFSTR("UserInteractedWithUI"),
               CFSTR("EcoModeFactorUpdate"),
               CFSTR("DominoStateUpdate"),
               CFSTR("AmbientAdaptiveDimming"),
               CFSTR("DisplayBrightnessFadePeriod"),
               CFSTR("DisplayBrightnessFadePeriodOverride"),
               CFSTR("MaxBrightness"),
               CFSTR("BrightnessWeakCap"),
               CFSTR("BrightnessMinPhysicalWithFade"),
               CFSTR("DisplayBrightnessFactorRamp"),
               CFSTR("PreStrobeConfig"),
               CFSTR("PreStrobe"),
               CFSTR("CoreBrightnessFeaturesDisabled"),
               CFSTR("DisableWPShift"),
               CFSTR("ReenablementRampPeriod"),
               CFSTR("DisablementRampPeriod"),
               CFSTR("AABConstraints"),
               CFSTR("AABCurveCap"),
               CFSTR("PreStrobeDimPeriod"),
               CFSTR("BrightDotsMitigationParameters"),
               CFSTR("VirtualBrightnessLimits"),
               CFSTR("CPMSCurrentPower"),
               CFSTR("CPMSPowerAccumulatorValue"),
               0);
}

- (id)className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  double v5;
  float v6;
  float v7;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  CBDisplayModuleiOS *v21;
  uint64_t v22;
  NSObject *v23;
  void *context;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *v29;
  id v30;
  id v31;
  uint8_t v32[7];
  os_log_type_t v33;
  os_log_t v34;
  os_log_type_t v35;
  os_log_t v36;
  os_log_type_t v37;
  os_log_t oslog;
  uint8_t v39[15];
  os_log_type_t v40;
  NSObject *v41;
  id v42;
  float v43;
  unint64_t v44;
  SEL v45;
  CBDisplayModuleiOS *v46;
  uint8_t v47[16];
  uint8_t v48[16];
  _QWORD v49[3];
  _QWORD v50[3];
  uint8_t v51[16];
  _QWORD v52[3];
  _QWORD v53[3];
  uint8_t v54[24];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v46 = self;
  v45 = a2;
  v44 = a3;
  v43 = a4;
  v42 = a5;
  -[CBChromaticCorrection handleAODStateUpdate:transitionTime:context:](self->_twilight, "handleAODStateUpdate:transitionTime:context:", a3, a5, *(double *)&a4);
  *(float *)&v5 = v43;
  v29 = (void *)MEMORY[0x1B5E4A8B0](-[CBChromaticCorrection handleAODStateUpdate:transitionTime:context:](v46->_ammolite, "handleAODStateUpdate:transitionTime:context:", v44, v42, v5));
  if (v44)
  {
    if (v44 == 3)
    {
      if (v46->_aurora)
      {
        v41 = 0;
        if (v46->super.super._logHandle)
        {
          logHandle = v46->super.super._logHandle;
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
          log = v41;
          type = v40;
          __os_log_helper_16_0_0(v39);
          _os_log_impl(&dword_1B5291000, log, type, "Let Aurora know about AOD state = ON", v39, 2u);
        }
        -[CBAurora setAODIsOn:](v46->_aurora, "setAODIsOn:", 1);
      }
      if (-[CBDisplayModuleiOS edrIsEngaged](v46, "edrIsEngaged"))
      {
        context = (void *)MEMORY[0x1B5E4A8B0]();
        oslog = 0;
        if (v46->super.super._logHandle)
        {
          v23 = v46->super.super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v22 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v22 = init_default_corebrightness_log();
          v23 = v22;
        }
        oslog = v23;
        v37 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v54, 0x3FF0000000000000);
          _os_log_impl(&dword_1B5291000, oslog, v37, "AOD EDR | Entering AOD, reducing EDR headroom to %f", v54, 0xCu);
        }
        v21 = v46;
        v52[0] = CFSTR("AODEDRHeadroomRequest");
        v53[0] = MEMORY[0x1E0C9AAB0];
        v52[1] = -[CBBrightnessProxy brightnessRequestEDRHeadroom](v46->_brtCtl, "brightnessRequestEDRHeadroom");
        v53[1] = &unk_1E6917648;
        v52[2] = -[CBBrightnessProxy brightnessRequestRampDuration](v46->_brtCtl, "brightnessRequestRampDuration");
        v53[2] = &unk_1E6917658;
        -[CBDisplayModuleiOS setProperty:forKey:](v21, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3), CFSTR("EDRHeadroomRequest"));
        objc_autoreleasePoolPop(context);
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v42, "objectForKey:", CFSTR("EDRHeadroom"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (void *)MEMORY[0x1B5E4A8B0]();
        v36 = 0;
        if (v46->super.super._logHandle)
        {
          v19 = v46->super.super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v18 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v18 = init_default_corebrightness_log();
          v19 = v18;
        }
        v36 = v19;
        v35 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)objc_msgSend(v42, "objectForKey:", CFSTR("EDRHeadroom")), "floatValue");
          __os_log_helper_16_0_1_8_0((uint64_t)v51, COERCE__INT64(v6));
          _os_log_impl(&dword_1B5291000, v36, v35, "AOD EDR | AOD is exiting, instantaneously restoring EDR headroom to %f", v51, 0xCu);
        }
        v49[0] = CFSTR("AODEDRHeadroomRequest");
        v50[0] = MEMORY[0x1E0C9AAB0];
        v49[1] = -[CBBrightnessProxy brightnessRequestEDRHeadroom](v46->_brtCtl, "brightnessRequestEDRHeadroom");
        v50[1] = objc_msgSend(v42, "objectForKey:", CFSTR("EDRHeadroom"));
        v49[2] = -[CBBrightnessProxy brightnessRequestRampDuration](v46->_brtCtl, "brightnessRequestRampDuration");
        v50[2] = &unk_1E6917658;
        -[CBDisplayModuleiOS setProperty:forKey:](v46, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3), CFSTR("EDRHeadroomRequest"));
        objc_autoreleasePoolPop(v20);
      }
    }
    if (v46->_aurora)
    {
      v34 = 0;
      if (v46->super.super._logHandle)
      {
        v17 = v46->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v16 = init_default_corebrightness_log();
        v17 = v16;
      }
      v34 = v17;
      v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v34;
        v15 = v33;
        __os_log_helper_16_0_0(v32);
        _os_log_impl(&dword_1B5291000, v14, v15, "Let Aurora know about AOD state = OFF", v32, 2u);
      }
      -[CBAurora setAODIsOn:](v46->_aurora, "setAODIsOn:", 0);
    }
    v31 = -[CBDisplayModuleiOS copyPropertyForKey:](v46, "copyPropertyForKey:", CFSTR("TrustedLux"));
    if (v46->super.super._logHandle)
    {
      v13 = v46->super.super._logHandle;
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
      __os_log_helper_16_2_1_8_64((uint64_t)v48, (uint64_t)v31);
      _os_log_impl(&dword_1B5291000, v13, OS_LOG_TYPE_DEFAULT, "Kick in Aurora with trusted lux %@", v48, 0xCu);
    }
    -[CBDisplayModuleiOS handleNotificationForKey:withProperty:](v46, "handleNotificationForKey:withProperty:", CFSTR("TrustedLux"), v31);

    if (v46->_lastEDRHeadroomRequestFromCA)
    {
      v11 = (void *)MEMORY[0x1B5E4A8B0]();
      v30 = (id)objc_msgSend(v46->_lastEDRHeadroomRequestFromCA, "mutableCopy");
      objc_msgSend(v30, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("AODEDRHeadroomRequest"));
      if (v46->super.super._logHandle)
      {
        v10 = v46->super.super._logHandle;
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
        objc_msgSend((id)objc_msgSend(v30, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v46->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v47, COERCE__INT64(v7));
        _os_log_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEFAULT, "AOD EDR | Restoring EDR headroom after AOD exit to %f", v47, 0xCu);
      }
      -[CBDisplayModuleiOS setProperty:forKey:](v46, "setProperty:forKey:", v30, CFSTR("EDRHeadroomRequest"));
      objc_autoreleasePoolPop(v11);
    }
  }
  objc_autoreleasePoolPop(v29);
  return 1;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSMutableArray *subModules;
  char v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  uint64_t *v11;
  __IOHIDServiceClient *v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  char v17;
  __IOHIDServiceClient *v18;
  SEL v19;
  CBDisplayModuleiOS *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x20000000;
  v16 = 32;
  v17 = 0;
  subModules = self->_subModules;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __42__CBDisplayModuleiOS_addHIDServiceClient___block_invoke;
  v10 = &unk_1E68EA090;
  v11 = &v13;
  v12 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](subModules, "enumerateObjectsUsingBlock:", &v6);
  v5 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v5 & 1;
}

uint64_t __42__CBDisplayModuleiOS_addHIDServiceClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "addHIDServiceClient:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 24) & 1 | result & 1) != 0;
  }
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSMutableArray *subModules;
  char v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  uint64_t *v11;
  __IOHIDServiceClient *v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  char v17;
  __IOHIDServiceClient *v18;
  SEL v19;
  CBDisplayModuleiOS *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x20000000;
  v16 = 32;
  v17 = 0;
  subModules = self->_subModules;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __45__CBDisplayModuleiOS_removeHIDServiceClient___block_invoke;
  v10 = &unk_1E68EA090;
  v11 = &v13;
  v12 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](subModules, "enumerateObjectsUsingBlock:", &v6);
  v5 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v5 & 1;
}

uint64_t __45__CBDisplayModuleiOS_removeHIDServiceClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "removeHIDServiceClient:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 24) & 1 | result & 1) != 0;
  }
  return result;
}

- (__Display)displayInternal
{
  return self->_displayInternal;
}

- (CBBacklightNode)backlightParams
{
  return self->_backlightParams;
}

@end
