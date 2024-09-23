@implementation CBAODState

- (unint64_t)AODState
{
  return self->_AODState;
}

+ (id)sharedInstance
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  SEL v10;
  id v11;
  uint64_t *v12;
  dispatch_once_t *v13;

  v11 = a1;
  v10 = a2;
  objc_sync_enter(a1);
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __28__CBAODState_sharedInstance__block_invoke;
  v8 = &unk_1E68E9E60;
  v9 = v11;
  v13 = &sharedInstance_onceToken_3;
  v12 = &v4;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(v13, v12);
  objc_sync_exit(a1);
  return (id)sharedInstance__sharedObject_3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  uint64_t inited;
  NSObject *logHandle;
  char v11;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AOTCurve")) & 1) != 0)
  {
    v11 = -[CBAODState handleAODCurveUpdate:](self, "handleAODCurveUpdate:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AODDarkerCurve")) & 1) != 0)
  {
    v11 = -[CBAODState handleAODDarkerCurveUpdate:](self, "handleAODDarkerCurveUpdate:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AODPullALSUpdatePeriod")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      self->_pullALSUpdatePeriod = v4;
      v11 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AODWPTransitionLength")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      self->_whitepointTransitionLength = v5;
      v11 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AODWPTransitionLengthLowLux")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      self->_whitepointTransitionLengthLowLux = v6;
      v11 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AODWPDeltaThreshold")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      self->_whitepointDeltaThreshold = v7;
      v11 = 1;
    }
  }
  if ((v11 & 1) != 0)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
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
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)a4, (uint64_t)a3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Set property %@ = %@", v15, 0x16u);
    }
  }
  return v11 & 1;
}

- (BOOL)isAODActive
{
  BOOL v3;

  v3 = 1;
  if (self->_AODState != 1)
  {
    v3 = 1;
    if (self->_AODState != 3)
    {
      v3 = 1;
      if (self->_AODState != 2)
        return self->_AODState == 4;
    }
  }
  return v3;
}

uint64_t __28__CBAODState_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_super v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1;
  v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___CBAODState;
  result = objc_msgSend(objc_msgSendSuper2(&v2, sel_alloc), "init");
  sharedInstance__sharedObject_3 = result;
  return result;
}

