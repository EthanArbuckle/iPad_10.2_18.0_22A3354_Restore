@implementation NightModeControl

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  float v4;
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
  id v17;
  id v18;
  id v19;
  id v20;
  _BOOL4 available;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  id v33;
  id v34;

  objc_sync_enter(self);
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightnessFactor")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightnessFactorWithFade")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = (id)objc_msgSend(a3, "objectForKey:", CFSTR("DisplayBrightnessFactor"));
    else
      v34 = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v34, "floatValue");
      v5 = v4;
      if (v5 <= 0.0)
      {
        if (self->_notificationInProgress && self->_enableNotification)
          CFUserNotificationCancel(self->_enableNotification);
        if (self->_algoState == 2 || self->_algoState == 1)
        {
          self->_displayOffTimestamp = CFAbsoluteTimeGetCurrent();
          -[NightModeControl updateOptionTimestamp:](self, "updateOptionTimestamp:", self->_displayOffTimestamp);
          self->_checkInactivity = 1;
          if (self->_logLevel >= 7)
            NSLog(CFSTR("Display off with algoState=%d ts=%f\n"), self->_algoState, *(_QWORD *)&self->_displayOffTimestamp);
        }
        -[NightModeControl tearDownAllTimers](self, "tearDownAllTimers", v5);
        -[CBAnalyticsNightShiftTracker stop:isEnabled:](self->_modeTracker, "stop:isEnabled:", self->_status.mode, self->_status.enabled);
        self->_displayOff = 1;
      }
      else if (self->_displayOff)
      {
        self->_displayOff = 0;
        -[CBAnalyticsNightShiftTracker start:](self->_modeTracker, "start:", self->_status.enabled, v5);
        v33 = -[SunriseSunsetProvider copySunriseSunsetInfo:](self->_sunriseSunsetProvider, "copySunriseSunsetInfo:", self->_sunriseSunsetInfoQueryTimeout);
        if (v33)
        {
          -[NightModeControl updateSunriseSunsetInfo:](self, "updateSunriseSunsetInfo:", v33);

        }
        LODWORD(v6) = 0;
        -[NightModeControl reevaluateCurrentStateWithFactorFadeOption:](self, "reevaluateCurrentStateWithFactorFadeOption:", v6);
      }
    }
    goto LABEL_98;
  }
  if ((objc_msgSend(a4, "isEqual:", CFSTR("CBSystemDidWakeFromSleep")) & 1) != 0)
  {
    if (self->_logLevel >= 7)
      NSLog(CFSTR("%s: Force Night Shift update on system wake"), "-[NightModeControl setProperty:forKey:]");
    LODWORD(v7) = 0;
    -[NightModeControl reevaluateCurrentStateWithFactorFadeOption:](self, "reevaluateCurrentStateWithFactorFadeOption:", v7);
    goto LABEL_98;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AutoBlueReductionEnabled")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("BlueReductionAvailable")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("CBDisplayPresetDisableNightShift")) & 1) != 0)
  {
    v32 = -1.0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AutoBlueReductionEnabled")) & 1) != 0)
      {
        self->_status.active = objc_msgSend(a3, "intValue") != 0;
        -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", a3, a4);
      }
      else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CBDisplayPresetDisableNightShift")) & 1) != 0)
      {
        available = self->_status.available;
        if (available != (objc_msgSend(a3, "intValue") == 0))
        {
          -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, a4);
          self->_status.available = objc_msgSend(a3, "intValue") == 0;
          v32 = 0.0;
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_status.available);
          -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v31, CFSTR("BlueReductionAvailable"));

        }
      }
      else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueReductionAvailable")) & 1) != 0)
      {
        self->_status.available = objc_msgSend(a3, "intValue") != 0;
        -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", a3, a4);
      }
      if (self->_status.active && self->_status.available)
      {
        if (-[NSMutableArray count](self->_supportObjs, "count"))
        {
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
          if (v27)
          {
            v18 = objc_alloc(MEMORY[0x1E0CB37E8]);
            *(float *)&v10 = self->_factorState.factor;
            v26 = (void *)objc_msgSend(v18, "initWithFloat:", v10);
            if (v26)
            {
              -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v26, CFSTR("BlueLightReductionFactor"));
              objc_msgSend(v27, "setObject:forKey:", v26, CFSTR("BlueLightReductionFactorValue"));

            }
            v17 = objc_alloc(MEMORY[0x1E0CB37E8]);
            HIDWORD(v11) = HIDWORD(v32);
            *(float *)&v11 = v32;
            v25 = (void *)objc_msgSend(v17, "initWithFloat:", v11);
            if (v25)
            {
              objc_msgSend(v27, "setObject:forKey:", v25, CFSTR("BlueLightReductionFactorFadePeriod"));

            }
            -[NightModeControl setNightShiftFactorDictionary:](self, "setNightShiftFactorDictionary:", v27);

          }
        }
        -[NightModeControl reevaluateCurrentState](self, "reevaluateCurrentState");
      }
      else if (-[NSMutableArray count](self->_supportObjs, "count"))
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        if (v30)
        {
          v20 = objc_alloc(MEMORY[0x1E0CB37E8]);
          LODWORD(v8) = 0;
          v29 = (void *)objc_msgSend(v20, "initWithFloat:", v8);
          if (v29)
          {
            -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v29, CFSTR("BlueLightReductionFactor"));
            objc_msgSend(v30, "setObject:forKey:", v29, CFSTR("BlueLightReductionFactorValue"));

          }
          v19 = objc_alloc(MEMORY[0x1E0CB37E8]);
          HIDWORD(v9) = HIDWORD(v32);
          *(float *)&v9 = v32;
          v28 = (void *)objc_msgSend(v19, "initWithFloat:", v9);
          if (v28)
          {
            objc_msgSend(v30, "setObject:forKey:", v28, CFSTR("BlueLightReductionFactorFadePeriod"));

          }
          -[NightModeControl setNightShiftFactorDictionary:](self, "setNightShiftFactorDictionary:", v30);

        }
      }
    }
    goto LABEL_98;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueLightReductionSchedule")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NightModeControl setSchedule:](self, "setSchedule:", a3);
      -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", a3, a4);
      -[NightModeControl reevaluateCurrentState](self, "reevaluateCurrentState");
    }
    goto LABEL_98;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueReductionEnabled")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionEnabledValue"));
      if (v24)
      {
        v23 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionEnabledOption"));
        if (v23)
          -[NightModeControl enableBlueLightReduction:withOption:](self, "enableBlueLightReduction:withOption:", objc_msgSend(v24, "intValue") != 0, objc_msgSend(v23, "intValue"));
        else
          -[NightModeControl enableBlueLightReduction:withOption:](self, "enableBlueLightReduction:withOption:", objc_msgSend(v24, "intValue") != 0, 0);
        -[NightModeControl updateLowPowerModeState:](self, "updateLowPowerModeState:", 0);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        NSLog(CFSTR("%s: internal settings workaround \n"), "-[NightModeControl setProperty:forKey:]");
        -[NightModeControl setMode:](self, "setMode:", 0);
        *(float *)&v12 = (float)(int)objc_msgSend(a3, "intValue");
        -[NightModeControl setNightModeFactor:](self, "setNightModeFactor:", v12);
      }
    }
    goto LABEL_98;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueReductionMode")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, a4);
      -[NightModeControl setMode:](self, "setMode:", objc_msgSend(a3, "intValue"));
      -[NightModeControl updateLowPowerModeState:](self, "updateLowPowerModeState:", 0);
    }
    goto LABEL_98;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("LogLevel")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("BlueLightReductionLogging")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_logLevel = objc_msgSend(a3, "intValue");
      -[SunriseSunsetProvider setLogLevel:](self->_sunriseSunsetProvider, "setLogLevel:", self->_logLevel);
    }
    goto LABEL_98;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueLightReductionTransitionLength")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, a4);
      objc_msgSend(a3, "floatValue");
      self->_transitionLength = v13;
    }
LABEL_84:
    -[NightModeControl reevaluateCurrentState](self, "reevaluateCurrentState");
    goto LABEL_98;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueLightReductionTransitionRate")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, a4);
      objc_msgSend(a3, "floatValue");
      self->_transitionRate = v14;
    }
    goto LABEL_84;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueLightReductionInactivityTimeout")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, a4);
      objc_msgSend(a3, "floatValue");
      self->_inactivityTimeout = v15;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueLightReductionSunInfoQueryTimeout")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, CFSTR("BlueLightReductionSunInfoQueryTimeout"));
      self->_sunriseSunsetInfoQueryTimeout = objc_msgSend(a3, "intValue");
    }
  }
  else
  {
    objc_msgSend(a4, "isEqualToString:", CFSTR("EcoMode"));
  }
LABEL_98:
  objc_sync_exit(self);
  return 1;
}

- (BOOL)parseStatusDictionary:(id)a3 intoStruct:(id *)a4 shouldUpdatePrefs:(BOOL *)a5
{
  char isKindOfClass;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v19 = 0;
  if (a5)
    *a5 = 0;
  objc_msgSend(a3, "objectForKey:", CFSTR("Version"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("Version")), "intValue") != 1)
    return 0;
  a4->var0 = 1;
  objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionEnabled"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
    return 0;
  a4->var1 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionEnabled")), "intValue") != 0;
  objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionMode"));
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();
  if ((v6 & 1) == 0)
    return 0;
  a4->var3 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionMode")), "intValue");
  if (a4->var3)
    v19 = 1;
  objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionSunScheduleAllowed"));
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();
  if ((v7 & 1) == 0)
    return 0;
  a4->var2 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionSunScheduleAllowed")), "intValue") != 0;
  v18 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionSchedule"));
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();
  if ((v8 & 1) == 0)
    return 0;
  objc_msgSend(v18, "objectForKey:", CFSTR("NightStartHour"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  a4->var4.var0.var0 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("NightStartHour")), "intValue");
  objc_msgSend(v18, "objectForKey:", CFSTR("NightStartMinute"));
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  if ((v9 & 1) == 0)
    return 0;
  a4->var4.var0.var1 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("NightStartMinute")), "intValue");
  objc_msgSend(v18, "objectForKey:", CFSTR("DayStartHour"));
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();
  if ((v10 & 1) == 0)
    return 0;
  a4->var4.var1.var0 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("DayStartHour")), "intValue");
  objc_msgSend(v18, "objectForKey:", CFSTR("DayStartMinute"));
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();
  if ((v11 & 1) == 0)
    return 0;
  a4->var4.var1.var1 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("DayStartMinute")), "intValue");
  objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionDisableScheduleAlertCounter"));
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();
  if ((v12 & 1) != 0)
    self->_notifyUserAboutScheduleCounter = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionDisableScheduleAlertCounter")), "intValue");
  if (self->_notifyUserAboutScheduleCounter < 3 && (v19 & 1) != 0)
  {
    self->_notifyUserAboutScheduleCounter = 3;
    if (a5)
      *a5 = 1;
  }
  objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionRevertToSunriseSunset"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_revertToSunriseSunset = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionRevertToSunriseSunset")), "intValue") != 0;
  objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionAlgoOverride"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_algoState = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionAlgoOverride")), "intValue");
    if (self->_algoState == 2 || self->_algoState == 1)
    {
      v17 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionAlgoOverrideTimestamp"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->_checkInactivity = 1;
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        self->_displayOffTimestamp = v13;
      }
    }
    else if (self->_algoState == 4 || self->_algoState == 3)
    {
      v16 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionAlgoOverrideTimestamp"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        self->_untilNexTransitionTimestamp = v14;
      }
    }
  }
  return 1;
}

