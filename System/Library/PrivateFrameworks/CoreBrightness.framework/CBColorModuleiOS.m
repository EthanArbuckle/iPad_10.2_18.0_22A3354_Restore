@implementation CBColorModuleiOS

uint64_t __39__CBColorModuleiOS_setProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "getKeyCategory");
    if (result == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 376))
    {
      result = objc_msgSend(*(id *)(a1 + 32), "getKeyString");
      if (result)
      {
        result = objc_msgSend(*(id *)(a1 + 40), "setPropertyInternal:forKey:", *(_QWORD *)(a1 + 48), result);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result & 1;
      }
    }
  }
  else
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "setPropertyInternal:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result & 1;
    }
  }
  return result;
}

uint64_t __42__CBColorModuleiOS_startNewTimerWithFreq___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerRoutine:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)timerRoutine:(id)a3
{
  double Current;
  BOOL v4;

  v4 = 1;
  Current = CFAbsoluteTimeGetCurrent();
  if (self->_colorStruct.cfx && self->_colorStruct.fadeInProgress)
  {
    self->_colorStruct.fadeInProgress = CFXUpdateColorFade((uint64_t)self->_colorStruct.cfx, Current) & 1;
    v4 = !self->_colorStruct.fadeInProgress;
  }
  if (v4)
  {
    if (a3)
      dispatch_source_cancel((dispatch_source_t)a3);
  }
}

- (BOOL)setPropertyInternal:(id)a3 forKey:(id)a4
{
  const char *v4;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSMutableArray *obj;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD __b[8];
  id v17;
  id v18;
  os_log_type_t type;
  os_log_t oslog;
  char v21;
  id v22;
  id v23;
  SEL v24;
  CBColorModuleiOS *v25;
  char v26;
  uint8_t v27[32];
  _BYTE v28[128];
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v21 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("BlueLightReductionFactor")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS BLRFactorPropertyHandler:](v25, "BLRFactorPropertyHandler:", v23);
LABEL_85:
    if ((v21 & 1) != 0)
      -[NSMutableDictionary setObject:forKey:](v25->_properties, "setObject:forKey:", v23, v22);
    memset(__b, 0, sizeof(__b));
    obj = v25->_filters;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
    if (v13)
    {
      v9 = *(_QWORD *)__b[2];
      v10 = 0;
      v11 = v13;
      while (1)
      {
        v8 = v10;
        if (*(_QWORD *)__b[2] != v9)
          objc_enumerationMutation(obj);
        v17 = 0;
        v17 = *(id *)(__b[1] + 8 * v10);
        objc_msgSend(v17, "setProperty:forKey:", v23, v22);
        ++v10;
        if (v8 + 1 >= v11)
        {
          v10 = 0;
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
          if (!v11)
            break;
        }
      }
    }
    if (v25->super._logHandle)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v27, (uint64_t)v22, (uint64_t)v23, v21 & 1);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ result=%d", v27, 0x1Cu);
    }
    v26 = v21 & 1;
    return v26 & 1;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("BlueLightReductionCCTTargetKey")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS BLRCCTTargetPropertyHandler:](v25, "BLRCCTTargetPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("BlueLightReductionCCTRange")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS BLRCCTRangePropertyHandler:](v25, "BLRCCTRangePropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("LabShift")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CALabShiftPropertyHandler:](v25, "CALabShiftPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorAdaptationEnabled")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CAEnabledPropertyHandler:](v25, "CAEnabledPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorAdaptationStrength")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CAStrengthPropertyHandler:](v25, "CAStrengthPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("FixedColorAdaptationStrength")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CAFixedStrengthPropertyHandler:](v25, "CAFixedStrengthPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("WeakestColorAdaptationMode")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CAWeakestColorAdaptationModePropertyHandler:](v25, "CAWeakestColorAdaptationModePropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("WeakestColorAdaptationModeAnimated")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CAWeakestColorAdaptationModeAnimatedPropertyHandler:](v25, "CAWeakestColorAdaptationModeAnimatedPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorAdaptationModeMapping")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CAModeMappingHandler:](v25, "CAModeMappingHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("StrengthRampPeriodTweak")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CAStrengthRampPeriodTweakPropertyHandler:](v25, "CAStrengthRampPeriodTweakPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorFadesEnabled")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CAFadesEnabledHandler:](v25, "CAFadesEnabledHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CBDisplayPresetDisableHarmony")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS displayPresetHarmonyHandler:](v25, "displayPresetHarmonyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CoreBrightnessFeaturesDisabled")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CoreBrightnessFeaturesDisabledPropertyHandler:](v25, "CoreBrightnessFeaturesDisabledPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("DisplayBrightnessFactor")) & 1) != 0
    || (objc_msgSend(v22, "isEqualToString:", CFSTR("DisplayBrightnessFactorWithFade")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS displayBrightnessFactorPropertyHandler:](v25, "displayBrightnessFactorPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("AABSensorOverride")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CAAABSensorOverridePropertyHandler:](v25, "CAAABSensorOverridePropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CEOverride")) & 1) != 0
    || (objc_msgSend(v22, "isEqualToString:", CFSTR("CEOverrideEnabled")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CEOverridePropertyHandler:key:](v25, "CEOverridePropertyHandler:key:", v23, v22);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CEEnable")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS CEEnablePropertyHandler:key:](v25, "CEEnablePropertyHandler:key:", v23, v22);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("PreStrobe")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS preStrobePropertyHandler:](v25, "preStrobePropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("PreStrobeDimPeriod")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS preStrobeDimPeriodPropertyHandler:](v25, "preStrobeDimPeriodPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CBAmmoliteEnabled")) & 1) != 0
    || (objc_msgSend(v22, "isEqualToString:", CFSTR("DisplayBrightnessAuto")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS ammolitePropertyHandler:key:](v25, "ammolitePropertyHandler:key:", v23, v22);
    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("DisplayBrightnessAuto")) & 1) != 0)
    {
      v26 = v21;
      return v26 & 1;
    }
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorFilterMode")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS colorFilterModeHandler:](v25, "colorFilterModeHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorFilterSensorPolicy")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS colorFilterSensorPolicyHandler:](v25, "colorFilterSensorPolicyHandler:", v23) != 0;
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CBSerializedAggregatedConfig")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS serializedAggregatedConfigPropertyHandler:](v25, "serializedAggregatedConfigPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CBApplyAggregatedConfig")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS applyAggregatedConfigPropertyHandler:](v25, "applyAggregatedConfigPropertyHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorRampEnableLogging")) & 1) != 0)
  {
    oslog = 0;
    if (v25->super._logHandle)
    {
      v15 = v25->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v14 = init_default_corebrightness_log();
      v15 = v14;
    }
    oslog = v15;
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if ((objc_msgSend(v23, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
        v4 = "on";
      else
        v4 = "off";
      __os_log_helper_16_2_1_8_32((uint64_t)v29, (uint64_t)v4);
      _os_log_impl(&dword_1B5291000, oslog, type, "Turning color ramp logging: %s", v29, 0xCu);
    }
    CFXColorRampEnableLogging((uint64_t)v25->_colorStruct.cfx, objc_msgSend(v23, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CarryLogEnabled")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS carryLogEnabledHandler:](v25, "carryLogEnabledHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CarryLogComment")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS carryLogCommentHandler:](v25, "carryLogCommentHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CarryLogCommit")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS carryLogCommitHandler:](v25, "carryLogCommitHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorRampPeriodOverride")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS colorRampPeriodOverrideHandler:](v25, "colorRampPeriodOverrideHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CBTTRestriction")) & 1) != 0)
  {
    v21 = -[CBColorModuleiOS ttRestrictionHandler:](v25, "ttRestrictionHandler:", v23);
    goto LABEL_85;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("TwilightParameters")) & 1) == 0)
    goto LABEL_85;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v25->_colorStruct.nightModeSupported)
  {
    v18 = v23;
    if (objc_msgSend(v23, "nightShiftAdaptation"))
      CFXInitializeTwilightNightShiftAdaptation((uint64_t)v25->_colorStruct.cfx, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "cctTable"), "dataCopy"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "cctTable"), "count"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "twilightStrengthTable"), "dataCopy"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "twilightStrengthTable"), "count"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "cctDeltaTable"), "dataCopy"));
  }
  v26 = 1;
  return v26 & 1;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CBColorModuleiOS *v11;
  __IOHIDServiceClient *v12;
  __IOHIDEvent *v13;
  __IOHIDServiceClient *v14;
  __IOHIDEvent *v15;
  SEL v16;
  CBColorModuleiOS *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  if (!a3 || !v14)
    return 0;
  CFRetain(v15);
  CFRetain(v14);
  queue = v17->super._queue;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __40__CBColorModuleiOS_handleHIDEvent_from___block_invoke;
  v10 = &unk_1E68E9FA0;
  v11 = v17;
  v12 = v14;
  v13 = v15;
  dispatch_async(queue, &v6);
  return 1;
}

- (BOOL)ignoreALSEventsInAOD
{
  BOOL v3;
  unint64_t v4;

  v4 = -[CBAODState AODState](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "AODState");
  v3 = 1;
  if (v4 != 2)
  {
    v3 = 1;
    if (v4 != 3)
      return v4 == 4;
  }
  return v3;
}

- (BOOL)CAWeakestColorAdaptationModeAnimatedPropertyHandler:(id)a3
{
  float v3;
  float v4;
  id v5;
  double v6;
  id v7;
  id v9;
  id v10;
  id v11;
  int v12;
  float v13;
  float v14;
  float v15;
  id v16;
  int j;
  int v18;
  _DWORD *v19;
  uint64_t v20;
  id v21;
  int i;
  int v23;
  _DWORD *v24;
  uint64_t v25;
  id v26;
  char v27;
  id v28;
  SEL v29;
  CBColorModuleiOS *v30;

  v30 = self;
  v29 = a2;
  v28 = a3;
  v27 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = 0;
    v24 = 0;
    v26 = (id)objc_msgSend(v28, "objectForKey:", CFSTR("ColorAdaptationModesTargetSub"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = 0;
      v25 = objc_msgSend(v26, "count");
      if (v25 > 0)
      {
        v24 = malloc_type_malloc(4 * v25, 0x100004052888210uLL);
        for (i = 0; i < v25; ++i)
        {
          v21 = (id)objc_msgSend(v26, "objectAtIndex:", i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24[i] = objc_msgSend(v21, "intValue");
            ++v23;
          }
        }
      }
      if (v23 < v25)
      {
        v25 = 0;
        if (v24)
          free(v24);
        v24 = 0;
      }
    }
    if (v25 > 0)
    {
      v20 = 0;
      v19 = 0;
      v26 = (id)objc_msgSend(v28, "objectForKey:", CFSTR("ColorAdaptationModesInitialSub"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = 0;
        v20 = objc_msgSend(v26, "count");
        if (v20 > 0)
        {
          v19 = malloc_type_malloc(4 * v20, 0x100004052888210uLL);
          for (j = 0; j < v20; ++j)
          {
            v16 = (id)objc_msgSend(v26, "objectAtIndex:", j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19[j] = objc_msgSend(v16, "intValue");
              ++v18;
            }
          }
        }
        if (v18 < v20)
        {
          v20 = 0;
          if (v19)
            free(v19);
          v19 = 0;
        }
      }
      v15 = 0.0;
      v14 = 0.0;
      v26 = (id)objc_msgSend(v28, "objectForKey:", CFSTR("ProgressRatio"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v26, "floatValue");
        v15 = v3;
      }
      v26 = (id)objc_msgSend(v28, "objectForKey:", CFSTR("ColorAdaptationStrengthPeriod"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v26, "floatValue");
        v14 = v4;
      }
      if (v30->_colorStruct.harmonySupported && v30->_colorStruct.cfx && v30->_colorStruct.harmonyFixedStrength < 0.0)
      {
        v13 = 0.0;
        CFXAnimateAmbientAdaptationModes((uint64_t)v30->_colorStruct.cfx, (uint64_t)v19, v20, (uint64_t)v24, v25, &v13, v15, v14);
        v12 = 0;
        v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", CFXGetAmbientAdaptationMode((uint64_t)v30->_colorStruct.cfx, (float *)&v12));
        if (v10)
        {
          -[NSMutableDictionary setObject:forKey:](v30->_properties, "setObject:forKey:", v10, CFSTR("ColorAdaptationMode"));

        }
        v30->_colorStruct.harmonyStrength = v13;
        v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v6 = v13;
        v11 = (id)objc_msgSend(v5, "initWithFloat:", v6);
        if (v11)
        {
          v7 = objc_alloc(MEMORY[0x1E0C99D80]);
          v9 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v11, CFSTR("ColorAdaptationStrengthSub"), v26, CFSTR("ColorAdaptationStrengthPeriod"), 0);
          if (v9)
          {
            -[NSMutableDictionary setObject:forKey:](v30->_properties, "setObject:forKey:", v9, CFSTR("ColorAdaptationStrength"));

          }
        }
      }
      if (v24)
        free(v24);
      if (v19)
        free(v19);
    }
  }
  return v27 & 1;
}

- (BOOL)CAWeakestColorAdaptationModePropertyHandler:(id)a3
{
  int v3;
  float v4;
  id v5;
  id v6;
  double v7;
  id v8;
  _BYTE v10[4];
  unint64_t v11;
  id v12;
  id v13;
  _BYTE *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  float v20;
  float v21;
  id v22;
  id v23;
  int i;
  unint64_t v25;
  _BYTE *v26;
  unint64_t v27;
  id v28;
  char v29;
  id v30;
  SEL v31;
  CBColorModuleiOS *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v32 = self;
  v31 = a2;
  v30 = a3;
  v29 = 0;
  v16 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("ColorAdaptationModesTargetSub"));
    v15 = v28;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = objc_msgSend(v28, "count");
      if (v27)
      {
        v26 = v10;
        v14 = &v10[-((4 * v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
        v25 = v27;
        for (i = 0; i < v27; ++i)
        {
          v23 = 0;
          v23 = (id)objc_msgSend(v28, "objectAtIndex:", i);
          v13 = v23;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v3 = objc_msgSend(v23, "intValue");
            *(_DWORD *)&v14[4 * i] = v3;
          }
        }
        v22 = 0;
        v22 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("ColorAdaptationStrengthPeriod"));
        v12 = v22;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = 0.0;
          objc_msgSend(v22, "floatValue");
          v21 = v4;
          if (v32->_colorStruct.harmonySupported
            && v32->_colorStruct.cfx
            && v32->_colorStruct.harmonyFixedStrength < 0.0)
          {
            v29 = 1;
            v11 = 0x1EF0FB000uLL;
            CFXSetWeakestAmbientAdaptationMode((uint64_t)v32->_colorStruct.cfx, (uint64_t)v14, v27, v21);
            v20 = 0.0;
            v19 = 0;
            v19 = CFXGetAmbientAdaptationMode(*(uint64_t *)((char *)&v32->super.super.isa + *(int *)(v11 + 3520)), &v20);
            v18 = 0;
            v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
            v18 = (id)objc_msgSend(v5, "initWithInt:", v19);
            if (v18)
            {
              -[NSMutableDictionary setObject:forKey:](v32->_properties, "setObject:forKey:", v18, CFSTR("ColorAdaptationMode"));

            }
            v32->_colorStruct.harmonyStrength = v20;
            v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
            *(float *)&v7 = v20;
            v18 = (id)objc_msgSend(v6, "initWithFloat:", v7);
            if (v18)
            {
              v17 = 0;
              v8 = objc_alloc(MEMORY[0x1E0C99D80]);
              v17 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", v18, CFSTR("ColorAdaptationStrengthSub"), v22, CFSTR("ColorAdaptationStrengthPeriod"), 0);

              if (v17)
              {
                -[NSMutableDictionary setObject:forKey:](v32->_properties, "setObject:forKey:", v17, CFSTR("ColorAdaptationStrength"));

              }
            }
          }
        }
      }
    }
  }
  return v29 & 1;
}

uint64_t __48__CBColorModuleiOS_handleHIDEventInternal_from___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "handleALSEvent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if ((result & 1) != 0)
    *a4 = 1;
  return result;
}

void __40__CBColorModuleiOS_handleHIDEvent_from___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleHIDEventInternal:from:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)handleHIDEventInternal:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  NSMutableDictionary *alsNodes;
  NSMutableDictionary *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSMutableArray *obj;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v27[7];
  os_log_type_t v28;
  os_log_t v29;
  id v30;
  _QWORD __b[8];
  id v32;
  uint8_t v33[7];
  os_log_type_t v34;
  os_log_t v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t (*v39)(uint64_t, uint64_t, void *, _BYTE *);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  int v44;
  int v45;
  char v46;
  os_log_type_t v47;
  os_log_t v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t (*v52)(uint64_t, uint64_t, void *, _BYTE *);
  void *v53;
  uint64_t *v54;
  os_log_type_t v55;
  os_log_t v56;
  int v57;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v60;
  uint64_t *v61;
  int v62;
  int v63;
  void (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  __IOHIDServiceClient *v67;
  __IOHIDEvent *v68;
  SEL v69;
  CBColorModuleiOS *v70;
  _BYTE v71[128];
  uint8_t v72[16];
  uint8_t v73[16];
  uint8_t v74[24];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v70 = self;
  v69 = a2;
  v68 = a3;
  v67 = a4;
  if (-[CBColorModuleiOS moduleType](self, "moduleType") != 2)
  {
    if (-[CBColorModuleiOS moduleType](v70, "moduleType") != 1)
      return;
    v60 = 0;
    v61 = &v60;
    v62 = 1375731712;
    v63 = 48;
    v64 = __Block_byref_object_copy__10;
    v65 = __Block_byref_object_dispose__10;
    v66 = 0;
    v66 = +[CBHIDEvent newEvent:andService:](CBHIDEvent, "newEvent:andService:", v68, v67);
    if (v61[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !v70->_displayOn)
      {
        -[NSMutableDictionary setObject:forKey:](v70->_pendingALSSamples, "setObject:forKey:", v61[5], -[CBColorModuleiOS getRegistryIDForHIDServiceClient:](v70, "getRegistryIDForHIDServiceClient:", v67));
        oslog = 0;
        if (v70->super._logHandle)
        {
          logHandle = v70->super._logHandle;
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
          __os_log_helper_16_2_1_8_66((uint64_t)v74, v61[5]);
          _os_log_impl(&dword_1B5291000, oslog, type, "ALS event arrived when display OFF %{public}@", v74, 0xCu);
        }
LABEL_17:

        v57 = 1;
LABEL_74:
        _Block_object_dispose(&v60, 8);
        return;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v70->_displayOn)
      {
        if (v70->_firstALSEventArrived && v70->_dropALSColorSamples)
        {
          v56 = 0;
          if (v70->super._logHandle)
          {
            v24 = v70->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v23 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v23 = init_default_corebrightness_log();
            v24 = v23;
          }
          v56 = v24;
          v55 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v73, v61[5]);
            _os_log_impl(&dword_1B5291000, v56, v55, "Dropping ALS event %{public}@ [Stockholm (NFC) CoEx enabled]", v73, 0xCu);
          }
          goto LABEL_17;
        }
        alsNodes = v70->_alsNodes;
        v49 = MEMORY[0x1E0C809B0];
        v50 = -1073741824;
        v51 = 0;
        v52 = __48__CBColorModuleiOS_handleHIDEventInternal_from___block_invoke;
        v53 = &unk_1E68EA898;
        v54 = &v60;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](alsNodes, "enumerateKeysAndObjectsUsingBlock:", &v49);
        if (!v70->_firstALSEventArrived)
        {
          v70->_firstALSEventArrived = 1;
          v48 = 0;
          if (v70->super._logHandle)
          {
            v22 = v70->super._logHandle;
          }
          else
          {
            v21 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v22 = v21;
          }
          v48 = v22;
          v47 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v72, v61[5]);
            _os_log_impl(&dword_1B5291000, v48, v47, "First ALS event arrived %{public}@", v72, 0xCu);
          }
        }
        if (!v70->_allALSEventsArrived)
        {
          v42 = 0;
          v43 = &v42;
          v44 = 0x20000000;
          v45 = 32;
          v46 = 0;
          v5 = v70->_alsNodes;
          v36 = MEMORY[0x1E0C809B0];
          v37 = -1073741824;
          v38 = 0;
          v39 = __48__CBColorModuleiOS_handleHIDEventInternal_from___block_invoke_164;
          v40 = &unk_1E68EA898;
          v41 = &v42;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", &v36);
          v70->_allALSEventsArrived = (*((_BYTE *)v43 + 24) ^ 1) & 1;
          if (v70->_allALSEventsArrived)
          {
            v70->_forceColorUpdate = 1;
            v70->_potentiallyBustedALS = 0;
            v35 = 0;
            if (v70->super._logHandle)
            {
              v20 = v70->super._logHandle;
            }
            else
            {
              v19 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
              v20 = v19;
            }
            v35 = v20;
            v34 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v17 = v35;
              v18 = v34;
              __os_log_helper_16_0_0(v33);
              _os_log_impl(&dword_1B5291000, v17, v18, "All ALS events arrived.", v33, 2u);
            }
          }
          _Block_object_dispose(&v42, 8);
        }
        if (v70->_allALSEventsArrived || v70->_potentiallyBustedALS || v70->_continueWithFewerALSs)
          -[CBColorModuleiOS cancelFirstSampleTimeout](v70, "cancelFirstSampleTimeout");
      }
      memset(__b, 0, sizeof(__b));
      obj = v70->_filters;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v71, 16);
      if (v16)
      {
        v12 = *(_QWORD *)__b[2];
        v13 = 0;
        v14 = v16;
        while (1)
        {
          v11 = v13;
          if (*(_QWORD *)__b[2] != v12)
            objc_enumerationMutation(obj);
          v32 = 0;
          v32 = *(id *)(__b[1] + 8 * v13);
          v30 = 0;
          v30 = (id)objc_msgSend(v32, "filterEvent:", v61[5]);
          v6 = v30;

          v61[5] = (uint64_t)v30;
          if (!v30)
            break;
          ++v13;
          if (v11 + 1 >= v14)
          {
            v13 = 0;
            v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v71, 16);
            if (!v14)
              goto LABEL_71;
          }
        }
        v29 = 0;
        if (v70->super._logHandle)
        {
          v10 = v70->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v9 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v9 = init_default_corebrightness_log();
          v10 = v9;
        }
        v29 = v10;
        v28 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v7 = v29;
          v8 = v28;
          __os_log_helper_16_0_0(v27);
          _os_log_impl(&dword_1B5291000, v7, v8, "ALS event discarded.", v27, 2u);
        }
      }