- (CBAODState)init
{
  os_log_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *context;
  objc_super v14;
  SEL v15;
  CBAODState *v16;
  __int128 v17;
  int v18;
  __int128 v19;
  int v20;
  __int128 v21;
  int v22;
  __int128 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = self;
  v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)CBAODState;
  v16 = -[CBAODState init](&v14, sel_init);
  if (v16)
  {
    v2 = os_log_create("com.apple.CoreBrightness.AOD.CBAODState", "default");
    v16->_logHandle = (OS_os_log *)v2;
    v16->_AODState = 0;
    v16->_AODStateExternal = 0;
    v16->_enableAODLiveON = 0;
    v16->_AODTransitionProfile = 2;
    v16->_AODTransitionProfileEaseInOut_K = 3.0;
    v16->_AODTransitionProfileSpring_mass = 1.0;
    v16->_AODTransitionProfileSpring_damping = 3.48;
    v16->_AODTransitionProfileSpring_velocity = 2.0;
    v16->_AODTransitionProfileSpring_stiffness = 6.0;
    v16->_AODTransitionTargetAlgoOptimised_dimmingThreshold = 0.2;
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
    v16->_defaults = (NSUserDefaults *)v3;
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODPullALSUpdatePeriod"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODWPTransitionLength"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODWPTransitionLengthLowLux"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODWPDeltaThreshold"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODTransitionProfileType"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODTransitionProfileEaseInOutK"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODTransitionProfileSpringMass"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODTransitionProfileSpringVelocity"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODTransitionProfileSpringStiffness"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODTransitionProfileSpringDamping"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODTRansitionTargetAlgoOptimisedDimThr"), 1, 0);
    v16->_whitepointDeltaThreshold = 0.009;
    v16->_whitepointTransitionLength = 5.0;
    v16->_whitepointTransitionLengthLowLux = 5.0;
    v16->_whitepointTransitionLengthLuxThreshold = 35.0;
    v16->_pullALSUpdatePeriod = 5.0;
    v23 = xmmword_1B545C930;
    v24 = 713503427;
    v21 = xmmword_1B545C944;
    v22 = -1632750650;
    v4 = MGIsDeviceOneOfType();
    if ((v4 & 1) != 0 && v16->_enableAODLiveON)
      v16->_pullALSUpdatePeriod = 120.0;
    context = (void *)MEMORY[0x1B5E4A8B0](v4, v5);
    v6 = objc_msgSend(&unk_1E69174C8, "mutableCopy", &v21, 0);
    v16->_thresholdsLuxBuckets = (NSMutableArray *)v6;
    v7 = objc_msgSend(&unk_1E69174E0, "mutableCopy");
    v16->_thresholdsDeltaPBrightenBuckets = (NSMutableArray *)v7;
    v8 = objc_msgSend(&unk_1E69174F8, "mutableCopy");
    v16->_thresholdsDeltaPDimBuckets = (NSMutableArray *)v8;
    v9 = objc_msgSend(&unk_1E6917510, "mutableCopy");
    v16->_thresholdsAPLuxBuckets = (NSMutableArray *)v9;
    v10 = objc_msgSend(&unk_1E6917528, "mutableCopy");
    v16->_thresholdsAPDeltaPBrightenBuckets = (NSMutableArray *)v10;
    v11 = objc_msgSend(&unk_1E6917540, "mutableCopy");
    v16->_thresholdsAPDeltaPDimBuckets = (NSMutableArray *)v11;
    objc_autoreleasePoolPop(context);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODThresholdsLuxBuckets"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODThresholdsDeltaPBrightenBuckets"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODThresholdsDeltaPDimBuckets"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODAPThresholdsLuxBuckets"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODAPThresholdsDeltaPBrightenBuckets"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, CFSTR("AODAPThresholdsDeltaPDimBuckets"), 1, 0);
    v16->_thresholdPCCLuxDelta = 30.0;
    v19 = xmmword_1B545C958;
    v20 = 1176256512;
    v17 = xmmword_1B545C96C;
    v18 = 1140457472;
    __memcpy_chk();
    __memcpy_chk();
    v16->_curve.size = 5;
    __memcpy_chk();
    __memcpy_chk();
    v16->_darkerCurve.size = 5;
    v16->_nitsCap = -1.0;
    -[CBAODState checkDefaultsConfiguration](v16, "checkDefaultsConfiguration");
    -[CBAODState checkBootArgsConfiguration](v16, "checkBootArgsConfiguration");
  }
  return v16;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAODState *v4;

  v4 = self;
  v3 = a2;

  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }

  if (v4->_systemActivityAssertion)
  {
    -[SWSystemActivityAssertion invalidate](v4->_systemActivityAssertion, "invalidate");

    v4->_systemActivityAssertion = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAODState;
  -[CBAODState dealloc](&v2, sel_dealloc);
}

- (char)AODStateString
{
  unint64_t AODState;

  AODState = self->_AODState;
  if (AODState <= 4)
    __asm { BR              X8 }
  return "invalid";
}

