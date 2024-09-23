@implementation CBABModuleExternal

- (CBABModuleExternal)initWithDisplayModule:(id)a3 andQueue:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
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
  NSObject *inited;
  uint8_t v20[15];
  os_log_type_t v21;
  os_log_t v22;
  id v23;
  id v24;
  os_log_type_t v25;
  os_log_t oslog;
  id v27;
  os_log_type_t v28;
  os_log_t v29;
  char v30;
  os_log_type_t v31;
  os_log_t v32;
  id v33;
  id v34;
  uint8_t v35[15];
  char v36;
  NSObject *v37;
  id v38;
  objc_super v39;
  id v40;
  id v41;
  SEL v42;
  void *v43;
  uint8_t v44[16];
  uint8_t v45[16];
  uint8_t v46[32];
  uint8_t v47[40];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v43 = self;
  v42 = a2;
  v41 = a3;
  v40 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CBABModuleExternal;
  v43 = -[CBModule initWithQueue:](&v39, sel_initWithQueue_, a4);
  if (v43)
  {
    v38 = (id)objc_msgSend(v41, "copyPropertyForKey:", CFSTR("kUSBContainerID"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *((_QWORD *)v43 + 5) = objc_msgSend(v38, "copy");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        *((_QWORD *)v43 + 5) = objc_msgSend((id)objc_msgSend(v38, "UUIDString"), "copy");
    }

    v38 = (id)objc_msgSend(v41, "copyPropertyForKey:", CFSTR("DisplayUniqueID"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *((_QWORD *)v43 + 7) = objc_msgSend(v38, "copy");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        *((_QWORD *)v43 + 7) = objc_msgSend((id)objc_msgSend(v38, "UUIDString"), "copy");
    }

    if (*((_QWORD *)v43 + 5))
    {
      *((_QWORD *)v43 + 6) = objc_msgSend(*((id *)v43 + 5), "copy");
    }
    else if (*((_QWORD *)v43 + 7))
    {
      *((_QWORD *)v43 + 6) = objc_msgSend(*((id *)v43 + 7), "copy");
    }
    else
    {
      v37 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v37 = inited;
      v36 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = v37;
        type = v36;
        __os_log_helper_16_0_0(v35);
        _os_log_error_impl(&dword_1B5291000, log, type, "error: no unique ID or contaienr ID - create ad-hoc UUID as backup", v35, 2u);
      }
      v38 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      *((_QWORD *)v43 + 6) = objc_msgSend((id)objc_msgSend(v38, "UUIDString"), "copy");

    }
    v34 = 0;
    v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.CBABModuleExternal.%@"), *((_QWORD *)v43 + 6));
    if (v34)
      *((_QWORD *)v43 + 2) = os_log_create((const char *)objc_msgSend(v34, "cStringUsingEncoding:", 1), "default");
    else
      *((_QWORD *)v43 + 2) = os_log_create("com.apple.CBABModuleExternal", "default");

    *((_QWORD *)v43 + 12) = v41;
    v33 = (id)objc_msgSend(v41, "copyPropertyForKey:", CFSTR("DisplayServicesIsBuiltInDisplay"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *((_BYTE *)v43 + 91) = objc_msgSend(v33, "BOOLValue") & 1;

    *((_QWORD *)v43 + 4) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = 0;
    if (*((_QWORD *)v43 + 2))
    {
      v16 = *((_QWORD *)v43 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v15 = init_default_corebrightness_log();
      v16 = v15;
    }
    v32 = v16;
    v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_3_8_66_8_66_8_66((uint64_t)v47, (uint64_t)v41, *((_QWORD *)v43 + 5), *((_QWORD *)v43 + 7));
      _os_log_impl(&dword_1B5291000, v32, v31, "display = %{public}@ | container ID = %{public}@ | UUID = %{public}@", v47, 0x20u);
    }
    *((_BYTE *)v43 + 64) = 1;
    *((_BYTE *)v43 + 88) = 0;
    *((_BYTE *)v43 + 89) = 0;
    *((_BYTE *)v43 + 66) = 0;
    *((_BYTE *)v43 + 90) = 0;
    *((_QWORD *)v43 + 10) = -[CBABRamp initWithDisplayModule:andQueue:]([CBABRamp alloc], "initWithDisplayModule:andQueue:", *((_QWORD *)v43 + 12), *((_QWORD *)v43 + 3));
    if (*((_QWORD *)v43 + 7))
    {
      if ((objc_msgSend(*((id *)v43 + 6), "isEqual:", *((_QWORD *)v43 + 7)) & 1) == 0)
      {
        v30 = 0;
        v30 = +[CBPreferencesHandler migrateNestedPreferenceForAllUsersWithKey1:key2:toKey:](CBPreferencesHandler, "migrateNestedPreferenceForAllUsersWithKey1:key2:toKey:", CFSTR("DisplayPreferences"), *((_QWORD *)v43 + 7), *((_QWORD *)v43 + 6));
        if (v30)
        {
          v29 = 0;
          if (*((_QWORD *)v43 + 2))
          {
            v14 = *((_QWORD *)v43 + 2);
          }
          else
          {
            v13 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v14 = v13;
          }
          v29 = v14;
          v28 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_2_8_66_8_66((uint64_t)v46, *((_QWORD *)v43 + 7), *((_QWORD *)v43 + 6));
            _os_log_impl(&dword_1B5291000, v29, v28, "Preferences for key = %{public}@ were migrated to key = %{public}@", v46, 0x16u);
          }
        }
      }
    }
    v27 = 0;
    v27 = +[CBPreferencesHandler copyNestedPreferenceForKey1:key2:key3:](CBPreferencesHandler, "copyNestedPreferenceForKey1:key2:key3:", CFSTR("DisplayPreferences"), *((_QWORD *)v43 + 6), CFSTR("AutoBrightnessEnable"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *((_BYTE *)v43 + 64) = objc_msgSend(v27, "BOOLValue") & 1;
      oslog = 0;
      if (*((_QWORD *)v43 + 2))
      {
        v12 = *((_QWORD *)v43 + 2);
      }
      else
      {
        v11 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v12 = v11;
      }
      oslog = v12;
      v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v45, *((_BYTE *)v43 + 64) & 1);
        _os_log_impl(&dword_1B5291000, oslog, v25, "auto-brightness state loaded from preferences: %d", v45, 8u);
      }
    }

    v24 = 0;
    v24 = (id)objc_msgSend(*((id *)v43 + 12), "copyPropertyForKey:", CFSTR("CBDisplayVendorID"));
    v23 = 0;
    v23 = (id)objc_msgSend(*((id *)v43 + 12), "copyPropertyForKey:", CFSTR("CBDisplayProductID"));
    *((_QWORD *)v43 + 9) = -[CBABCurve initWithUUID:vendorID:andProductID:]([CBABCurve alloc], "initWithUUID:vendorID:andProductID:", *((_QWORD *)v43 + 6), v24, v23);
    if (!*((_QWORD *)v43 + 9))
    {
      v22 = 0;
      if (*((_QWORD *)v43 + 2))
      {
        v10 = *((_QWORD *)v43 + 2);
      }
      else
      {
        v9 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v10 = v9;
      }
      v22 = v10;
      v21 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v7 = v22;
        v8 = v21;
        __os_log_helper_16_0_0(v20);
        _os_log_error_impl(&dword_1B5291000, v7, v8, "failed to create curve module", v20, 2u);
      }
    }

    if (*((_QWORD *)v43 + 2))
    {
      v6 = *((_QWORD *)v43 + 2);
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
      __os_log_helper_16_2_1_8_66((uint64_t)v44, *((_QWORD *)v43 + 9));
      _os_log_impl(&dword_1B5291000, v6, OS_LOG_TYPE_DEFAULT, "auto-brightness curve initialised: %{public}@", v44, 0xCu);
    }
  }
  return (CBABModuleExternal *)v43;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBABModuleExternal *v4;

  v4 = self;
  v3 = a2;

  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBABModuleExternal;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (void)start
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  char v7;
  NSObject *v8;
  SEL v9;
  CBABModuleExternal *v10;

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
  v7 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v6, 2u);
  }
}