LABEL_71:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[CBColorModuleiOS handleALSEvent:](v70, "handleALSEvent:", v61[5]);
    }

    v57 = 0;
    goto LABEL_74;
  }
  if (IOHIDEventGetType() == 12)
  {
    -[CBColorFilter handleHIDEvent:from:](v70->_colorFilter, "handleHIDEvent:from:", v68, v67);
    -[CBColorModuleiOS processColorSample:forceUpdate:](v70, "processColorSample:forceUpdate:", -[CBColorFilter sample](v70->_colorFilter, "sample"), 0);
  }
}

- (unint64_t)moduleType
{
  return self->_moduleType;
}

- (void)cancelFirstSampleTimeout
{
  uint64_t v2;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_timeoutTimer)
  {
    dispatch_release((dispatch_object_t)self->_timeoutTimer);
    self->_timeoutTimer = 0;
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
      *(double *)&v2 = CFAbsoluteTimeGetCurrent();
      __os_log_helper_16_0_1_8_0((uint64_t)v6, v2);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "ts=%f Cancelling first sample timeout", v6, 0xCu);
    }
  }
}

void __52__CBColorModuleiOS_sendNotificationForKey_andValue___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    _Block_release(*(const void **)(a1 + 48));
  }

}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  NSObject *queue;
  uint64_t block;
  int v6;
  int v7;
  uint64_t (*v8)(id *);
  void *v9;
  id v10;
  CBColorModuleiOS *v11;
  id v12;
  id v13;
  id v14;
  SEL v15;
  CBColorModuleiOS *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __58__CBColorModuleiOS_handleNotificationForKey_withProperty___block_invoke;
  v9 = &unk_1E68EA150;
  v10 = a3;
  v11 = v16;
  v12 = a4;
  dispatch_sync(queue, &block);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  NSObject *queue;
  char v6;
  uint64_t block;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  CBColorModuleiOS *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  int v19;
  char v20;
  id v21;
  id v22;
  SEL v23;
  CBColorModuleiOS *v24;

  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 0;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __39__CBColorModuleiOS_setProperty_forKey___block_invoke;
  v11 = &unk_1E68EA630;
  v12 = a4;
  v13 = v24;
  v15 = &v16;
  v14 = a3;
  dispatch_sync(queue, &block);
  v6 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v6 & 1;
}

- (void)handleALSEvent:(id)a3
{
  float v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSMutableArray *obj;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t inited;
  NSObject *logHandle;
  os_log_type_t v19[63];
  os_log_type_t v20;
  os_log_t oslog;
  float v22;
  char v23;
  _QWORD __b[8];
  id v25;
  char v26;
  os_log_type_t v27;
  os_log_t v28;
  os_log_type_t v29;
  os_log_t v30;
  id v31;
  SEL v32;
  CBColorModuleiOS *v33;
  uint8_t v34[16];
  uint8_t v35[16];
  _BYTE v36[128];
  uint8_t v37[16];
  uint8_t v38[8];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = self;
  v32 = a2;
  v31 = a3;
  v30 = 0;
  if (self->super._logHandle)
  {
    logHandle = v33->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v30 = logHandle;
  v29 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v38, objc_msgSend(v31, "orientation"));
    _os_log_debug_impl(&dword_1B5291000, v30, v29, "ALS event with orientation = %d", v38, 8u);
  }
  if (-[CBColorModuleiOS ignoreALSEventsInAOD](v33, "ignoreALSEventsInAOD"))
  {
    v28 = 0;
    if (v33->super._logHandle)
    {
      v16 = v33->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v15 = init_default_corebrightness_log();
      v16 = v15;
    }
    v28 = v16;
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v31);
      _os_log_impl(&dword_1B5291000, v28, v27, "AOD is on -> ignore this ALS event %@", v37, 0xCu);
    }
  }
  else if (v31)
  {
    ++v33->_NSamples;
    if (v33->_allALSEventsArrived || v33->_potentiallyBustedALS || v33->_continueWithFewerALSs)
    {
      v26 = 0;
      if (v33->_forceColorUpdate)
      {
        v26 = 1;
        v33->_forceColorUpdate = 0;
      }
      memset(__b, 0, sizeof(__b));
      obj = v33->_filters;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
      if (v14)
      {
        v10 = *(_QWORD *)__b[2];
        v11 = 0;
        v12 = v14;
        while (1)
        {
          v9 = v11;
          if (*(_QWORD *)__b[2] != v10)
            objc_enumerationMutation(obj);
          v25 = 0;
          v25 = *(id *)(__b[1] + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = objc_msgSend(v31, "colorMitigationTriggered") & 1;
            objc_msgSend(v25, "filteredStrength");
            v22 = v3;
            oslog = 0;
            if (v33->super._logHandle)
            {
              v8 = v33->super._logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v7 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v7 = init_default_corebrightness_log();
              v8 = v7;
            }
            oslog = v8;
            v20 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              if ((v23 & 1) != 0)
                v4 = "Baseline";
              else
                v4 = "Shipping";
              __os_log_helper_16_2_1_8_32((uint64_t)v35, (uint64_t)v4);
              _os_log_impl(&dword_1B5291000, oslog, v20, "HarmonyPolicy: Using %s", v35, 0xCu);
            }
            CFXTriggerMitigation((uint64_t)v33->_colorStruct.cfx, v23 & 1);
            CFXSetFadeDuration((uint64_t)v33->_colorStruct.cfx, v23 & 1);
            CFXSetSampleStrength((uint64_t)v33->_colorStruct.cfx, v22);
          }
          ++v11;
          if (v9 + 1 >= v12)
          {
            v11 = 0;
            v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
            if (!v12)
              break;
          }
        }
      }
      memset(v19, 0, 0x3CuLL);
      if (v31)
        objc_msgSend(v31, "colorSample");
      else
        memset(v19, 0, 0x3CuLL);
      -[CBColorModuleiOS inputAmbientColorSample:force:trust:](v33, "inputAmbientColorSample:force:trust:", v19, v26 & 1, 1);
      if (v33->super._logHandle)
      {
        v6 = v33->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v5 = init_default_corebrightness_log();
        v6 = v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v34, (uint64_t)v31);
        _os_log_impl(&dword_1B5291000, v6, OS_LOG_TYPE_INFO, "Set ambient color sample %{public}@", v34, 0xCu);
      }
    }
  }
}

- (void)inputAmbientColorSample:(id *)a3 force:(BOOL)a4 trust:(BOOL)a5
{
  float v5;
  uint64_t inited;
  NSObject *logHandle;
  int v8;
  BOOL v9;
  BOOL v10;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v9 = a5;
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
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v13, COERCE__INT64(a3->var1.var0), COERCE__INT64(a3->var1.var1));
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "input ambient color sample: xy = (%f;%f)",
      v13,
      0x16u);
  }
  v8 = v10;
  if (v9)
    v8 = v10 | 4;
  if (self->_colorStruct.cfx)
  {
    if (self->_supportsAmmoliteWithoutColor)
    {
      v5 = self->_trustedLux / 3.14159265;
      a3->var0[1] = v5;
    }
    CFXInputAmbientColor((uint64_t *)self->_colorStruct.cfx, a3->var0, v8);
  }
}

- (void)colorRampRoutine:(id *)a3
{
  float v3;
  double v4;
  double v5;
  double v6;
  int v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  double v14;
  id v15;
  double v16;
  id v17;
  double v18;
  id v19;
  double v20;
  id v21;
  double v22;
  id v23;
  id v24;
  double v25;
  _QWORD v26[11];
  unint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  os_log_t v30;
  os_log_type_t v31[4];
  uint8_t *v32;
  NSObject *v33;
  os_log_t v34;
  id *v35;
  CBBrightnessProxy *brightnessControl;
  os_log_t v37;
  os_log_type_t v38[4];
  uint8_t *v39;
  NSObject *v40;
  os_log_t v41;
  void *v42;
  os_log_t log;
  os_log_type_t type[4];
  uint8_t *buf;
  NSObject *inited;
  os_log_t logHandle;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *context;
  unint64_t var5;
  double Current;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  unsigned int j;
  id v63;
  os_log_type_t v64;
  os_log_t oslog;
  id v66;
  os_log_type_t v67;
  os_log_t v68;
  int i;
  os_log_type_t v70;
  os_log_t v71;
  __CFString *v72;
  id v73;
  int v74;
  uint64_t v75;
  float var0;
  const $9756FCCE715B982771B61E32206558DC *v77;
  SEL v78;
  CBColorModuleiOS *v79;
  uint8_t v80[16];
  uint8_t v81[40];
  _QWORD v82[9];
  uint8_t v83[8];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v79 = self;
  v78 = a2;
  v77 = a3;
  if (a3)
  {
    var0 = 0.0;
    var0 = v77->var0;
    v75 = 0;
    v74 = 0;
    v3 = CFXGetWPFromMatrix((uint64_t)v79->_colorStruct.cfx, v77->var1, &v75, &v74);
    context = (void *)MEMORY[0x1B5E4A8B0](v3);
    v51 = objc_alloc(MEMORY[0x1E0C99D80]);
    v48 = 0x1E0CB3000uLL;
    LODWORD(v4) = v75;
    v50 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    LODWORD(v5) = HIDWORD(v75);
    v49 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    LODWORD(v6) = v74;
    v73 = (id)objc_msgSend(v51, "initWithObjectsAndKeys:", v50, CFSTR("xWP"), v49, CFSTR("yWP"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("YWP"), 0);
    objc_autoreleasePoolPop(context);
    -[CBColorModuleiOS sendNotificationForKey:andValue:](v79, "sendNotificationForKey:andValue:", CFSTR("CBTargetWhitePoint"), v73);

    v72 = 0;
    var5 = v77->var5;
    if (var5 <= 3)
      __asm { BR              X8 }
    v71 = 0;
    if (v79->super._logHandle)
    {
      logHandle = (os_log_t)v79->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v71 = logHandle;
    v70 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v71;
      *(_DWORD *)type = v70;
      v7 = v77->var5;
      buf = v83;
      __os_log_helper_16_0_1_4_0((uint64_t)v83, v7);
      _os_log_error_impl(&dword_1B5291000, v71, v70, "Unknown ramp type: %d. Reporting as kCBColorRamp", v83, 8u);
    }
    v72 = CFSTR("ColorRamp");
    if (v79->_brightnessControl && (-[__CFString isEqual:](v72, "isEqual:", CFSTR("ColorRamp")) & 1) != 0)
    {
      v42 = (void *)MEMORY[0x1B5E4A8B0]();
      for (i = 0; i < 9; ++i)
      {
        *(float *)&v8 = v77->var1[i];
        v82[i] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
      }
      v68 = 0;
      if (v79->super._logHandle)
      {
        v41 = (os_log_t)v79->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v40 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v40 = init_default_corebrightness_log();
        v41 = v40;
      }
      v68 = v41;
      v67 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v37 = v68;
        *(_DWORD *)v38 = v67;
        *(double *)&v9 = v77->var4.var0;
        *(double *)&v10 = v77->var4.var1;
        v39 = v81;
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v81, v9, v10, COERCE__INT64(var0));
        _os_log_impl(&dword_1B5291000, v68, v67, "Calling brightness control with whitepoint(%f | %f) and period: %f", v81, 0x20u);
      }
      if (!-[CBAODState isAODActive](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODActive"))
      {
        v35 = &v66;
        v66 = 0;
        brightnessControl = v79->_brightnessControl;
        v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 9);
        if ((-[CBBrightnessProxy setWhitePoint:rampDuration:error:](brightnessControl, "setWhitePoint:rampDuration:error:", v11, &v66, var0) & 1) == 0)
        {
          oslog = 0;
          if (v79->super._logHandle)
          {
            v34 = (os_log_t)v79->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v33 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v33 = init_default_corebrightness_log();
            v34 = v33;
          }
          oslog = v34;
          v64 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v30 = oslog;
            *(_DWORD *)v31 = v64;
            v32 = v80;
            __os_log_helper_16_2_1_8_64((uint64_t)v80, (uint64_t)v66);
            _os_log_error_impl(&dword_1B5291000, oslog, v64, "failed to set whitepoint(%@)", v80, 0xCu);
          }

        }
      }
      objc_autoreleasePoolPop(v42);
    }
    v63 = 0;
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v63 = (id)objc_msgSend(v12, "initWithCapacity:", v77->var2);
    if (v63)
    {
      for (j = 0; j < v77->var2; ++j)
      {
        v61 = 0;
        v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v14 = v77->var1[j];
        v61 = (id)objc_msgSend(v13, "initWithFloat:", v14);
        if (v61)
        {
          objc_msgSend(v63, "addObject:", v61);

        }
      }
      v60 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      if (v60)
      {
        v59 = 0;
        v15 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v16 = v77->var4.var0;
        v59 = (id)objc_msgSend(v15, "initWithFloat:", v16);
        if (v59)
        {
          objc_msgSend(v60, "addObject:", v59);

        }
        v17 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v18 = v77->var4.var1;
        v59 = (id)objc_msgSend(v17, "initWithFloat:", v18);
        if (v59)
        {
          objc_msgSend(v60, "addObject:", v59);

        }
        v29 = 0x1E0CB3000uLL;
        v19 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v20 = var0;
        v58 = (id)objc_msgSend(v19, "initWithFloat:", v20);
        v57 = 0;
        v21 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v22 = v77->var3;
        v57 = (id)objc_msgSend(v21, "initWithFloat:", v22);
        v56 = 0;
        v23 = objc_alloc(MEMORY[0x1E0C99D68]);
        v56 = (id)objc_msgSend(v23, "initWithTimeIntervalSinceReferenceDate:", v77->var6);
        if (v58)
        {
          if (v57)
          {
            if (v56)
            {
              v55 = 0;
              v24 = objc_alloc(MEMORY[0x1E0C99D80]);
              v28 = v26;
              v55 = (id)objc_msgSend(v24, "initWithObjectsAndKeys:", v63, CFSTR("ColorRampTarget"), v58, CFSTR("ColorRampPeriod"), v57, CFSTR("ColorScaler"), v60, CFSTR("ColorRampWhitePointTarget"), v56, CFSTR("ColorRampTimestamp"), 0);
              if (v55)
              {
                -[CBColorModuleiOS sendNotificationForKey:andValue:](v79, "sendNotificationForKey:andValue:", v72, v55);
                -[NSMutableDictionary setObject:forKey:](v79->_properties, "setObject:forKey:", v55, v72);

              }
            }
          }
        }

      }
    }
    v79->_colorStruct.fadeInProgress = 0;
  }
  else
  {
    v27 = 0x1EF0FB000uLL;
    v79->_colorStruct.fadeInProgress = 1;
    Current = CFAbsoluteTimeGetCurrent();
    if (*(Class *)((char *)&v79->super.super.isa + *(int *)(v27 + 3520)))
    {
      if (v79->_colorStruct.fadeInProgress)
      {
        v26[10] = 0x1EF0FB000uLL;
        v79->_colorStruct.fadeInProgress = CFXUpdateColorFade((uint64_t)v79->_colorStruct.cfx, Current) & 1;
        if (v79->_colorStruct.fadeInProgress)
        {
          LODWORD(v25) = 1114636288;
          -[CBColorModuleiOS startNewTimerWithFreq:](v79, "startNewTimerWithFreq:", v25);
        }
      }
    }
  }
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  id v4;
  id v5;
  NSObject *notificationQueue;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  os_log_type_t v21;
  os_log_t v22;
  id v23;
  id v24;
  SEL v25;
  CBColorModuleiOS *v26;
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = self;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  v22 = 0;
  if (self->super._logHandle)
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
  v22 = logHandle;
  v21 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v27, (uint64_t)v24, (uint64_t)v23);
    _os_log_debug_impl(&dword_1B5291000, v22, v21, "send notification for key = %@ value = %@", v27, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v24;
      v19 = v23;
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ColorAdaptationEnabled")) & 1) != 0)
      {
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D01FC8]), "initWithStarting:", v19);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)BiomeLibrary(), "Device"), "Display"), "TrueTone"), "source"), "sendEvent:", v18);

      }
    }
  }
  if (v26->super._notificationQueue && v26->super._notificationBlock)
  {
    v17 = 0;
    v17 = _Block_copy(v26->super._notificationBlock);
    if (v17)
    {
      v4 = v23;
      v5 = v24;
      notificationQueue = v26->super._notificationQueue;
      block = MEMORY[0x1E0C809B0];
      v10 = -1073741824;
      v11 = 0;
      v12 = __52__CBColorModuleiOS_sendNotificationForKey_andValue___block_invoke;
      v13 = &unk_1E68EA938;
      v14 = v24;
      v16 = v17;
      v15 = v23;
      dispatch_async(notificationQueue, &block);
    }
  }
}

- (BOOL)startNewTimerWithFreq:(float)a3
{
  uint64_t block;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CBColorModuleiOS *v9;
  dispatch_object_t v10;
  dispatch_block_t v11;
  dispatch_object_t v12;
  float v13;
  char v14;
  float v15;
  SEL v16;
  CBColorModuleiOS *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = 0;
  v13 = 1000000000.0 / a3;
  if ((float)(1000000000.0 / a3) < 16.7)
    v13 = 16.7;
  if (v17->_rampTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v17->_rampTimer);
    dispatch_release((dispatch_object_t)v17->_rampTimer);
    v17->_rampTimer = 0;
  }
  v12 = 0;
  v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v17->super._queue);
  if (v12)
  {
    dispatch_source_set_timer(v12, 0, (unint64_t)v13, 0);
    v11 = 0;
    block = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __42__CBColorModuleiOS_startNewTimerWithFreq___block_invoke;
    v8 = &unk_1E68EA540;
    v9 = v17;
    v10 = v12;
    v11 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, &block);
    if (v11)
    {
      dispatch_source_set_event_handler(v12, v11);
      _Block_release(v11);
    }
    v17->_rampTimer = (OS_dispatch_source *)v12;
    dispatch_resume(v12);
    v14 = 1;
  }
  return v14 & 1;
}