- (void)checkDefaultsConfiguration
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t inited;
  NSObject *logHandle;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint8_t v64[32];
  uint8_t v65[32];
  uint8_t v66[32];
  uint8_t v67[32];
  uint8_t v68[32];
  uint8_t v69[32];
  uint8_t v70[32];
  uint8_t v71[32];
  uint8_t v72[32];
  uint8_t v73[32];
  uint8_t v74[32];
  uint8_t v75[32];
  uint8_t v76[32];
  uint8_t v77[32];
  uint8_t v78[32];
  uint8_t v79[32];
  uint8_t v80[24];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (self->_defaults)
  {
    -[NSUserDefaults synchronize](self->_defaults, "synchronize");
    v46 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODPullALSUpdatePeriod"));
    if (v46)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          logHandle = self->_logHandle;
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
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v80, (uint64_t)CFSTR("AODPullALSUpdatePeriod"), (uint64_t)v46);
          _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v80, 0x16u);
        }
        objc_msgSend(v46, "floatValue");
        self->_pullALSUpdatePeriod = v2;
      }
    }
    v47 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODWPTransitionLength"));
    if (v47)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          v43 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v42 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v42 = init_default_corebrightness_log();
          v43 = v42;
        }
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v79, (uint64_t)CFSTR("AODWPTransitionLength"), (uint64_t)v47);
          _os_log_impl(&dword_1B5291000, v43, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v79, 0x16u);
        }
        objc_msgSend(v47, "floatValue");
        self->_whitepointTransitionLength = v3;
      }
    }
    v48 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODWPTransitionLengthLowLux"));
    if (v48)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          v41 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v40 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v40 = init_default_corebrightness_log();
          v41 = v40;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v78, (uint64_t)CFSTR("AODWPTransitionLengthLowLux"), (uint64_t)v48);
          _os_log_impl(&dword_1B5291000, v41, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v78, 0x16u);
        }
        objc_msgSend(v48, "floatValue");
        self->_whitepointTransitionLengthLowLux = v4;
      }
    }
    v49 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODWPDeltaThreshold"));
    if (v49)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          v39 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v38 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v38 = init_default_corebrightness_log();
          v39 = v38;
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v77, (uint64_t)CFSTR("AODWPDeltaThreshold"), (uint64_t)v49);
          _os_log_impl(&dword_1B5291000, v39, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v77, 0x16u);
        }
        objc_msgSend(v49, "floatValue");
        self->_whitepointDeltaThreshold = v5;
      }
    }
    v50 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODThresholdsLuxBuckets"));
    if (v50)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          v37 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v36 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v36 = init_default_corebrightness_log();
          v37 = v36;
        }
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v76, (uint64_t)CFSTR("AODThresholdsLuxBuckets"), (uint64_t)v50);
          _os_log_impl(&dword_1B5291000, v37, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v76, 0x16u);
        }

        self->_thresholdsLuxBuckets = (NSMutableArray *)objc_msgSend(v50, "mutableCopy");
      }
    }
    v51 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODThresholdsDeltaPBrightenBuckets"));
    if (v51)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          v35 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v34 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v34 = init_default_corebrightness_log();
          v35 = v34;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v75, (uint64_t)CFSTR("AODThresholdsDeltaPBrightenBuckets"), (uint64_t)v51);
          _os_log_impl(&dword_1B5291000, v35, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v75, 0x16u);
        }

        self->_thresholdsDeltaPBrightenBuckets = (NSMutableArray *)objc_msgSend(v51, "mutableCopy");
      }
    }
    v52 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODThresholdsDeltaPDimBuckets"));
    if (v52)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          v33 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v32 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v32 = init_default_corebrightness_log();
          v33 = v32;
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v74, (uint64_t)CFSTR("AODThresholdsDeltaPDimBuckets"), (uint64_t)v52);
          _os_log_impl(&dword_1B5291000, v33, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v74, 0x16u);
        }

        self->_thresholdsDeltaPDimBuckets = (NSMutableArray *)objc_msgSend(v52, "mutableCopy");
      }
    }
    v53 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODAPThresholdsLuxBuckets"));
    if (v53)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          v31 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v30 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v30 = init_default_corebrightness_log();
          v31 = v30;
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v73, (uint64_t)CFSTR("AODThresholdsLuxBuckets"), (uint64_t)v53);
          _os_log_impl(&dword_1B5291000, v31, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v73, 0x16u);
        }

        self->_thresholdsAPLuxBuckets = (NSMutableArray *)objc_msgSend(v53, "mutableCopy");
      }
    }
    v54 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODAPThresholdsDeltaPBrightenBuckets"));
    if (v54)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          v29 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v28 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v28 = init_default_corebrightness_log();
          v29 = v28;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v72, (uint64_t)CFSTR("AODAPThresholdsDeltaPBrightenBuckets"), (uint64_t)v54);
          _os_log_impl(&dword_1B5291000, v29, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v72, 0x16u);
        }

        self->_thresholdsAPDeltaPBrightenBuckets = (NSMutableArray *)objc_msgSend(v54, "mutableCopy");
      }
    }
    v55 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODAPThresholdsDeltaPDimBuckets"));
    if (v55)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_logHandle)
        {
          v27 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v26 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v26 = init_default_corebrightness_log();
          v27 = v26;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v71, (uint64_t)CFSTR("AODAPThresholdsDeltaPDimBuckets"), (uint64_t)v55);
          _os_log_impl(&dword_1B5291000, v27, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v71, 0x16u);
        }

        self->_thresholdsAPDeltaPDimBuckets = (NSMutableArray *)objc_msgSend(v55, "mutableCopy");
      }
    }
    v56 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODTransitionProfileType"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_logHandle)
      {
        v25 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v24 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v24 = init_default_corebrightness_log();
        v25 = v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v70, (uint64_t)CFSTR("AODTransitionProfileType"), (uint64_t)v56);
        _os_log_impl(&dword_1B5291000, v25, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v70, 0x16u);
      }
      self->_AODTransitionProfile = objc_msgSend(v56, "integerValue");
    }
    v57 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODTransitionProfileEaseInOutK"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_logHandle)
      {
        v23 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v22 = init_default_corebrightness_log();
        v23 = v22;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v69, (uint64_t)CFSTR("AODTransitionProfileEaseInOutK"), (uint64_t)v57);
        _os_log_impl(&dword_1B5291000, v23, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v69, 0x16u);
      }
      objc_msgSend(v57, "floatValue");
      self->_AODTransitionProfileEaseInOut_K = v6;
    }
    v58 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODTransitionProfileSpringMass"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_logHandle)
      {
        v21 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v20 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v20 = init_default_corebrightness_log();
        v21 = v20;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v68, (uint64_t)CFSTR("AODTransitionProfileSpringMass"), (uint64_t)v58);
        _os_log_impl(&dword_1B5291000, v21, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v68, 0x16u);
      }
      objc_msgSend(v58, "floatValue");
      self->_AODTransitionProfileSpring_mass = v7;
    }
    v59 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODTransitionProfileSpringVelocity"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_logHandle)
      {
        v19 = self->_logHandle;
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
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v67, (uint64_t)CFSTR("AODTransitionProfileSpringVelocity"), (uint64_t)v59);
        _os_log_impl(&dword_1B5291000, v19, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v67, 0x16u);
      }
      objc_msgSend(v59, "floatValue");
      self->_AODTransitionProfileSpring_velocity = v8;
    }
    v60 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODTransitionProfileSpringStiffness"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_logHandle)
      {
        v17 = self->_logHandle;
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
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v66, (uint64_t)CFSTR("AODTransitionProfileSpringStiffness"), (uint64_t)v60);
        _os_log_impl(&dword_1B5291000, v17, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v66, 0x16u);
      }
      objc_msgSend(v60, "floatValue");
      self->_AODTransitionProfileSpring_stiffness = v9;
    }
    v61 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODTransitionProfileSpringDamping"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_logHandle)
      {
        v15 = self->_logHandle;
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
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v65, (uint64_t)CFSTR("AODTransitionProfileSpringDamping"), (uint64_t)v61);
        _os_log_impl(&dword_1B5291000, v15, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v65, 0x16u);
      }
      objc_msgSend(v61, "floatValue");
      self->_AODTransitionProfileSpring_damping = v10;
    }
    v62 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("AODTRansitionTargetAlgoOptimisedDimThr"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_logHandle)
      {
        v13 = self->_logHandle;
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
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v64, (uint64_t)CFSTR("AODTRansitionTargetAlgoOptimisedDimThr"), (uint64_t)v62);
        _os_log_impl(&dword_1B5291000, v13, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v64, 0x16u);
      }
      objc_msgSend(v62, "floatValue");
      self->_AODTransitionTargetAlgoOptimised_dimmingThreshold = v11;
    }
  }
}