- (void)stop
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  char v7;
  NSObject *v8;
  SEL v9;
  CBABModuleExternal *v10;

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
  v7 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v6, 2u);
  }
  -[CBABRamp stopTransition](v10->_ramp, "stopTransition");
}

- (id)copyPropertyForKey:(id)a3
{
  void *v4;

  v4 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightnessAuto2")) & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_enabled);
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightnessAuto2Available")) & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_available);
  return v4;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  double v4;
  uint64_t inited;
  NSObject *v7;
  uint64_t v8;
  NSObject *logHandle;
  void *v10;
  char v11;
  uint8_t v15[32];
  uint8_t v16[8];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = -[CBABModuleExternal setPropertyInternal:forKey:](self, "setPropertyInternal:forKey:", a3, a4);
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightnessAuto2")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSMutableArray count](self->_ALSServices, "count"))
    {
      -[CBABModuleExternal updateAutoBrightnessState:](self, "updateAutoBrightnessState:", objc_msgSend(a3, "BOOLValue") & 1);
      v11 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightness2")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Commit"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
          -[CBABModuleExternal userBrightnessCommitHandler](self, "userBrightnessCommitHandler");
        else
          -[CBABModuleExternal userBrightnessChangingHandler](self, "userBrightnessChangingHandler");
        v11 = 1;
      }
    }
  }
  else if ((objc_msgSend(a4, "isEqual:", CFSTR("DisplayBrightnessFactorWithFade")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a3, "BOOLValue") & 1) != 0)
    {
      LODWORD(v4) = 1036831949;
      -[CBABModuleExternal updateBrightnessForce:periodOverride:period:](self, "updateBrightnessForce:periodOverride:period:", 0, 1, v4);
      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
      }
      else
      {
        v8 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v8;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v16, objc_msgSend(a3, "intValue"));
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Receive brightness factor %d -> update brightness of ext display in short period.", v16, 8u);
      }
    }
  }
  if (self->super._logHandle)
  {
    v7 = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v7 = inited;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_66_8_64_4_0((uint64_t)v15, (uint64_t)a4, (uint64_t)a3, v11 & 1);
    _os_log_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEFAULT, "key = %{public}@ | property = %@ | result = %d", v15, 0x1Cu);
  }
  return v11 & 1;
}