- (id)copyPropertyInternalForKey:(id)a3
{
  id v3;
  double v4;
  double v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSMutableArray *obj;
  uint64_t v14;
  id v15;
  _QWORD __b[8];
  id v17;
  int i;
  id v19;
  id v20;
  id v21;
  id v22;
  SEL v23;
  CBColorModuleiOS *v24;
  uint8_t v25[32];
  _BYTE v26[128];
  _DWORD v27[6];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ColorAdaptationAvailable")) & 1) != 0)
  {
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v24->_colorStruct.harmonyAvailable);
  }
  else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorAdaptationEnabled")) & 1) != 0)
  {
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v24->_colorStruct.harmonyEnabled);
  }
  else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("StatusInfo")) & 1) != 0)
  {
    v20 = +[CBStatusInfoHelper copyStatusInfoFor:](CBStatusInfoHelper, "copyStatusInfoFor:", v24);
    if (v20)
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v20, CFSTR("ColorModule"), 0);

  }
  else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CBDisplayPresetDisableHarmony")) & 1) != 0)
  {
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v24->_colorStruct.presetDisableHarmony);
  }
  else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CBAmmoliteEnabled")) & 1) != 0)
  {
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", CFXAmmoliteEnabled((uint64_t)v24->_colorStruct.cfx));
  }
  else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("CBAmmoliteSupported")) & 1) != 0)
  {
    if (v24->_backlightService)
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", CFXAmmoliteSupported(v24->_backlightService));
  }
  else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("HarmonyMagic")) & 1) != 0)
  {
    if ((CFXGetMagicCoeff((uint64_t)v24->_colorStruct.cfx, (uint64_t)v27) & 1) != 0)
    {
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
      for (i = 0; i < 6; ++i)
      {
        v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
        LODWORD(v4) = v27[i];
        objc_msgSend(v19, "addObject:", objc_msgSend(v3, "initWithFloat:", v4));
      }
      v21 = v19;
    }
  }
  else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ColorAdaptationStrength")) & 1) != 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v5 = CFXGetAdaptationStrength((uint64_t)v24->_colorStruct.cfx);
    v21 = (id)objc_msgSend(v15, "initWithFloat:", v5);
  }
  else
  {
    v21 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](v24->_properties, "objectForKey:", v22), "copy");
  }
  if (!v21)
  {
    memset(__b, 0, sizeof(__b));
    obj = v24->_filters;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
    if (v14)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v14;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(obj);
        v17 = 0;
        v17 = *(id *)(__b[1] + 8 * v11);
        v21 = (id)objc_msgSend(v17, "copyPropertyForKey:", v22);
        if (v21)
          break;
        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
          if (!v12)
            break;
        }
      }
    }
  }
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v25, (uint64_t)v22, (uint64_t)v21);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ result=%@", v25, 0x16u);
  }
  return v21;
}

uint64_t __58__CBColorModuleiOS_handleNotificationForKey_withProperty___block_invoke(id *a1)
{
  uint64_t result;
  float v2;
  float v3;
  double Current;
  int v5;
  uint64_t v6;
  float v8;

  if ((objc_msgSend(a1[4], "isEqual:", CFSTR("DisplayBrightnessFactorZero")) & 1) != 0)
    return objc_msgSend(a1[5], "handleDisplayBrightnessFactorZero:", a1[6]);
  if ((objc_msgSend(a1[4], "isEqualToString:", CFSTR("TwilightStrength")) & 1) != 0)
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      objc_msgSend(a1[6], "floatValue");
      v8 = v2;
      v3 = CFXGetTwilightStrength(*((_QWORD *)a1[5] + 8));
      result = float_equal(v3, v8);
      if ((result & 1) == 0)
      {
        result = CFXSetTwilightStrength(*((_QWORD *)a1[5] + 8), v8);
        if ((*((_BYTE *)a1[5] + 75) & 1) == 0)
        {
          v6 = *((_QWORD *)a1[5] + 8);
          Current = CFAbsoluteTimeGetCurrent();
          return CFXUpdateColorFade(v6, Current);
        }
      }
    }
  }
  else
  {
    result = objc_msgSend(a1[4], "isEqualToString:", CFSTR("TrustedLux"));
    if ((result & 1) != 0 && (*((_BYTE *)a1[5] + 368) & 1) != 0)
    {
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if ((result & 1) != 0)
      {
        result = objc_msgSend(a1[6], "floatValue");
        *((_DWORD *)a1[5] + 93) = v5;
      }
    }
  }
  return result;
}

uint64_t __39__CBColorModuleiOS_copyPropertyForKey___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v2;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, void *, uint64_t, _BYTE *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = a1;
  v11 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "getKeyCategory");
    if (result == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 376))
    {
      result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    }
  }
  else
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("CEOutput")) & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("CEInput")) & 1) != 0)
      {
        v2 = *(void **)(*(_QWORD *)(a1 + 40) + 360);
        v4 = MEMORY[0x1E0C809B0];
        v5 = -1073741824;
        v6 = 0;
        v7 = __39__CBColorModuleiOS_copyPropertyForKey___block_invoke_2;
        v8 = &unk_1E68EA910;
        v10 = *(_QWORD *)(a1 + 48);
        v9 = *(_QWORD *)(a1 + 32);
        return objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v4);
      }
      else
      {
        result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", *(_QWORD *)(a1 + 32));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
      }
    }
  }
  return result;
}

- (id)copyPropertyForKey:(id)a3
{
  NSObject *queue;
  void *v5;
  uint64_t block;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  CBColorModuleiOS *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  id v21;
  SEL v22;
  CBColorModuleiOS *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 1375731712;
  v17 = 48;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v20 = 0;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __39__CBColorModuleiOS_copyPropertyForKey___block_invoke;
  v10 = &unk_1E68EA1A0;
  v11 = a3;
  v12 = v23;
  v13 = &v14;
  dispatch_sync(queue, &block);
  v5 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __38__CBColorModuleiOS_enableMitigations___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
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
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(result + 32) + 8);
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

- (CBColorModuleiOS)init
{
  return -[CBColorModuleiOS initWithBacklight:andModuleType:](self, "initWithBacklight:andModuleType:", 0, 2, a2, self);
}

- (CBColorModuleiOS)initWithBacklight:(unsigned int)a3 andModuleType:(unint64_t)a4
{
  return -[CBColorModuleiOS initWithBacklight:andModuleType:andBrightnessControl:](self, "initWithBacklight:andModuleType:andBrightnessControl:", a3, a4, 0, a4);
}

- (CBColorModuleiOS)initWithBacklight:(unsigned int)a3 andModuleType:(unint64_t)a4 andBrightnessControl:(id)a5
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  os_log_t v12;
  dispatch_queue_t v13;
  CBColorFilter *v14;
  uint64_t v15;
  id v16;
  NSMutableArray *v17;
  CBAnalyticsScheduler *v18;
  uint64_t v19;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint8_t v34[15];
  char v35;
  NSObject *v36;
  uint64_t v37;
  int v38;
  int v39;
  void (*v40)(uint64_t);
  void *v41;
  CBColorModuleiOS *v42;
  uint8_t v43[7];
  char v44;
  NSObject *v45;
  uint8_t v46[7];
  char v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  objc_super v51;
  id v52;
  unint64_t v53;
  unsigned int v54;
  SEL v55;
  CBColorModuleiOS *v56;

  v56 = self;
  v55 = a2;
  v54 = a3;
  v53 = a4;
  v52 = a5;
  v51.receiver = self;
  v51.super_class = (Class)CBColorModuleiOS;
  v56 = -[CBColorModuleiOS init](&v51, sel_init);
  if (!v56)
    return v56;
  v56->_colorEffectsEnabled = 1;
  v56->_dropALSColorSamples = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v56, (CFNotificationCallback)StockholmALSCoExEnableNotificationHandler, CFSTR("com.apple.stockholm.reader.cardDetected"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, v56, (CFNotificationCallback)StockholmALSCoExDisableNotificationHandler, CFSTR("com.apple.stockholm.reader.cardLost"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v56->_moduleType = v53;
  v56->_backlightService = v54;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:");
  v56->_relevantServices = (NSMutableArray *)v7;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v56->_properties = (NSMutableDictionary *)v8;
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56->_alsServices = v9;
  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v56->_alsNodes = v10;
  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v56->_pendingALSSamples = v11;
  v50 = 0;
  v49 = 0;
  v33 = -[CBColorModuleiOS moduleType](v56, "moduleType");
  if (v33 == 1)
  {
    v50 = "com.apple.CoreBrightness.CBColorModule.Primary";
    v49 = "ColorModule - Primary";
  }
  else if (v33 == 2)
  {
    v50 = "com.apple.CoreBrightness.CBColorModule.External";
    v49 = "ColorModule - External";
  }
  else
  {
    v50 = "com.apple.CoreBrightness.CBColorModule.Undefined";
    v49 = "ColorModule - Undefined";
  }
  v12 = os_log_create(v50, "default");
  v56->super._logHandle = (OS_os_log *)v12;
  if (v56->super._logHandle)
  {
    v13 = dispatch_queue_create(v49, 0);
    v56->super._queue = (OS_dispatch_queue *)v13;
    if (!v56->super._queue)
    {
      v45 = 0;
      if (v56->super._logHandle)
      {
        logHandle = v56->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v45 = logHandle;
      v44 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        v25 = v45;
        v26 = v44;
        __os_log_helper_16_0_0(v43);
        _os_log_error_impl(&dword_1B5291000, v25, v26, "failed to create dispatch queue", v43, 2u);
      }
      goto LABEL_37;
    }
    -[CBColorModuleiOS initColorStruct](v56, "initColorStruct");
    v56->_reportContext.periodS = 300;
    v56->_displayOn = 1;
    v56->_forceInitialFactorUpdate = 1;
    v56->_firstALSEventArrived = 0;
    v56->_allALSEventsArrived = 0;
    v56->_forceColorUpdate = 1;
    v56->_potentiallyBustedALS = 0;
    v56->_continueWithFewerALSs = 0;
    v56->_useCopyEventOnDisplayWake = 0;
    v56->_NSamples = 0;
    v56->_preStrobeDimPeriod = -1.0;
    v56->_trustedLux = 0.0;
    v56->_supportsAmmoliteWithoutColor = 0;
    v56->_firstSampleTimeoutValue = 0.25;
    if (-[CBColorModuleiOS moduleType](v56, "moduleType") == 1)
      -[CBColorModuleiOS reportInitialize](v56, "reportInitialize");
    -[CBColorModuleiOS filterInitialize](v56, "filterInitialize");
    -[CBColorModuleiOS loadBacklightProperties](v56, "loadBacklightProperties");
    if (v56->_moduleType == 2)
    {
      v14 = [CBColorFilter alloc];
      v15 = -[CBColorFilter initWithQueue:](v14, "initWithQueue:", v56->super._queue);
      v56->_colorFilter = (CBColorFilter *)v15;
      -[CBColorFilter setSensorPolicy:](v56->_colorFilter, "setSensorPolicy:", 7);
      -[CBColorFilter setMode:](v56->_colorFilter, "setMode:", 6);
    }
    if (v52)
    {
      v16 = v52;
      v56->_brightnessControl = (CBBrightnessProxy *)v52;
    }
    if (v56->_moduleType == 1)
      -[CBColorModuleiOS ttRestrictionReload](v56, "ttRestrictionReload");
    v56->_enableMitigations = 0;
    v56->_ceConfidenceThreshold = 0.1;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56->_modules = v17;
    v18 = +[CBAnalyticsScheduler sharedInstance](CBAnalyticsScheduler, "sharedInstance");
    v37 = MEMORY[0x1E0C809B0];
    v38 = -1073741824;
    v39 = 0;
    v40 = __73__CBColorModuleiOS_initWithBacklight_andModuleType_andBrightnessControl___block_invoke;
    v41 = &unk_1E68E9E60;
    v42 = v56;
    v19 = -[CBAnalyticsScheduler registerHandler:](v18, "registerHandler:", &v37);
    v56->_analyticsPeriodicSender = v19;
    return v56;
  }
  v48 = 0;
  if (v56->super._logHandle)
  {
    v32 = v56->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v31 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v31 = init_default_corebrightness_log();
    v32 = v31;
  }
  v48 = v32;
  v47 = 16;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    log = v48;
    type = v47;
    __os_log_helper_16_0_0(v46);
    _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create logHandle", v46, 2u);
  }
LABEL_37:
  v36 = 0;
  if (v56->super._logHandle)
  {
    v24 = v56->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v23 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v23 = init_default_corebrightness_log();
    v24 = v23;
  }
  v36 = v24;
  v35 = 16;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v21 = v36;
    v22 = v35;
    __os_log_helper_16_0_0(v34);
    _os_log_error_impl(&dword_1B5291000, v21, v22, "error creating main CBColorModule", v34, 2u);
  }
  -[CBColorModuleiOS stop](v56, "stop");

  v56 = 0;
  return 0;
}

void __73__CBColorModuleiOS_initWithBacklight_andModuleType_andBrightnessControl___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t block;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __73__CBColorModuleiOS_initWithBacklight_andModuleType_andBrightnessControl___block_invoke_2;
  v7 = &unk_1E68E9E60;
  v8 = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, &block);
}

uint64_t __73__CBColorModuleiOS_initWithBacklight_andModuleType_andBrightnessControl___block_invoke_2(uint64_t result)
{
  if ((*(_BYTE *)(*(_QWORD *)(result + 32) + 104) & 1) != 0)
    return +[CBAnalytics harmonyEnabled:byUser:](CBAnalytics, "harmonyEnabled:byUser:", *(_BYTE *)(*(_QWORD *)(result + 32) + 105) & 1, 0);
  return result;
}

- (BOOL)start
{
  return 1;
}

- (void)enableMitigations:(BOOL)a3
{
  CBCEModule *ceModule;
  CBColorPolicyFilter *v4;
  double v5;
  CBColorPolicyFilter *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  CBColorModuleiOS *v12;
  BOOL v13;
  SEL v14;
  CBColorModuleiOS *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  if (self->_enableMitigations != a3)
  {
    if (v13)
    {
      v15->_ceModule = -[CBCEModule initWithQueue:ceModelID:]([CBCEModule alloc], "initWithQueue:ceModelID:", v15->super._queue, v15->_ceModelID);
      ceModule = v15->_ceModule;
      v7 = MEMORY[0x1E0C809B0];
      v8 = -1073741824;
      v9 = 0;
      v10 = __38__CBColorModuleiOS_enableMitigations___block_invoke;
      v11 = &unk_1E68E9F38;
      v12 = v15;
      -[CBModule registerNotificationBlock:](ceModule, "registerNotificationBlock:", &v7);
      -[NSMutableArray addObject:](v15->_modules, "addObject:", v15->_ceModule);
      v4 = [CBColorPolicyFilter alloc];
      v6 = -[CBColorPolicyFilter initWithID:](v4, "initWithID:", v15->_ceModelID);
      -[CBColorPolicyFilter setModuleObject:](v6, "setModuleObject:", v15->_ceModule);
      *(float *)&v5 = v15->_ceConfidenceThreshold;
      -[CBColorPolicyFilter setProperty:forKey:](v6, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("CEConfidenceThreshold"));
      -[NSMutableArray addObject:](v15->_filters, "addObject:", v6);

      v15->_enableMitigations = 1;
      CFXEnableMitigations((uint64_t)v15->_colorStruct.cfx, v13);
    }
    v15->_enableMitigations = v13;
  }
}

- (void)stop
{
  -[CBAnalyticsScheduler removeHandler:](+[CBAnalyticsScheduler sharedInstance](CBAnalyticsScheduler, "sharedInstance"), "removeHandler:", self->_analyticsPeriodicSender);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v3;
  unint64_t v4;
  objc_super v5;
  SEL v6;
  CBColorModuleiOS *v7;

  v7 = self;
  v6 = a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v7, CFSTR("com.apple.stockholm.reader.cardDetected"), 0);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v3, v7, CFSTR("com.apple.stockholm.reader.cardLost"), 0);
  if (v7->_rampTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v7->_rampTimer);
    dispatch_release((dispatch_object_t)v7->_rampTimer);
  }
  if (v7->_reportContext.logTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v7->_reportContext.logTimer);
    dispatch_release((dispatch_object_t)v7->_reportContext.logTimer);
  }

  if (v7->_colorStruct.cfx)
    CFXRelease((void **)v7->_colorStruct.cfx);
  if (v7->_brightnessControl)
  {
    v4 = 0x1EF0FB000uLL;

    v7->_brightnessControl = 0;
  }
  v5.receiver = v7;
  v5.super_class = (Class)CBColorModuleiOS;
  -[CBContainer dealloc](&v5, sel_dealloc, v4);
}

- (void)filterInitialize
{
  CBBrightestALSFilter *v2;

  self->_filters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = objc_alloc_init(CBBrightestALSFilter);
  -[NSMutableArray addObject:](self->_filters, "addObject:", v2);

}

- (void)loadBacklightProperties
{
  uint64_t inited;
  NSObject *v3;
  uint64_t v4;
  NSObject *logHandle;
  UInt8 v6[7];
  os_log_type_t v7;
  os_log_t v8;
  unsigned int v9;
  CFTypeRef v10;
  SEL v11;
  CBColorModuleiOS *v12;
  uint8_t v13[16];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = self;
  v11 = a2;
  if (self->_backlightService)
  {
    v10 = 0;
    v10 = IORegistryEntrySearchCFProperty(v12->_backlightService, "IOService", CFSTR("pre-strobe-dim-period"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
    v9 = 0;
    if (-[CBColorModuleiOS convertNSData:toUint32:](v12, "convertNSData:toUint32:", v10, &v9))
    {
      v12->_preStrobeDimPeriod = (float)v9 / 1000.0;
      v8 = 0;
      if (v12->super._logHandle)
      {
        logHandle = v12->super._logHandle;
      }
      else
      {
        v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v4;
      }
      v8 = logHandle;
      v7 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v14, COERCE__INT64(v12->_preStrobeDimPeriod));
        _os_log_impl(&dword_1B5291000, v8, v7, "PreStrobe period = %f", v14, 0xCu);
      }
    }
    if (v10)
      CFRelease(v10);
    *(_DWORD *)v6 = 0;
    if (!readExactDataFromIOService(v12->_backlightService, CFSTR("aml-only-support"), v6, 4))
      *(_DWORD *)v6 = 0;
    v12->_supportsAmmoliteWithoutColor = *(_DWORD *)v6 != 0;
    if (v12->super._logHandle)
    {
      v3 = v12->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v3 = inited;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v13, v12->_supportsAmmoliteWithoutColor);
      _os_log_impl(&dword_1B5291000, v3, OS_LOG_TYPE_INFO, "Ammolite without Color ALS: %d", v13, 8u);
    }
  }
}

- (BOOL)displayBrightnessFactorPropertyHandler:(id)a3
{
  id v4;
  BOOL v5;

  v5 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (id)objc_msgSend(a3, "objectForKey:", CFSTR("DisplayBrightnessFactor"));
  else
    v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
    objc_msgSend(v4, "floatValue");
    -[CBColorModuleiOS displayBrightnessFactorUpdate:](self, "displayBrightnessFactorUpdate:");
    -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v4, CFSTR("DisplayBrightnessFactor"));
  }
  return v5;
}

- (void)handleDisplayBrightnessFactorZero:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_4_0((uint64_t)v6, self->_displayOn);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "FactorZero - display state = %d\n", v6, 8u);
  }
  if (!self->_displayOn && self->_colorStruct.harmonyEnabled && self->_moduleType == 1)
    CFXResetAdaptation((uint64_t)self->_colorStruct.cfx, 0.1);
}

- (void)displayBrightnessFactorUpdate:(float)a3
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSMutableArray *obj;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t inited;
  NSObject *logHandle;
  _QWORD v24[8];
  id v25;
  float v26[30];
  os_log_type_t v27;
  os_log_t v28;
  id v29;
  char v30;
  BOOL displayOn;
  os_log_type_t type;
  os_log_t oslog;
  float v34;
  SEL v35;
  CBColorModuleiOS *v36;
  _BYTE v37[128];
  uint8_t v38[64];
  uint8_t v39[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v36 = self;
  v35 = a2;
  v34 = a3;
  oslog = 0;
  if (self->super._logHandle)
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
  oslog = logHandle;
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v39, COERCE__INT64(v34), v36->_NSamples);
    _os_log_impl(&dword_1B5291000, oslog, type, "Brightness factor update = %f, N samples = %d", v39, 0x12u);
  }
  displayOn = 0;
  displayOn = v36->_displayOn;
  v3 = v34;
  v36->_displayOn = v34 > 0.0;
  if (v36->_displayOn != displayOn || v36->_forceInitialFactorUpdate)
  {
    v36->_forceInitialFactorUpdate = 0;
    if (v36->_displayOn)
    {
      if (-[CBColorModuleiOS moduleType](v36, "moduleType", v3) == 1)
        -[CBColorModuleiOS reportInitialize](v36, "reportInitialize");
      if (v36->_moduleType == 2)
      {
        v30 = 0;
        v30 = -[CBColorFilter forceSampleUpdate](v36->_colorFilter, "forceSampleUpdate");
        if (v30)
          -[CBColorModuleiOS processColorSample:forceUpdate:](v36, "processColorSample:forceUpdate:", -[CBColorFilter sample](v36->_colorFilter, "sample"), 1);
      }
      else
      {
        -[CBColorModuleiOS applyPendingSamples](v36, "applyPendingSamples");
        if (!v36->_allALSEventsArrived && v36->_useCopyEventOnDisplayWake)
        {
          v29 = -[CBColorModuleiOS copyALSSamples](v36, "copyALSSamples");
          if (objc_msgSend(v29, "count"))
          {
            LODWORD(v4) = 0.5;
            if (-[CBColorModuleiOS applySamples:withinTimeout:](v36, "applySamples:withinTimeout:", v29, v4))
            {
              v28 = 0;
              if (v36->super._logHandle)
              {
                v21 = v36->super._logHandle;
              }
              else
              {
                v20 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
                v21 = v20;
              }
              v28 = v21;
              v27 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v14 = v28;
                v15 = v27;
                *(double *)&v16 = v34;
                v17 = objc_msgSend(v29, "count");
                objc_msgSend((id)objc_msgSend(v29, "objectAtIndexedSubscript:"), "illuminance");
                v18 = v5;
                v19 = (void *)objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
                if (v19)
                  objc_msgSend(v19, "colorSample");
                else
                  memset(&v26[15], 0, 0x3CuLL);
                *(double *)&v12 = v26[18];
                v13 = (void *)objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
                if (v13)
                  objc_msgSend(v13, "colorSample");
                else
                  memset(v26, 0, 0x3CuLL);
                __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v38, v16, v17, v18, v12, COERCE__INT64(v26[4]));
                _os_log_impl(&dword_1B5291000, v14, v15, "Display on (f=%f) -> Copied ALS samples (count = %lu) has been applied (Lux[0] = %f, x[0]=%f y[0]=%f).", v38, 0x34u);
              }
            }
          }

        }
        if (!v36->_allALSEventsArrived)
          -[CBColorModuleiOS armFirstALSSampleTimer](v36, "armFirstALSSampleTimer");
      }
    }
    else
    {
      v36->_firstALSEventArrived = 0;
      v36->_allALSEventsArrived = 0;
      v36->_forceColorUpdate = 1;
      v36->_continueWithFewerALSs = 0;
      v36->_NSamples = 0;
      -[CBColorModuleiOS cancelFirstSampleTimeout](v36, "cancelFirstSampleTimeout", v3);
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v36->_alsNodes, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_7);
      memset(v24, 0, sizeof(v24));
      obj = v36->_filters;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", v24, v37, 16);
      if (v11)
      {
        v7 = *(_QWORD *)v24[2];
        v8 = 0;
        v9 = v11;
        while (1)
        {
          v6 = v8;
          if (*(_QWORD *)v24[2] != v7)
            objc_enumerationMutation(obj);
          v25 = 0;
          v25 = *(id *)(v24[1] + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v25, "resetFilter");
          ++v8;
          if (v6 + 1 >= v9)
          {
            v8 = 0;
            v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", v24, v37, 16);
            if (!v9)
              break;
          }
        }
      }
      v36->_dropALSColorSamples = 0;
    }
    if (!v36->_displayOn && -[CBColorModuleiOS moduleType](v36, "moduleType") == 1)
      -[CBColorModuleiOS reportCommitWithStop:](v36, "reportCommitWithStop:", 1);
  }
}