- (BOOL)enableAODLiveON
{
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  CBAODState *v8;
  SEL v9;
  CBAODState *v10;
  uint64_t *v11;
  dispatch_once_t *v12;

  v10 = self;
  v9 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __29__CBAODState_enableAODLiveON__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = self;
  v12 = &enableAODLiveON_once;
  v11 = &v3;
  if (enableAODLiveON_once != -1)
    dispatch_once(v12, v11);
  return v10->_enableAODLiveON;
}

void __29__CBAODState_enableAODLiveON__block_invoke(uint64_t a1)
{
  const char *v1;
  uint64_t inited;
  NSObject *v3;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyNumberFromPrefsForKey:", CFSTR("CBSupportsAlwaysOnOverride"));
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v5, "BOOLValue") & 1;
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
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 1) != 0)
        v1 = "enabled";
      else
        v1 = "disabled";
      __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)v1);
      _os_log_impl(&dword_1B5291000, v3, OS_LOG_TYPE_DEFAULT, "AOD live-on %s by defaults config.", v6, 0xCu);
    }

  }
}

- (BOOL)isAODSupported
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  CBAODState *v8;
  SEL v9;
  CBAODState *v10;
  uint64_t *v11;
  dispatch_once_t *v12;

  v10 = self;
  v9 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __28__CBAODState_isAODSupported__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = self;
  v12 = &isAODSupported_once;
  v11 = &v3;
  if (isAODSupported_once != -1)
    dispatch_once(v12, v11);
  return v10->_isAODSupported;
}