- (BOOL)setPropertyInternal:(id)a3 forKey:(id)a4
{
  return 0;
}

- (void)updateAutoBrightnessState:(BOOL)a3
{
  double v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v13[7];
  char v14;
  NSObject *v15;
  uint8_t v16[7];
  char v17;
  NSObject *v18;
  id v19;
  BOOL enabled;
  BOOL v21;
  SEL v22;
  CBABModuleExternal *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  enabled = 0;
  enabled = self->_enabled;
  self->_enabled = a3;
  if (!v21 || enabled)
  {
    if (!v21)
      -[CBABRamp stopTransition](v23->_ramp, "stopTransition");
  }
  else
  {
    -[CBABCurve resetToDefaultState](v23->_curve, "resetToDefaultState");
    -[CBABModuleExternal storeCurveToPreferences](v23, "storeCurveToPreferences");
    LODWORD(v3) = 0.5;
    -[CBABModuleExternal updateBrightnessForce:periodOverride:period:](v23, "updateBrightnessForce:periodOverride:period:", 1, 1, v3);
  }
  if (enabled != v21)
  {
    if (v21)
      v4 = MEMORY[0x1E0C9AAB0];
    else
      v4 = MEMORY[0x1E0C9AAA0];
    -[CBABModuleExternal sendNotificationForKey:withValue:](v23, "sendNotificationForKey:withValue:", CFSTR("DisplayBrightnessAuto2"), v4);
  }
  v19 = 0;
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v23->_enabled);
  if (v19)
  {
    if (+[CBPreferencesHandler storeNestedPreferenceForAllUsersWithKey1:key2:key3:andValue:](CBPreferencesHandler, "storeNestedPreferenceForAllUsersWithKey1:key2:key3:andValue:", CFSTR("DisplayPreferences"), v23->_uniqueID, CFSTR("AutoBrightnessEnable"), v19))
    {
      v18 = 0;
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
      v18 = logHandle;
      v17 = 2;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        log = v18;
        type = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_debug_impl(&dword_1B5291000, log, type, "auto-brightness state preferences stored successfully", v16, 2u);
      }
    }
    else
    {
      v15 = 0;
      if (v23->super._logHandle)
      {
        v8 = v23->super._logHandle;
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
      v14 = 16;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v5 = v15;
        v6 = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1B5291000, v5, v6, "auto-brightness state preferences failed to store", v13, 2u);
      }
    }
  }

}