uint64_t __50__CBColorModuleiOS_displayBrightnessFactorUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setCurrentALSEvent:", 0);
}

- (BOOL)CoreBrightnessFeaturesDisabledPropertyHandler:(id)a3
{
  float v3;
  float v4;
  CFAbsoluteTime v5;
  CFAbsoluteTime v6;
  int v7;
  BOOL v8;
  uint64_t cfx;
  float v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v22[7];
  char v23;
  NSObject *v24;
  uint8_t v25[15];
  char v26;
  NSObject *v27;
  float v28;
  float v29;
  id v30;
  char v31;
  os_log_type_t v32;
  os_log_t v33;
  id v34;
  SEL v35;
  CBColorModuleiOS *v36;
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36 = self;
  v35 = a2;
  v34 = a3;
  v33 = 0;
  if (self->super._logHandle)
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
  v33 = logHandle;
  v32 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v34);
    _os_log_debug_impl(&dword_1B5291000, v33, v32, "CoreBrightnessFeaturesDisabled handler called with dict %@", v37, 0xCu);
  }
  v31 = 0;
  v30 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("DisableWPShift"));
  else
    v30 = (id)MEMORY[0x1E0C9AAA0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36->_colorEffectsEnabled = (objc_msgSend(v30, "BOOLValue") ^ 1) & 1;
    objc_msgSend((id)objc_msgSend(v34, "objectForKey:", CFSTR("ReenablementRampPeriod")), "floatValue");
    v29 = v3;
    objc_msgSend((id)objc_msgSend(v34, "objectForKey:", CFSTR("DisablementRampPeriod")), "floatValue");
    v28 = v4;
    if (v36->_colorStruct.harmonyActive)
    {
      if (v36->_colorEffectsEnabled)
      {
        v27 = 0;
        if (v36->super._logHandle)
        {
          v19 = v36->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v18 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v18 = init_default_corebrightness_log();
          v19 = v18;
        }
        v27 = v19;
        v26 = 2;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v16 = v27;
          v17 = v26;
          __os_log_helper_16_0_0(v25);
          _os_log_debug_impl(&dword_1B5291000, v16, v17, "Suspend harmony: OFF", v25, 2u);
        }
        *(float *)&v5 = v29;
        CFXSuspendHarmony((uint64_t)v36->_colorStruct.cfx, 0, v5);
      }
      else
      {
        v24 = 0;
        if (v36->super._logHandle)
        {
          v15 = v36->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v14 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v14 = init_default_corebrightness_log();
          v15 = v14;
        }
        v24 = v15;
        v23 = 2;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v12 = v24;
          v13 = v23;
          __os_log_helper_16_0_0(v22);
          _os_log_debug_impl(&dword_1B5291000, v12, v13, "Suspend harmony: ON", v22, 2u);
        }
        *(float *)&v6 = v28;
        CFXSuspendHarmony((uint64_t)v36->_colorStruct.cfx, 1, v6);
      }
    }
    if (v36->_colorStruct.nightModeSupported)
    {
      cfx = (uint64_t)v36->_colorStruct.cfx;
      if (!v36->_colorEffectsEnabled)
        v7 = 0;
      else
        v7 = -1;
      v11 = (float)v7;
      if (v36->_colorEffectsEnabled)
        CFXSetBlueReductionFactorOverride(cfx, v11, v29);
      else
        CFXSetBlueReductionFactorOverride(cfx, v11, v28);
    }
    if (v36->_ammoliteEnabledStatus)
    {
      if (v36->_colorEffectsEnabled)
      {
        if (v36->_backlightService)
        {
          CFXInitAmmolite((uint64_t)v36->_colorStruct.cfx, v36->_backlightService);
          v8 = CFXAmmoliteEnabled((uint64_t)v36->_colorStruct.cfx);
          v36->_ammoliteEnabledStatus = v8;
        }
      }
      else
      {
        v36->_ammoliteEnabledStatus = 1;
        CFXAmmoliteDisable((uint64_t)v36->_colorStruct.cfx);
      }
    }
    else
    {
      CFXAmmoliteDisable((uint64_t)v36->_colorStruct.cfx);
      v36->_ammoliteEnabledStatus = 0;
    }
    v31 = 1;
  }
  return v31 & 1;
}

- (BOOL)preStrobePropertyHandler:(id)a3
{
  CFAbsoluteTime v3;
  int v4;
  float harmonyStrength;
  float v7;
  BOOL v8;
  BOOL v9;

  v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_colorStruct.cfx)
  {
    v8 = objc_msgSend(a3, "intValue") != 0;
    if (v8)
      v7 = 0.0;
    else
      v7 = fmaxf(0.0, self->_preStrobeDimPeriod);
    if (self->_colorStruct.harmonyActive)
    {
      if (v8)
        harmonyStrength = 0.0;
      else
        harmonyStrength = self->_colorStruct.harmonyStrength;
      *(float *)&v3 = harmonyStrength;
      CFXSetAmbientAdaptationStrength((uint64_t)self->_colorStruct.cfx, v3, v7);
    }
    if (self->_colorStruct.nightModeSupported)
    {
      if (v8)
        v4 = 0;
      else
        v4 = -1;
      CFXSetBlueReductionFactorOverride((uint64_t)self->_colorStruct.cfx, (float)v4, v7);
    }
    return 1;
  }
  return v9;
}

- (BOOL)preStrobeDimPeriodPropertyHandler:(id)a3
{
  float v3;
  BOOL v5;

  v5 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    self->_preStrobeDimPeriod = v3;
    return 1;
  }
  return v5;
}

- (BOOL)BLRFactorPropertyHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    -[CBColorModuleiOS BLRFactorUpdate:](self, "BLRFactorUpdate:");
    return 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 0;
      v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionFactorValue"));
      v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionFactorFadePeriod"));
      v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("ForceUpdate"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = (objc_msgSend(v5, "BOOLValue") & 1) != 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "floatValue");
        objc_msgSend(v7, "floatValue", self);
        objc_msgSend(v4, "BLRFactorUpdate:withPeriod:shouldForceUpdate:", v8);
        return 1;
      }
    }
  }
  return v9;
}

- (void)BLRFactorUpdate:(float)a3
{
  double v3;

  LODWORD(v3) = -1.0;
  -[CBColorModuleiOS BLRFactorUpdate:withPeriod:shouldForceUpdate:](self, "BLRFactorUpdate:withPeriod:shouldForceUpdate:", 0, *(double *)&a3, v3);
}

- (void)BLRFactorUpdate:(float)a3 withPeriod:(float)a4 shouldForceUpdate:(BOOL)a5
{
  double v5;
  uint64_t v6;
  BOOL v7;

  v7 = a5;
  v5 = a3;
  self->_colorStruct.blueReductionEnabled = a3 > 0.0;
  *(float *)&v5 = a3;
  self->_colorStruct.blueReductionFactor = a3 != 0.0;
  if (self->_colorStruct.enforceSlowRamps)
  {
    LODWORD(v5) = -1.0;
    a4 = -1.0;
    self->_colorStruct.enforceSlowRamps = 0;
  }
  if (self->_colorStruct.blueReductionEnabled)
    v6 = MEMORY[0x1E0C9AAB0];
  else
    v6 = MEMORY[0x1E0C9AAA0];
  -[CBColorModuleiOS sendNotificationForKey:andValue:](self, "sendNotificationForKey:andValue:", CFSTR("BlueReductionEnabled"), v6, v5);
  if (!self->_aggregatedConfigApplied)
    CFXEnableBlueLightReduction((uint64_t)self->_colorStruct.cfx, v7, a3, a4);
}

- (BOOL)BLRCCTTargetPropertyHandler:(id)a3
{
  float v3;
  float v4;
  double v5;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  float v10;
  float v11;
  void *v12;
  BOOL v13;

  v13 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionCCTTargetValue"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      v11 = v3;
      v10 = -1.0;
      v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionCCTTargetPeriod"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "floatValue");
        v10 = v4;
      }
      v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionCCTTargetCommit"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v8, "BOOLValue") & 1;
        v5 = v10;
        if (v10 == -1.0)
        {
          LODWORD(v5) = -1.0;
          if ((v9 & 1) == 0)
            *(float *)&v5 = 0.0;
          v10 = *(float *)&v5;
        }
        if (!self->_aggregatedConfigApplied)
          CFXSetBlueLightReductionTargetCCT((uint64_t)self->_colorStruct.cfx, 0, v11, v10, (float)((v9 ^ 1) & 1));
        v13 = 1;
        if ((v9 & 1) != 0)
          -[CBColorModuleiOS setPreferences:forKey:](self, "setPreferences:forKey:", v12, CFSTR("CBBlueLightReductionCCTTargetRaw"), v5);
      }
    }
  }
  return v13;
}

- (BOOL)BLRCCTRangePropertyHandler:(id)a3
{
  int v3;
  double v4;
  int i;
  BOOL v7;
  unint64_t v10;
  float v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "count") == 3)
  {
    v10 = 0xBF800000BF800000;
    v11 = -1.0;
    for (i = 0; i < 3; ++i)
    {
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", i), "floatValue");
      *((_DWORD *)&v10 + i) = v3;
    }
    if (*(float *)&v10 != -1.0 && *((float *)&v10 + 1) != -1.0 && v11 != -1.0)
    {
      *(float *)&v4 = CFXOverrideBlueLightReductionCCTRange((uint64_t)self->_colorStruct.cfx, v11, *(float *)&v10, *((float *)&v10 + 1));
      -[CBColorModuleiOS setPreferences:forKey:](self, "setPreferences:forKey:", a3, CFSTR("CBBlueLightReductionCCTRange"), v4);
      return 1;
    }
  }
  return v7;
}

- (BOOL)CALabShiftPropertyHandler:(id)a3
{
  int v3;
  int v4;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  SEL v11;
  CBColorModuleiOS *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    v7 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("a"));
    v6 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("b"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "floatValue");
        LODWORD(v8) = v3;
        objc_msgSend(v6, "floatValue");
        HIDWORD(v8) = v4;
        CFXSetABShift((uint64_t)v12->_colorStruct.cfx, &v8);
        return 1;
      }
    }
  }
  return v9;
}

- (BOOL)CAEnabledPropertyHandler:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t inited;
  NSObject *logHandle;
  id v8;
  char v9;
  char v10;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(a3, "BOOLValue") & 1;
    if (self->_colorStruct.harmonySupported)
    {
      if (self->_colorStruct.cfx)
      {
        self->_colorStruct.harmonyEnabled = v9 & 1;
        v10 = 1;
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
          if (self->_colorStruct.harmonyEnabled)
            v3 = "ON";
          else
            v3 = "OFF";
          __os_log_helper_16_2_1_8_32((uint64_t)v13, (uint64_t)v3);
          _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "harmony turned %s", v13, 0xCu);
        }
        -[CBColorModuleiOS updateActivity](self, "updateActivity");
        v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v9 & 1);
        if (v8)
        {
          -[CBColorModuleiOS setPreferences:forKey:](self, "setPreferences:forKey:", v8, CFSTR("CBColorAdaptationEnabled"));

        }
        +[CBAnalytics harmonyEnabled:byUser:](CBAnalytics, "harmonyEnabled:byUser:", self->_colorStruct.harmonyEnabled, 1);
        if (self->_colorStruct.harmonyEnabled)
          v4 = MEMORY[0x1E0C9AAB0];
        else
          v4 = MEMORY[0x1E0C9AAA0];
        -[CBColorModuleiOS sendNotificationForKey:andValue:](self, "sendNotificationForKey:andValue:", CFSTR("ColorAdaptationEnabled"), v4);
      }
    }
  }
  return v10 & 1;
}

- (BOOL)CAStrengthPropertyHandler:(id)a3
{
  float v3;
  double v4;
  double v5;
  int v7;
  float v8;
  void *v9;
  void *v10;
  BOOL v11;

  v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("ColorAdaptationStrengthSub"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      v8 = fminf(fmaxf(v3, 0.0), 1.0);
      v7 = 0;
      v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("ColorAdaptationStrengthPeriod"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "floatValue");
        v7 = LODWORD(v4);
      }
      *(float *)&v4 = v8;
      LODWORD(v5) = v7;
      -[CBColorModuleiOS CAStrengthUpdate:withPeriod:](self, "CAStrengthUpdate:withPeriod:", v4, v5, v10);
      return 1;
    }
  }
  return v11;
}

- (BOOL)CAFixedStrengthPropertyHandler:(id)a3
{
  float v3;
  CFAbsoluteTime v4;
  float v6;
  BOOL v7;

  v7 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    v6 = v3;
    if (v3 >= 0.0)
      v6 = fminf(fmaxf(v3, 0.0), 1.0);
    -[CBColorModuleiOS setPreferences:forKey:](self, "setPreferences:forKey:", a3, CFSTR("CBFixedAdaptationStrength"));
    self->_colorStruct.harmonyFixedStrength = v6;
    if (self->_colorStruct.harmonyFixedStrength < 0.0)
      *(float *)&v4 = self->_colorStruct.harmonyStrength;
    else
      *(float *)&v4 = self->_colorStruct.harmonyFixedStrength;
    CFXSetAmbientAdaptationStrength((uint64_t)self->_colorStruct.cfx, v4, 0.0);
    return 1;
  }
  return v7;
}

- (BOOL)CAStrengthRampPeriodTweakPropertyHandler:(id)a3
{
  float v3;
  double v4;
  BOOL v6;

  v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    if (self->_colorStruct.harmonySupported && self->_colorStruct.cfx && v3 >= 0.0)
    {
      *(float *)&v4 = CFXSetStrengthRampTweakFactor((uint64_t)self->_colorStruct.cfx, v3);
      -[CBColorModuleiOS setPreferences:forKey:](self, "setPreferences:forKey:", a3, CFSTR("CBStrengthRampPeriodTweak"), v4);
      return 1;
    }
  }
  return v6;
}

- (void)CAStrengthUpdate:(float)a3 withPeriod:(float)a4
{
  CFAbsoluteTime v4;

  if (self->_colorStruct.harmonySupported && self->_colorStruct.cfx && self->_colorStruct.harmonyFixedStrength < 0.0)
  {
    self->_colorStruct.harmonyStrength = a3;
    *(float *)&v4 = self->_colorStruct.harmonyStrength;
    CFXSetAmbientAdaptationStrength((uint64_t)self->_colorStruct.cfx, v4, a4);
  }
}

- (BOOL)CAModeMappingHandler:(id)a3
{
  id v4;
  id v5;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[CBColorModuleiOS parseAdaptationModeMappingDictionary:strengths:strengthNum:](self, "parseAdaptationModeMappingDictionary:strengths:strengthNum:", a3, v8, 6))
  {
    CFXSetAdaptationModesMapping((uint64_t)self->_colorStruct.cfx, (uint64_t)v8, 6);
    v5 = -[CBColorModuleiOS newAdaptationModeMappingDictionary:strengthNum:](self, "newAdaptationModeMappingDictionary:strengthNum:", v8, 6);
    if (v5)
    {
      -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v5, CFSTR("ColorAdaptationModeMapping"));

    }
    v4 = -[CBColorModuleiOS newAdaptationModeMappingArray:strengthNum:](self, "newAdaptationModeMappingArray:strengthNum:", v8, 6);
    if (v4)
    {
      -[CBColorModuleiOS setPreferences:forKey:](self, "setPreferences:forKey:", v4, CFSTR("CBAdaptationModeMapping2"));

    }
  }
  return 0;
}

- (BOOL)CAFadesEnabledHandler:(id)a3
{
  BOOL v4;

  v4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFXEnableFades((uint64_t)self->_colorStruct.cfx, objc_msgSend(a3, "BOOLValue") & 1);
    return 1;
  }
  return v4;
}

- (BOOL)CAAABSensorOverridePropertyHandler:(id)a3
{
  float v3;
  float v4;
  int v5;
  CBSensorOverrideFilter *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSMutableArray *obj;
  uint64_t v13;
  uint64_t inited;
  NSObject *logHandle;
  CBSensorOverrideFilter *v16;
  _QWORD __b[8];
  id v18;
  id v19;
  os_log_type_t v20;
  os_log_t v21;
  id v22;
  id v23;
  float v24;
  int v25;
  char v26;
  id v27;
  SEL v28;
  CBColorModuleiOS *v29;
  _BYTE v30[128];
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = self;
  v28 = a2;
  v27 = a3;
  v26 = 1;
  v25 = 0;
  v24 = -1.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v27, "floatValue");
    v24 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (id)objc_msgSend(v27, "objectForKey:", CFSTR("AABSensorOverrideValue"));
      v22 = (id)objc_msgSend(v27, "objectForKey:", CFSTR("AABSensorOverrideOrientation"));
      if (v23)
      {
        objc_msgSend(v23, "floatValue");
        v24 = v4;
      }
      if (v22)
        v25 = objc_msgSend(v22, "intValue");
    }
  }
  v21 = 0;
  if (v29->super._logHandle)
  {
    logHandle = v29->super._logHandle;
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
  v20 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v31, COERCE__INT64(v24), v25);
    _os_log_impl(&dword_1B5291000, v21, v20, "override ALS samples with value = %f, with orientation = %d", v31, 0x12u);
  }
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  obj = v29->_filters;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v13)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v13;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v18 = 0;
      v18 = *(id *)(__b[1] + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v25
          || (v5 = objc_msgSend(v18, "orientation"), v5 == v25)
          || !objc_msgSend(v18, "orientation"))
        {
          objc_msgSend(v19, "addObject:", v18);
        }
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v11)
          break;
      }
    }
  }
  -[NSMutableArray removeObjectsInArray:](v29->_filters, "removeObjectsInArray:", v19);

  if (v24 >= 0.0)
  {
    v6 = [CBSensorOverrideFilter alloc];
    v16 = -[CBSensorOverrideFilter initWithData:](v6, "initWithData:", v27);
    -[NSMutableArray insertObject:atIndex:](v29->_filters, "insertObject:atIndex:", v16, 0);

  }
  return v26 & 1;
}

- (BOOL)CEOverridePropertyHandler:(id)a3 key:(id)a4
{
  -[CBCEModule setProperty:forKey:](self->_ceModule, "setProperty:forKey:", a3, a4);
  return 1;
}

- (BOOL)CEEnablePropertyHandler:(id)a3 key:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSMutableArray *obj;
  uint64_t v10;
  _QWORD __b[8];
  id v12;
  char v13;
  id v14;
  id v15;
  SEL v16;
  CBColorModuleiOS *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v17->_filters;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
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
      v12 = 0;
      v12 = *(id *)(__b[1] + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "setProperty:forKey:", v15, v14);
        v13 = 1;
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
        if (!v8)
          break;
      }
    }
  }
  return v13 & 1;
}