uint64_t __28__CBAODState_isAODSupported__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  result = MGGetBoolAnswer();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  }
  else
  {
    result = -[CBAODState enableAODLiveON](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "enableAODLiveON");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = result & 1;
  }
  return result;
}

- (id)copyNumberFromPrefsForKey:(id)a3
{
  id v4;
  void *v5;

  v5 = 0;
  if (self->_defaults)
  {
    -[NSUserDefaults synchronize](self->_defaults, "synchronize");
    v4 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", a3);
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v4;
    }
  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v11, (uint64_t)a3, (uint64_t)a5);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Changed property %@ to value %@", v11, 0x16u);
  }
  -[CBAODState checkDefaultsConfiguration](self, "checkDefaultsConfiguration");
}

- (void)checkBootArgsConfiguration
{
  BOOL v2;
  const char *v3;
  NSObject *v4;
  char *v5;
  size_t v6[2];
  CBAODState *v7;
  uint8_t v8[24];
  char __s1[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = self;
  v6[1] = (size_t)a2;
  bzero(__s1, 0x400uLL);
  v6[0] = 1024;
  if (!sysctlbyname("kern.bootargs", __s1, v6, 0, 0))
  {
    v5 = strstr(__s1, "cb_aod_enable_liveon");
    if (v5)
    {
      v2 = strtol(v5 + 21, 0, 0) != 0;
      v7->_enableAODLiveON = v2;
      v4 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        if (v7->_enableAODLiveON)
          v3 = "Enable";
        else
          v3 = "Disable";
        __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
        _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEFAULT, "Boot arg override: %s AOD live-on.", v8, 0xCu);
      }
    }
  }
}