- (id)copyDictionaryFromStatus:(id *)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v15 = 0;
  if (a3)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
    if (v5)
    {
      objc_msgSend(v15, "setObject:forKey:", v5, CFSTR("AutoBlueReductionEnabled"));

    }
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var1);
    if (v6)
    {
      objc_msgSend(v15, "setObject:forKey:", v6, CFSTR("BlueReductionEnabled"));

    }
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var3);
    if (v7)
    {
      objc_msgSend(v15, "setObject:forKey:", v7, CFSTR("BlueReductionMode"));

    }
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var2);
    if (v8)
    {
      objc_msgSend(v15, "setObject:forKey:", v8, CFSTR("BlueReductionSunScheduleAllowed"));

    }
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var6);
    if (v9)
    {
      objc_msgSend(v15, "setObject:forKey:", v9, CFSTR("BlueReductionAvailable"));

    }
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    if (v4)
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var4.var0.var0);
      if (v10)
      {
        objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("NightStartHour"));

      }
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var4.var0.var1);
      if (v11)
      {
        objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("NightStartMinute"));

      }
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var4.var1.var0);
      if (v12)
      {
        objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("DayStartHour"));

      }
      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var4.var1.var1);
      if (v13)
      {
        objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("DayStartMinute"));

      }
      objc_msgSend(v15, "setObject:forKey:", v4, CFSTR("BlueLightReductionSchedule"));

      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
      if (v14)
      {
        objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("Version"));

      }
    }
  }
  return v15;
}

- (void)saveStatusToPrefs:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
    if (v3)
    {
      if (objc_msgSend(v3, "objectForKey:", CFSTR("CBBlueReductionStatus")) || !self->_statusUpdated)
      {
        objc_msgSend(v3, "setObject:forKey:", a3, CFSTR("CBBlueReductionStatus"));
        objc_msgSend(v3, "synchronize");
        self->_statusUpdated = 1;
      }

    }
  }
}

- (id)copyStatusDictionaryFromPrefs
{
  id v3;
  void *v4;

  v4 = 0;
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
  if (v3)
  {
    objc_msgSend(v3, "synchronize");
    v4 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("CBBlueReductionStatus"));
    if (v4)
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);

  }
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: %@ \n"), "-[NightModeControl copyStatusDictionaryFromPrefs]", v4);
  return v4;
}

- (void)updateStatusDictionaryWithValue:(id)a3 forKey:(id)a4
{
  id v4;
  char v5;
  void *v6;

  if (self->_properties)
  {
    v6 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("CBBlueReductionStatus"));
    if (v6)
    {
      v5 = 1;
      if (a3)
      {
        objc_msgSend(v6, "setObject:forKey:", a3, a4);
      }
      else if (objc_msgSend(v6, "objectForKey:", a4))
      {
        objc_msgSend(v6, "removeObjectForKey:", a4);
      }
      else
      {
        v5 = 0;
      }
      if ((v5 & 1) != 0)
      {
        -[NightModeControl saveStatusToPrefs:](self, "saveStatusToPrefs:", v6);
        if (self->_callbackBlock
          && ((objc_msgSend(a4, "isEqualToString:", CFSTR("AutoBlueReductionEnabled")) & 1) != 0
           || (objc_msgSend(a4, "isEqualToString:", CFSTR("BlueReductionEnabled")) & 1) != 0
           || (objc_msgSend(a4, "isEqualToString:", CFSTR("BlueReductionMode")) & 1) != 0
           || (objc_msgSend(a4, "isEqualToString:", CFSTR("BlueReductionSunScheduleAllowed")) & 1) != 0
           || (objc_msgSend(a4, "isEqualToString:", CFSTR("BlueLightReductionDisableFlags")) & 1) != 0
           || (objc_msgSend(a4, "isEqualToString:", CFSTR("BlueReductionAvailable")) & 1) != 0
           || (objc_msgSend(a4, "isEqualToString:", CFSTR("BlueLightReductionSchedule")) & 1) != 0))
        {
          (*((void (**)(void))self->_callbackBlock + 2))();
        }
        if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueReductionEnabled")) & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D01FB0]), "initWithStarting:reason:", a3, 0);
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)BiomeLibrary(), "Device"), "Display"), "NightShift"), "source"), "sendEvent:", v4);

          }
        }
      }
    }
    if (self->_logLevel >= 7)
      NSLog(CFSTR("%s: %@ (%@) -> %@ \n"), "-[NightModeControl updateStatusDictionaryWithValue:forKey:]", a4, a3, v6);
  }
}

- (void)updateLowPowerModeState:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
  if (v3)
  {
    if (a3)
    {
      objc_msgSend(v3, "setObject:forKey:", a3, CFSTR("BLRLowPowerSavedMode"));
      objc_msgSend(v3, "synchronize");
    }
    else if (objc_msgSend(v3, "objectForKey:", CFSTR("BLRLowPowerSavedMode")))
    {
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("BLRLowPowerSavedMode"));
      objc_msgSend(v3, "synchronize");
    }

  }
}

- (id)copyLowPowerModeState
{
  unsigned int v3;
  id v4;
  void *v5;
  void *v6;

  v5 = 0;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
  if (v4)
  {
    objc_msgSend(v4, "synchronize");
    v6 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("BLRLowPowerSavedMode"));
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v3 = objc_msgSend(v6, "intValue");
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v3);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (NightModeControl)initWithSupportObject:(id)a3 queue:(id)a4 callback:(id)a5
{
  uint64_t v5;
  double v6;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  CBAnalyticsNightShiftTracker *v16;
  CFAbsoluteTime Current;
  id v18;
  uint64_t v19;
  SunriseSunsetProvider *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  _QWORD *v35;
  _QWORD v36[2];
  int v37;
  int v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  char *v41;
  objc_super v42;
  id v43;
  id v44;
  id v45;
  SEL v46;
  char *v47;

  v47 = (char *)self;
  v46 = a2;
  v45 = a3;
  v44 = a4;
  v43 = a5;
  NSLog(CFSTR("Night mode init"));
  v42.receiver = v47;
  v42.super_class = (Class)NightModeControl;
  v47 = -[NightModeControl init](&v42, sel_init);
  if (v47)
  {
    if (v44 && v43)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
      *((_QWORD *)v47 + 1) = v5;
      v36[0] = 0;
      v36[1] = v36;
      v37 = 1375731712;
      v38 = 48;
      v39 = __Block_byref_object_copy__2;
      v40 = __Block_byref_object_dispose__2;
      v41 = v47;
      v20 = [SunriseSunsetProvider alloc];
      v30 = MEMORY[0x1E0C809B0];
      v31 = -1073741824;
      v32 = 0;
      v33 = __57__NightModeControl_initWithSupportObject_queue_callback___block_invoke;
      v34 = &unk_1E68EA218;
      v35 = v36;
      v19 = -[SunriseSunsetProvider initWithCallback:](v20, "initWithCallback:", &v30);
      *((_QWORD *)v47 + 2) = v19;
      *((_DWORD *)v47 + 6) = 20;
      if (!*((_QWORD *)v47 + 2))
        NSLog(CFSTR("%s: ERROR - sunrise/sunset provider not loaded information not available \n"), "-[NightModeControl initWithSupportObject:queue:callback:]");
      *((_QWORD *)v47 + 38) = CFSTR("sunrise");
      *((_QWORD *)v47 + 39) = CFSTR("sunset");
      *((_QWORD *)v47 + 40) = CFSTR("previousSunrise");
      *((_QWORD *)v47 + 41) = CFSTR("previousSunset");
      *((_QWORD *)v47 + 42) = CFSTR("nextSunrise");
      *((_QWORD *)v47 + 43) = CFSTR("nextSunset");
      *((_QWORD *)v47 + 44) = CFSTR("isDaylight");
      *((_QWORD *)v47 + 4) = 0;
      v47[192] = 0;
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *((_QWORD *)v47 + 5) = v18;
      if (v45)
        objc_msgSend(*((id *)v47 + 5), "addObject:", v45);
      *((_QWORD *)v47 + 6) = v44;
      dispatch_retain(*((dispatch_object_t *)v47 + 6));
      *((_DWORD *)v47 + 20) = 0;
      *((_DWORD *)v47 + 31) = 0;
      *((_DWORD *)v47 + 32) = 0;
      *((_DWORD *)v47 + 30) = 0;
      *((_DWORD *)v47 + 25) = 0;
      *((float *)v47 + 26) = 1.0;
      v47[221] = 1;
      Current = CFAbsoluteTimeGetCurrent();
      *((CFAbsoluteTime *)v47 + 26) = Current;
      *((CFAbsoluteTime *)v47 + 25) = Current;
      v47[220] = 0;
      *((_DWORD *)v47 + 54) = 1155596288;
      *((_QWORD *)v47 + 7) = 0;
      *((_QWORD *)v47 + 8) = 0;
      v16 = objc_alloc_init(CBAnalyticsNightShiftTracker);
      *((_QWORD *)v47 + 9) = v16;
      *((_DWORD *)v47 + 49) = 0;
      *((_DWORD *)v47 + 90) = 0;
      v47[377] = 0;
      *((_DWORD *)v47 + 70) = 22;
      *((_DWORD *)v47 + 71) = 0;
      *((_DWORD *)v47 + 72) = 7;
      *((_DWORD *)v47 + 73) = 0;
      v47[296] = 0;
      *((_QWORD *)v47 + 33) = 0;
      *((_QWORD *)v47 + 17) = CFTimeZoneCopySystem();
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v15, "addObserver:selector:name:object:", v47, sel_timeZoneChanged, *MEMORY[0x1E0C998A0], 0);
      v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v14, "addObserver:selector:name:object:", v47, sel_clockChanged, *MEMORY[0x1E0C99898], 0);
      v29 = 0;
      v28 = (void *)objc_msgSend(v47, "copyStatusDictionaryFromPrefs");
      if (v28)
      {
        v27 = (void *)objc_msgSend(v47, "copyLowPowerModeState");
        if (v27)
        {
          objc_msgSend(v28, "setObject:forKey:", v27, CFSTR("BlueReductionMode"));
          objc_msgSend(v47, "updateLowPowerModeState:", 0);

        }
        objc_msgSend(v28, "removeObjectForKey:", CFSTR("BlueLightReductionDisableFlags"));
        v47[296] = 1;
        if ((objc_msgSend(v47, "parseStatusDictionary:intoStruct:shouldUpdatePrefs:", v28, v47 + 240, &v29) & 1) != 0)
        {
          NSLog(CFSTR("%s: Defaults found and valid \n"), "-[NightModeControl initWithSupportObject:queue:callback:]");
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
          if (v26)
          {
            objc_msgSend(v28, "setValue:forKey:", v26, CFSTR("AutoBlueReductionEnabled"));
            objc_msgSend(v28, "setValue:forKey:", v26, CFSTR("BlueReductionAvailable"));

          }
        }
        else
        {

          v28 = 0;
          NSLog(CFSTR("%s: Defaults found and invalid \n"), "-[NightModeControl initWithSupportObject:queue:callback:]");
        }
      }
      v47[272] = 1;
      if (!v28)
      {
        NSLog(CFSTR("%s: Creating defaults status info \n"), "-[NightModeControl initWithSupportObject:queue:callback:]");
        v47[240] = 1;
        v47[241] = 0;
        *((_DWORD *)v47 + 61) = 0;
        *((_DWORD *)v47 + 62) = 22;
        *((_DWORD *)v47 + 63) = 0;
        *((_DWORD *)v47 + 64) = 7;
        *((_DWORD *)v47 + 65) = 0;
        v47[242] = 0;
        v28 = (void *)objc_msgSend(v47, "copyDictionaryFromStatus:", v47 + 240);
      }
      if (v28)
      {
        if (*((_QWORD *)v47 + 1))
          objc_msgSend(*((id *)v47 + 1), "setObject:forKey:", v28, CFSTR("CBBlueReductionStatus"));

      }
      if ((v29 & 1) != 0)
      {
        v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v25 = (void *)objc_msgSend(v13, "initWithInt:", *((unsigned int *)v47 + 90));
        if (v25)
        {
          objc_msgSend(v47, "updateStatusDictionaryWithValue:forKey:", v25, CFSTR("BlueLightReductionDisableScheduleAlertCounter"));

        }
      }
      if (v43)
      {
        v12 = objc_msgSend(v43, "copy");
        *((_QWORD *)v47 + 29) = v12;
      }
      if (*((_DWORD *)v47 + 61) == 1)
        *((_DWORD *)v47 + 21) = 1155596288;
      else
        *((_DWORD *)v47 + 21) = 1123024896;
      *((_DWORD *)v47 + 22) = *((_DWORD *)v47 + 21);
      *((float *)v47 + 24) = 2.0;
      *((float *)v47 + 23) = 1.0;
      if (*((_QWORD *)v47 + 1))
      {
        v11 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v21 = (id)objc_msgSend(v11, "initWithInt:", (int)*((float *)v47 + 21));
        if (v21)
        {
          objc_msgSend(*((id *)v47 + 1), "setObject:forKey:", v21, CFSTR("BlueLightReductionTransitionLength"));

        }
        v10 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v22 = (id)objc_msgSend(v10, "initWithInt:", (int)*((float *)v47 + 24));
        if (v22)
        {
          objc_msgSend(*((id *)v47 + 1), "setObject:forKey:", v22, CFSTR("BlueLightReductionTransitionRate"));

        }
        v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v23 = (id)objc_msgSend(v9, "initWithInt:", (int)*((float *)v47 + 54));
        if (v23)
        {
          objc_msgSend(*((id *)v47 + 1), "setObject:forKey:", v23, CFSTR("BlueLightReductionInactivityTimeout"));

        }
        v8 = objc_alloc(MEMORY[0x1E0CB37E8]);
        LODWORD(v6) = *((_DWORD *)v47 + 30);
        v24 = (id)objc_msgSend(v8, "initWithFloat:", v6);
        if (v24)
        {
          objc_msgSend(*((id *)v47 + 1), "setObject:forKey:", v24, CFSTR("BlueLightReductionFactor"));

        }
      }
      _Block_object_dispose(v36, 8);
    }
    else
    {

      return 0;
    }
  }
  return (NightModeControl *)v47;
}