- (BOOL)carryLogEnabledHandler:(id)a3
{
  CFTypeID TypeID;
  int valuePtr;
  BOOL v6;
  CFTypeRef cf;
  SEL v8;
  CBColorModuleiOS *v9;

  v9 = self;
  v8 = a2;
  cf = a3;
  v6 = 0;
  if (a3)
  {
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      valuePtr = 0;
      CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
      CFXEnableLog((uint64_t)v9->_colorStruct.cfx, valuePtr != 0);
      if (CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]))
        CFPreferencesSetAppValue(CFSTR("CBCarryLogEnabled"), cf, (CFStringRef)*MEMORY[0x1E0C9B248]);
      return 1;
    }
  }
  return v6;
}

- (BOOL)carryLogCommentHandler:(id)a3
{
  CFTypeID TypeID;
  BOOL v5;

  v5 = 0;
  if (a3)
  {
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(a3))
    {
      CFXStoreComment((uint64_t)self->_colorStruct.cfx, (const __CFString *)a3);
      return 1;
    }
  }
  return v5;
}

- (BOOL)carryLogCommitHandler:(id)a3
{
  CFXForceLogCommit((FILE *)self->_colorStruct.cfx);
  return 1;
}

- (BOOL)colorRampPeriodOverrideHandler:(id)a3
{
  float v3;
  BOOL v5;

  v5 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    CFXOverrideRampPeriod((uint64_t)self->_colorStruct.cfx, v3);
    return 1;
  }
  return v5;
}

- (BOOL)ammolitePropertyHandler:(id)a3 key:(id)a4
{
  uint64_t v4;
  BOOL v5;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[7];
  os_log_type_t v18;
  NSObject *v19;
  uint8_t v20[7];
  os_log_type_t v21;
  NSObject *v22;
  id v23;
  os_log_type_t v24;
  os_log_t v25;
  id v26;
  id v27;
  SEL v28;
  CBColorModuleiOS *v29;
  char v30;
  uint8_t v31[40];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = self;
  v28 = a2;
  v27 = a3;
  v26 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v27;
    if ((objc_msgSend(v27, "BOOLValue") & 1) != 0)
    {
      v22 = 0;
      if (v29->super._logHandle)
      {
        logHandle = v29->super._logHandle;
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
      v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v22;
        v12 = v21;
        __os_log_helper_16_0_0(v20);
        _os_log_impl(&dword_1B5291000, v11, v12, "Enabling/restarting Ammolite", v20, 2u);
      }
      if (v29->_colorEffectsEnabled && v29->_backlightService)
      {
        CFXInitAmmolite((uint64_t)v29->_colorStruct.cfx, v29->_backlightService);
        v5 = CFXAmmoliteEnabled((uint64_t)v29->_colorStruct.cfx);
        v29->_ammoliteEnabledStatus = v5;
      }
      else
      {
        v29->_ammoliteEnabledStatus = 1;
      }
    }
    else
    {
      v19 = 0;
      if (v29->super._logHandle)
      {
        v10 = v29->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v9 = init_default_corebrightness_log();
        v10 = v9;
      }
      v19 = v10;
      v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v19;
        v8 = v18;
        __os_log_helper_16_0_0(v17);
        _os_log_impl(&dword_1B5291000, v7, v8, "Disabling Ammolite", v17, 2u);
      }
      CFXAmmoliteDisable((uint64_t)v29->_colorStruct.cfx);
      v29->_ammoliteEnabledStatus = 0;
    }
    v30 = 1;
  }
  else
  {
    v25 = 0;
    if (v29->super._logHandle)
    {
      v16 = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v15 = init_default_corebrightness_log();
      v16 = v15;
    }
    v25 = v16;
    v24 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v4 = objc_opt_class();
      __os_log_helper_16_2_3_8_66_8_66_8_64((uint64_t)v31, (uint64_t)v26, v4, (uint64_t)v27);
      _os_log_error_impl(&dword_1B5291000, v25, v24, "Wrong value for key %{public}@: (%{public}@) %@", v31, 0x20u);
    }
    v30 = 0;
  }
  return v30 & 1;
}

- (BOOL)colorFilterModeHandler:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[7];
  char v9;
  NSObject *v10;
  char v11;
  id v12;
  SEL v13;
  CBColorModuleiOS *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 1;
    -[CBColorFilter setMode:](v14->_colorFilter, "setMode:", objc_msgSend(v12, "unsignedIntegerValue"));
    -[CBColorModuleiOS processColorSample:forceUpdate:](v14, "processColorSample:forceUpdate:", -[CBColorFilter sample](v14->_colorFilter, "sample"), 0);
  }
  else
  {
    v10 = 0;
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
    v10 = logHandle;
    v9 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v10;
      type = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1B5291000, log, type, "unsupported data format", v8, 2u);
    }
  }
  return v11 & 1;
}

- (void)processColorSample:(id)a3 forceUpdate:(BOOL)a4
{
  double v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  NSObject *v15;
  float __b[15];
  uint8_t v17[7];
  char v18;
  NSObject *v19;
  BOOL v20;
  id v21;
  SEL v22;
  CBColorModuleiOS *v23;
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  if (a3)
  {
    memset(__b, 0, sizeof(__b));
    objc_msgSend(v21, "XYZ");
    *(float *)&v4 = v4;
    __b[0] = *(float *)&v4;
    objc_msgSend(v21, "XYZ");
    v6 = v5;
    __b[1] = v6;
    objc_msgSend(v21, "XYZ");
    v8 = v7;
    __b[2] = v8;
    objc_msgSend(v21, "CCT");
    *(float *)&v9 = v9;
    __b[5] = *(float *)&v9;
    if (__b[0] == 0.0 || __b[1] == 0.0)
    {
      __b[4] = 0.0;
      __b[3] = 0.0;
    }
    else
    {
      CFXTristimulus2Chromaticity(__b, &__b[3]);
    }
    if (v23->super._logHandle)
    {
      logHandle = v23->super._logHandle;
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
      __os_log_helper_16_2_2_8_64_4_0((uint64_t)v24, (uint64_t)v21, v20);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "process color sample = %@, force = %d", v24, 0x12u);
    }
    -[CBColorModuleiOS inputAmbientColorSample:force:trust:](v23, "inputAmbientColorSample:force:trust:", __b, v20, 1);
  }
  else
  {
    v19 = 0;
    if (v23->super._logHandle)
    {
      v15 = v23->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v14 = init_default_corebrightness_log();
      v15 = v14;
    }
    v19 = v15;
    v18 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      log = v19;
      type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_error_impl(&dword_1B5291000, log, type, "ERROR: invalid sample", v17, 2u);
    }
  }
}

- (void)debugPrintColorSampleAsRGB:(id)a3
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
  uint64_t inited;
  NSObject *logHandle;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint8_t v25[40];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "XYZ");
  v14 = v3;
  objc_msgSend(a3, "XYZ");
  v15 = -(0.158 * v4 - 0.418 * v14);
  objc_msgSend(a3, "XYZ");
  v22 = v15 + -0.082 * v5;
  objc_msgSend(a3, "XYZ");
  v16 = v6;
  objc_msgSend(a3, "XYZ");
  v17 = 0.252 * v7 + -0.091 * v16;
  objc_msgSend(a3, "XYZ");
  v21 = v17 + 0.015 * v8;
  objc_msgSend(a3, "XYZ");
  v18 = v9;
  objc_msgSend(a3, "XYZ");
  v19 = -(0.002 * v10 - 0.00092 * v18);
  objc_msgSend(a3, "XYZ");
  v20 = v19 + 0.178 * v11;
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
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v25, *(uint64_t *)&v22, *(uint64_t *)&v21, *(uint64_t *)&v20);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "RGB: color sample with r=%f, g=%f, b=%f", v25, 0x20u);
  }
}

- (BOOL)displayPresetHarmonyHandler:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v6;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_colorStruct.presetDisableHarmony = objc_msgSend(a3, "BOOLValue") & 1;
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
      __os_log_helper_16_0_1_4_0((uint64_t)v9, self->_colorStruct.presetDisableHarmony);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Harmony preset state changed to %d", v9, 8u);
    }
    if (self->_colorStruct.harmonySupported && self->_colorStruct.cfx)
      -[CBColorModuleiOS updateAvailability](self, "updateAvailability");
    -[CBColorModuleiOS sendNotificationForKey:andValue:](self, "sendNotificationForKey:andValue:", CFSTR("CBDisplayPresetDisableHarmony"), a3);
    v6 = 1;
  }
  return v6 & 1;
}

uint64_t __48__CBColorModuleiOS_handleHIDEventInternal_from___block_invoke_164(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "currentALSEvent");
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)getRegistryIDForHIDServiceClient:(__IOHIDServiceClient *)a3
{
  CFTypeID v4;
  void *v5;
  CFTypeRef cf;

  cf = IOHIDServiceClientGetRegistryID(a3);
  v5 = 0;
  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFNumberGetTypeID())
      return (id)cf;
  }
  return v5;
}

- (int)getVid:(__IOHIDServiceClient *)a3
{
  const __CFNumber *number;
  int valuePtr;
  IOHIDServiceClientRef service;
  SEL v7;
  CBColorModuleiOS *v8;

  v8 = self;
  v7 = a2;
  service = a3;
  valuePtr = 0;
  number = (const __CFNumber *)IOHIDServiceClientCopyProperty(a3, CFSTR("VendorID"));
  if (number)
  {
    CFNumberGetValue(number, kCFNumberIntType, &valuePtr);
    CFRelease(number);
  }
  return valuePtr;
}

- (int)getPid:(__IOHIDServiceClient *)a3
{
  const __CFNumber *number;
  int valuePtr;
  IOHIDServiceClientRef service;
  SEL v7;
  CBColorModuleiOS *v8;

  v8 = self;
  v7 = a2;
  service = a3;
  valuePtr = 0;
  number = (const __CFNumber *)IOHIDServiceClientCopyProperty(a3, CFSTR("ProductID"));
  if (number)
  {
    CFNumberGetValue(number, kCFNumberIntType, &valuePtr);
    CFRelease(number);
  }
  return valuePtr;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSObject *queue;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  char v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSMutableArray *obj;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  int v35;
  void (*v36)(uint64_t);
  void *v37;
  CBColorModuleiOS *v38;
  IOHIDServiceClientRef v39;
  uint64_t v40;
  int v41;
  int v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  CBColorModuleiOS *v45;
  IOHIDServiceClientRef v46;
  uint8_t v47[7];
  os_log_type_t v48;
  os_log_t oslog;
  uint64_t v50;
  int v51;
  int v52;
  void (*v53)(uint64_t);
  void *v54;
  CBColorModuleiOS *v55;
  IOHIDServiceClientRef v56;
  uint8_t v57[15];
  os_log_type_t v58;
  NSObject *v59;
  CFTypeRef v60;
  uint64_t block;
  int v62;
  int v63;
  uint64_t (*v64)(uint64_t);
  void *v65;
  CBColorModuleiOS *v66;
  uint64_t *v67;
  uint64_t *v68;
  IOHIDServiceClientRef v69;
  BOOL v70;
  char v71;
  _QWORD __b[8];
  id v73;
  uint64_t v74;
  uint64_t *v75;
  int v76;
  int v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  CBALSNode *v80;
  uint8_t v81[7];
  os_log_type_t v82;
  NSObject *v83;
  uint8_t v84[3];
  os_log_type_t type;
  NSObject *v86;
  uint64_t v87;
  uint64_t *v88;
  int v89;
  int v90;
  char v91;
  IOHIDServiceClientRef v92;
  SEL v93;
  CBColorModuleiOS *v94;
  uint8_t v95[40];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v94 = self;
  v93 = a2;
  v92 = a3;
  v87 = 0;
  v88 = &v87;
  v89 = 0x20000000;
  v90 = 32;
  v91 = 0;
  if (a3)
  {
    v83 = 0;
    if (v94->super._logHandle)
    {
      logHandle = v94->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v83 = logHandle;
    v82 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      v25 = v83;
      v26 = v82;
      __os_log_helper_16_0_0(v81);
      _os_log_debug_impl(&dword_1B5291000, v25, v26, "Check if the service is ALS", v81, 2u);
    }
    if (IOHIDServiceClientConformsTo(v92, 0xFF00u, 4u))
    {
      v74 = 0;
      v75 = &v74;
      v76 = 1375731712;
      v77 = 48;
      v78 = __Block_byref_object_copy__10;
      v79 = __Block_byref_object_dispose__10;
      v80 = 0;
      v80 = -[CBALSNode initWithALSServiceClient:]([CBALSNode alloc], "initWithALSServiceClient:", v92);
      memset(__b, 0, sizeof(__b));
      obj = v94->_filters;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v96, 16);
      if (v24)
      {
        v20 = *(_QWORD *)__b[2];
        v21 = 0;
        v22 = v24;
        while (1)
        {
          v19 = v21;
          if (*(_QWORD *)__b[2] != v20)
            objc_enumerationMutation(obj);
          v73 = 0;
          v73 = *(id *)(__b[1] + 8 * v21);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v73, "setIsActive:", (objc_msgSend(v73, "isActive") & 1 & objc_msgSend((id)v75[5], "useProxForOcclusion") & 1) != 0);
          ++v21;
          if (v19 + 1 >= v22)
          {
            v21 = 0;
            v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v96, 16);
            if (!v22)
              break;
          }
        }
      }
      v71 = 0;
      v71 = objc_msgSend((id)v75[5], "isColorSupported") & 1;
      v70 = 0;
      v70 = objc_msgSend((id)v75[5], "placement") == 2;
      if (!v70 && ((v71 & 1) != 0 || v94->_supportsAmmoliteWithoutColor))
      {
        queue = v94->super._queue;
        block = MEMORY[0x1E0C809B0];
        v62 = -1073741824;
        v63 = 0;
        v64 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke;
        v65 = &unk_1E68EA8C0;
        v66 = v94;
        v69 = v92;
        v67 = &v74;
        v68 = &v87;
        dispatch_sync(queue, &block);
        v60 = 0;
        v60 = (CFTypeRef)objc_msgSend((id)v75[5], "copyEvent");
        if (v60)
        {
          -[CBColorModuleiOS handleHIDEvent:from:](v94, "handleHIDEvent:from:", v60, v92);
          CFRelease(v60);
        }
      }

      _Block_object_dispose(&v74, 8);
    }
    else if (IOHIDServiceClientConformsTo(v92, 0xFF00u, 8u))
    {
      v59 = 0;
      if (v94->super._logHandle)
      {
        v18 = v94->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v17 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v17 = init_default_corebrightness_log();
        v18 = v17;
      }
      v59 = v18;
      v58 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v15 = v59;
        v16 = v58;
        __os_log_helper_16_0_0(v57);
        _os_log_impl(&dword_1B5291000, v15, v16, "Incoming proximity sensor service", v57, 2u);
      }
      v4 = v94->super._queue;
      v50 = MEMORY[0x1E0C809B0];
      v51 = -1073741824;
      v52 = 0;
      v53 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_180;
      v54 = &unk_1E68EA3D8;
      v55 = v94;
      v56 = v92;
      dispatch_sync(v4, &v50);
    }
    else if (IOHIDServiceClientConformsTo(v92, 0xDu, 0xCu))
    {
      oslog = 0;
      if (v94->super._logHandle)
      {
        v14 = v94->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v13 = init_default_corebrightness_log();
        v14 = v13;
      }
      oslog = v14;
      v48 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v11 = oslog;
        v12 = v48;
        __os_log_helper_16_0_0(v47);
        _os_log_impl(&dword_1B5291000, v11, v12, "Incoming multiple point digitizer service", v47, 2u);
      }
      v5 = v94->super._queue;
      v40 = MEMORY[0x1E0C809B0];
      v41 = -1073741824;
      v42 = 0;
      v43 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_181;
      v44 = &unk_1E68EA3D8;
      v45 = v94;
      v46 = v92;
      dispatch_sync(v5, &v40);
    }
    else if (IOHIDServiceClientConformsTo(v92, 0x20u, 0x41u) && v94->_moduleType == 2)
    {
      v6 = v94->super._queue;
      v33 = MEMORY[0x1E0C809B0];
      v34 = -1073741824;
      v35 = 0;
      v36 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_2_182;
      v37 = &unk_1E68EA3D8;
      v39 = v92;
      v38 = v94;
      dispatch_sync(v6, &v33);
      *((_BYTE *)v88 + 24) = 1;
    }
    if (v94->super._logHandle)
    {
      v10 = v94->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v9 = init_default_corebrightness_log();
      v10 = v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_0_4_0_8_64_8_64((uint64_t)v95, (uint64_t)v92, v88[3] & 1, (uint64_t)v94->_relevantServices, (uint64_t)v94->_alsServices);
      _os_log_debug_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEBUG, "service: %p relevant:%d services-> %@ ALS services-> %@", v95, 0x26u);
    }
  }
  else
  {
    v86 = 0;
    if (v94->super._logHandle)
    {
      v32 = v94->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v31 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v31 = init_default_corebrightness_log();
      v32 = v31;
    }
    v86 = v32;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      log = v86;
      v30 = type;
      __os_log_helper_16_0_0(v84);
      _os_log_error_impl(&dword_1B5291000, log, v30, "HID service client pointer is NULL", v84, 2u);
    }
  }
  v8 = *((_BYTE *)v88 + 24);
  _Block_object_dispose(&v87, 8);
  return v8 & 1;
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  NSObject *v3;
  uint64_t inited;
  NSObject *v5;
  mach_port_t mainPort;
  const __CFDictionary *matching;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  _QWORD *v14;
  _QWORD v15[2];
  int v16;
  int v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  CBDigitizerFilter *v21;
  uint64_t v22;
  os_log_type_t v23;
  os_log_t v24;
  uint64_t v25;
  uint64_t v26;
  UInt8 buffer[4];
  os_log_type_t v28;
  os_log_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFData *v32;
  io_registry_entry_t MatchingService;
  CFNumberRef RegistryID;
  uint64_t valuePtr[11];
  uint8_t v36[16];
  uint8_t v37[8];
  uint64_t v38;
  CFRange v39;
  CFRange v40;

  v38 = *MEMORY[0x1E0C80C00];
  valuePtr[2] = a1;
  valuePtr[1] = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addObject:", *(_QWORD *)(a1 + 56));
  valuePtr[0] = 0;
  RegistryID = 0;
  RegistryID = (CFNumberRef)IOHIDServiceClientGetRegistryID(*(IOHIDServiceClientRef *)(a1 + 56));
  if (RegistryID)
    CFNumberGetValue(RegistryID, kCFNumberSInt64Type, valuePtr);
  if (valuePtr[0])
  {
    MatchingService = 0;
    mainPort = *MEMORY[0x1E0CBBAA8];
    matching = IORegistryEntryIDMatching(valuePtr[0]);
    MatchingService = IOServiceGetMatchingService(mainPort, matching);
    if (MatchingService)
    {
      v32 = 0;
      v32 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("ce-model"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
      if (v32)
      {
        valuePtr[8] = 0;
        valuePtr[7] = 4;
        valuePtr[9] = 0;
        valuePtr[10] = 4;
        v30 = 0;
        v31 = 4;
        v39.location = 0;
        v39.length = 4;
        CFDataGetBytes(v32, v39, (UInt8 *)(*(_QWORD *)(a1 + 32) + 312));
        v29 = 0;
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
        v29 = v5;
        v28 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v37, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 312));
          _os_log_impl(&dword_1B5291000, v29, v28, "CE Model being used:%d", v37, 8u);
        }
        CFRelease(v32);
        v32 = 0;
      }
      v32 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("ce-threshold"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
      if (v32)
      {
        *(_DWORD *)buffer = 0;
        valuePtr[4] = 0;
        valuePtr[3] = 4;
        valuePtr[5] = 0;
        valuePtr[6] = 4;
        v25 = 0;
        v26 = 4;
        v40.location = 0;
        v40.length = 4;
        CFDataGetBytes(v32, v40, buffer);
        *(float *)(*(_QWORD *)(a1 + 32) + 316) = (float)*(int *)buffer / 65536.0;
        v24 = 0;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
        {
          v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v2 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v2 = init_default_corebrightness_log();
          v3 = v2;
        }
        v24 = v3;
        v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v36, COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 316)));
          _os_log_impl(&dword_1B5291000, v24, v23, "CE Confidence threshold:%f", v36, 0xCu);
        }
        CFRelease(v32);
        v32 = 0;
      }
    }
  }
  v22 = 0;
  v22 = objc_msgSend(*(id *)(a1 + 32), "getRegistryIDForHIDServiceClient:", *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) && v22)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v22);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 220) = (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 220) & 1 | (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "sensorType") == 8)) != 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 220) = (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 220) & 1 | (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "sensorType") == 9)) != 0;
    v21 = 0;
    v21 = -[CBDigitizerFilter initWithALSNode:andLogCategory:]([CBDigitizerFilter alloc], "initWithALSNode:andLogCategory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "color");
    -[CBFilter scheduleWithDispatchQueue:](v21, "scheduleWithDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v15[0] = 0;
    v15[1] = v15;
    v16 = 1375731712;
    v17 = 48;
    v18 = __Block_byref_object_copy__10;
    v19 = __Block_byref_object_dispose__10;
    v20 = 0;
    v20 = *(_QWORD *)(a1 + 32);
    v9 = MEMORY[0x1E0C809B0];
    v10 = -1073741824;
    v11 = 0;
    v12 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_179;
    v13 = &unk_1E68EA5E0;
    v14 = v15;
    -[CBFilter registerNotificationBlock:](v21, "registerNotificationBlock:", &v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "insertObject:atIndex:", v21, 0);
    _Block_object_dispose(v15, 8);
  }
  objc_msgSend(*(id *)(a1 + 32), "activateColorAdaptation");
  result = objc_msgSend(*(id *)(a1 + 32), "updateAvailability");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_179(uint64_t result, uint64_t a2, uint64_t a3)
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
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) + 8);
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
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 40), "handleFilterNotificationForKey:withProperty:", a2, a3);
  }
  return result;
}