- (BOOL)handleAODCurveUpdate:(id)a3
{
  _BYTE __dst[167];
  unsigned __int8 v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  SEL v11;
  CBAODState *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (id)objc_msgSend(v10, "objectForKey:", CFSTR("CurveLevelMed"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (id)objc_msgSend(v8, "valueForKey:", CFSTR("lux"));
      v6 = (id)objc_msgSend(v8, "valueForKey:", CFSTR("nits"));
      v5 = objc_msgSend(v7, "count");
      dword_1EF1294F8 = v5;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_4);
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_95);
      memcpy(&v12->_curve, &handleAODCurveUpdate__newCurve, sizeof(v12->_curve));
      v9 = 1;
    }
    memcpy(__dst, &v12->_curve, 0xA4uLL);
    -[CBAODState logAODCurve:name:](v12, "logAODCurve:name:", __dst, CFSTR("Curve"));
  }
  return v9 & 1;
}

uint64_t __35__CBAODState_handleAODCurveUpdate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  int v4;

  result = objc_msgSend(a2, "floatValue");
  handleAODCurveUpdate__newCurve[a3] = v4;
  return result;
}

uint64_t __35__CBAODState_handleAODCurveUpdate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  int v4;

  result = objc_msgSend(a2, "floatValue");
  handleAODCurveUpdate__newCurve[a3 + 20] = v4;
  return result;
}

- (BOOL)handleAODDarkerCurveUpdate:(id)a3
{
  _BYTE __dst[167];
  unsigned __int8 v5;
  id v6;
  id v7;
  char v8;
  id v9;
  SEL v10;
  CBAODState *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (id)objc_msgSend(v9, "valueForKey:", CFSTR("lux"));
    v6 = (id)objc_msgSend(v9, "valueForKey:", CFSTR("nits"));
    v5 = objc_msgSend(v7, "count");
    dword_1EF12959C = v5;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_98);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_99);
    memcpy(&v11->_darkerCurve, &handleAODDarkerCurveUpdate__newCurve, sizeof(v11->_darkerCurve));
    v8 = 1;
    memcpy(__dst, &v11->_darkerCurve, 0xA4uLL);
    -[CBAODState logAODCurve:name:](v11, "logAODCurve:name:", __dst, CFSTR("DarkerCurve"));
  }
  return v8 & 1;
}

uint64_t __41__CBAODState_handleAODDarkerCurveUpdate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  int v4;

  result = objc_msgSend(a2, "floatValue");
  handleAODDarkerCurveUpdate__newCurve[a3] = v4;
  return result;
}

uint64_t __41__CBAODState_handleAODDarkerCurveUpdate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  int v4;

  result = objc_msgSend(a2, "floatValue");
  handleAODDarkerCurveUpdate__newCurve[a3 + 20] = v4;
  return result;
}

- (float)maxAODNits
{
  return self->_curve._E[self->_curve.size + 19];
}

- (float)minAODNits
{
  return self->_curve._L[0];
}

- (void)logAODCurve:(id *)a3 name:(id)a4
{
  uint64_t v4;
  NSObject *v5;
  uint64_t inited;
  NSObject *logHandle;
  int i;
  uint8_t v12[32];
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  for (i = 0; i < a3->var2; ++i)
  {
    if (a4)
    {
      if (self->_logHandle)
      {
        logHandle = self->_logHandle;
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
        __os_log_helper_16_2_4_8_64_4_0_8_0_8_0((uint64_t)v13, (uint64_t)a4, i, COERCE__INT64(a3->var0[i]), COERCE__INT64(a3->var1[i]));
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "%@[%d] = lux=%f ; nits=%f]", v13, 0x26u);
      }
    }
    else
    {
      if (self->_logHandle)
      {
        v5 = self->_logHandle;
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
        __os_log_helper_16_0_3_4_0_8_0_8_0((uint64_t)v12, i, COERCE__INT64(a3->var0[i]), COERCE__INT64(a3->var1[i]));
        _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEFAULT, "Curve[%d] = lux=%f ; nits=%f]", v12, 0x1Cu);
      }
    }
  }
}