void __57__NightModeControl_initWithSupportObject_queue_callback___block_invoke(uint64_t a1, void *a2)
{
  NSObject *global_queue;
  uint64_t block;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v14 = a1;
  v13 = a2;
  v12 = a1;
  v11 = objc_msgSend(a2, "copy");
  global_queue = dispatch_get_global_queue(2, 0);
  block = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __57__NightModeControl_initWithSupportObject_queue_callback___block_invoke_2;
  v8 = &unk_1E68EA1F0;
  v10 = *(_QWORD *)(a1 + 32);
  v9 = v11;
  dispatch_async(global_queue, &block);
}

uint64_t __57__NightModeControl_initWithSupportObject_queue_callback___block_invoke_2(uint64_t a1)
{
  id obj;

  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "updateSunriseSunsetInfo:", *(_QWORD *)(a1 + 32));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 244) == 1)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "reevaluateCurrentState");

  return objc_sync_exit(obj);
}

- (void)addSupportObject:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  SEL v7;
  NightModeControl *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  if (a3)
  {
    -[NSMutableArray addObject:](v8->_supportObjs, "addObject:", v6);
    v5 = -[NightModeControl getPropertyForKey:](v8, "getPropertyForKey:", CFSTR("BlueLightReductionFactor"));
    if (v5)
    {
      v4 = 0;
      v3 = objc_alloc(MEMORY[0x1E0C99D80]);
      v4 = (id)objc_msgSend(v3, "initWithObjectsAndKeys:", &unk_1E6916778, CFSTR("BlueLightReductionFactorFadePeriod"), v5, CFSTR("BlueLightReductionFactorValue"), MEMORY[0x1E0C9AAB0], CFSTR("ForceUpdate"), 0);
      objc_msgSend(v6, "setNightShiftFactorDictionary:", v4);

    }
  }
}

- (void)removeSupportObject:(id)a3
{
  if (a3)
    -[NSMutableArray removeObject:](self->_supportObjs, "removeObject:", a3);
}

- (void)dealloc
{
  void *v2;
  NightModeControl *obj;
  void *v4;
  objc_super v5;
  SEL v6;
  NightModeControl *v7;

  v7 = self;
  v6 = a2;
  NSLog(CFSTR("%s"), "-[NightModeControl dealloc]");
  obj = v7;
  objc_sync_enter(v7);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v4, "removeObserver:name:object:", v7, *MEMORY[0x1E0C998A0], 0);
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:name:object:", v7, *MEMORY[0x1E0C99898], 0);
  if (v7->_sunriseSunsetProvider)
  {
    -[SunriseSunsetProvider cancel](v7->_sunriseSunsetProvider, "cancel");

    v7->_sunriseSunsetProvider = 0;
  }
  if (v7->_callbackBlock)
  {

    v7->_callbackBlock = 0;
  }
  if (v7->_sunriseSunsetInfo)
  {

    v7->_sunriseSunsetInfo = 0;
  }
  if (v7->_properties)
  {

    v7->_properties = 0;
  }
  -[NightModeControl tearDownAllTimers](v7, "tearDownAllTimers");
  if (-[CBAnalyticsNightShiftTracker isStarted](v7->_modeTracker, "isStarted"))
    -[CBAnalyticsNightShiftTracker stop:isEnabled:](v7->_modeTracker, "stop:isEnabled:", v7->_status.mode, v7->_status.enabled);

  if (v7->_queue)
  {
    dispatch_release((dispatch_object_t)v7->_queue);
    v7->_queue = 0;
  }

  v7->_supportObjs = 0;
  if (v7->_currentTimeZone)
  {
    CFRelease(v7->_currentTimeZone);
    v7->_currentTimeZone = 0;
  }
  objc_sync_exit(obj);
  v5.receiver = v7;
  v5.super_class = (Class)NightModeControl;
  -[NightModeControl dealloc](&v5, sel_dealloc);
}

- (id)getPropertyForKey:(id)a3
{
  void *v5;

  objc_sync_enter(self);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3);
  objc_sync_exit(self);
  return v5;
}

- (void)setMode:(int)a3
{
  id v3;
  id v4;
  void *v5;

  if (self->_status.mode != a3)
  {
    if (a3 != 1 || self->_status.sunSchedulePermitted)
    {
      if (self->_logLevel >= 7)
        NSLog(CFSTR("%s: mode=%d \n"), "-[NightModeControl setMode:]", a3);
      -[CBAnalyticsNightShiftTracker update:isEnabled:](self->_modeTracker, "update:isEnabled:", self->_status.mode, self->_status.enabled);
      -[NightModeControl setAlgoState:](self, "setAlgoState:", 0);
      self->_status.mode = a3;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", self->_status.mode);
      if (v5)
      {
        -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v5, CFSTR("BlueReductionMode"));

      }
      if (self->_status.mode == 1)
        self->_transitionLength = 1800.0;
      else
        self->_transitionLength = 120.0;
      self->_transitionLengthActual = self->_transitionLength;
      self->_transitionsTimesCoeff = 1.0;
      if (self->_revertToSunriseSunset)
      {
        if (self->_logLevel >= 7)
          NSLog(CFSTR("%s: user changed mode - clearing out the sun mode revert mark \n"), "-[NightModeControl setMode:]");
        self->_revertToSunriseSunset = 0;
        v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
        -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v4, CFSTR("BlueLightReductionRevertToSunriseSunset"));

      }
      if (self->_notifyUserAboutScheduleCounter < 3)
      {
        if (a3)
        {
          self->_notifyUserAboutScheduleCounter = 3;
          v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", self->_notifyUserAboutScheduleCounter);
          if (v3)
          {
            -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v3, CFSTR("BlueLightReductionDisableScheduleAlertCounter"));

          }
        }
      }
      -[NightModeControl reevaluateCurrentState](self, "reevaluateCurrentState");
    }
    else if (self->_logLevel >= 7)
    {
      NSLog(CFSTR("%s: change to sun mode not permitted \n"), "-[NightModeControl setMode:]");
    }
  }
}

- (void)setSchedule:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: %@"), "-[NightModeControl setSchedule:]", a3);
  -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, CFSTR("BlueLightReductionSchedule"));
  if (objc_msgSend(a3, "count") == 4)
  {
    v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("DayStartHour"));
    if (v6)
      self->_status.schedule.toTime.hour = objc_msgSend(v6, "intValue");
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("DayStartMinute"));
    if (v6)
      self->_status.schedule.toTime.minute = objc_msgSend(v5, "intValue");
    v4 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NightStartHour"));
    if (v4)
      self->_status.schedule.fromTime.hour = objc_msgSend(v4, "intValue");
    v3 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NightStartMinute"));
    if (v3)
      self->_status.schedule.fromTime.minute = objc_msgSend(v3, "intValue");
  }
  else
  {
    NSLog(CFSTR("%s: insufficient number of records in schedule"), "-[NightModeControl setSchedule:]");
  }
}

- (void)enableBlueLightReduction:(BOOL)a3 withOption:(int)a4
{
  NightModeControl *v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;

  v7 = a3;
  v6 = a4;
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s mode=%d enable=%d option=%d"), "-[NightModeControl enableBlueLightReduction:withOption:]", self->_status.mode, a3, a4);
  if (self->_status.mode)
  {
    if (v6 == 3)
      v6 = 2;
    if (v6 == 1)
    {
      v4 = self;
      if (v7)
        v5 = 2;
      else
        v5 = 1;
    }
    else
    {
      v4 = self;
      if (v7)
        v5 = 4;
      else
        v5 = 3;
    }
    -[NightModeControl setAlgoState:](v4, "setAlgoState:", v5);
  }
  else if (v7)
  {
    if (v6 == 3)
    {
      -[NightModeControl displayAlertInteractive:](self, "displayAlertInteractive:", 1);
      return;
    }
    if (v6 == 1)
      -[NightModeControl setAlgoState:](self, "setAlgoState:", 2);
    else
      -[NightModeControl setAlgoState:](self, "setAlgoState:", 4);
  }
  else
  {
    -[NightModeControl setAlgoState:](self, "setAlgoState:", 0);
  }
  +[CBAnalytics nightShiftEnabled:withOption:](CBAnalytics, "nightShiftEnabled:withOption:", v7, v6);
  -[NightModeControl reevaluateCurrentState](self, "reevaluateCurrentState");
}