- (void)updateBrightness
{
  double v2;

  LODWORD(v2) = 0;
  -[CBABModuleExternal updateBrightnessForce:periodOverride:period:](self, "updateBrightnessForce:periodOverride:period:", 0, 0, v2, a2, self);
}

- (void)updateBrightnessForce:(BOOL)a3 periodOverride:(BOOL)a4 period:(float)a5
{
  double v5;
  float v6;
  double v7;
  double v8;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t v21[7];
  char v22;
  NSObject *v23;
  os_log_type_t v24;
  os_log_t v25;
  os_log_type_t v26;
  os_log_t v27;
  os_log_type_t v28;
  os_log_t v29;
  float v30;
  float v31;
  float v32;
  BOOL v33;
  BOOL v34;
  SEL v35;
  CBABModuleExternal *v36;
  uint8_t v37[32];
  uint8_t v38[16];
  uint8_t v39[32];
  uint8_t v40[24];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = self;
  v35 = a2;
  v34 = a3;
  v33 = a4;
  v32 = a5;
  if (!self->_enabled || v36->_updatesFrozen || v36->_suspendAutoBrightness || v36->_presetDisableAB)
  {
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_4_4_0_4_0_4_0_4_0((uint64_t)v37, v36->_enabled, v36->_updatesFrozen, v36->_suspendAutoBrightness, v36->_presetDisableAB);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "skip update (enabled=%i | frozen=%i | suspended=%i | presetDisableAB=%i)", v37, 0x1Au);
    }
  }
  else
  {
    v31 = 0.0;
    v30 = 0.0;
    if (-[CBABModuleExternal getAggregatedLux:](v36, "getAggregatedLux:", &v30))
    {
      *(float *)&v5 = v30;
      if (-[CBABCurve setLux:](v36->_curve, "setLux:", v5))
      {
        -[CBABCurve getLinearBrightness](v36->_curve, "getLinearBrightness");
        v31 = v6;
        v29 = 0;
        if (v36->super._logHandle)
        {
          v20 = v36->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v19 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v19 = init_default_corebrightness_log();
          v20 = v19;
        }
        v29 = v20;
        v28 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v36->_curve);
          _os_log_debug_impl(&dword_1B5291000, v29, v28, "Curve Object: %@", v40, 0xCu);
        }
        v27 = 0;
        if (v36->super._logHandle)
        {
          v18 = v36->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v17 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v17 = init_default_corebrightness_log();
          v18 = v17;
        }
        v27 = v18;
        v26 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v39, COERCE__INT64(v31), COERCE__INT64(v30));
          _os_log_impl(&dword_1B5291000, v27, v26, "Got brightness %f from Lux %f", v39, 0x16u);
        }
        if (v36->_fastRamp)
        {
          v33 = 1;
          v32 = 0.5;
        }
        *(float *)&v7 = v31;
        *(float *)&v8 = v32;
        -[CBABRamp transitionToBrightness:force:periodOverride:period:](v36->_ramp, "transitionToBrightness:force:periodOverride:period:", v34, v33, v7, v8);
      }
      else
      {
        v25 = 0;
        if (v36->super._logHandle)
        {
          v16 = v36->super._logHandle;
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
          __os_log_helper_16_0_1_8_0((uint64_t)v38, COERCE__INT64(v30));
          _os_log_error_impl(&dword_1B5291000, v25, v24, "Error retrieving brightness for lux %f", v38, 0xCu);
        }
      }
    }
    else
    {
      v23 = 0;
      if (v36->super._logHandle)
      {
        v14 = v36->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v13 = init_default_corebrightness_log();
        v14 = v13;
      }
      v23 = v14;
      v22 = 16;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v11 = v23;
        v12 = v22;
        __os_log_helper_16_0_0(v21);
        _os_log_error_impl(&dword_1B5291000, v11, v12, "failed to retrieve aggregated lux value", v21, 2u);
      }
    }
  }
}