void __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_180(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  void *v8;
  _QWORD *v9;
  _QWORD v10[2];
  int v11;
  int v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  CBProxFilter *v21;
  CBProxFilter *v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a1;
  v23 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  v22 = 0;
  v22 = objc_alloc_init(CBProxFilter);
  -[CBFilter scheduleWithDispatchQueue:](v22, "scheduleWithDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  v3 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = -1073741824;
  v18 = 0;
  v19 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_2;
  v20 = &unk_1E68EA8E8;
  v21 = v22;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", &v16);
  v10[0] = 0;
  v10[1] = v10;
  v11 = 1375731712;
  v12 = 48;
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  v15 = 0;
  v15 = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v5 = -1073741824;
  v6 = 0;
  v7 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_3;
  v8 = &unk_1E68EA5E0;
  v9 = v10;
  -[CBFilter registerNotificationBlock:](v22, "registerNotificationBlock:", &v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "insertObject:atIndex:", v22, 0);
  _Block_object_dispose(v10, 8);
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "setIsActive:", (objc_msgSend(*(id *)(a1 + 32), "isActive") & 1 & objc_msgSend(a3, "useProxForOcclusion") & 1) != 0);
  return result;
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
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
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) + 8);
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
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 40), "handleFilterNotificationForKey:withProperty:", a2, a3);
  }
  return result;
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_181(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40), a1, a1);
}

void __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_2_182(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v4;
  uint64_t v5;
  uint8_t v7[15];
  os_log_type_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v12 = a1;
  v11 = a1;
  v10 = 0;
  v10 = (id)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(a1 + 40), CFSTR("ColorSupport"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v10, "BOOLValue") & 1) == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 320);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "addHIDServiceClient:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "activateColorAdaptation");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 107) = 1;
    v5 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:");
    objc_msgSend(*(id *)(a1 + 32), "sendNotificationForKey:andValue:", CFSTR("ColorAdaptationAvailable"), v5);
    objc_msgSend(*(id *)(a1 + 32), "updateActivity");
    v9 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    v9 = v4;
    v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      log = v9;
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_impl(&dword_1B5291000, log, type, "Found a Color ALS", v7, 2u);
    }
  }

}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CBColorModuleiOS *v10;
  uint64_t *v11;
  __IOHIDServiceClient *v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  __IOHIDServiceClient *v19;
  SEL v20;
  CBColorModuleiOS *v21;
  char v22;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x20000000;
  v17 = 32;
  v18 = 0;
  if (a3)
  {
    queue = v21->super._queue;
    v5 = MEMORY[0x1E0C809B0];
    v6 = -1073741824;
    v7 = 0;
    v8 = __43__CBColorModuleiOS_removeHIDServiceClient___block_invoke;
    v9 = &unk_1E68EA658;
    v10 = v21;
    v12 = v19;
    v11 = &v14;
    dispatch_sync(queue, &v5);
  }
  v22 = v15[3] & 1;
  v13 = 1;
  _Block_object_dispose(&v14, 8);
  return v22 & 1;
}

uint64_t __43__CBColorModuleiOS_removeHIDServiceClient___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "getRegistryIDForHIDServiceClient:", *(_QWORD *)(a1 + 48));
  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeObjectForKey:", v4);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObject:", *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "updateAvailability");
  }
  else
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 48));
    if ((result & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 48));
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "removeHIDServiceClient:", *(_QWORD *)(a1 + 48));
      if (!--*(_DWORD *)(*(_QWORD *)(a1 + 32) + 320))
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 107) = 0;
        objc_msgSend(*(id *)(a1 + 32), "activateColorAdaptation");
        v2 = MEMORY[0x1E0C9AAA0];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:");
        objc_msgSend(*(id *)(a1 + 32), "sendNotificationForKey:andValue:", CFSTR("ColorAdaptationAvailable"), v2);
        result = objc_msgSend(*(id *)(a1 + 32), "updateActivity");
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)setNightShiftFactorDictionary:(id)a3
{
  -[CBColorModuleiOS setProperty:forKey:](self, "setProperty:forKey:", a3, CFSTR("BlueLightReductionFactor"));
}

- (id)copyPreferenceForKey:(id)a3 user:(id)a4
{
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
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Copy preference for key = %@", v8, 0xCu);
  }
  return 0;
}

- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5
{
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
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a4);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Set preference for key = %@", v8, 0xCu);
  }
}

uint64_t __39__CBColorModuleiOS_copyPropertyForKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "copyPropertyForKey:", *(_QWORD *)(a1 + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *a4 = 1;
  }
  return result;
}

- (void)updateAvailability
{
  NSMutableDictionary *alsNodes;
  uint64_t v3;
  id v4;
  uint64_t inited;
  NSObject *v6;
  uint64_t v7;
  NSObject *logHandle;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t, uint64_t, void *, _BYTE *);
  void *v14;
  CBColorModuleiOS *v15;
  BOOL harmonyAvailable;
  SEL v17;
  CBColorModuleiOS *v18;
  uint8_t v19[16];
  uint8_t v20[8];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = self;
  v17 = a2;
  harmonyAvailable = 0;
  harmonyAvailable = self->_colorStruct.harmonyAvailable;
  alsNodes = self->_alsNodes;
  v10 = MEMORY[0x1E0C809B0];
  v11 = -1073741824;
  v12 = 0;
  v13 = __38__CBColorModuleiOS_updateAvailability__block_invoke;
  v14 = &unk_1E68EA568;
  v15 = v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](alsNodes, "enumerateKeysAndObjectsUsingBlock:", &v10);
  if (v18->_colorStruct.presetDisableHarmony)
  {
    v18->_colorStruct.harmonyAvailable = 0;
    if (v18->super._logHandle)
    {
      logHandle = v18->super._logHandle;
    }
    else
    {
      v7 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v7;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v20, v18->_colorStruct.harmonyAvailable);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "harmony available: %d preset overrides availability)", v20, 8u);
    }
  }
  if (v18->super._logHandle)
  {
    v6 = v18->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v6 = inited;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v19, v18->_colorStruct.harmonyAvailable);
    _os_log_impl(&dword_1B5291000, v6, OS_LOG_TYPE_INFO, "harmony available: %d", v19, 8u);
  }
  if (v18->_colorStruct.harmonyAvailable)
    v3 = MEMORY[0x1E0C9AAB0];
  else
    v3 = MEMORY[0x1E0C9AAA0];
  -[NSMutableDictionary setObject:forKey:](v18->_properties, "setObject:forKey:", v3, CFSTR("ColorAdaptationAvailable"));
  if (harmonyAvailable != v18->_colorStruct.harmonyAvailable)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v9 = (id)objc_msgSend(v4, "initWithBool:", v18->_colorStruct.harmonyAvailable);
    if (v9)
      -[CBColorModuleiOS sendNotificationForKey:andValue:](v18, "sendNotificationForKey:andValue:", CFSTR("ColorAdaptationAvailable"), v9);

  }
  -[CBColorModuleiOS updateActivity](v18, "updateActivity");
}

uint64_t __38__CBColorModuleiOS_updateAvailability__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a3, "isColorSupported");
    if ((result & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 107) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (void)updateActivity
{
  NSMutableDictionary *alsNodes;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t inited;
  NSObject *logHandle;
  BOOL harmonyAvailable;
  uint8_t v14[15];
  char v15;
  NSObject *v16;
  char v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, uint64_t, void *, uint64_t);
  void *v22;
  CBColorModuleiOS *v23;
  os_log_type_t v24;
  os_log_t v25;
  BOOL harmonyActive;
  SEL v27;
  CBColorModuleiOS *v28;
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28 = self;
  v27 = a2;
  harmonyActive = 0;
  harmonyActive = self->_colorStruct.harmonyActive;
  harmonyAvailable = 0;
  if (self->_colorStruct.harmonyEnabled)
    harmonyAvailable = v28->_colorStruct.harmonyAvailable;
  v28->_colorStruct.harmonyActive = harmonyAvailable;
  if (harmonyActive != v28->_colorStruct.harmonyActive)
  {
    v25 = 0;
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
    v25 = logHandle;
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_3_4_0_4_0_4_0((uint64_t)v29, v28->_colorStruct.harmonyActive, v28->_colorStruct.harmonyEnabled, v28->_colorStruct.harmonyAvailable);
      _os_log_impl(&dword_1B5291000, v25, v24, "harmony active: %d (enabled=%d available=%d)", v29, 0x14u);
    }
    if (v28->_colorStruct.harmonyActive)
    {
      alsNodes = v28->_alsNodes;
      v18 = MEMORY[0x1E0C809B0];
      v19 = -1073741824;
      v20 = 0;
      v21 = __34__CBColorModuleiOS_updateActivity__block_invoke;
      v22 = &unk_1E68EA8E8;
      v23 = v28;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](alsNodes, "enumerateKeysAndObjectsUsingBlock:", &v18);
      if (v28->_moduleType == 2)
      {
        v17 = 0;
        v17 = -[CBColorFilter forceSampleUpdate](v28->_colorFilter, "forceSampleUpdate");
        if (v17)
        {
          -[CBColorModuleiOS processColorSample:forceUpdate:](v28, "processColorSample:forceUpdate:", -[CBColorFilter sample](v28->_colorFilter, "sample"), 1);
        }
        else
        {
          v16 = 0;
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
          v16 = v10;
          v15 = 16;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v7 = v16;
            v8 = v15;
            __os_log_helper_16_0_0(v14);
            _os_log_error_impl(&dword_1B5291000, v7, v8, "EXTERNAL: failed to retrieve event", v14, 2u);
          }
        }
      }
    }
    if (!v28->_aggregatedConfigApplied)
      CFXEnableAmbientAdaptation((uint64_t)v28->_colorStruct.cfx, v28->_colorStruct.harmonyActive);
    v5 = MEMORY[0x1E0C9AAA0];
    v6 = MEMORY[0x1E0C9AAB0];
    if (v28->_colorStruct.harmonyActive)
      v3 = MEMORY[0x1E0C9AAB0];
    else
      v3 = MEMORY[0x1E0C9AAA0];
    -[NSMutableDictionary setObject:forKey:](v28->_properties, "setObject:forKey:", v3);
    if (v28->_colorStruct.harmonyActive)
      v4 = v6;
    else
      v4 = v5;
    -[CBColorModuleiOS sendNotificationForKey:andValue:](v28, "sendNotificationForKey:andValue:", CFSTR("ColorAdaptationActive"), v4);
  }
}

void __34__CBColorModuleiOS_updateActivity__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v7;
  uint8_t v9[7];
  char v10;
  NSObject *v11;
  CFTypeRef v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v17 = a1;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = a1;
  v12 = (CFTypeRef)objc_msgSend(a3, "copyEvent");
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleHIDEventInternal:from:", v12, objc_msgSend(v15, "alsService"));
    CFRelease(v12);
  }
  else
  {
    v11 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v7 = inited;
    }
    v11 = v7;
    v10 = 16;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      log = v11;
      type = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_error_impl(&dword_1B5291000, log, type, "failed to retrieve event", v9, 2u);
    }
  }
}

- (void)handleFilterNotificationForKey:(id)a3 withProperty:(id)a4
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSMutableArray *obj;
  uint64_t v17;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v20[15];
  os_log_type_t v21;
  os_log_t v22;
  uint8_t v24[15];
  os_log_type_t v25;
  os_log_t oslog;
  _QWORD __b[8];
  id v28;
  char v29;
  os_log_type_t v30;
  os_log_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  SEL v36;
  CBColorModuleiOS *v37;
  _BYTE v38[128];
  uint8_t v39[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v37 = self;
  v36 = a2;
  v35 = a3;
  v34 = a4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TouchStateChanged")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = objc_msgSend(v34, "objectForKey:", CFSTR("TouchOrientation"));
      v32 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("TouchIsObstucted"));
      v31 = 0;
      if (v37->super._logHandle)
      {
        logHandle = v37->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v31 = logHandle;
      v30 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v39, (uint64_t)v32, v33);
        _os_log_impl(&dword_1B5291000, v31, v30, "Touch state changed = %{public}@, orientation = %{public}@", v39, 0x16u);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v32, "BOOLValue") & 1) != 0)
      {
        v29 = 1;
        memset(__b, 0, sizeof(__b));
        obj = v37->_filters;
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
        if (v17)
        {
          v13 = *(_QWORD *)__b[2];
          v14 = 0;
          v15 = v17;
          while (1)
          {
            v12 = v14;
            if (*(_QWORD *)__b[2] != v13)
              objc_enumerationMutation(obj);
            v28 = 0;
            v28 = *(id *)(__b[1] + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v28, "isObstructed") & 1) == 0)
              break;
            ++v14;
            if (v12 + 1 >= v15)
            {
              v14 = 0;
              v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
              if (!v15)
                goto LABEL_22;
            }
          }
          v29 = 0;
        }
LABEL_22:
        if ((v29 & 1) != 0)
        {
          CFXCancelColorFade((uint64_t)v37->_colorStruct.cfx);
          oslog = 0;
          if (v37->super._logHandle)
          {
            v11 = v37->super._logHandle;
          }
          else
          {
            v10 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v11 = v10;
          }
          oslog = v11;
          v25 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v8 = oslog;
            v9 = v25;
            __os_log_helper_16_0_0(v24);
            _os_log_impl(&dword_1B5291000, v8, v9, "MITIGATION: Cancel color ramp on touch mitigation", v24, 2u);
          }
        }
      }
    }
  }
  if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ProxStateChanged")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v34, "BOOLValue") & 1)
      {
        CFXCancelColorFade((uint64_t)v37->_colorStruct.cfx);
        v22 = 0;
        if (v37->super._logHandle)
        {
          v7 = v37->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v6 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v6 = init_default_corebrightness_log();
          v7 = v6;
        }
        v22 = v7;
        v21 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v4 = v22;
          v5 = v21;
          __os_log_helper_16_0_0(v20);
          _os_log_impl(&dword_1B5291000, v4, v5, "MITIGATION: Cancel color ramp on prox mitigation", v20, 2u);
        }
      }
    }
  }
}

- (void)initColorStruct
{
  id v2;
  uint64_t v3;
  id v4;
  double v5;
  int v6;
  id v7;
  double v8;
  id v9;
  double v10;
  id v11;
  double v12;
  float v13;
  id v14;
  double v15;
  CFTypeID TypeID;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  int valuePtr;
  CFTypeRef cf;
  uint8_t v28[15];
  os_log_type_t v29;
  os_log_t oslog;
  id v31;
  float v32;
  id v33;
  id v34;
  int i;
  id v36;
  id v37;
  float v38;
  float v39;
  float v40;
  float v41;
  char v42;
  int v43;
  CFTypeRef v44;
  uint8_t v45[15];
  os_log_type_t v46;
  NSObject *v47;
  id v48;
  SEL v49;
  CBColorModuleiOS *v50;
  id v51;
  __CFString *v52;
  id v53;
  id v54;
  id v55;
  unint64_t v56;
  float v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v50 = self;
  v49 = a2;
  self->_colorStruct.harmonyFixedStrength = -1.0;
  v50->_colorStruct.enforceSlowRamps = 1;
  v50->_colorStruct.harmonySupported = 0;
  v50->_colorStruct.enablementTs = 0.0;
  v50->_colorStruct.forceSnapping = 0;
  v50->_colorStruct.whitePointEnabled = 0;
  v50->_colorStruct.nightModeSupported = CBU_IsNightShiftSupported() & 1;
  v50->_colorStruct.presetDisableHarmony = 0;
  v48 = 0;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  if (v50->_colorStruct.nightModeSupported)
    v3 = MEMORY[0x1E0C9AAB0];
  else
    v3 = MEMORY[0x1E0C9AAA0];
  v48 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", CFSTR("SupportsAmbientColorAdaptation"), v3, CFSTR("SupportsNightMode"), 0);
  objc_autoreleasePoolPop(context);
  if (v48)
  {
    -[NSMutableDictionary setObject:forKey:](v50->_properties, "setObject:forKey:", v48, CFSTR("SupportedColorFX"));

  }
  v50->_colorStruct.cfx = (ColorEffects *)CFXCreate();
  if (v50->_colorStruct.cfx)
  {
    CFXInstallCallback((uint64_t)v50->_colorStruct.cfx, (uint64_t)ColorRampCallback, (uint64_t)v50);
    if (v50->_backlightService)
    {
      v47 = 0;
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
      v47 = logHandle;
      v46 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        log = v47;
        type = v46;
        __os_log_helper_16_0_0(v45);
        _os_log_impl(&dword_1B5291000, log, type, "Set whitepoint from the device tree\n", v45, 2u);
      }
      v44 = 0;
      v44 = IORegistryEntrySearchCFProperty(v50->_backlightService, "IOService", CFSTR("default-whitepoint-type"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
      v43 = 0;
      if (-[CBColorModuleiOS convertNSData:toUint32:](v50, "convertNSData:toUint32:", v44, &v43))
        CFXSetWhitePointType(v50->_colorStruct.cfx, v43);
      if (v44)
        CFRelease(v44);
    }
    if (v50->_colorStruct.nightModeSupported)
    {
      v42 = 0;
      v42 = CFXInitializeBlueLightReduction((uint64_t)v50->_colorStruct.cfx) & 1;
      if (v42)
      {
        v41 = 0.0;
        v40 = 0.0;
        v39 = 0.0;
        v38 = 0.0;
        CFXGetBlueLightReductionCCTRange((uint64_t)v50->_colorStruct.cfx, &v39, &v41, &v40);
        v38 = v40;
        if (v50->_backlightService)
        {
          CBU_GetNightShiftCCTRange(v50->_backlightService, &v41, &v40, &v39, &v38);
          v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
          *(float *)&v5 = v38;
          v37 = (id)objc_msgSend(v4, "initWithFloat:", v5);
          if (v37)
          {
            -[NSMutableDictionary setObject:forKey:](v50->_properties, "setObject:forKey:", v37, CFSTR("BlueLightReductionCCTWarningKey"));

          }
        }
        v36 = -[CBColorModuleiOS copyPreferencesForKey:](v50, "copyPreferencesForKey:", CFSTR("CBBlueLightReductionCCTRange"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "count") == 3)
        {
          v56 = 0xBF800000BF800000;
          v57 = -1.0;
          for (i = 0; i < 3; ++i)
          {
            objc_msgSend(v36, "objectAtIndexedSubscript:", i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValue");
              *((_DWORD *)&v56 + i) = v6;
            }
          }
          if (*(float *)&v56 != -1.0 && *((float *)&v56 + 1) != -1.0 && v57 != -1.0)
          {
            v40 = *((float *)&v56 + 1);
            LODWORD(v41) = v56;
            v39 = v57;
          }
        }

        CFXOverrideBlueLightReductionCCTRange((uint64_t)v50->_colorStruct.cfx, v39, v41, v40);
        v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v8 = v41;
        v53 = (id)objc_msgSend(v7, "initWithFloat:", v8);
        v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v10 = v40;
        v54 = (id)objc_msgSend(v9, "initWithFloat:", v10);
        v11 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v12 = v39;
        v55 = (id)objc_msgSend(v11, "initWithFloat:", v12);
        if (v53)
        {
          if (v54)
          {
            if (v55)
            {
              v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v53, v54, v55, 0);
              if (v34)
              {
                -[NSMutableDictionary setObject:forKey:](v50->_properties, "setObject:forKey:", v34, CFSTR("BlueLightReductionCCTRange"));

              }
            }
          }
        }

        v33 = -[CBColorModuleiOS copyPreferencesForKey:](v50, "copyPreferencesForKey:", CFSTR("CBBlueLightReductionCCTTargetRaw"));
        v32 = 0.0;
        v32 = CFXGetBlueLightReductionTargetCCT((uint64_t)v50->_colorStruct.cfx);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v33, "floatValue");
          v32 = fminf(fmaxf(v13, v41), v39);
          CFXSetBlueLightReductionTargetCCT((uint64_t)v50->_colorStruct.cfx, 0, v32, 0.0, 0.0);
        }

        v52 = CFSTR("BlueLightReductionCCTTargetValue");
        v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v15 = v32;
        v51 = (id)objc_msgSend(v14, "initWithFloat:", v15);
        if (v51)
        {
          v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", &v51, &v52, 1);
          if (v31)
          {
            -[NSMutableDictionary setObject:forKey:](v50->_properties, "setObject:forKey:", v31, CFSTR("BlueLightReductionCCTTargetKey"));

          }
        }

      }
    }
  }
  else
  {
    oslog = 0;
    if (v50->super._logHandle)
    {
      v20 = v50->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v19 = init_default_corebrightness_log();
      v20 = v19;
    }
    oslog = v20;
    v29 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v17 = oslog;
      v18 = v29;
      __os_log_helper_16_0_0(v28);
      _os_log_impl(&dword_1B5291000, v17, v18, "Failed to create _colorStruct.cfx", v28, 2u);
    }
  }
  if (CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]))
  {
    cf = 0;
    cf = CFPreferencesCopyAppValue(CFSTR("CBCarryLogEnabled"), (CFStringRef)*MEMORY[0x1E0C9B248]);
    valuePtr = 0;
    if (!cf)
      cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    if (cf)
    {
      TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(cf))
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
        CFXEnableLog((uint64_t)v50->_colorStruct.cfx, valuePtr != 0);
        -[NSMutableDictionary setObject:forKey:](v50->_properties, "setObject:forKey:", cf, CFSTR("CarryLogEnabled"));
      }
      CFRelease(cf);
    }
  }
}