- (void)acquirePowerAssertion
{
  SWSystemActivityAssertion *systemActivityAssertion;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, char, uint64_t, uint64_t);
  void *v8;
  CBAODState *v9;
  SEL v10;
  CBAODState *v11;

  v11 = self;
  v10 = a2;
  objc_sync_enter(self);
  if (v11->_systemActivityAssertion)
  {
    -[SWSystemActivityAssertion invalidate](v11->_systemActivityAssertion, "invalidate");

    v11->_systemActivityAssertion = 0;
  }
  v11->_systemActivityAssertion = (SWSystemActivityAssertion *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F70]), "initWithIdentifier:", CFSTR("CoreBrightness AOD transitions in progress."));
  systemActivityAssertion = v11->_systemActivityAssertion;
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __35__CBAODState_acquirePowerAssertion__block_invoke;
  v8 = &unk_1E68EA808;
  v9 = v11;
  -[SWSystemActivityAssertion acquireWithTimeout:handler:](systemActivityAssertion, "acquireWithTimeout:handler:", &v4, 10.0);
  objc_sync_exit(self);
}

void __35__CBAODState_acquirePowerAssertion__block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t inited;
  NSObject *v5;
  char v9;
  uint8_t v10[40];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = a2 & 1;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_4_4_0_8_66_8_66_8_0((uint64_t)v10, v9 & 1, a4, a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEFAULT, "[Power Assertion] Acquired=%d (details:%{public}@ error:%{public}@ assertionObj=%p)", v10, 0x26u);
  }
}

- (void)releasePowerAssertion
{
  uint64_t inited;
  NSObject *logHandle;
  char v5;
  SWSystemActivityAssertion *systemActivityAssertion;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  systemActivityAssertion = self->_systemActivityAssertion;
  v5 = 0;
  if (systemActivityAssertion)
  {
    -[SWSystemActivityAssertion invalidate](self->_systemActivityAssertion, "invalidate");

    self->_systemActivityAssertion = 0;
    v5 = 1;
  }
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
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
    __os_log_helper_16_0_2_4_0_8_0((uint64_t)v8, v5 & 1, (uint64_t)systemActivityAssertion);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "[Power Assertion] Released=%d (assertionObj=0x%lx)", v8, 0x12u);
  }
  objc_sync_exit(self);
}

- (void)setAODState:(unint64_t)a3
{
  self->_AODState = a3;
}

- (unint64_t)AODStateExternal
{
  return self->_AODStateExternal;
}

- (void)setAODStateExternal:(unint64_t)a3
{
  self->_AODStateExternal = a3;
}

- (void)setEnableAODLiveON:(BOOL)a3
{
  self->_enableAODLiveON = a3;
}

- (NSMutableArray)thresholdsLuxBuckets
{
  return self->_thresholdsLuxBuckets;
}

- (NSMutableArray)thresholdsDeltaPBrightenBuckets
{
  return self->_thresholdsDeltaPBrightenBuckets;
}

- (NSMutableArray)thresholdsDeltaPDimBuckets
{
  return self->_thresholdsDeltaPDimBuckets;
}

- (NSMutableArray)thresholdsAPLuxBuckets
{
  return self->_thresholdsAPLuxBuckets;
}

- (NSMutableArray)thresholdsAPDeltaPBrightenBuckets
{
  return self->_thresholdsAPDeltaPBrightenBuckets;
}

- (NSMutableArray)thresholdsAPDeltaPDimBuckets
{
  return self->_thresholdsAPDeltaPDimBuckets;
}

- (float)thresholdPCCLuxDelta
{
  return self->_thresholdPCCLuxDelta;
}