- (void)initiateTransitionTo:(float)a3 andRampLength:(float)a4
{
  dispatch_source_t v4;
  dispatch_time_t v5;
  NSObject *transitionTimer;
  NSObject *source;
  uint64_t handler;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  NightModeControl *v13;
  float v14;
  float v15;
  SEL v16;
  NightModeControl *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  -[NightModeControl cancelTransition](self, "cancelTransition");
  if (v17->_queue && v15 != v17->_factorState.factor)
  {
    v17->_factorState.start = v17->_factorState.factor;
    v17->_factorState.target = v15;
    v17->_factorState.rampStartTime = CFAbsoluteTimeGetCurrent();
    v17->_factorState.rampLength = v14;
    if (v17->_logLevel >= 7)
      NSLog(CFSTR("%s: [%f] START transition (%f -> %f) in %f sec "), "-[NightModeControl initiateTransitionTo:andRampLength:]", *(_QWORD *)&v17->_factorState.rampStartTime, v17->_factorState.start, v17->_factorState.target, v17->_factorState.rampLength);
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v17->_queue);
    v17->_transitionTimer = (OS_dispatch_source *)v4;
    source = v17->_transitionTimer;
    v5 = dispatch_time(0, 0);
    dispatch_source_set_timer(source, v5, (unint64_t)(float)(v17->_transitionRate * 1000000000.0), 0x3B9ACA00uLL);
    transitionTimer = v17->_transitionTimer;
    handler = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __55__NightModeControl_initiateTransitionTo_andRampLength___block_invoke;
    v12 = &unk_1E68E9E60;
    v13 = v17;
    dispatch_source_set_event_handler(transitionTimer, &handler);
    dispatch_resume((dispatch_object_t)v17->_transitionTimer);
  }
}

uint64_t __55__NightModeControl_initiateTransitionTo_andRampLength___block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "transitionTimerHandler");
  return objc_sync_exit(obj);
}

- (void)scheduleNextTransition:(double)a3 withType:(int)a4
{
  dispatch_source_t v4;
  NSObject *nextTransitionTimer;
  uint64_t handler;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  NightModeControl *v11;
  dispatch_time_t v12;
  double v13;
  double Current;
  int v15;
  double v16;
  SEL v17;
  NightModeControl *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  if (v18->_logLevel >= 7)
    NSLog(CFSTR("%s: next transition at %f (in %f seconds) \n"), "-[NightModeControl scheduleNextTransition:withType:]", *(_QWORD *)&v16, v16 - Current);
  if (v18->_nextTransitionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v18->_nextTransitionTimer);
    dispatch_release((dispatch_object_t)v18->_nextTransitionTimer);
    v18->_nextTransitionTimer = 0;
  }
  v13 = (v16 - Current) * 1000000000.0 + 1000000000.0;
  v12 = 0;
  if (v13 < 3.1536e16)
  {
    v12 = dispatch_time(0, (uint64_t)v13);
  }
  else
  {
    if (v18->_logLevel >= 7)
      NSLog(CFSTR("%s: dispatch time overflow - clamping to DISPATCH_TIME_FOREVER"), "-[NightModeControl scheduleNextTransition:withType:]");
    v12 = -1;
  }
  if (v18->_queue)
  {
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v18->_queue);
    v18->_nextTransitionTimer = (OS_dispatch_source *)v4;
    dispatch_source_set_timer((dispatch_source_t)v18->_nextTransitionTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    nextTransitionTimer = v18->_nextTransitionTimer;
    handler = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __52__NightModeControl_scheduleNextTransition_withType___block_invoke;
    v10 = &unk_1E68E9E60;
    v11 = v18;
    dispatch_source_set_event_handler(nextTransitionTimer, &handler);
    v18->_currentScheduledTransitionType = v15;
    dispatch_resume((dispatch_object_t)v18->_nextTransitionTimer);
  }
}

uint64_t __52__NightModeControl_scheduleNextTransition_withType___block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 56));
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 56));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "reevaluateCurrentState");
  return objc_sync_exit(obj);
}

- (void)setNightModeFactor:(float)a3
{
  double v3;

  LODWORD(v3) = -1.0;
  -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", *(double *)&a3, v3);
}

- (void)setNightModeFactor:(float)a3 withFadePeriod:(float)a4
{
  id v4;
  double v5;
  id v6;
  double v7;
  float minFactor;
  float maxFactor;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;

  if (a3 <= self->_maxFactor)
    maxFactor = a3;
  else
    maxFactor = self->_maxFactor;
  if (maxFactor >= self->_minFactor)
    minFactor = maxFactor;
  else
    minFactor = self->_minFactor;
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: factor=%f period=%f"), "-[NightModeControl setNightModeFactor:withFadePeriod:]", minFactor, a4);
  self->_factorState.factor = minFactor;
  a3 = minFactor;
  v14 = minFactor > self->_minFactor;
  if (self->_status.enabled != v14)
  {
    self->_status.enabled = minFactor > self->_minFactor;
    -[CBAnalyticsNightShiftTracker update:isEnabled:](self->_modeTracker, "update:isEnabled:", self->_status.mode, v14, *(double *)&a3);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", self->_status.enabled);
    if (v13)
    {
      -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v13, CFSTR("BlueReductionEnabled"));

    }
  }
  if (-[NSMutableArray count](self->_supportObjs, "count", *(double *)&a3))
  {
    if (self->_status.active && self->_status.available)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      if (v12)
      {
        v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v5 = minFactor;
        v11 = (id)objc_msgSend(v4, "initWithFloat:", v5);
        if (v11)
        {
          -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v11, CFSTR("BlueLightReductionFactor"));
          objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("BlueLightReductionFactorValue"));

        }
        v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v7 = a4;
        v10 = (id)objc_msgSend(v6, "initWithFloat:", v7);
        if (v10)
        {
          objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("BlueLightReductionFactorFadePeriod"));

        }
        -[NightModeControl setNightShiftFactorDictionary:](self, "setNightShiftFactorDictionary:", v12);

      }
    }
  }
}

- (void)transitionTimerHandler
{
  CFAbsoluteTime Current;
  float factor;
  double v4;

  Current = CFAbsoluteTimeGetCurrent();
  v4 = Current;
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: now=%f"), "-[NightModeControl transitionTimerHandler]", *(_QWORD *)&Current);
  factor = self->_factorState.factor;
  if (self->_factorState.start >= self->_factorState.target)
  {
    if (self->_factorState.start > self->_factorState.target)
    {
      Current = self->_factorState.start
              - (float)(self->_factorState.start - self->_factorState.target)
              * ((v4 - self->_factorState.rampStartTime)
               / self->_factorState.rampLength);
      *(float *)&Current = Current;
      factor = *(float *)&Current;
    }
  }
  else
  {
    Current = self->_factorState.start
            + (float)(self->_factorState.target - self->_factorState.start)
            * ((v4 - self->_factorState.rampStartTime)
             / self->_factorState.rampLength);
    *(float *)&Current = Current;
    factor = *(float *)&Current;
  }
  if (self->_factorState.start <= self->_factorState.target && factor >= self->_factorState.target
    || self->_factorState.start >= self->_factorState.target && factor <= self->_factorState.target)
  {
    factor = self->_factorState.target;
    if (self->_logLevel >= 7)
      NSLog(CFSTR("%s: blue light reduction factor ramp done (%f -> %f)\n"), "-[NightModeControl transitionTimerHandler]", self->_factorState.start, factor);
    if (self->_transitionTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_transitionTimer);
      dispatch_release((dispatch_object_t)self->_transitionTimer);
      self->_transitionTimer = 0;
    }
    -[NightModeControl setAlgoState:](self, "setAlgoState:", 0);
  }
  *(float *)&Current = factor;
  -[NightModeControl setNightModeFactor:](self, "setNightModeFactor:", Current);
}

- (BOOL)updateTransitionTimesFromSchedule:(double)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v8;
  double v9;
  unsigned int minute;
  unsigned int hour;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  __CFCalendar *v15;
  char v16;
  double v17;
  SEL v18;
  NightModeControl *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = 0;
  v15 = 0;
  v15 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
  if (v15)
  {
    CFCalendarSetTimeZone(v15, v19->_currentTimeZone);
    v14 = 0;
    v13 = 0;
    v12 = 0;
    hour = 0;
    minute = 0;
    if (CFCalendarDecomposeAbsoluteTime(v15, v17, "yMdHm", &v14, &v13, &v12, &hour, &minute))
    {
      if (v19->_status.mode)
      {
        hour = v19->_status.schedule.fromTime.hour;
        minute = v19->_status.schedule.fromTime.minute;
      }
      else
      {
        hour = 22;
        minute = 0;
      }
      if (CFCalendarComposeAbsoluteTime(v15, &v19->_sunsetAbsolute, "yMdHm", v14, v13, v12, hour, minute))
      {
        v19->_sunsetPreviousAbsolute = v19->_sunsetAbsolute;
        if (v19->_sunsetAbsolute >= v17)
          CFCalendarAddComponents(v15, &v19->_sunsetPreviousAbsolute, 0, "d", -1);
        else
          CFCalendarAddComponents(v15, &v19->_sunsetAbsolute, 0, "d", 1);
        if (v19->_status.mode)
        {
          hour = v19->_status.schedule.toTime.hour;
          minute = v19->_status.schedule.toTime.minute;
        }
        else
        {
          hour = 7;
          minute = 0;
        }
        if (CFCalendarComposeAbsoluteTime(v15, &v19->_sunriseAbsolute, "yMdHm", v14, v13, v12, hour, minute))
        {
          v19->_offTransitionTimeAbsoluteUnrestricted = v19->_sunriseAbsolute - v19->_transitionLength;
          if (v19->_sunriseAbsolute < v19->_sunsetAbsolute
            || v19->_sunriseAbsolute - v19->_sunsetAbsolute >= (float)(v19->_transitionLength * 2.0))
          {
            if (v19->_sunriseAbsolute < v19->_sunsetPreviousAbsolute
              || v19->_sunriseAbsolute - v19->_sunsetPreviousAbsolute >= (float)(v19->_transitionLength * 2.0))
            {
              v19->_transitionsTimesCoeff = 1.0;
              v19->_sunriseAbsolute = v19->_sunriseAbsolute - v19->_transitionLength;
              v19->_transitionLengthActual = v19->_transitionLength;
            }
            else
            {
              v8 = v19->_sunriseAbsolute - v19->_sunsetPreviousAbsolute;
              v5 = v8 / (float)(v19->_transitionLength * 2.0);
              v19->_transitionsTimesCoeff = v5;
              v19->_sunriseAbsolute = v19->_sunriseAbsolute - v8 / 2.0;
              v6 = v8 / 2.0;
              v19->_transitionLengthActual = v6;
              if (v19->_logLevel >= 7)
                NSLog(CFSTR("%s: transitions overlaping coeff=%f trLenghtActual=%f \n"), "-[NightModeControl updateTransitionTimesFromSchedule:]", v19->_transitionsTimesCoeff, v19->_transitionLengthActual);
            }
          }
          else
          {
            v9 = v19->_sunriseAbsolute - v19->_sunsetAbsolute;
            v3 = v9 / (float)(v19->_transitionLength * 2.0);
            v19->_transitionsTimesCoeff = v3;
            v19->_sunriseAbsolute = v19->_sunriseAbsolute - v9 / 2.0;
            v4 = v9 / 2.0;
            v19->_transitionLengthActual = v4;
            if (v19->_logLevel >= 7)
              NSLog(CFSTR("%s: transitions overlaping coeff=%f trLenghtActual=%f \n"), "-[NightModeControl updateTransitionTimesFromSchedule:]", v19->_transitionsTimesCoeff, v19->_transitionLengthActual);
          }
          v19->_sunrisePreviousAbsolute = v19->_sunriseAbsolute;
          if (v19->_sunriseAbsolute >= v17)
            CFCalendarAddComponents(v15, &v19->_sunrisePreviousAbsolute, 0, "d", -1);
          else
            CFCalendarAddComponents(v15, &v19->_sunriseAbsolute, 0, "d", 1);
          v19->_offTransitionTimeAbsoluteUnrestrictedPrev = v19->_offTransitionTimeAbsoluteUnrestricted;
          if (v19->_offTransitionTimeAbsoluteUnrestricted >= v17)
            CFCalendarAddComponents(v15, &v19->_offTransitionTimeAbsoluteUnrestrictedPrev, 0, "d", -1);
          else
            CFCalendarAddComponents(v15, &v19->_offTransitionTimeAbsoluteUnrestricted, 0, "d", 1);
          v16 = 1;
        }
        else
        {
          NSLog(CFSTR("FATAL ERROR (%s) - unable to obtain OFF transition time\n"), "-[NightModeControl updateTransitionTimesFromSchedule:]");
        }
      }
      else
      {
        NSLog(CFSTR("FATAL ERROR (%s) - unable to obtain ON transition time\n"), "-[NightModeControl updateTransitionTimesFromSchedule:]");
      }
    }
    CFRelease(v15);
  }
  return v16 & 1;
}