- (BOOL)parseAdaptationModeMappingDictionary:(id)a3 strengths:(float *)a4 strengthNum:(int)a5
{
  char v6;
  uint64_t v7;
  int v8;
  int v9;
  float (*v10)(uint64_t, void *, void *);
  void *v11;
  uint64_t *v12;
  float *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  int v19;
  float *v20;
  id v21;
  SEL v22;
  CBColorModuleiOS *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  v19 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x20000000;
  v17 = 32;
  v18 = 0;
  if (a4 && v19 >= 6)
  {
    CFXGetAdaptationModesMapping((uint64_t)v23->_colorStruct.cfx, (uint64_t)v20, 6);
    v7 = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __79__CBColorModuleiOS_parseAdaptationModeMappingDictionary_strengths_strengthNum___block_invoke;
    v11 = &unk_1E68EA968;
    v13 = v20;
    v12 = &v14;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", &v7);
  }
  v6 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v6 & 1;
}

float __79__CBColorModuleiOS_parseAdaptationModeMappingDictionary_strengths_strengthNum___block_invoke(uint64_t a1, void *a2, void *a3)
{
  float result;
  unint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(a2, "integerValue");
      if (v5 <= 5)
      {
        objc_msgSend(a3, "floatValue");
        if (result >= 0.0 && result <= 1.0)
        {
          *(float *)(*(_QWORD *)(a1 + 40) + 4 * v5) = result;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        }
      }
    }
  }
  return result;
}

- (BOOL)parseAdaptationModeMappingArray:(id)a3 strengths:(float *)a4 strengthNum:(int)a5
{
  char v6;
  uint64_t v7;
  int v8;
  int v9;
  float (*v10)(uint64_t, void *, uint64_t);
  void *v11;
  uint64_t *v12;
  float *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  int v19;
  float *v20;
  id v21;
  SEL v22;
  CBColorModuleiOS *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  v19 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x20000000;
  v17 = 32;
  v18 = 0;
  if (a4 && v19 >= 6 && objc_msgSend(v21, "count") && (unint64_t)objc_msgSend(v21, "count") <= 6)
  {
    CFXGetAdaptationModesMapping((uint64_t)v23->_colorStruct.cfx, (uint64_t)v20, 6);
    v7 = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __74__CBColorModuleiOS_parseAdaptationModeMappingArray_strengths_strengthNum___block_invoke;
    v11 = &unk_1E68EA990;
    v13 = v20;
    v12 = &v14;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", &v7);
  }
  v6 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v6 & 1;
}

float __74__CBColorModuleiOS_parseAdaptationModeMappingArray_strengths_strengthNum___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  float result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a2, "floatValue");
    if (result >= 0.0 && result <= 1.0)
    {
      *(float *)(*(_QWORD *)(a1 + 40) + 4 * a3) = result;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

- (id)newAdaptationModeMappingArray:(float *)a3 strengthNum:(int)a4
{
  id v4;
  double v5;
  id v7;
  int i;
  id v9;

  v9 = 0;
  if (a3 && a4 == 6)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
    for (i = 0; i < 6; ++i)
    {
      v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v5 = a3[i];
      v7 = (id)objc_msgSend(v4, "initWithFloat:", v5);
      if (!v7)
      {

        return 0;
      }
      objc_msgSend(v9, "addObject:", v7);

    }
  }
  return v9;
}

- (id)newAdaptationModeMappingDictionary:(float *)a3 strengthNum:(int)a4
{
  id v4;
  double v5;
  id v7;
  id v8;
  int i;
  id v10;

  v10 = 0;
  if (a3 && a4 == 6)
  {
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
    for (i = 0; i < 6; ++i)
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", i);
      v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v5 = a3[i];
      v7 = (id)objc_msgSend(v4, "initWithFloat:", v5);
      if (!v8 || !v7)
      {

        return 0;
      }
      objc_msgSend(v10, "setObject:forKey:", v7, v8);

    }
  }
  return v10;
}

- (BOOL)convertNSData:(id)a3 toUint32:(unsigned int *)a4
{
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "length") == 4)
  {
    objc_msgSend(a3, "getBytes:length:", a4, 4);
    v7 = 1;
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
      __os_log_helper_16_2_2_8_64_4_0((uint64_t)v11, (uint64_t)a3, *a4);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "convert data %@ to int %u", v11, 0x12u);
    }
  }
  return v7 & 1;
}

- (void)activateColorAdaptation
{
  char v2;
  BOOL v3;
  float v4;
  float v5;
  float v6;
  id v7;
  double v8;
  id v9;
  float v10;
  id v11;
  double v12;
  id v13;
  double v14;
  CFAbsoluteTime v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  id v20;
  double v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  CFTypeID TypeID;
  uint64_t v29;
  NSObject *v30;
  CFAllocatorRef *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v38[15];
  os_log_type_t v39;
  os_log_t oslog;
  float v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  char v46;
  float v47;
  id v48;
  id v49;
  unsigned int v50;
  id v51;
  id v52;
  int i;
  CFRange range;
  CFDataRef theData;
  CFTypeRef cf;
  char v57;
  id v58;
  os_log_type_t v59;
  os_log_t v60;
  char v61;
  char v62;
  int v63;
  int v64;
  CFTypeRef v65;
  CFTypeRef v66;
  uint64_t v67;
  os_log_type_t v68;
  os_log_t v69;
  uint8_t v70[15];
  char v71;
  NSObject *v72;
  SEL v73;
  CBColorModuleiOS *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _WORD buffer[6];
  float v80[6];
  uint8_t v81[32];
  uint8_t v82[8];
  uint64_t v83;
  CFRange v84;

  v83 = *MEMORY[0x1E0C80C00];
  v74 = self;
  v73 = a2;
  if (self->_colorStruct.cfx)
  {
    v72 = 0;
    if (v74->super._logHandle)
    {
      logHandle = v74->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v72 = logHandle;
    v71 = 1;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      log = v72;
      type = v71;
      __os_log_helper_16_0_0(v70);
      _os_log_impl(&dword_1B5291000, log, type, "CFX exists", v70, 2u);
    }
    if (!v74->_colorStruct.harmonySupported)
    {
      v2 = CFXInitializeAmbientAdaptation((uint64_t)v74->_colorStruct.cfx);
      v74->_colorStruct.harmonySupported = v2 & 1;
      v69 = 0;
      if (v74->super._logHandle)
      {
        v33 = v74->super._logHandle;
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
      v68 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v82, v74->_colorStruct.harmonySupported);
        _os_log_impl(&dword_1B5291000, v69, v68, "Harmony supported?? %d", v82, 8u);
      }
      if (v74->_colorStruct.harmonySupported)
      {
        if (v74->_colorEffectsEnabled && v74->_backlightService)
        {
          CFXInitAmmolite((uint64_t)v74->_colorStruct.cfx, v74->_backlightService);
          v3 = CFXAmmoliteEnabled((uint64_t)v74->_colorStruct.cfx);
          v74->_ammoliteEnabledStatus = v3;
        }
        else
        {
          v74->_ammoliteEnabledStatus = 1;
        }
        if (v74->_backlightService)
        {
          v67 = 0;
          v66 = 0;
          v31 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
          v66 = IORegistryEntrySearchCFProperty(v74->_backlightService, "IOService", CFSTR("truetone-shift-b"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
          v65 = 0;
          v65 = IORegistryEntrySearchCFProperty(v74->_backlightService, "IOService", CFSTR("truetone-shift-a"), *v31, 3u);
          v64 = 0;
          v63 = 0;
          v62 = -[CBColorModuleiOS convertNSData:toUint32:](v74, "convertNSData:toUint32:", v65, &v64);
          v61 = -[CBColorModuleiOS convertNSData:toUint32:](v74, "convertNSData:toUint32:", v66, &v63);
          if (v65)
            CFRelease(v65);
          if (v66)
            CFRelease(v66);
          if ((v62 & 1) != 0 && (v61 & 1) != 0)
          {
            v4 = (float)v64 / 65536.0;
            *(float *)&v67 = v4;
            v5 = (float)v63 / 65536.0;
            *((float *)&v67 + 1) = v5;
            v60 = 0;
            if (v74->super._logHandle)
            {
              v30 = v74->super._logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v29 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v29 = init_default_corebrightness_log();
              v30 = v29;
            }
            v60 = v30;
            v59 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              __os_log_helper_16_0_2_8_0_8_0((uint64_t)v81, COERCE__INT64(*(float *)&v67), COERCE__INT64(*((float *)&v67 + 1)));
              _os_log_impl(&dword_1B5291000, v60, v59, "TrueTone: shift-a = %f, shift-b = %f", v81, 0x16u);
            }
            CFXSetABShift((uint64_t)v74->_colorStruct.cfx, &v67);
          }
        }
        v58 = 0;
        v58 = (id)-[NSMutableDictionary objectForKey:](v74->_properties, "objectForKey:", CFSTR("SupportedColorFX"));
        if (v58)
          objc_msgSend(v58, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("SupportsAmbientColorAdaptation"));
        v74->_colorStruct.harmonyEnabled = 1;
        v57 = 0;
        CFXGetAdaptationModesMapping((uint64_t)v74->_colorStruct.cfx, (uint64_t)v80, 6);
        if (v74->_backlightService)
        {
          cf = 0;
          cf = IORegistryEntrySearchCFProperty(v74->_backlightService, "IOService", CFSTR("truetone-strength"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
          if (cf)
          {
            TypeID = CFDataGetTypeID();
            if (TypeID == CFGetTypeID(cf))
            {
              theData = (CFDataRef)cf;
              if ((unint64_t)CFDataGetLength((CFDataRef)cf) >= 0xC)
              {
                v76 = 0;
                v75 = 12;
                v77 = 0;
                v78 = 12;
                range.location = 0;
                range.length = 12;
                v84.location = 0;
                v84.length = 12;
                CFDataGetBytes(theData, v84, (UInt8 *)buffer);
                for (i = 0; i < 6; ++i)
                {
                  v6 = (float)(unsigned __int16)buffer[i] / 1000.0;
                  v80[i] = v6;
                }
                v57 = 1;
              }
            }
            CFRelease(cf);
          }
        }
        v52 = -[CBColorModuleiOS copyPreferencesForKey:](v74, "copyPreferencesForKey:", CFSTR("CBAdaptationModeMapping2"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && -[CBColorModuleiOS parseAdaptationModeMappingArray:strengths:strengthNum:](v74, "parseAdaptationModeMappingArray:strengths:strengthNum:", v52, v80, 6))
        {
          v57 = 1;
        }

        if ((v57 & 1) != 0)
          CFXSetAdaptationModesMapping((uint64_t)v74->_colorStruct.cfx, (uint64_t)v80, 6);
        v51 = -[CBColorModuleiOS newAdaptationModeMappingDictionary:strengthNum:](v74, "newAdaptationModeMappingDictionary:strengthNum:", v80, 6);
        if (v51)
        {
          -[NSMutableDictionary setValue:forKey:](v74->_properties, "setValue:forKey:", v51, CFSTR("ColorAdaptationModeMapping"));

        }
        v50 = 1;
        CFXSetWeakestAmbientAdaptationMode((uint64_t)v74->_colorStruct.cfx, (uint64_t)&v50, 1, 0.0);
        v50 = CFXGetAmbientAdaptationMode((uint64_t)v74->_colorStruct.cfx, &v74->_colorStruct.harmonyStrength);
        v49 = 0;
        v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v8 = v74->_colorStruct.harmonyStrength;
        v49 = (id)objc_msgSend(v7, "initWithFloat:", v8);
        if (v49)
        {
          v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v49, CFSTR("ColorAdaptationStrengthSub"), 0);
          if (v48)
          {
            -[NSMutableDictionary setValue:forKey:](v74->_properties, "setValue:forKey:", v48, CFSTR("ColorAdaptationStrength"));

          }
        }
        v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v49 = (id)objc_msgSend(v9, "initWithInt:", v50);
        if (v49)
        {
          -[NSMutableDictionary setValue:forKey:](v74->_properties, "setValue:forKey:", v49, CFSTR("ColorAdaptationMode"));

        }
        v52 = -[CBColorModuleiOS copyPreferencesForKey:](v74, "copyPreferencesForKey:", CFSTR("CBFixedAdaptationStrength"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v52, "floatValue");
          v47 = v10;
          v74->_colorStruct.harmonyFixedStrength = v10;
          -[NSMutableDictionary setValue:forKey:](v74->_properties, "setValue:forKey:", v52, CFSTR("FixedColorAdaptationStrength"));
        }

        v46 = 0;
        v45 = 0;
        v44 = 0;
        CFXGetABShift((uint64_t)v74->_colorStruct.cfx, &v44);
        v11 = objc_alloc(MEMORY[0x1E0CB37E8]);
        LODWORD(v12) = v44;
        v43 = (id)objc_msgSend(v11, "initWithFloat:", v12);
        v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
        LODWORD(v14) = HIDWORD(v44);
        v42 = (id)objc_msgSend(v13, "initWithFloat:", v14);
        if (v43 && v42)
          v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v43, CFSTR("a"), v42, CFSTR("b"), 0);

        if ((v46 & 1) != 0)
          -[NSMutableDictionary setValue:forKey:](v74->_properties, "setValue:forKey:", v45, CFSTR("LabShift"));

        if (v74->_colorStruct.harmonyFixedStrength >= 0.0)
        {
          *(float *)&v15 = v74->_colorStruct.harmonyFixedStrength;
          CFXSetAmbientAdaptationStrength((uint64_t)v74->_colorStruct.cfx, v15, 0.0);
        }
        v52 = -[CBColorModuleiOS copyPreferencesForKey:](v74, "copyPreferencesForKey:", CFSTR("CBColorAdaptationEnabled"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = objc_msgSend(v52, "BOOLValue");
          v74->_colorStruct.harmonyEnabled = v16 & 1;
        }

        v26 = MEMORY[0x1E0C9AAA0];
        v27 = MEMORY[0x1E0C9AAB0];
        if (v74->_colorStruct.harmonyEnabled)
          v17 = MEMORY[0x1E0C9AAB0];
        else
          v17 = MEMORY[0x1E0C9AAA0];
        -[NSMutableDictionary setValue:forKey:](v74->_properties, "setValue:forKey:", v17);
        -[CBColorModuleiOS updateActivity](v74, "updateActivity");
        +[CBAnalytics harmonyEnabled:byUser:](CBAnalytics, "harmonyEnabled:byUser:", v74->_colorStruct.harmonyEnabled, 0);
        if (v74->_colorStruct.harmonyEnabled)
          v18 = v27;
        else
          v18 = v26;
        -[CBColorModuleiOS sendNotificationForKey:andValue:](v74, "sendNotificationForKey:andValue:", CFSTR("ColorAdaptationEnabled"), v18);
        v41 = 0.0;
        v41 = CFXGetStrengthRampTweakFactor((uint64_t)v74->_colorStruct.cfx);
        v52 = -[CBColorModuleiOS copyPreferencesForKey:](v74, "copyPreferencesForKey:", CFSTR("CBStrengthRampPeriodTweak"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v52, "floatValue");
          v41 = v19;
        }

        if (v41 < 0.0)
          v41 = 0.0;
        CFXSetStrengthRampTweakFactor((uint64_t)v74->_colorStruct.cfx, v41);
        v20 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v21 = v41;
        v49 = (id)objc_msgSend(v20, "initWithFloat:", v21);
        if (v49)
        {
          -[NSMutableDictionary setValue:forKey:](v74->_properties, "setValue:forKey:", v49, CFSTR("StrengthRampPeriodTweak"));

        }
        if (v74->_moduleType == 1)
          -[CBColorModuleiOS ttRestrictionReload](v74, "ttRestrictionReload");
      }
    }
  }
  else
  {
    oslog = 0;
    if (v74->super._logHandle)
    {
      v25 = v74->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v24 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v24 = init_default_corebrightness_log();
      v25 = v24;
    }
    oslog = v25;
    v39 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v22 = oslog;
      v23 = v39;
      __os_log_helper_16_0_0(v38);
      _os_log_impl(&dword_1B5291000, v22, v23, "CFX was not initialized", v38, 2u);
    }
  }
}

- (void)reportResetTimerWithStop:(BOOL)a3
{
  NSObject *logTimer;
  uint64_t handler;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CBColorModuleiOS *v9;
  uint64_t v10;
  BOOL v11;
  SEL v12;
  CBColorModuleiOS *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  if (a3)
  {
    if (v13->_reportContext.logTimer)
    {
      dispatch_source_cancel((dispatch_source_t)v13->_reportContext.logTimer);
      dispatch_release((dispatch_object_t)v13->_reportContext.logTimer);
      v13->_reportContext.logTimer = 0;
    }
  }
  else if (!v13->_reportContext.logTimer)
  {
    v13->_reportContext.logTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v13->super._queue);
    if (v13->_reportContext.logTimer)
    {
      v10 = 0;
      v10 = 1000000000 * v13->_reportContext.periodS;
      dispatch_source_set_timer((dispatch_source_t)v13->_reportContext.logTimer, 0, v10, 0);
      logTimer = v13->_reportContext.logTimer;
      handler = MEMORY[0x1E0C809B0];
      v5 = -1073741824;
      v6 = 0;
      v7 = __45__CBColorModuleiOS_reportResetTimerWithStop___block_invoke;
      v8 = &unk_1E68E9E60;
      v9 = v13;
      dispatch_source_set_event_handler(logTimer, &handler);
      dispatch_resume((dispatch_object_t)v13->_reportContext.logTimer);
      v13->_reportContext.firstTimerFire = 1;
    }
  }
}

uint64_t __45__CBColorModuleiOS_reportResetTimerWithStop___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 128))
  {
    *(_BYTE *)(*(_QWORD *)(result + 32) + 128) = 0;
  }
  else
  {
    result = objc_msgSend(*(id *)(result + 32), "moduleType");
    if (result == 1)
      return objc_msgSend(*(id *)(v1 + 32), "reportCommitWithStop:", 0);
  }
  return result;
}

- (void)reportInitialize
{
  if (self->_colorStruct.nightModeSupported || self->_colorStruct.harmonySupported)
  {
    if (self->_colorStruct.cfx)
      CFXClearReport((uint64_t)self->_colorStruct.cfx);
    -[CBColorModuleiOS reportResetTimerWithStop:](self, "reportResetTimerWithStop:", 0);
  }
}

- (void)reportCommitWithStop:(BOOL)a3
{
  double v3;
  _BYTE v4[999];
  BOOL v5;
  SEL v6;
  uint64_t *v7;

  v7 = (uint64_t *)self;
  v6 = a2;
  v5 = a3;
  if (self->_colorStruct.nightModeSupported || (v7[13] & 1) != 0)
  {
    if (v5)
      objc_msgSend(v7, "reportResetTimerWithStop:", 1);
    if (v7[8])
    {
      bzero(v4, 0x200uLL);
      v3 = CFXGetReport(v7[8], (uint64_t)v4);
      objc_msgSend(v7, "reportToCoreAnlytics:", v4, v3);
      objc_msgSend(v7, "commitPowerLogReport:", v4);
    }
  }
}