- (BOOL)newALSService:(__IOHIDServiceClient *)a3
{
  dispatch_time_t v3;
  NSObject *queue;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v15;
  int v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CBABModuleExternal *v19;
  os_log_type_t v20;
  os_log_t v21;
  CBALSService *v22;
  os_log_type_t v23;
  os_log_t v24;
  id v25;
  id v26;
  id v27;
  char v28;
  id v29;
  char v30;
  IOHIDServiceClientRef v31;
  SEL v32;
  CBABModuleExternal *v33;
  uint8_t v34[32];
  uint8_t v35[32];
  uint8_t v36[16];
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = self;
  v32 = a2;
  v31 = a3;
  v30 = 0;
  v29 = 0;
  v28 = 0;
  v27 = (id)IOHIDServiceClientCopyProperty(a3, CFSTR("kUSBContainerID"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = (id)objc_msgSend((id)objc_msgSend(v27, "UUIDString"), "copy");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v27);
      v29 = (id)objc_msgSend((id)objc_msgSend(v26, "UUIDString"), "copy");

    }
  }
  v25 = (id)IOHIDServiceClientCopyProperty(v31, CFSTR("Built-In"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v28 = objc_msgSend(v25, "BOOLValue") & 1;

  v24 = 0;
  if (v33->super._logHandle)
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
  v24 = logHandle;
  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_66_4_0((uint64_t)v37, (uint64_t)v29, v28 & 1);
    _os_log_impl(&dword_1B5291000, v24, v23, "sensor: containerID=%{public}@ builtIn=%i", v37, 0x12u);
  }
  if ((objc_msgSend(v29, "isEqual:", v33->_containerID) & 1) != 0 || (v28 & 1) == 1 && v33->_builtIn)
  {
    v22 = -[CBALSService initWithHIDALSServiceClient:]([CBALSService alloc], "initWithHIDALSServiceClient:", v31);
    if (v22)
    {
      v21 = 0;
      if (v33->super._logHandle)
      {
        v11 = v33->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v10 = init_default_corebrightness_log();
        v11 = v10;
      }
      v21 = v11;
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v36, 0x4008000000000000);
        _os_log_impl(&dword_1B5291000, v21, v20, "Set fast ramp for %f sec", v36, 0xCu);
      }
      v33->_fastRamp = 1;
      v3 = dispatch_time(0, 3000000000);
      queue = v33->super._queue;
      block = MEMORY[0x1E0C809B0];
      v15 = -1073741824;
      v16 = 0;
      v17 = __36__CBABModuleExternal_newALSService___block_invoke;
      v18 = &unk_1E68E9E60;
      v19 = v33;
      dispatch_after(v3, queue, &block);
      -[NSMutableArray addObject:](v33->_ALSServices, "addObject:", v22);
      v30 = 1;
      if (v33->super._logHandle)
      {
        v9 = v33->super._logHandle;
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
        __os_log_helper_16_2_2_8_66_4_0((uint64_t)v35, (uint64_t)v22, v30 & 1);
        _os_log_impl(&dword_1B5291000, v9, OS_LOG_TYPE_DEFAULT, "new ALS service added \n%{public}@, success=%d", v35, 0x12u);
      }
    }

  }
  else
  {
    if (v33->super._logHandle)
    {
      v7 = v33->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v34, (uint64_t)v29, (uint64_t)v33->_containerID);
      _os_log_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEFAULT, "service containerID (%{public}@) and display container ID (%{public}@) mismatch", v34, 0x16u);
    }
  }

  return v30 & 1;
}