- (void)updateTransitionTimes:(double)a3
{
  double v3;
  SEL v4;
  NightModeControl *v5;

  v5 = self;
  v4 = a2;
  v3 = a3;
  if (self->_status.mode == 1)
    v5->_transitionTimesValid = -[NightModeControl updateTransitionTimesFromSunriseSunset:](v5, "updateTransitionTimesFromSunriseSunset:", v3);
  else
    v5->_transitionTimesValid = -[NightModeControl updateTransitionTimesFromSchedule:](v5, "updateTransitionTimesFromSchedule:", v3);
  if (v5->_logLevel >= 7)
    NSLog(CFSTR("%s: prev. sunrise=%f, prev. sunset=%f, sunrise=%f, sunset=%f, min factor=%f, max factor=%f\n"), "-[NightModeControl updateTransitionTimes:]", *(_QWORD *)&v5->_sunrisePreviousAbsolute, *(_QWORD *)&v5->_sunsetPreviousAbsolute, *(_QWORD *)&v5->_sunriseAbsolute, *(_QWORD *)&v5->_sunsetAbsolute, v5->_minFactor, v5->_maxFactor);
}

- (void)initiateRestrictedMaxTransition
{
  double v2;
  double v3;

  *(float *)&v2 = self->_maxFactor * self->_transitionsTimesCoeff;
  *(float *)&v3 = fabsf(-(float)(self->_factorState.factor - *(float *)&v2)) * self->_transitionLength;
  -[NightModeControl initiateTransitionTo:andRampLength:](self, "initiateTransitionTo:andRampLength:", v2, v3, a2, self);
}

- (void)initiateFullMaxTransition
{
  double v2;
  double v3;

  *(float *)&v2 = self->_maxFactor;
  *(float *)&v3 = (float)(*(float *)&v2 - self->_factorState.factor) * self->_transitionLength;
  -[NightModeControl initiateTransitionTo:andRampLength:](self, "initiateTransitionTo:andRampLength:", v2, v3, a2, self);
}

- (void)initiateFullMinTransition
{
  double v2;
  double v3;

  *(float *)&v2 = self->_minFactor;
  *(float *)&v3 = self->_factorState.factor * self->_transitionLength;
  -[NightModeControl initiateTransitionTo:andRampLength:](self, "initiateTransitionTo:andRampLength:", v2, v3, a2, self);
}

- (void)reevaluateCurrentState
{
  double v2;

  LODWORD(v2) = -1.0;
  -[NightModeControl reevaluateCurrentStateWithFactorFadeOption:](self, "reevaluateCurrentStateWithFactorFadeOption:", v2, a2, self);
}

- (void)reevaluateCurrentStateWithFactorFadeOption:(float)a3
{
  double untilNexTransitionTimestamp;
  double offTransitionTimeAbsoluteUnrestrictedPrev;
  double v5;
  double sunsetPreviousAbsolute;
  double transitionLengthActual;
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
  double transitionsTimesCoeff;
  double v22;
  char v23;
  double Current;

  Current = CFAbsoluteTimeGetCurrent();
  v23 = 0;
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: now=%f enabled=%d mode=%d algo=%d\n"), "-[NightModeControl reevaluateCurrentStateWithFactorFadeOption:]", *(_QWORD *)&Current, self->_status.enabled, self->_status.mode, self->_algoState);
  -[NightModeControl cancelSchedule](self, "cancelSchedule");
  -[NightModeControl cancelTransition](self, "cancelTransition");
  if (self->_checkInactivity)
  {
    if (self->_logLevel >= 7)
      NSLog(CFSTR("%s: check incativity \n"), "-[NightModeControl reevaluateCurrentStateWithFactorFadeOption:]");
    self->_checkInactivity = 0;
    if (Current - self->_displayOffTimestamp > self->_inactivityTimeout)
    {
      if (self->_logLevel >= 7)
        NSLog(CFSTR("%s: inactivity check passed \n"), "-[NightModeControl reevaluateCurrentStateWithFactorFadeOption:]");
      -[NightModeControl setAlgoState:](self, "setAlgoState:", 0);
    }
    -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", 0, CFSTR("BlueLightReductionAlgoOverrideTimestamp"));
  }
  if (self->_algoState == 4)
  {
    -[NightModeControl updateTransitionTimes:](self, "updateTransitionTimes:", Current);
    v23 = 1;
    if (self->_transitionTimesValid)
    {
      untilNexTransitionTimestamp = self->_untilNexTransitionTimestamp;
      offTransitionTimeAbsoluteUnrestrictedPrev = self->_offTransitionTimeAbsoluteUnrestrictedPrev;
      if (untilNexTransitionTimestamp < offTransitionTimeAbsoluteUnrestrictedPrev)
      {
        HIDWORD(untilNexTransitionTimestamp) = HIDWORD(Current);
        offTransitionTimeAbsoluteUnrestrictedPrev = self->_offTransitionTimeAbsoluteUnrestrictedPrev
                                                  + self->_transitionLength;
        if (Current >= offTransitionTimeAbsoluteUnrestrictedPrev)
          -[NightModeControl setAlgoState:](self, "setAlgoState:", 0, Current);
      }
    }
  }
  else if (self->_algoState == 3)
  {
    -[NightModeControl updateTransitionTimes:](self, "updateTransitionTimes:", Current);
    v23 = 1;
    if (self->_transitionTimesValid)
    {
      untilNexTransitionTimestamp = self->_untilNexTransitionTimestamp;
      offTransitionTimeAbsoluteUnrestrictedPrev = self->_sunsetPreviousAbsolute;
      if (untilNexTransitionTimestamp < offTransitionTimeAbsoluteUnrestrictedPrev)
        -[NightModeControl setAlgoState:](self, "setAlgoState:", 0);
    }
  }
  switch(self->_algoState)
  {
    case 3:
      if ((v23 & 1) == 0)
        -[NightModeControl updateTransitionTimes:](self, "updateTransitionTimes:", Current);
      v5 = self->_untilNexTransitionTimestamp;
      sunsetPreviousAbsolute = self->_sunsetPreviousAbsolute;
      if (v5 < sunsetPreviousAbsolute)
      {
        if (Current >= self->_sunsetPreviousAbsolute + self->_transitionLengthActual)
        {
          -[NightModeControl setAlgoState:](self, "setAlgoState:", 0, Current);
          *(float *)&v9 = self->_maxFactor * self->_transitionsTimesCoeff;
          *(float *)&v10 = a3;
          -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", v9, v10);
          if (self->_status.mode)
            -[NightModeControl scheduleNextTransition:withType:](self, "scheduleNextTransition:withType:", 2, self->_sunriseAbsolute);
        }
        else
        {
          transitionLengthActual = self->_transitionLengthActual;
          v8 = vabdd_f64(Current, self->_sunsetPreviousAbsolute) / transitionLengthActual;
          *(float *)&v8 = v8;
          *(float *)&transitionLengthActual = a3;
          -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", v8, transitionLengthActual);
          -[NightModeControl initiateRestrictedMaxTransition](self, "initiateRestrictedMaxTransition");
          if (self->_status.mode)
            -[NightModeControl scheduleNextTransition:withType:](self, "scheduleNextTransition:withType:", 2, self->_sunriseAbsolute);
        }
        break;
      }
LABEL_32:
      *(float *)&v5 = self->_minFactor;
      *(float *)&sunsetPreviousAbsolute = a3;
      -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", v5, sunsetPreviousAbsolute);
      -[NightModeControl scheduleNextTransition:withType:](self, "scheduleNextTransition:withType:", 1, self->_sunsetAbsolute);
      break;
    case 4:
      if ((v23 & 1) == 0)
        -[NightModeControl updateTransitionTimes:](self, "updateTransitionTimes:", Current);
      v11 = self->_untilNexTransitionTimestamp;
      v12 = self->_offTransitionTimeAbsoluteUnrestrictedPrev + self->_transitionLength;
      if (v11 >= v12)
      {
        *(float *)&v11 = self->_maxFactor;
        *(float *)&v12 = a3;
        -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", v11, v12);
        -[NightModeControl scheduleNextTransition:withType:](self, "scheduleNextTransition:withType:", 2, self->_offTransitionTimeAbsoluteUnrestricted);
      }
      else if (Current >= self->_offTransitionTimeAbsoluteUnrestrictedPrev + self->_transitionLength)
      {
        -[NightModeControl setAlgoState:](self, "setAlgoState:", 0, Current);
        *(float *)&v15 = self->_minFactor;
        *(float *)&v16 = a3;
        -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", v15, v16);
        if (self->_status.mode)
          -[NightModeControl scheduleNextTransition:withType:](self, "scheduleNextTransition:withType:", 1, self->_sunsetAbsolute);
      }
      else
      {
        v13 = vabdd_f64(Current, self->_offTransitionTimeAbsoluteUnrestrictedPrev) / self->_transitionLength;
        v14 = self->_maxFactor - v13;
        *(float *)&v14 = v14;
        *(float *)&v13 = a3;
        -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", v14, v13);
        -[NightModeControl initiateFullMinTransition](self, "initiateFullMinTransition");
        if (self->_status.mode)
          -[NightModeControl scheduleNextTransition:withType:](self, "scheduleNextTransition:withType:", 1, self->_sunsetAbsolute);
      }
      break;
    case 2:
      *(float *)&untilNexTransitionTimestamp = self->_maxFactor;
      *(float *)&offTransitionTimeAbsoluteUnrestrictedPrev = a3;
      -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", untilNexTransitionTimestamp, offTransitionTimeAbsoluteUnrestrictedPrev);
      break;
    default:
      if (self->_algoState == 1 || !self->_status.mode)
      {
        *(float *)&untilNexTransitionTimestamp = self->_minFactor;
        *(float *)&offTransitionTimeAbsoluteUnrestrictedPrev = a3;
        -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", untilNexTransitionTimestamp, offTransitionTimeAbsoluteUnrestrictedPrev);
        break;
      }
      if ((v23 & 1) == 0)
        -[NightModeControl updateTransitionTimes:](self, "updateTransitionTimes:", Current);
      if (self->_transitionTimesValid)
      {
        if (self->_sunriseAbsolute < self->_sunsetAbsolute)
        {
          HIDWORD(v19) = HIDWORD(Current);
          v20 = self->_sunsetPreviousAbsolute + self->_transitionLengthActual;
          if (Current >= v20)
          {
            *(float *)&v19 = self->_maxFactor * self->_transitionsTimesCoeff;
            *(float *)&v20 = a3;
            -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", v19, v20);
            -[NightModeControl scheduleNextTransition:withType:](self, "scheduleNextTransition:withType:", 2, self->_sunriseAbsolute);
          }
          else
          {
            -[NightModeControl scheduleNextTransition:withType:](self, "scheduleNextTransition:withType:", 2, self->_sunriseAbsolute);
            transitionsTimesCoeff = self->_transitionsTimesCoeff;
            v22 = vabdd_f64(Current, self->_sunsetPreviousAbsolute)
                / self->_transitionLengthActual
                * transitionsTimesCoeff;
            *(float *)&v22 = v22;
            *(float *)&transitionsTimesCoeff = a3;
            -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", v22, transitionsTimesCoeff);
            -[NightModeControl initiateRestrictedMaxTransition](self, "initiateRestrictedMaxTransition");
          }
          break;
        }
        HIDWORD(v5) = HIDWORD(Current);
        sunsetPreviousAbsolute = self->_sunrisePreviousAbsolute + self->_transitionLengthActual;
        if (Current < sunsetPreviousAbsolute)
        {
          -[NightModeControl scheduleNextTransition:withType:](self, "scheduleNextTransition:withType:", 1, self->_sunsetAbsolute);
          v17 = self->_transitionsTimesCoeff;
          v18 = (self->_maxFactor - vabdd_f64(Current, self->_sunrisePreviousAbsolute) / self->_transitionLengthActual)
              * v17;
          *(float *)&v18 = v18;
          *(float *)&v17 = a3;
          -[NightModeControl setNightModeFactor:withFadePeriod:](self, "setNightModeFactor:withFadePeriod:", v18, v17);
          -[NightModeControl initiateFullMinTransition](self, "initiateFullMinTransition");
          break;
        }
        goto LABEL_32;
      }
      break;
  }
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: factor=%f"), "-[NightModeControl reevaluateCurrentStateWithFactorFadeOption:]", self->_factorState.factor);
}