- (void)commitPowerLogReport:(ColorReport *)a3
{
  uint64_t v3;
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

  if (a3)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v13)
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a3->var3.var0);
      if (v10)
      {
        objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("BlueLightReductionOnTime"));

      }
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a3->var3.var1);
      if (v11)
      {
        objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("BlueLightReductionOffTime"));

      }
      v4 = -[CBColorModuleiOS newArrayFromDoubles:size:](self, "newArrayFromDoubles:size:", a3, 17);
      if (v4)
      {
        objc_msgSend(v13, "setObject:forKey:", v4, CFSTR("AmbientColorBins"));

      }
      v5 = -[CBColorModuleiOS newArrayFromDoubles:size:](self, "newArrayFromDoubles:size:", &a3->var4, 10);
      if (v5)
      {
        objc_msgSend(v13, "setObject:forKey:", v5, CFSTR("AdaptationStrengthBins"));

      }
      v6 = -[CBColorModuleiOS newArrayFromIntegers:size:](self, "newArrayFromIntegers:size:", a3->var0.var1, 17);
      if (v6)
      {
        objc_msgSend(v13, "setObject:forKey:", v6, CFSTR("AmbientColorTransitionBins"));

      }
      v7 = -[CBColorModuleiOS newArrayFromIntegers:size:](self, "newArrayFromIntegers:size:", a3->var1.var1, 17);
      if (v7)
      {
        objc_msgSend(v13, "setObject:forKey:", v7, CFSTR("DisplayColorTransitionBins"));

      }
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var6);
      if (v12)
      {
        objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("DisplayColorNumberOfUpdates"));

      }
      v8 = -[CBColorModuleiOS newArrayFromDoubles:size:](self, "newArrayFromDoubles:size:", &a3->var2, 46);
      if (v8)
      {
        objc_msgSend(v13, "setObject:forKey:", v8, CFSTR("AmbientColorBinsAnsi"));

      }
      v9 = -[CBColorModuleiOS newArrayFromDoubles:size:](self, "newArrayFromDoubles:size:", &a3->var1, 17);
      if (v9)
      {
        objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("DisplayColorBins"));

      }
      -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v13, CFSTR("PowerLogReport"));
      -[CBColorModuleiOS sendNotificationForKey:andValue:](self, "sendNotificationForKey:andValue:", v3, v13);

    }
  }
}

- (void)reportToCoreAnlytics:(ColorReport *)a3
{
  if (a3)
  {
    if (self->_colorStruct.harmonySupported)
      +[CBAnalytics harmonyColor:](CBAnalytics, "harmonyColor:", a3);
    +[CBAnalytics nightShiftCCT:](CBAnalytics, "nightShiftCCT:", (uint64_t)a3->var3.var4);
  }
}

- (void)setPreferences:(id)a3 forKey:(id)a4
{
  CFStringRef *v4;
  CFStringRef *v5;

  v4 = (CFStringRef *)MEMORY[0x1E0C9B260];
  v5 = (CFStringRef *)MEMORY[0x1E0C9B250];
  CFPreferencesSetValue((CFStringRef)a4, a3, CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), *v4, *v5);
}

- (id)copyPreferencesForKey:(id)a3
{
  CFStringRef *v4;
  CFStringRef *v5;

  v4 = (CFStringRef *)MEMORY[0x1E0C9B260];
  v5 = (CFStringRef *)MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  return (id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.CoreBrightness"), *v4, *v5);
}

- (id)newArrayFromDoubles:(double *)a3 size:(int)a4
{
  id v5;
  int i;
  id v7;

  v7 = 0;
  if (a3 && a4 > 0)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    for (i = 0; i < a4; ++i)
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a3[i]);
      if (!v5)
      {

        return 0;
      }
      objc_msgSend(v7, "addObject:", v5);

    }
  }
  return v7;
}

- (id)newArrayFromIntegers:(int *)a3 size:(int)a4
{
  id v5;
  int i;
  id v7;

  v7 = 0;
  if (a3 && a4 > 0)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    for (i = 0; i < a4; ++i)
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3[i]);
      if (!v5)
      {

        return 0;
      }
      objc_msgSend(v7, "addObject:", v5);

    }
  }
  return v7;
}

- (id)copyIdentifiers
{
  SEL v3;
  CBColorModuleiOS *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("ColorAdaptationAvailable"), CFSTR("ColorAdaptationEnabled"), CFSTR("ColorAdaptationActive"), CFSTR("ColorAdaptationMode"), CFSTR("ColorAdaptationStrength"), CFSTR("ColorAdaptationModeMapping"), CFSTR("ColorFadesEnabled"), CFSTR("BlueLightReductionCCTTargetKey"), CFSTR("ColorRamp"), CFSTR("ColorRampBLR"), CFSTR("ColorRampHarmony"), CFSTR("ColorRampAmmolite"), CFSTR("SupportedColorFX"), CFSTR("BlueLightReductionCCTWarningKey"), CFSTR("BlueLightReductionCCTRange"), CFSTR("LabShift"), CFSTR("PowerLogReport"),
               CFSTR("CBAmmoliteEnabled"),
               0);
}

- (BOOL)applyPendingSamples
{
  uint64_t v2;
  double v3;

  if (-[NSMutableDictionary count](self->_pendingALSSamples, "count"))
  {
    v2 = -[NSMutableDictionary allValues](self->_pendingALSSamples, "allValues");
    LODWORD(v3) = 1045220557;
    -[CBColorModuleiOS applySamples:withinTimeout:](self, "applySamples:withinTimeout:", v2, v3);
    -[NSMutableDictionary removeAllObjects](self->_pendingALSSamples, "removeAllObjects");
  }
  return 0;
}

- (id)copyALSSamples
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  id v9;
  _QWORD __b[8];
  id v11;
  id v12;
  SEL v13;
  CBColorModuleiOS *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = self;
  v13 = a2;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  obj = (id)-[NSMutableDictionary allValues](v14->_alsNodes, "allValues");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v11 = 0;
      v11 = *(id *)(__b[1] + 8 * v5);
      v9 = (id)objc_msgSend(v11, "copyALSEvent");
      if (v9)
      {
        objc_msgSend(v12, "addObject:", v9);

      }
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v6)
          break;
      }
    }
  }
  return v12;
}

- (BOOL)applySamples:(id)a3 withinTimeout:(float)a4
{
  float v4;
  uint64_t v6;
  CBColorModuleiOS *v7;
  uint64_t inited;
  NSObject *logHandle;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id obj;
  uint64_t v16;
  _QWORD __b[8];
  id v18;
  float v19;
  char v20;
  float v21;
  id v22;
  SEL v23;
  CBColorModuleiOS *v24;
  uint8_t v25[24];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = a4;
  v20 = 0;
  if (objc_msgSend(a3, "count"))
  {
    v19 = mach_time_now_in_seconds();
    memset(__b, 0, sizeof(__b));
    obj = v22;
    v16 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
    if (v16)
    {
      v12 = *(_QWORD *)__b[2];
      v13 = 0;
      v14 = v16;
      while (1)
      {
        v11 = v13;
        if (*(_QWORD *)__b[2] != v12)
          objc_enumerationMutation(obj);
        v18 = 0;
        v18 = *(id *)(__b[1] + 8 * v13);
        v10 = v19;
        objc_msgSend(v18, "timestamp");
        if (vabds_f32(v10, v4) < v21)
        {
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
            __os_log_helper_16_2_1_8_66((uint64_t)v25, (uint64_t)v18);
            _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Apply pending/copied ALS sample %{public}@", v25, 0xCu);
          }
          v7 = v24;
          v6 = objc_msgSend(v18, "event");
          -[CBColorModuleiOS handleHIDEventInternal:from:](v7, "handleHIDEventInternal:from:", v6, objc_msgSend(v18, "service"));
          v20 = 1;
        }
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
          if (!v14)
            break;
        }
      }
    }
  }
  return v20 & 1;
}

- (void)armFirstALSSampleTimer
{
  uint64_t v2;
  dispatch_time_t v3;
  NSObject *timeoutTimer;
  NSObject *source;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t handler;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  CBColorModuleiOS *v13;
  os_log_type_t v14;
  os_log_t v15;
  SEL v16;
  CBColorModuleiOS *v17;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = self;
  v16 = a2;
  v15 = 0;
  if (self->super._logHandle)
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
    *(double *)&v2 = CFAbsoluteTimeGetCurrent();
    __os_log_helper_16_0_1_8_0((uint64_t)v18, v2);
    _os_log_impl(&dword_1B5291000, v15, v14, "ts=%f Arming first sample timeout", v18, 0xCu);
  }
  v17->_timeoutTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v17->super._queue);
  if (v17->_timeoutTimer)
  {
    source = v17->_timeoutTimer;
    v3 = dispatch_time(0, (uint64_t)(float)(v17->_firstSampleTimeoutValue * 1000000000.0));
    dispatch_source_set_timer(source, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
    timeoutTimer = v17->_timeoutTimer;
    handler = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __42__CBColorModuleiOS_armFirstALSSampleTimer__block_invoke;
    v12 = &unk_1E68E9E60;
    v13 = v17;
    dispatch_source_set_event_handler(timeoutTimer, &handler);
    dispatch_resume((dispatch_object_t)v17->_timeoutTimer);
  }
}

uint64_t __42__CBColorModuleiOS_armFirstALSSampleTimer__block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "firstALSSampleTimeout");
  return objc_sync_exit(obj);
}

- (void)firstALSSampleTimeout
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[15];
  char v9;
  NSObject *v10;
  _BYTE __b[63];
  os_log_type_t v12;
  os_log_t v13;
  SEL v14;
  CBColorModuleiOS *v15;
  uint8_t v16[8];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = self;
  v14 = a2;
  if (self->_firstALSEventArrived)
    v15->_potentiallyBustedALS = 1;
  v15->_continueWithFewerALSs = 1;
  v13 = 0;
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
  v13 = logHandle;
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v16, v15->_potentiallyBustedALS);
    _os_log_impl(&dword_1B5291000, v13, v12, "First ALS sample TIMEOUT! Busted ALS = %i", v16, 8u);
  }
  if (v15->_timeoutTimer)
  {
    if (!v15->_NSamples && v15->_colorStruct.harmonyEnabled && v15->_moduleType == 1)
    {
      memset(__b, 0, 0x3CuLL);
      -[CBColorModuleiOS inputAmbientColorSample:force:trust:](v15, "inputAmbientColorSample:force:trust:", __b, 0, 1);
    }
    dispatch_release((dispatch_object_t)v15->_timeoutTimer);
    v15->_timeoutTimer = 0;
  }
  else
  {
    v10 = 0;
    if (v15->super._logHandle)
    {
      v5 = v15->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v4 = init_default_corebrightness_log();
      v5 = v4;
    }
    v10 = v5;
    v9 = 16;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v2 = v10;
      v3 = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1B5291000, v2, v3, "Timer is invalid", v8, 2u);
    }
  }
}

- (id)newAggregatedConfigFromSerializedConfig:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = self;
  v6[2] = a2;
  v6[1] = a3;
  v6[0] = 0;
  v5 = 0;
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, v6, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v4;
  return v5;
}

- (BOOL)serializedAggregatedConfigPropertyHandler:(id)a3
{
  id v4;
  BOOL v5;

  v5 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[CBColorModuleiOS newAggregatedConfigFromSerializedConfig:](self, "newAggregatedConfigFromSerializedConfig:", a3);
    if (v4)
    {
      -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v4, CFSTR("CBAggregatedConfig"));

    }
    if (self->_aggregatedConfigApplied)
      -[CBColorModuleiOS applyAggregatedConfig:](self, "applyAggregatedConfig:", 1);
    return 1;
  }
  return v5;
}

- (BOOL)applyAggregatedConfigPropertyHandler:(id)a3
{
  BOOL v4;

  v4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CBColorModuleiOS applyAggregatedConfig:](self, "applyAggregatedConfig:", objc_msgSend(a3, "BOOLValue") & 1);
    return 1;
  }
  return v4;
}

- (id)copyLocalAggregatedConfig
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  if (v6)
  {
    v3 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("BlueLightReductionCCTTargetKey"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("BlueLightReductionCCTTargetValue"));
    if (v3)
      objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("BlueLightReductionCCTTargetKey"));
    v4 = -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("ColorAdaptationActive"));
    if (v4)
      objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("ColorAdaptationActive"));
    v5 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("BlueLightReductionFactor"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("BlueLightReductionFactorValue"));
    if (v5)
      objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("BlueLightReductionFactor"));
  }
  return v6;
}

- (void)applyAggregatedConfig:(BOOL)a3
{
  id v3;
  double v4;
  double v5;
  float v6;
  int v7;
  ColorEffects *v8;
  int v9;
  ColorEffects *cfx;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;

  v18 = a3;
  v17 = 0;
  v16 = 0;
  v15 = 0;
  self->_aggregatedConfigApplied = 0;
  if (a3)
  {
    v14 = (id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("CBAggregatedConfig"));
    v3 = v14;
  }
  else
  {
    v14 = -[CBColorModuleiOS copyLocalAggregatedConfig](self, "copyLocalAggregatedConfig");
    self->_aggregatedConfigApplied = 0;
  }
  if (v14)
  {
    v11 = objc_msgSend(v14, "objectForKey:", CFSTR("BlueLightReductionFactor"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = (void *)v11;
    v12 = objc_msgSend(v14, "objectForKey:", CFSTR("BlueLightReductionCCTTargetKey"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = (void *)v12;
    v13 = objc_msgSend(v14, "objectForKey:", CFSTR("ColorAdaptationActive"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = (void *)v13;
  }
  if (v16)
  {
    cfx = self->_colorStruct.cfx;
    objc_msgSend(v16, "floatValue");
    CFXSetBlueLightReductionTargetCCT((uint64_t)cfx, 0, v6, -1.0, 0.0);
  }
  if (v17)
  {
    objc_msgSend(v17, "floatValue");
    v9 = LODWORD(v4);
  }
  else
  {
    v9 = 0;
  }
  LODWORD(v4) = v9;
  LODWORD(v5) = -1.0;
  -[CBColorModuleiOS BLRFactorUpdate:withPeriod:shouldForceUpdate:](self, "BLRFactorUpdate:withPeriod:shouldForceUpdate:", 1, v4, v5);
  v8 = self->_colorStruct.cfx;
  if (v15)
    v7 = objc_msgSend(v15, "BOOLValue") & 1;
  else
    v7 = 0;
  CFXEnableAmbientAdaptation((uint64_t)v8, v7 != 0);

  self->_aggregatedConfigApplied = v18;
}

- (BOOL)ttRestrictionReload
{
  float v2;
  float v3;
  float v4;
  int v5;
  int v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSMutableArray *filters;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  NSMutableArray *obj;
  uint64_t v28;
  uint64_t inited;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *logHandle;
  _QWORD v34[8];
  id v35;
  uint64_t v36;
  uint8_t v37[7];
  os_log_type_t v38;
  os_log_t v39;
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  _QWORD __b[8];
  id v44;
  id v45;
  os_log_type_t v46;
  os_log_t v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  os_log_type_t type;
  os_log_t oslog;
  id v54;
  id v55;
  BOOL v56;
  SEL v57;
  CBColorModuleiOS *v58;
  _BYTE v59[128];
  uint8_t v60[32];
  _BYTE v61[128];
  uint8_t v62[16];
  uint8_t v63[8];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v58 = self;
  v57 = a2;
  v56 = 0;
  v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
  if (v55)
  {
    objc_msgSend(v55, "synchronize");
    v54 = (id)objc_msgSend(v55, "objectForKey:", CFSTR("TTRestrictionEnable"));
    if (v54)
    {
      v56 = objc_msgSend(v54, "intValue") != 0;
      oslog = 0;
      if (v58->super._logHandle)
      {
        logHandle = v58->super._logHandle;
      }
      else
      {
        v32 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v32;
      }
      oslog = logHandle;
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v63, v56);
        _os_log_debug_impl(&dword_1B5291000, oslog, type, "Enable TT restriction = %d\n", v63, 8u);
      }
    }
    if (v56)
    {
      v50 = 0;
      v51 = 0;
      v49 = (id)objc_msgSend(v55, "objectForKey:", CFSTR("TTRestriction_th_E"));
      v48 = (id)objc_msgSend(v55, "objectForKey:", CFSTR("TTRestriction_th_L"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = objc_msgSend(v49, "count");
          if (v31 == objc_msgSend(v48, "count"))
          {
            if (objc_msgSend(v49, "count"))
            {
              v47 = 0;
              if (v58->super._logHandle)
              {
                v30 = v58->super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  inited = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  inited = init_default_corebrightness_log();
                v30 = inited;
              }
              v47 = v30;
              v46 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                __os_log_helper_16_0_1_8_0((uint64_t)v62, objc_msgSend(v49, "count"));
                _os_log_impl(&dword_1B5291000, v47, v46, "TT restriction: th_E and th_L sizes = %ld\n", v62, 0xCu);
              }
              LOBYTE(v50) = 1;
              v45 = 0;
              v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v49, CFSTR("TTRestriction_th_E"), v48, CFSTR("TTRestriction_th_E"), 0);
              memset(__b, 0, sizeof(__b));
              obj = v58->_filters;
              v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v61, 16);
              if (v28)
              {
                v24 = *(_QWORD *)__b[2];
                v25 = 0;
                v26 = v28;
                while (1)
                {
                  v23 = v25;
                  if (*(_QWORD *)__b[2] != v24)
                    objc_enumerationMutation(obj);
                  v44 = 0;
                  v44 = *(id *)(__b[1] + 8 * v25);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v44, "setProperty:forKey:", v45, CFSTR("MitigationBoundaryOverride"));
                  ++v25;
                  if (v23 + 1 >= v26)
                  {
                    v25 = 0;
                    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v61, 16);
                    if (!v26)
                      break;
                  }
                }
              }

            }
          }
        }
      }
      v42 = (id)objc_msgSend(v55, "objectForKey:", CFSTR("TTRestriction_fade_periods"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v42, "count") == 3)
      {
        v41 = 0;
        if (v58->super._logHandle)
        {
          v22 = v58->super._logHandle;
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
        v40 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 0), "floatValue");
          *(double *)&v19 = v2;
          objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 1), "floatValue");
          *(double *)&v20 = v3;
          objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 2), "floatValue");
          __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v60, v19, v20, COERCE__INT64(v4));
          _os_log_debug_impl(&dword_1B5291000, v41, v40, "TT restriction: fade periods = %f %f %f\n", v60, 0x20u);
        }
        objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 0), "floatValue");
        HIDWORD(v50) = v5;
        objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 1), "floatValue");
        LODWORD(v51) = v6;
        objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 2), "floatValue");
        HIDWORD(v51) = v7;
        BYTE1(v50) = 1;
      }
      CFXEnableOverrides((uint64_t)v58->_colorStruct.cfx, (uint64_t)&v50);
    }
    else if (v54)
    {
      v39 = 0;
      if (v58->super._logHandle)
      {
        v18 = v58->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v17 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v17 = init_default_corebrightness_log();
        v18 = v17;
      }
      v39 = v18;
      v38 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v39;
        v16 = v38;
        __os_log_helper_16_0_0(v37);
        _os_log_impl(&dword_1B5291000, v15, v16, "TT restriction: Resetting defaults\n", v37, 2u);
      }
      v36 = 0;
      memset(v34, 0, sizeof(v34));
      filters = v58->_filters;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", v34, v59, 16);
      if (v14)
      {
        v10 = *(_QWORD *)v34[2];
        v11 = 0;
        v12 = v14;
        while (1)
        {
          v9 = v11;
          if (*(_QWORD *)v34[2] != v10)
            objc_enumerationMutation(filters);
          v35 = 0;
          v35 = *(id *)(v34[1] + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v35, "setProperty:forKey:", v36, CFSTR("MitigationBoundaryOverride"));
          ++v11;
          if (v9 + 1 >= v12)
          {
            v11 = 0;
            v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", v34, v59, 16);
            if (!v12)
              break;
          }
        }
      }
      CFXEnableOverrides((uint64_t)v58->_colorStruct.cfx, 0);
    }

  }
  return 1;
}

- (BOOL)ttRestrictionHandler:(id)a3
{
  uint64_t v4;
  NSObject *logHandle;
  id v6;
  BOOL v7;
  uint8_t v10[8];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(a3, "intValue") != 0;
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v4;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v10, v7);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Setting TT restriction = %d\n", v10, 8u);
    }
  }
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
  if (v6)
  {
    objc_msgSend(v6, "setObject:forKey:", a3, CFSTR("TTRestrictionEnable"));
    objc_msgSend(v6, "synchronize");

  }
  return -[CBColorModuleiOS ttRestrictionReload](self, "ttRestrictionReload");
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_0_1_4_0((uint64_t)v9, a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "AOD state update = %d", v9, 8u);
  }
  if (a3 <= 4)
    __asm { BR              X8 }
  return 1;
}

@end