uint64_t __36__CBABModuleExternal_newALSService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endFastRamp", a1, a1);
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  char v4;

  v4 = 0;
  if (a3 && (IOHIDServiceClientConformsTo(a3, 0x20u, 0x41u) || IOHIDServiceClientConformsTo(a3, 0xFF00u, 4u)))
  {
    v4 = -[CBABModuleExternal newALSService:](self, "newALSService:", a3);
    if (v4)
      -[CBABModuleExternal updateBrightness](self, "updateBrightness");
  }
  -[CBABModuleExternal updateAvailability](self, "updateAvailability");
  return v4 & 1;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSMutableArray *ALSServices;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, void *, uint64_t, _BYTE *);
  void *v9;
  uint64_t *v10;
  __IOHIDServiceClient *v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  __IOHIDServiceClient *v19;
  SEL v20;
  CBABModuleExternal *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 1375731712;
  v15 = 48;
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  v18 = 0;
  ALSServices = self->_ALSServices;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __45__CBABModuleExternal_removeHIDServiceClient___block_invoke;
  v9 = &unk_1E68EA9B8;
  v11 = a3;
  v10 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](ALSServices, "enumerateObjectsUsingBlock:", &v5);
  -[NSMutableArray removeObject:](v21->_ALSServices, "removeObject:", v13[5]);
  -[CBABModuleExternal updateAvailability](v21, "updateAvailability");
  _Block_object_dispose(&v12, 8);
  return 1;
}

uint64_t __45__CBABModuleExternal_removeHIDServiceClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToHIDService:", *(_QWORD *)(a1 + 40));
  if ((result & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)updateAvailability
{
  if (!self->_available || -[NSMutableArray count](self->_ALSServices, "count"))
  {
    if (!self->_available)
    {
      if (-[NSMutableArray count](self->_ALSServices, "count"))
      {
        self->_available = 1;
        -[CBABModuleExternal sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("DisplayBrightnessAuto2Available"), MEMORY[0x1E0C9AAB0]);
      }
    }
  }
  else
  {
    self->_available = 0;
    -[CBABModuleExternal sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("DisplayBrightnessAuto2Available"), MEMORY[0x1E0C9AAA0]);
  }
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  NSMutableArray *ALSServices;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v10;
  uint64_t *v11;
  __IOHIDServiceClient *v12;
  __IOHIDEvent *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  __IOHIDServiceClient *v19;
  __IOHIDEvent *v20;
  SEL v21;
  CBABModuleExternal *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  if (!a3)
    return 0;
  if (IOHIDEventGetType() == 12)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x20000000;
    v17 = 32;
    v18 = 0;
    ALSServices = v22->_ALSServices;
    v6 = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __42__CBABModuleExternal_handleHIDEvent_from___block_invoke;
    v10 = &unk_1E68EA9E0;
    v12 = v19;
    v13 = v20;
    v11 = &v14;
    -[NSMutableArray enumerateObjectsUsingBlock:](ALSServices, "enumerateObjectsUsingBlock:", &v6);
    if ((v15[3] & 1) != 0)
      -[CBABModuleExternal updateBrightness](v22, "updateBrightness");
    _Block_object_dispose(&v14, 8);
  }
  return 1;
}

uint64_t __42__CBABModuleExternal_handleHIDEvent_from___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToHIDService:", a1[5]);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "setEvent:", a1[6]);
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)userBrightnessChangingHandler
{
  -[CBABRamp stopTransition](self->_ramp, "stopTransition", a2);
  self->_updatesFrozen = 1;
}