- (void)setSunPermitted:(BOOL)a3
{
  id v3;
  id v4;
  id v5;

  if (self->_status.sunSchedulePermitted != a3)
  {
    self->_status.sunSchedulePermitted = a3;
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_status.sunSchedulePermitted);
    -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v5, CFSTR("BlueReductionSunScheduleAllowed"));
    +[CBAnalytics nightShiftSunSchedulePermitted:](CBAnalytics, "nightShiftSunSchedulePermitted:", self->_status.sunSchedulePermitted);

    if (self->_status.sunSchedulePermitted)
    {
      if (self->_revertToSunriseSunset)
      {
        if (self->_logLevel >= 7)
          NSLog(CFSTR("%s: reverting back to sun mode \n"), "-[NightModeControl setSunPermitted:]");
        self->_revertToSunriseSunset = 0;
        v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
        -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v3, CFSTR("BlueLightReductionRevertToSunriseSunset"));

        -[NightModeControl setMode:](self, "setMode:", 1);
      }
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](self->_properties, "removeObjectForKey:", CFSTR("BlueLightSunSchedule"));

      self->_sunriseSunsetInfo = 0;
      if (self->_status.mode == 1)
      {
        if (self->_logLevel >= 7)
          NSLog(CFSTR("%s: taking a mark to return to sun mode \n"), "-[NightModeControl setSunPermitted:]");
        -[NightModeControl setMode:](self, "setMode:", 0);
        self->_revertToSunriseSunset = 1;
        v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
        -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v4, CFSTR("BlueLightReductionRevertToSunriseSunset"));

      }
    }
  }
}

- (void)updateSunriseSunsetBackup
{
  CFAbsoluteTime v2;
  CFAbsoluteTime v3;
  __CFCalendar *calendar;
  int v5;
  int v6;
  int v7;
  int v8;
  SEL v9;
  NightModeControl *v10;

  v10 = self;
  v9 = a2;
  if (self->_status.sunSchedulePermitted)
  {
    v8 = 7;
    v7 = 0;
    v6 = 22;
    v5 = 0;
    if (v10->_sunriseSunsetInfo)
    {
      calendar = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
      if (calendar)
      {
        CFCalendarSetTimeZone(calendar, v10->_currentTimeZone);
        objc_msgSend(-[NSDictionary objectForKey:](v10->_sunriseSunsetInfo, "objectForKey:", v10->_nextSunriseKey), "timeIntervalSinceReferenceDate");
        if (!CFCalendarDecomposeAbsoluteTime(calendar, v2, "Hm", &v8, &v7))
        {
          v8 = 7;
          v7 = 0;
        }
        objc_msgSend(-[NSDictionary objectForKey:](v10->_sunriseSunsetInfo, "objectForKey:", v10->_nextSunsetKey), "timeIntervalSinceReferenceDate");
        if (!CFCalendarDecomposeAbsoluteTime(calendar, v3, "Hm", &v6, &v5))
        {
          v6 = 22;
          v5 = 0;
        }
        CFRelease(calendar);
      }
    }
    if (v6 != v10->_backupSchedule.fromTime.hour
      || v5 != v10->_backupSchedule.fromTime.minute
      || v8 != v10->_backupSchedule.toTime.hour
      || v5 != v10->_backupSchedule.toTime.minute)
    {
      v10->_backupSchedule.fromTime.hour = v6;
      v10->_backupSchedule.fromTime.minute = v5;
      v10->_backupSchedule.toTime.hour = v8;
      v10->_backupSchedule.toTime.minute = v7;
    }
  }
}

- (void)updateSunriseSunsetInfo:(id)a3
{
  NSDictionary *v3;
  int v4;

  if (a3)
  {
    v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("status")), "intValue");
    if (v4)
    {
      if (v4 == 1)
      {

        self->_sunriseSunsetInfo = (NSDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("sunSchedule"));
        v3 = self->_sunriseSunsetInfo;
        if (self->_sunriseSunsetInfo)
          -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", self->_sunriseSunsetInfo, CFSTR("BlueLightSunSchedule"));
        else
          -[NSMutableDictionary removeObjectForKey:](self->_properties, "removeObjectForKey:", CFSTR("BlueLightSunSchedule"));
        -[NightModeControl setSunPermitted:](self, "setSunPermitted:", 1);
        if (self->_logLevel >= 7)
        {
          if (self->_sunriseSunsetInfo)
            NSLog(CFSTR("%s: sunrise/sunset info: %@"), "-[NightModeControl updateSunriseSunsetInfo:]", self->_sunriseSunsetInfo);
          else
            NSLog(CFSTR("%s: sunrise/sunset info: %@"), "-[NightModeControl updateSunriseSunsetInfo:]", CFSTR("unavailable"));
        }
      }
      else if (v4 == 2)
      {
        if (self->_logLevel >= 7)
          NSLog(CFSTR("%s: sunrise/sunset info: unavailable but permited \n"), "-[NightModeControl updateSunriseSunsetInfo:]");
        -[NightModeControl setSunPermitted:](self, "setSunPermitted:", 1);
      }
      else
      {
        NSLog(CFSTR("%s: ERROR: unexpected status, ignore \n"), "-[NightModeControl updateSunriseSunsetInfo:]");
      }
    }
    else
    {
      if (self->_logLevel >= 7)
        NSLog(CFSTR("%s: sunrise/sunset not permitted \n"), "-[NightModeControl updateSunriseSunsetInfo:]");
      -[NightModeControl setSunPermitted:](self, "setSunPermitted:", 0);
    }
  }
  else if (self->_logLevel >= 7)
  {
    NSLog(CFSTR("%s: warning - sunrise/sunset key not found, waiting for recovery \n"), "-[NightModeControl updateSunriseSunsetInfo:]");
  }
  -[NightModeControl updateSunriseSunsetBackup](self, "updateSunriseSunsetBackup");
}

- (void)retrieveSunriseSunsetTimesFromBackup:(double)a3
{
  unsigned int minute;
  unsigned int hour;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  __CFCalendar *v8;
  double v9;
  SEL v10;
  NightModeControl *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = 0;
  v8 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
  if (v8)
  {
    CFCalendarSetTimeZone(v8, v11->_currentTimeZone);
    v7 = 0;
    v6 = 0;
    v5 = 0;
    hour = 0;
    minute = 0;
    if (CFCalendarDecomposeAbsoluteTime(v8, v9, "yMdHm", &v7, &v6, &v5, &hour, &minute))
    {
      hour = v11->_backupSchedule.fromTime.hour;
      minute = v11->_backupSchedule.fromTime.minute;
      if (CFCalendarComposeAbsoluteTime(v8, &v11->_sunsetAbsolute, "yMdHm", v7, v6, v5, hour, minute))
      {
        v11->_sunsetPreviousAbsolute = v11->_sunsetAbsolute;
        if (v11->_sunsetAbsolute >= v9)
          CFCalendarAddComponents(v8, &v11->_sunsetPreviousAbsolute, 0, "d", -1);
        else
          CFCalendarAddComponents(v8, &v11->_sunsetAbsolute, 0, "d", 1);
      }
      else
      {
        NSLog(CFSTR("FATAL ERROR (%s) - unable to obtain SS date\n"), "-[NightModeControl retrieveSunriseSunsetTimesFromBackup:]");
      }
      hour = v11->_backupSchedule.toTime.hour;
      minute = v11->_backupSchedule.toTime.minute;
      if (CFCalendarComposeAbsoluteTime(v8, &v11->_sunriseAbsolute, "yMdHm", v7, v6, v5, hour, minute))
      {
        v11->_sunriseAbsolute = v11->_sunriseAbsolute - v11->_transitionLength;
        v11->_sunrisePreviousAbsolute = v11->_sunriseAbsolute;
        if (v11->_sunriseAbsolute >= v9)
          CFCalendarAddComponents(v8, &v11->_sunrisePreviousAbsolute, 0, "d", -1);
        else
          CFCalendarAddComponents(v8, &v11->_sunriseAbsolute, 0, "d", 1);
      }
      else
      {
        NSLog(CFSTR("FATAL ERROR (%s) - unable to obtain SR date\n"), "-[NightModeControl retrieveSunriseSunsetTimesFromBackup:]");
      }
    }
    CFRelease(v8);
  }
}