- (unint64_t)AODTransitionProfile
{
  return self->_AODTransitionProfile;
}

- (void)setAODTransitionProfile:(unint64_t)a3
{
  self->_AODTransitionProfile = a3;
}

- (float)AODTransitionProfileEaseInOut_K
{
  return self->_AODTransitionProfileEaseInOut_K;
}

- (void)setAODTransitionProfileEaseInOut_K:(float)a3
{
  self->_AODTransitionProfileEaseInOut_K = a3;
}

- (float)AODTransitionProfileSpring_mass
{
  return self->_AODTransitionProfileSpring_mass;
}

- (void)setAODTransitionProfileSpring_mass:(float)a3
{
  self->_AODTransitionProfileSpring_mass = a3;
}

- (float)AODTransitionProfileSpring_velocity
{
  return self->_AODTransitionProfileSpring_velocity;
}

- (void)setAODTransitionProfileSpring_velocity:(float)a3
{
  self->_AODTransitionProfileSpring_velocity = a3;
}

- (float)AODTransitionProfileSpring_damping
{
  return self->_AODTransitionProfileSpring_damping;
}

- (void)setAODTransitionProfileSpring_damping:(float)a3
{
  self->_AODTransitionProfileSpring_damping = a3;
}

- (float)AODTransitionProfileSpring_stiffness
{
  return self->_AODTransitionProfileSpring_stiffness;
}

- (void)setAODTransitionProfileSpring_stiffness:(float)a3
{
  self->_AODTransitionProfileSpring_stiffness = a3;
}

- (float)AODTransitionTargetAlgoOptimised_dimmingThreshold
{
  return self->_AODTransitionTargetAlgoOptimised_dimmingThreshold;
}

- (void)setAODTransitionTargetAlgoOptimised_dimmingThreshold:(float)a3
{
  self->_AODTransitionTargetAlgoOptimised_dimmingThreshold = a3;
}

- (void)setIsAODSupported:(BOOL)a3
{
  self->_isAODSupported = a3;
}

- (float)pullALSUpdatePeriod
{
  return self->_pullALSUpdatePeriod;
}

- (void)setPullALSUpdatePeriod:(float)a3
{
  self->_pullALSUpdatePeriod = a3;
}

- (float)nitsCap
{
  return self->_nitsCap;
}

- (void)setNitsCap:(float)a3
{
  self->_nitsCap = a3;
}

- ($9B79091F130840996C5B4CF8AB9B5A60)curve
{
  $9B79091F130840996C5B4CF8AB9B5A60 *result;

  objc_copyStruct(retstr, &self->_curve, 164, 1, 0);
  return result;
}

- ($9B79091F130840996C5B4CF8AB9B5A60)darkerCurve
{
  $9B79091F130840996C5B4CF8AB9B5A60 *result;

  objc_copyStruct(retstr, &self->_darkerCurve, 164, 1, 0);
  return result;
}

- (float)whitepointTransitionLength
{
  return self->_whitepointTransitionLength;
}

- (void)setWhitepointTransitionLength:(float)a3
{
  self->_whitepointTransitionLength = a3;
}

- (float)whitepointTransitionLengthLowLux
{
  return self->_whitepointTransitionLengthLowLux;
}

- (void)setWhitepointTransitionLengthLowLux:(float)a3
{
  self->_whitepointTransitionLengthLowLux = a3;
}

- (float)whitepointTransitionLengthLuxThreshold
{
  return self->_whitepointTransitionLengthLuxThreshold;
}

- (void)setWhitepointTransitionLengthLuxThreshold:(float)a3
{
  self->_whitepointTransitionLengthLuxThreshold = a3;
}

- (float)whitepointDeltaThreshold
{
  return self->_whitepointDeltaThreshold;
}

- (void)setWhitepointDeltaThreshold:(float)a3
{
  self->_whitepointDeltaThreshold = a3;
}

@end