- (void)userBrightnessCommitHandler
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  NSObject *v5;
  CBABCurve *curve;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[15];
  char v10;
  NSObject *v11;
  os_log_type_t v12;
  os_log_t v13;
  id v14;
  SEL v15;
  CBABModuleExternal *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = self;
  v15 = a2;
  -[CBABRamp stopTransition](self->_ramp, "stopTransition");
  v16->_updatesFrozen = 0;
  v14 = 0;
  v14 = -[CBDisplayModule copyPropertyForKey:](v16->_displayModule, "copyPropertyForKey:", CFSTR("DisplayBrightnessLinear"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0;
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
    v13 = logHandle;
    v12 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v14);
      _os_log_impl(&dword_1B5291000, v13, v12, "user brightness commit (%@)", v17, 0xCu);
    }
    -[CBABRamp stopTransition](v16->_ramp, "stopTransition");
    curve = v16->_curve;
    objc_msgSend(v14, "floatValue");
    -[CBABCurve updateALSParametersForDisplayBrightness:](curve, "updateALSParametersForDisplayBrightness:");
    -[CBABModuleExternal storeCurveToPreferences](v16, "storeCurveToPreferences");
  }
  else
  {
    v11 = 0;
    if (v16->super._logHandle)
    {
      v5 = v16->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v4 = init_default_corebrightness_log();
      v5 = v4;
    }
    v11 = v5;
    v10 = 16;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v2 = v11;
      v3 = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_error_impl(&dword_1B5291000, v2, v3, "ERROR: user brightness commit - failed to retrieve current brightness", v9, 2u);
    }
  }

}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)storeCurveToPreferences
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
  uint8_t v13[15];
  os_log_type_t v14;
  NSObject *v15;
  id v16;
  SEL v17;
  CBABModuleExternal *v18;

  v18 = self;
  v17 = a2;
  v16 = 0;
  v16 = -[CBABCurve copyUserPrefState](self->_curve, "copyUserPrefState");
  if (+[CBPreferencesHandler storeNestedPreferenceForAllUsersWithKey1:key2:key3:andValue:](CBPreferencesHandler, "storeNestedPreferenceForAllUsersWithKey1:key2:key3:andValue:", CFSTR("DisplayPreferences"), v18->_uniqueID, CFSTR("AutoBrightnessCurve"), v16))
  {
    v15 = 0;
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
    v15 = logHandle;
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v15;
      type = v14;
      __os_log_helper_16_0_0(v13);
      _os_log_impl(&dword_1B5291000, log, type, "Curve preferences saved sucessfully", v13, 2u);
    }
  }
  else
  {
    v12 = 0;
    if (v18->super._logHandle)
    {
      v5 = v18->super._logHandle;
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
      _os_log_error_impl(&dword_1B5291000, v2, v3, "Curve preferences failed to save", v10, 2u);
    }
  }

}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[24];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)a3, (uint64_t)a4);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "key=%@ value=%@", v9, 0x16u);
  }
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  ;
}

- (BOOL)getAggregatedLux:(float *)a3
{
  NSMutableArray *ALSServices;
  char v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  float *v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;
  int v23;
  char v24;
  float *v25;
  SEL v26;
  CBABModuleExternal *v27;
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = self;
  v26 = a2;
  v25 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x20000000;
  v23 = 32;
  v24 = 0;
  v15 = 0;
  v16 = (float *)&v15;
  v17 = 0x20000000;
  v18 = 32;
  v19 = 0;
  ALSServices = self->_ALSServices;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __39__CBABModuleExternal_getAggregatedLux___block_invoke;
  v12 = &unk_1E68EAA08;
  v13 = &v15;
  v14 = &v20;
  -[NSMutableArray enumerateObjectsUsingBlock:](ALSServices, "enumerateObjectsUsingBlock:", &v8);
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v28, COERCE__INT64(v16[6]), (uint64_t)v27->_ALSServices);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "lux=%f from: %@", v28, 0x16u);
  }
  *v25 = v16[6];
  v5 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v20, 8);
  return v5 & 1;
}

uint64_t __39__CBABModuleExternal_getAggregatedLux___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v3;
  double v4;
  double v6;

  v6 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "lux");
  if (v6 < v3)
  {
    result = objc_msgSend(a2, "lux", v6);
    *(float *)&v4 = v4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = LODWORD(v4);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)endFastRamp
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  SEL v9;
  CBABModuleExternal *v10;

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
    _os_log_impl(&dword_1B5291000, log, type, "Fast ramp ends", v6, 2u);
  }
  v10->_fastRamp = 0;
}

- (CBDisplayModule)displayModule
{
  return self->_displayModule;
}

@end