- (BOOL)updateTransitionTimesFromSunriseSunset:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  double v13;
  int j;
  int i;
  double v16;
  double v17;
  unsigned int v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  double v26;
  SEL v27;
  NightModeControl *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = self;
  v27 = a2;
  v26 = a3;
  v25 = 0;
  if (self->_sunriseSunsetInfo)
  {
    v18 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"), "timeIntervalSinceReferenceDate");
    v17 = v3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"), "timeIntervalSinceReferenceDate");
    v16 = v4;
    v25 = 1;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_previousSunriseKey), "timeIntervalSinceReferenceDate");
    v29 = v5;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_previousSunsetKey), "timeIntervalSinceReferenceDate");
    v30 = v6;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_currentSunriseKey), "timeIntervalSinceReferenceDate");
    v31 = v7;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_currentSunsetKey), "timeIntervalSinceReferenceDate");
    v32 = v8;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_nextSunriseKey), "timeIntervalSinceReferenceDate");
    v33 = v9;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_nextSunsetKey), "timeIntervalSinceReferenceDate");
    v34 = v10;
    for (i = 0; i < 6; ++i)
    {
      if (*(&v29 + i) == v16 || *(&v29 + i) == v17)
      {
        ++v18;
        *(&v19 + i) = 0;
      }
      else
      {
        *(&v19 + i) = 1;
      }
    }
    v29 = v29 - v28->_transitionLength;
    v31 = v31 - v28->_transitionLength;
    v33 = v33 - v28->_transitionLength;
    -[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_isDaylightKey);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_isDaylightKey), "BOOLValue");
      v28->_isDaylight = v11 & 1;
    }
    if (v28->_logLevel >= 7)
      NSLog(CFSTR("%s: flag=%d isDaylight=%d\n"), "-[NightModeControl updateTransitionTimesFromSunriseSunset:]", v18, v28->_isDaylight);
    if (v18 == 6)
    {
      if (!v28->_isDaylight)
      {
LABEL_15:
        v28->_sunsetAbsolute = v17;
        v28->_sunriseAbsolute = v17 - 86400.0;
        v28->_sunsetPreviousAbsolute = v16 + 86400.0;
        v28->_sunrisePreviousAbsolute = v16;
        goto LABEL_107;
      }
      goto LABEL_83;
    }
    if (v18 == 5)
    {
      for (j = 0; j < 6; ++j)
      {
        if ((*(&v19 + j) & 1) != 0)
        {
          if (j % 2 == 1 && v26 < *(&v29 + j))
          {
            v28->_sunsetAbsolute = *(&v29 + j);
            v28->_sunriseAbsolute = v17;
            v28->_sunsetPreviousAbsolute = v16;
            v28->_sunrisePreviousAbsolute = v16;
          }
          else if (j % 2 == 1 && v26 >= *(&v29 + j))
          {
            v28->_sunsetAbsolute = v17;
            v28->_sunriseAbsolute = v17 - 86400.0;
            v28->_sunsetPreviousAbsolute = *(&v29 + j);
            v28->_sunrisePreviousAbsolute = v16;
          }
          else if (j % 2 || v26 >= *(&v29 + j))
          {
            v28->_sunsetAbsolute = v17 - 86400.0;
            v28->_sunriseAbsolute = v17;
            v28->_sunrisePreviousAbsolute = *(&v29 + j);
            v28->_sunsetPreviousAbsolute = v16;
          }
          else
          {
            v28->_sunsetAbsolute = v17;
            v28->_sunriseAbsolute = *(&v29 + j);
            v28->_sunsetPreviousAbsolute = v16 + 86400.0;
            v28->_sunrisePreviousAbsolute = v16;
          }
        }
      }
    }
    else if (v18)
    {
      if ((v22 & 1) != 0 && (v21 & 1) != 0)
      {
        if (v31 > v32)
        {
          if (v26 >= v32)
          {
            if (v26 >= v31)
            {
              if ((v23 & 1) != 0)
                v28->_sunriseAbsolute = v33;
              else
                v28->_sunriseAbsolute = v17;
              if ((v24 & 1) != 0)
                v28->_sunsetAbsolute = v34;
              else
                v28->_sunsetAbsolute = v17 - 86400.0;
              v28->_sunrisePreviousAbsolute = v31;
              v28->_sunsetPreviousAbsolute = v32;
            }
            else
            {
              v28->_sunriseAbsolute = v31;
              if ((v24 & 1) != 0)
                v28->_sunsetAbsolute = v34;
              else
                v28->_sunsetAbsolute = v17;
              if ((v19 & 1) != 0)
                v28->_sunrisePreviousAbsolute = v29;
              else
                v28->_sunrisePreviousAbsolute = v16;
              v28->_sunsetPreviousAbsolute = v32;
            }
          }
          else
          {
            v28->_sunriseAbsolute = v31;
            v28->_sunsetAbsolute = v32;
            if ((v19 & 1) != 0)
              v28->_sunrisePreviousAbsolute = v29;
            else
              v28->_sunrisePreviousAbsolute = v16;
            if ((v20 & 1) != 0)
              v28->_sunsetPreviousAbsolute = v30;
            else
              v28->_sunsetPreviousAbsolute = v16;
          }
        }
        else if (v26 >= v31)
        {
          if (v26 >= v32)
          {
            if ((v23 & 1) != 0)
              v28->_sunriseAbsolute = v33;
            else
              v28->_sunriseAbsolute = v17 - 86400.0;
            if ((v24 & 1) != 0)
              v28->_sunsetAbsolute = v34;
            else
              v28->_sunsetAbsolute = v17;
            v28->_sunrisePreviousAbsolute = v31;
            v28->_sunsetPreviousAbsolute = v32;
          }
          else
          {
            if ((v23 & 1) != 0)
              v28->_sunriseAbsolute = v33;
            else
              v28->_sunriseAbsolute = v17;
            v28->_sunsetAbsolute = v32;
            v28->_sunrisePreviousAbsolute = v31;
            if ((v20 & 1) != 0)
              v28->_sunsetPreviousAbsolute = v30;
            else
              v28->_sunsetPreviousAbsolute = v16;
          }
        }
        else
        {
          v28->_sunriseAbsolute = v31;
          v28->_sunsetAbsolute = v32;
          if ((v19 & 1) != 0)
            v28->_sunrisePreviousAbsolute = v29;
          else
            v28->_sunrisePreviousAbsolute = v16;
          if ((v20 & 1) != 0)
            v28->_sunsetPreviousAbsolute = v30;
          else
            v28->_sunsetPreviousAbsolute = v16;
        }
      }
      else
      {
        if ((v22 & 1) == 0 && (v21 & 1) == 0)
        {
          if (!v28->_isDaylight)
            goto LABEL_15;
LABEL_83:
          v28->_sunriseAbsolute = v17;
          v28->_sunsetAbsolute = v17 - 86400.0;
          v28->_sunrisePreviousAbsolute = v16 + 86400.0;
          v28->_sunsetPreviousAbsolute = v16;
          goto LABEL_107;
        }
        if ((v24 & 1) != 0)
        {
          if (v26 < v32)
          {
            v28->_sunriseAbsolute = v17;
            v28->_sunsetAbsolute = v32;
            v28->_sunrisePreviousAbsolute = v29;
            v28->_sunsetPreviousAbsolute = v30;
          }
          else
          {
            v28->_sunriseAbsolute = v17 - 86400.0;
            v28->_sunsetAbsolute = v17;
            v28->_sunrisePreviousAbsolute = v29;
            v28->_sunsetPreviousAbsolute = v32;
          }
        }
        else
        {
          if (v26 < v31)
          {
            v28->_sunriseAbsolute = v31;
            v28->_sunsetAbsolute = v17;
            v28->_sunrisePreviousAbsolute = v29;
          }
          else
          {
            v28->_sunriseAbsolute = v17;
            v28->_sunsetAbsolute = v17 - 86400.0;
            v28->_sunrisePreviousAbsolute = v31;
          }
          v28->_sunsetPreviousAbsolute = v30;
        }
      }
    }
    else if (v31 > v32)
    {
      if (v26 >= v32)
      {
        if (v26 >= v31)
        {
          if (v26 >= v34)
          {
            v25 = 0;
          }
          else
          {
            v28->_sunriseAbsolute = v33;
            v28->_sunsetAbsolute = v34;
            v28->_sunrisePreviousAbsolute = v31;
            v28->_sunsetPreviousAbsolute = v32;
          }
        }
        else
        {
          v28->_sunriseAbsolute = v31;
          v28->_sunsetAbsolute = v34;
          v28->_sunrisePreviousAbsolute = v29;
          v28->_sunsetPreviousAbsolute = v32;
        }
      }
      else
      {
        v28->_sunriseAbsolute = v31;
        v28->_sunsetAbsolute = v32;
        v28->_sunrisePreviousAbsolute = v29;
        v28->_sunsetPreviousAbsolute = v30;
      }
    }
    else if (v26 >= v31)
    {
      if (v26 >= v32)
      {
        if (v26 >= v33)
        {
          v25 = 0;
        }
        else
        {
          v28->_sunriseAbsolute = v33;
          v28->_sunsetAbsolute = v34;
          v28->_sunrisePreviousAbsolute = v31;
          v28->_sunsetPreviousAbsolute = v32;
        }
      }
      else
      {
        v28->_sunriseAbsolute = v33;
        v28->_sunsetAbsolute = v32;
        v28->_sunrisePreviousAbsolute = v31;
        v28->_sunsetPreviousAbsolute = v30;
      }
    }
    else
    {
      v28->_sunriseAbsolute = v31;
      v28->_sunsetAbsolute = v32;
      v28->_sunrisePreviousAbsolute = v29;
      v28->_sunsetPreviousAbsolute = v30;
    }
  }
LABEL_107:
  if ((v25 & 1) == 0)
  {
    if (v28->_logLevel >= 7)
      NSLog(CFSTR("%s: Warning - invalid sunrise/sunset info, using defaults\n"), "-[NightModeControl updateTransitionTimesFromSunriseSunset:]");
    -[NightModeControl retrieveSunriseSunsetTimesFromBackup:](v28, "retrieveSunriseSunsetTimesFromBackup:", v26);
    v25 = 1;
  }
  v13 = v28->_sunriseAbsolute + v28->_transitionLength;
  if ((v13 < v28->_sunsetAbsolute || v13 - v28->_sunsetAbsolute >= (float)(v28->_transitionLength * 2.0))
    && (v13 < v28->_sunsetPreviousAbsolute || v13 - v28->_sunsetPreviousAbsolute >= (float)(v28->_transitionLength * 2.0)))
  {
    v28->_transitionsTimesCoeff = 1.0;
    v28->_transitionLengthActual = v28->_transitionLength;
    v28->_offTransitionTimeAbsoluteUnrestrictedPrev = v28->_sunrisePreviousAbsolute;
    v28->_offTransitionTimeAbsoluteUnrestricted = v28->_sunriseAbsolute;
  }
  else
  {
    v28->_transitionsTimesCoeff = 0.0;
    v28->_transitionLengthActual = 0.0;
    v28->_sunriseAbsolute = v28->_sunsetAbsolute;
    v28->_sunrisePreviousAbsolute = v28->_sunsetPreviousAbsolute;
    v28->_offTransitionTimeAbsoluteUnrestricted = v28->_sunriseAbsolute - v28->_transitionLength;
    v28->_offTransitionTimeAbsoluteUnrestrictedPrev = v28->_sunrisePreviousAbsolute - v28->_transitionLength;
    if (v28->_logLevel >= 7)
      NSLog(CFSTR("%s: Sunrise/Sunset transitions overlaping coeff=%f trLenghtActual=%f \n"), "-[NightModeControl updateTransitionTimesFromSunriseSunset:]", v28->_transitionsTimesCoeff, v28->_transitionLengthActual);
  }
  return v25 & 1;
}

- (void)updateOptionTimestamp:(double)a3
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a3);
  if (v3)
  {
    -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v3, CFSTR("BlueLightReductionAlgoOverrideTimestamp"));

  }
}

- (void)setAlgoState:(int)a3
{
  id v3;
  CFAbsoluteTime Current;

  if (self->_algoState != a3)
  {
    Current = CFAbsoluteTimeGetCurrent();
    self->_algoState = a3;
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", self->_algoState);
    if (v3)
    {
      -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", v3, CFSTR("BlueLightReductionAlgoOverride"));

    }
    if (self->_algoState == 4 || self->_algoState == 3)
    {
      -[NightModeControl updateOptionTimestamp:](self, "updateOptionTimestamp:", Current);
      self->_untilNexTransitionTimestamp = Current;
    }
    else
    {
      -[NightModeControl updateStatusDictionaryWithValue:forKey:](self, "updateStatusDictionaryWithValue:forKey:", 0, CFSTR("BlueLightReductionAlgoOverrideTimestamp"));
    }
  }
}

- (void)timeZoneChanged
{
  NSObject *queue;
  uint64_t block;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  NightModeControl *v8;
  SEL v9;
  NightModeControl *v10;

  v10 = self;
  v9 = a2;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __35__NightModeControl_timeZoneChanged__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = v10;
  dispatch_async(queue, &block);
}

uint64_t __35__NightModeControl_timeZoneChanged__block_invoke(uint64_t a1)
{
  id obj;

  if (*(int *)(*(_QWORD *)(a1 + 32) + 224) >= 7)
    NSLog(CFSTR("%s"), "-[NightModeControl timeZoneChanged]_block_invoke");
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
  {
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 136));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = CFTimeZoneCopySystem();
  }
  objc_msgSend(*(id *)(a1 + 32), "reevaluateCurrentState");
  return objc_sync_exit(obj);
}

- (void)clockChanged
{
  NSObject *queue;
  uint64_t block;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  NightModeControl *v8;
  SEL v9;
  NightModeControl *v10;

  v10 = self;
  v9 = a2;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __32__NightModeControl_clockChanged__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = v10;
  dispatch_async(queue, &block);
}

uint64_t __32__NightModeControl_clockChanged__block_invoke(uint64_t a1)
{
  id obj;

  if (*(int *)(*(_QWORD *)(a1 + 32) + 224) >= 7)
    NSLog(CFSTR("%s"), "-[NightModeControl clockChanged]_block_invoke");
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "reevaluateCurrentState");
  return objc_sync_exit(obj);
}

- (void)tearDownAllTimers
{
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: disable all timers \n"), "-[NightModeControl tearDownAllTimers]");
  -[NightModeControl cancelTransition](self, "cancelTransition");
  -[NightModeControl cancelSchedule](self, "cancelSchedule");
}

- (void)cancelSchedule
{
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: cancel next transition schedule \n"), "-[NightModeControl cancelSchedule]");
  if (self->_nextTransitionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_nextTransitionTimer);
    dispatch_release((dispatch_object_t)self->_nextTransitionTimer);
    self->_nextTransitionTimer = 0;
    self->_currentScheduledTransitionType = 0;
  }
}

- (void)cancelTransition
{
  float factor;

  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: cancel current transition \n"), "-[NightModeControl cancelTransition]");
  if (self->_transitionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_transitionTimer);
    dispatch_release((dispatch_object_t)self->_transitionTimer);
    self->_transitionTimer = 0;
  }
  factor = self->_factorState.factor;
  self->_factorState.target = factor;
  self->_factorState.start = factor;
}

- (id)copyTimeStringWithHour:(int)a3 minute:(int)a4 second:(int)a5
{
  id v5;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v13 = 0;
  v12 = 0;
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v11 = (id)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    if (v12)
    {
      objc_msgSend(v12, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
      v10 = (void *)objc_msgSend(v12, "dateFormat");
      if (v10
        && (objc_msgSend(v10, "containsString:", CFSTR("a")) & 1) == 0
        && (objc_msgSend(v10, "containsString:", CFSTR("b")) & 1) == 0
        && (objc_msgSend(v10, "containsString:", CFSTR("B")) & 1) == 0)
      {
        objc_msgSend(v12, "setLocalizedDateFormatFromTemplate:", CFSTR("jjmm"));
      }
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 0.0);
      if (v9)
      {
        v8 = (void *)objc_msgSend(v11, "components:fromDate:", 32, v9);
        if (v8)
        {
          objc_msgSend(v8, "setHour:", a3);
          objc_msgSend(v8, "setMinute:", a4);
          objc_msgSend(v8, "setSecond:", a5);
          v7 = objc_msgSend(v11, "dateFromComponents:", v8);
          if (v7)
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", objc_msgSend(v12, "stringFromDate:", v7));
        }

      }
    }
  }
  if (v12)

  if (v11)
  return v13;
}

- (void)displayAlertInteractive:(BOOL)a3
{
  CFUserNotificationRef v3;
  NSObject *global_queue;
  void *context;
  uint64_t v6;
  void *v7;
  uint64_t block;
  int v9;
  int v10;
  uint64_t (*v11)(CFOptionFlags);
  void *v12;
  NightModeControl *v13;
  BOOL v14;
  CFDictionaryRef dictionary;
  SInt32 v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  const void *v21;
  const void *v22;
  const void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  SEL v29;
  NightModeControl *v30;
  const void *v31[9];
  const void *__b[10];

  __b[9] = *(const void **)MEMORY[0x1E0C80C00];
  v30 = self;
  v29 = a2;
  v28 = a3;
  if (!self->_notificationInProgress)
  {
    if (v30->_notifyUserAboutScheduleCounter < 3)
    {
      ++v30->_notifyUserAboutScheduleCounter;
      v27 = 0;
      v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v30->_notifyUserAboutScheduleCounter);
      if (v27)
      {
        -[NightModeControl updateStatusDictionaryWithValue:forKey:](v30, "updateStatusDictionaryWithValue:forKey:", v27, CFSTR("BlueLightReductionDisableScheduleAlertCounter"));

      }
      if (!v28)
        -[NightModeControl enableBlueLightReduction:withOption:](v30, "enableBlueLightReduction:withOption:", 1, 2);
      v26 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)MEMORY[0x1E0CB34D0];
      v6 = objc_msgSend(v26, "localizations");
      v25 = (id)objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v6, objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages"));
      if (objc_msgSend(v25, "count"))
      {
        v24 = objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
        v23 = (const void *)objc_msgSend(v26, "localizedStringForKey:value:table:localization:", CFSTR("BLR_ALERT_TITLE"), 0);
        v22 = (const void *)objc_msgSend(v26, "localizedStringForKey:value:table:localization:", CFSTR("BLR_ALERT_TEXT_2"), 0, CFSTR("Localizable"), v24);
        v21 = (const void *)objc_msgSend(v26, "localizedStringForKey:value:table:localization:", CFSTR("BLR_ALERT_OK_2"), 0, CFSTR("Localizable"), v24);
        v20 = objc_msgSend(v26, "localizedStringForKey:value:table:localization:", CFSTR("BLR_ALERT_CANCEL_3"), 0, CFSTR("Localizable"), v24);
        if (v23)
        {
          if (v22 && v21 && v20)
          {
            v19 = 0;
            v18 = -[NightModeControl copyTimeStringWithHour:minute:second:](v30, "copyTimeStringWithHour:minute:second:", 7, 0);
            if (v18)
            {
              context = (void *)MEMORY[0x1B5E4A8B0]();
              v17 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%@"), 0, v18);
              v19 = (id)objc_msgSend(v17, "copy");
              objc_autoreleasePoolPop(context);

            }
            if (v19)
            {
              v16 = 0;
              memset(__b, 0, 0x48uLL);
              __b[0] = *(const void **)MEMORY[0x1E0C9B820];
              __b[1] = *(const void **)MEMORY[0x1E0C9B800];
              __b[2] = *(const void **)MEMORY[0x1E0C9B810];
              __b[3] = *(const void **)MEMORY[0x1E0C9B838];
              __b[4] = *(const void **)MEMORY[0x1E0C9B830];
              __b[5] = *(const void **)MEMORY[0x1E0DABBA8];
              __b[6] = *(const void **)MEMORY[0x1E0DABBC8];
              __b[7] = *(const void **)MEMORY[0x1E0DABBA0];
              __b[8] = *(const void **)MEMORY[0x1E0DABB88];
              memset(v31, 0, sizeof(v31));
              v31[0] = *(const void **)MEMORY[0x1E0C9AE50];
              v31[1] = v23;
              v31[2] = v22;
              v31[3] = v21;
              v31[4] = v19;
              v31[5] = *(const void **)MEMORY[0x1E0C9AE50];
              v31[6] = *(const void **)MEMORY[0x1E0C9AE50];
              v31[7] = *(const void **)MEMORY[0x1E0C9AE50];
              v31[8] = CFSTR("prefs:root=DISPLAY&path=BLUE_LIGHT_REDUCTION");
              dictionary = CFDictionaryCreate(0, __b, v31, 9, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);

              v30->_notificationInProgress = 1;
              v3 = CFUserNotificationCreate(0, 0.0, 3uLL, &v16, dictionary);
              v30->_enableNotification = v3;
              CFRelease(dictionary);
              global_queue = dispatch_get_global_queue(0, 0);
              block = MEMORY[0x1E0C809B0];
              v9 = -1073741824;
              v10 = 0;
              v11 = __44__NightModeControl_displayAlertInteractive___block_invoke;
              v12 = &unk_1E68EA240;
              v13 = v30;
              v14 = v28;
              dispatch_async(global_queue, &block);
            }
          }
        }
      }
    }
    else
    {
      -[NightModeControl enableBlueLightReduction:withOption:](v30, "enableBlueLightReduction:withOption:", 1, 2);
    }
  }
}

uint64_t __44__NightModeControl_displayAlertInteractive___block_invoke(CFOptionFlags a1)
{
  CFOptionFlags v1;
  id v2;
  id obj;
  unint64_t v5;
  CFOptionFlags v6;
  id v7;
  id v8;
  id v9;
  CFOptionFlags responseFlags[3];

  v6 = a1;
  responseFlags[2] = a1;
  responseFlags[1] = a1;
  responseFlags[0] = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(a1 + 32) + 368), 0.0, responseFlags);
  if (responseFlags[0] == 1 && (*(_BYTE *)(v6 + 40) & 1) != 0)
  {
    v5 = 0x1E0CB3000uLL;
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 2);
    if (v9)
    {
      if (v8)
      {
        v7 = 0;
        v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("BlueReductionEnabledValue"), v8, CFSTR("BlueReductionEnabledOption"), 0);
        if (v7)
        {
          objc_msgSend(*(id *)(v6 + 32), "setProperty:forKey:", v7, CFSTR("BlueReductionEnabled"));

        }
      }
    }

  }
  obj = *(id *)(v6 + 32);
  objc_sync_enter(obj);
  v1 = v6;
  *(_BYTE *)(*(_QWORD *)(v6 + 32) + 376) = 0;
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(v1 + 32) + 368));
  v2 = obj;
  *(_QWORD *)(*(_QWORD *)(v6 + 32) + 368) = 0;
  return objc_sync_exit(v2);
}

- (void)setNightShiftFactorDictionary:(id)a3
{
  NSMutableArray *supportObjs;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;
  SEL v11;
  NightModeControl *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  supportObjs = self->_supportObjs;
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __50__NightModeControl_setNightShiftFactorDictionary___block_invoke;
  v8 = &unk_1E68EA068;
  v9 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](supportObjs, "enumerateObjectsUsingBlock:", &v4);
}

uint64_t __50__NightModeControl_setNightShiftFactorDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF131518);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "setNightShiftFactorDictionary:", *(_QWORD *)(a1 + 32));
  return result;
}

- (id)copyPreferenceForKey:(id)a3 user:(id)a4
{
  NSMutableArray *supportObjs;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  id v22;
  id v23;
  SEL v24;
  NightModeControl *v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 1375731712;
  v18 = 48;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  supportObjs = self->_supportObjs;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __46__NightModeControl_copyPreferenceForKey_user___block_invoke;
  v11 = &unk_1E68EA268;
  v14 = &v15;
  v12 = a3;
  v13 = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](supportObjs, "enumerateObjectsUsingBlock:", &v7);
  v6 = (void *)v16[5];
  _Block_object_dispose(&v15, 8);
  return v6;
}

uint64_t __46__NightModeControl_copyPreferenceForKey_user___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF131518);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "copyPreferenceForKey:user:", a1[4], a1[5]);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5
{
  NSMutableArray *supportObjs;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SEL v17;
  NightModeControl *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  supportObjs = self->_supportObjs;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __46__NightModeControl_setPreference_forKey_user___block_invoke;
  v10 = &unk_1E68EA290;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  -[NSMutableArray enumerateObjectsUsingBlock:](supportObjs, "enumerateObjectsUsingBlock:", &v6);
}

uint64_t __46__NightModeControl_setPreference_forKey_user___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF131518);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "setPreference:forKey:user:", a1[4], a1[5], a1[6]);
  return result;
}

@end
