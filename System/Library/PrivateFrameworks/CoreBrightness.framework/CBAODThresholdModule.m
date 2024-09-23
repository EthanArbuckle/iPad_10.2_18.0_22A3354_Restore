@implementation CBAODThresholdModule

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  uint64_t inited;
  NSObject *logHandle;
  char v15;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AODPerceptualBrightenThreshold")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      self->_Pthreshold_brighten = fmaxf(fminf(v4, 1.0), 0.0);
      -[CBAODThresholdModule reevaluateALSThresholds](self, "reevaluateALSThresholds");
      v15 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AODPerceptualBrightenLowLuxThreshold")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      self->_Pthreshold_brighten_lowLux = fmaxf(fminf(v5, 1.0), 0.0);
      -[CBAODThresholdModule reevaluateALSThresholds](self, "reevaluateALSThresholds");
      v15 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AODPerceptualDimThreshold")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      self->_Pthreshold_dim = fmaxf(fminf(v6, 1.0), 0.0);
      -[CBAODThresholdModule reevaluateALSThresholds](self, "reevaluateALSThresholds");
      v15 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AODPerceptualDimLowLuxThreshold")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      self->_Pthreshold_dim_lowLux = fmaxf(fminf(v7, 1.0), 0.0);
      -[CBAODThresholdModule reevaluateALSThresholds](self, "reevaluateALSThresholds");
      v15 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("ALSLuxBrightenThreshold")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      if (v8 >= 0.0)
      {
        objc_msgSend(a3, "floatValue");
        self->_brightenLuxThreshold = v9;
        self->_brightenLuxThresholdOverriden = 1;
        -[CBAODThresholdModule reevaluateALSThresholds](self, "reevaluateALSThresholds");
      }
      else
      {
        self->_brightenLuxThresholdOverriden = 0;
      }
      v15 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("ALSLuxDimThreshold")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      if (v10 >= 0.0)
      {
        objc_msgSend(a3, "floatValue");
        self->_dimLuxThreshold = v11;
        self->_dimLuxThresholdOverriden = 1;
        -[CBAODThresholdModule reevaluateALSThresholds](self, "reevaluateALSThresholds");
      }
      else
      {
        self->_dimLuxThresholdOverriden = 0;
      }
      v15 = 1;
    }
  }
  if ((v15 & 1) != 0)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)a4, (uint64_t)a3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "key = %@ property = %@", v19, 0x16u);
    }
  }
  return v15 & 1;
}

- (CBAODThresholdModule)initWithQueue:(id)a3
{
  os_log_t v3;
  NSMutableArray *v4;
  objc_super v6;
  id v7;
  SEL v8;
  CBAODThresholdModule *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  if (!a3)
    __assert_rtn("-[CBAODThresholdModule initWithQueue:]", "CBAODThresholdModule.m", 51, "queue");
  v6.receiver = v9;
  v6.super_class = (Class)CBAODThresholdModule;
  v9 = -[CBModule initWithQueue:](&v6, sel_initWithQueue_, v7);
  if (v9)
  {
    v3 = os_log_create("com.apple.CoreBrightness.AOD.ThresholdModule", "default");
    v9->super._logHandle = (OS_os_log *)v3;
    v9->_Pthreshold_dim = 0.25;
    v9->_Pthreshold_dim_lowLux = 0.2;
    v9->_Pthreshold_brighten = 0.1;
    v9->_Pthreshold_brighten_lowLux = 0.15;
    v9->_AP_Pthreshold_dim = 0.2;
    v9->_AP_Pthreshold_brighten = 0.1;
    v9->_minNits = 2.0;
    v9->_maxNits = 1060.0;
    v9->_currentLux = -1.0;
    v9->_currentBrightness = -1.0;
    v9->_currentBrightnessLimit = -1.0;
    v9->_brightenLuxThreshold = -1.0;
    v9->_dimLuxThreshold = -1.0;
    v9->_brightenLuxThresholdOverriden = 0;
    v9->_dimLuxThresholdOverriden = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9->_alsServiceClients = v4;
    -[CBAODThresholdModule checkBootArgsConfiguration](v9, "checkBootArgsConfiguration");
  }
  return v9;
}

- (void)checkBootArgsConfiguration
{
  float v2;
  float v3;
  float v4;
  float v5;
  uint64_t inited;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *logHandle;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  size_t v18[2];
  CBAODThresholdModule *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[24];
  char v24[1024];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18[1] = (size_t)a2;
  bzero(v24, 0x400uLL);
  v18[0] = 1024;
  if (!sysctlbyname("kern.bootargs", v24, v18, 0, 0))
  {
    v14 = strstr[abi:ne180100](v24, "cb_aod_threshold_dim");
    if (v14)
    {
      v2 = strtof(v14 + 21, 0);
      v19->_Pthreshold_dim = v2;
      if (v19->super._logHandle)
      {
        logHandle = v19->super._logHandle;
      }
      else
      {
        v12 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v12;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v23, COERCE__INT64(v19->_Pthreshold_dim));
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "AOD dim threshold overrided to %f", v23, 0xCu);
      }
    }
    v15 = strstr[abi:ne180100](v24, "cb_aod_threshold_dim_lowlux");
    if (v15)
    {
      v3 = strtof(v15 + 28, 0);
      v19->_Pthreshold_dim_lowLux = v3;
      if (v19->super._logHandle)
      {
        v11 = v19->super._logHandle;
      }
      else
      {
        v10 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v11 = v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v22, COERCE__INT64(v19->_Pthreshold_dim_lowLux));
        _os_log_impl(&dword_1B5291000, v11, OS_LOG_TYPE_DEFAULT, "AOD dim threshold in low lux overrided to %f", v22, 0xCu);
      }
    }
    v16 = strstr[abi:ne180100](v24, "cb_aod_threshold_brighten");
    if (v16)
    {
      v4 = strtof(v16 + 26, 0);
      v19->_Pthreshold_brighten = v4;
      if (v19->super._logHandle)
      {
        v9 = v19->super._logHandle;
      }
      else
      {
        v8 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v9 = v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v21, COERCE__INT64(v19->_Pthreshold_brighten));
        _os_log_impl(&dword_1B5291000, v9, OS_LOG_TYPE_DEFAULT, "AOD brighten threshold overrided to %f", v21, 0xCu);
      }
    }
    v17 = strstr[abi:ne180100](v24, "cb_aod_threshold_brighten_lowlux");
    if (v17)
    {
      v5 = strtof(v17 + 33, 0);
      v19->_Pthreshold_brighten_lowLux = v5;
      if (v19->super._logHandle)
      {
        v7 = v19->super._logHandle;
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
        __os_log_helper_16_0_1_8_0((uint64_t)v20, COERCE__INT64(v19->_Pthreshold_brighten_lowLux));
        _os_log_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEFAULT, "AOD brighten threshold in low lux overrided to %f", v20, 0xCu);
      }
    }
  }
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAODThresholdModule *v4;

  v4 = self;
  v3 = a2;

  v4->_alsServiceClients = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBAODThresholdModule;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (id)copyPropertyForKey:(id)a3
{
  id v3;
  double v4;
  id v5;
  double v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ALSLuxBrightenThreshold")) & 1) != 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v4 = self->_brightenLuxThreshold;
    return (id)objc_msgSend(v3, "initWithFloat:", v4);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ALSLuxDimThreshold")) & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v6 = self->_dimLuxThreshold;
    return (id)objc_msgSend(v5, "initWithFloat:", v6);
  }
  else
  {
    return 0;
  }
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if ((-[__IOHIDServiceClient conformsToUsagePage:usage:](a3, "conformsToUsagePage:usage:", 65280, 4) & 1) != 0)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)a3);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Get ALS service - save it! %@", v9, 0xCu);
    }
    if ((-[NSMutableArray containsObject:](self->_alsServiceClients, "containsObject:", a3) & 1) == 0)
      -[NSMutableArray addObject:](self->_alsServiceClients, "addObject:", a3);
    v7 = 1;
  }
  return v7 & 1;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if ((-[NSMutableArray containsObject:](self->_alsServiceClients, "containsObject:", a3) & 1) != 0)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)a3);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Remove ALS service! %@", v9, 0xCu);
    }
    -[NSMutableArray removeObject:](self->_alsServiceClients, "removeObject:", a3);
    v7 = 1;
  }
  return v7 & 1;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  return 0;
}

- (void)reevaluateALSThresholds
{
  double v2;
  double v3;
  double v4;

  if (self->_currentLux >= 0.0 && self->_currentBrightness >= 0.0
    || self->_brightenLuxThresholdOverriden
    || self->_dimLuxThresholdOverriden)
  {
    *(float *)&v2 = self->_currentBrightness;
    *(float *)&v3 = self->_currentBrightnessLimit;
    *(float *)&v4 = self->_currentLux;
    -[CBAODThresholdModule updateALSThresholdsWithBrightness:brightnessLimit:lux:](self, "updateALSThresholdsWithBrightness:brightnessLimit:lux:", v2, v3, v4);
  }
}

- (void)updateALSThresholdsWithBrightness:(float)a3 brightnessLimit:(float)a4 lux:(float)a5
{
  float v5;
  double v6;
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
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSMutableArray *obj;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  float v26;
  CBAODState *v27;
  CBAODState *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *logHandle;
  uint64_t inited;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  float maxNits;
  float minNits;
  _QWORD v39[8];
  id v40;
  os_log_type_t v41;
  os_log_t v42;
  float v43;
  float v44;
  float v45[41];
  float v46;
  float __b[41];
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  os_log_type_t v53;
  os_log_t v54;
  os_log_type_t v55;
  os_log_t v56;
  int i;
  os_log_type_t type;
  os_log_t oslog;
  float Pthreshold_dim;
  float Pthreshold_brighten;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  SEL v69;
  CBAODThresholdModule *v70;
  _BYTE v71[128];
  uint8_t v72[96];
  uint8_t v73[32];
  uint8_t v74[48];
  uint8_t v75[56];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v70 = self;
  v69 = a2;
  v68 = a3;
  v67 = a4;
  v66 = a5;
  self->_currentLux = a5;
  v70->_currentBrightness = v68;
  v70->_currentBrightnessLimit = v67;
  v65 = 0.0;
  maxNits = v70->_maxNits;
  -[CBAODState maxAODNits](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "maxAODNits");
  v65 = fminf(maxNits, v5);
  v64 = 0.0;
  minNits = v70->_minNits;
  -[CBAODState minAODNits](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "minAODNits");
  v64 = fmaxf(minNits, *(float *)&v6);
  v63 = v65;
  *(float *)&v6 = v67;
  if (v67 > 0.0)
  {
    *(float *)&v6 = fminf(v63, v67);
    v63 = *(float *)&v6;
  }
  -[CBAODState nitsCap](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v6), "nitsCap");
  if (v7 > 0.0)
  {
    -[CBAODState nitsCap](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "nitsCap");
    v63 = fminf(v63, v8);
  }
  v63 = fmaxf(v63, v64);
  v62 = BULuminanceToPerceptual(v68, v64, v65);
  Pthreshold_brighten = 0.0;
  Pthreshold_brighten = v70->_Pthreshold_brighten;
  Pthreshold_dim = 0.0;
  Pthreshold_dim = v70->_Pthreshold_dim;
  v36 = -[NSMutableArray count](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsLuxBuckets"), "count");
  if (v36 == -[NSMutableArray count](-[CBAODState thresholdsDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsDeltaPBrightenBuckets"), "count")&& (v35 = -[NSMutableArray count](-[CBAODState thresholdsDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsDeltaPBrightenBuckets"), "count"), v35 == -[NSMutableArray count](-[CBAODState thresholdsDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsDeltaPDimBuckets"), "count")))
  {
    objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsLuxBuckets"), "lastObject"), "floatValue");
    v9 = *(float *)&v10;
    *(float *)&v10 = v66;
    if (v66 <= v9)
    {
      for (i = 0;
            i < (unint64_t)(-[NSMutableArray count](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v10), "thresholdsLuxBuckets"), "count")- 1);
            ++i)
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsLuxBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
        v14 = *(float *)&v10;
        *(float *)&v10 = v66;
        if (v66 >= v14)
        {
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsLuxBuckets"), "objectAtIndexedSubscript:", i + 1), "floatValue");
          v15 = *(float *)&v10;
          *(float *)&v10 = v66;
          if (v66 < v15)
          {
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v10), "thresholdsDeltaPBrightenBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
            Pthreshold_brighten = v16;
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsDeltaPDimBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
            Pthreshold_dim = v17;
            v56 = 0;
            if (v70->super._logHandle)
            {
              logHandle = v70->super._logHandle;
            }
            else
            {
              v31 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
              logHandle = v31;
            }
            v56 = logHandle;
            v55 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_0_4_8_0_4_0_8_0_8_0((uint64_t)v74, COERCE__INT64(v66), i, COERCE__INT64(Pthreshold_brighten), COERCE__INT64(Pthreshold_dim));
              _os_log_impl(&dword_1B5291000, v56, v55, "AOP thresholds: lux %f - bucket[%d] => AOP P delta thresholds: Brighten = %f; Dim = %f",
                v74,
                0x26u);
            }
          }
        }
      }
    }
    else
    {
      objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v10), "thresholdsDeltaPBrightenBuckets"), "lastObject"), "floatValue");
      Pthreshold_brighten = v11;
      objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsDeltaPDimBuckets"), "lastObject"), "floatValue");
      Pthreshold_dim = v12;
      oslog = 0;
      if (v70->super._logHandle)
      {
        v34 = v70->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v34 = inited;
      }
      oslog = v34;
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsLuxBuckets"), "lastObject"), "floatValue");
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v75, COERCE__INT64(v66), COERCE__INT64(v13), COERCE__INT64(Pthreshold_brighten), COERCE__INT64(Pthreshold_dim));
        _os_log_impl(&dword_1B5291000, oslog, type, "AOP thresholds: lux %f > %f => AOP P delta thresholds: Brighten = %f; Dim = %f",
          v75,
          0x2Au);
      }
    }
  }
  else
  {
    v54 = 0;
    if (v70->super._logHandle)
    {
      v30 = v70->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v29 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v29 = init_default_corebrightness_log();
      v30 = v29;
    }
    v54 = v30;
    v53 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v73, COERCE__INT64(Pthreshold_brighten), COERCE__INT64(Pthreshold_dim));
      _os_log_error_impl(&dword_1B5291000, v54, v53, "AOP thresholds: buckets have different sizes -> use defaults delta P thresholds: Brighten = %f; Dim = %f.",
        v73,
        0x16u);
    }
  }
  v52 = fminf(1.0, v62 + Pthreshold_brighten);
  v51 = fmaxf(0.0, v62 - Pthreshold_dim);
  v50 = BUPerceptualToLuminance(v52, v64, v65);
  v49 = BUPerceptualToLuminance(v51, v64, v65);
  v50 = fminf(v50, v63);
  v48 = 0.0;
  v28 = +[CBAODState sharedInstance](CBAODState, "sharedInstance");
  if (v28)
    -[CBAODState darkerCurve](v28, "darkerCurve");
  else
    memset(__b, 0, sizeof(__b));
  v48 = BULuminanceToIlluminance(__b, v50);
  v46 = 0.0;
  v26 = v49;
  v27 = +[CBAODState sharedInstance](CBAODState, "sharedInstance");
  if (v27)
    -[CBAODState darkerCurve](v27, "darkerCurve");
  else
    memset(v45, 0, sizeof(v45));
  v46 = BULuminanceToIlluminance(v45, v26);
  if (v50 >= v63)
    v48 = 150000.0;
  if (v49 <= v64)
    v46 = 0.0;
  v44 = v66 * 1.15;
  v43 = v66 * 0.85;
  v48 = fminf(150000.0, fmaxf(v48, v66 * 1.15));
  v46 = fmaxf(0.0, fminf(v46, v66 * 0.85));
  if (!v70->_brightenLuxThresholdOverriden)
    v70->_brightenLuxThreshold = v48;
  if (!v70->_dimLuxThresholdOverriden)
    v70->_dimLuxThreshold = v46;
  v42 = 0;
  if (v70->super._logHandle)
  {
    v25 = v70->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v24 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v24 = init_default_corebrightness_log();
    v25 = v24;
  }
  v42 = v25;
  v41 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_8_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v72, COERCE__INT64(v70->_brightenLuxThreshold), COERCE__INT64(v70->_dimLuxThreshold), COERCE__INT64(v50), COERCE__INT64(v49), COERCE__INT64(v66), COERCE__INT64(v68), COERCE__INT64(v63), COERCE__INT64(v67));
    _os_log_impl(&dword_1B5291000, v42, v41, "AOP thresholds: lux brighten = %f, dim = %f; nits brighten = %f, dim = %f; Current lux = %f, current nits = %f; Ni"
      "ts cap = %f, brt limit = %f",
      v72,
      0x52u);
  }
  memset(v39, 0, sizeof(v39));
  obj = v70->_alsServiceClients;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", v39, v71, 16);
  if (v23)
  {
    v19 = *(_QWORD *)v39[2];
    v20 = 0;
    v21 = v23;
    while (1)
    {
      v18 = v20;
      if (*(_QWORD *)v39[2] != v19)
        objc_enumerationMutation(obj);
      v40 = 0;
      v40 = *(id *)(v39[1] + 8 * v20);
      objc_msgSend(v40, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(v70->_brightenLuxThreshold * 4294967300.0)), CFSTR("ALSLuxBrightenThreshold"));
      objc_msgSend(v40, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(v70->_dimLuxThreshold * 4294967300.0)), CFSTR("ALSLuxDimThreshold"));
      ++v20;
      if (v18 + 1 >= v21)
      {
        v20 = 0;
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", v39, v71, 16);
        if (!v21)
          break;
      }
    }
  }
}

- (id)copyPdeltaThresholdsForLux:(float)a3
{
  float v3;
  double v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  id v12;
  double v13;
  id v14;
  double v15;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *logHandle;
  uint64_t inited;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int i;
  float AP_Pthreshold_dim;
  float AP_Pthreshold_brighten;
  uint8_t v33[32];
  uint8_t v34[48];
  uint8_t v35[56];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  self->_currentLux = a3;
  AP_Pthreshold_brighten = self->_AP_Pthreshold_brighten;
  AP_Pthreshold_dim = self->_AP_Pthreshold_dim;
  v24 = -[NSMutableArray count](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPLuxBuckets"), "count");
  if (v24 == -[NSMutableArray count](-[CBAODState thresholdsAPDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPDeltaPBrightenBuckets"), "count")&& (v23 = -[NSMutableArray count](-[CBAODState thresholdsAPDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPDeltaPBrightenBuckets"), "count"), v23 == -[NSMutableArray count](-[CBAODState thresholdsAPDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPDeltaPDimBuckets"), "count")))
  {
    objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPLuxBuckets"), "lastObject"), "floatValue");
    v3 = *(float *)&v4;
    *(float *)&v4 = a3;
    if (a3 <= v3)
    {
      for (i = 0;
            i < (unint64_t)(-[NSMutableArray count](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v4), "thresholdsAPLuxBuckets"), "count")- 1);
            ++i)
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPLuxBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
        v8 = *(float *)&v4;
        *(float *)&v4 = a3;
        if (a3 >= v8)
        {
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPLuxBuckets"), "objectAtIndexedSubscript:", i + 1), "floatValue");
          v9 = *(float *)&v4;
          *(float *)&v4 = a3;
          if (a3 < v9)
          {
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsAPDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v4), "thresholdsAPDeltaPBrightenBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
            AP_Pthreshold_brighten = v10;
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsAPDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPDeltaPDimBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
            AP_Pthreshold_dim = v11;
            if (self->super._logHandle)
            {
              logHandle = self->super._logHandle;
            }
            else
            {
              v19 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
              logHandle = v19;
            }
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
            {
              __os_log_helper_16_0_4_8_0_4_0_8_0_8_0((uint64_t)v34, COERCE__INT64(a3), i, COERCE__INT64(AP_Pthreshold_brighten), COERCE__INT64(AP_Pthreshold_dim));
              _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "AP thresholds: lux %f - bucket[%d] => CoreBrightness-AP side P delta thresholds: Brighten = %f; Dim = %f",
                v34,
                0x26u);
            }
          }
        }
      }
    }
    else
    {
      objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsAPDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v4), "thresholdsAPDeltaPBrightenBuckets"), "lastObject"), "floatValue");
      AP_Pthreshold_brighten = v5;
      objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsAPDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPDeltaPDimBuckets"), "lastObject"), "floatValue");
      AP_Pthreshold_dim = v6;
      if (self->super._logHandle)
      {
        v22 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v22 = inited;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPLuxBuckets"), "lastObject"), "floatValue");
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v35, COERCE__INT64(a3), COERCE__INT64(v7), COERCE__INT64(AP_Pthreshold_brighten), COERCE__INT64(AP_Pthreshold_dim));
        _os_log_impl(&dword_1B5291000, v22, OS_LOG_TYPE_DEFAULT, "AP thresholds: lux %f > %f => CoreBrightness-AP side P delta thresholds: Brighten = %f; Dim = %f",
          v35,
          0x2Au);
      }
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      v18 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v17 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v17 = init_default_corebrightness_log();
      v18 = v17;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v33, COERCE__INT64(AP_Pthreshold_brighten), COERCE__INT64(AP_Pthreshold_dim));
      _os_log_error_impl(&dword_1B5291000, v18, OS_LOG_TYPE_ERROR, "AP thresholds: buckets have different sizes -> use defaults delta P thresholds: Brighten = %f; Dim = %f.",
        v33,
        0x16u);
    }
  }
  v12 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v13 = AP_Pthreshold_brighten;
  v27 = (void *)objc_msgSend(v12, "initWithFloat:", v13);
  v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v15 = AP_Pthreshold_dim;
  v26 = (void *)objc_msgSend(v14, "initWithFloat:", v15);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v27, CFSTR("ALSBrightenPdeltaSlow"), v26, CFSTR("ALSDimPdeltaSlow"), 0);

  return v25;
}

- (BOOL)thresholdsCrossedForLux:(float)a3
{
  BOOL v4;

  if (self->_dimLuxThreshold < 0.0 || self->_brightenLuxThreshold < 0.0)
    return 1;
  v4 = a3 <= self->_dimLuxThreshold;
  if (a3 >= self->_brightenLuxThreshold)
    return 1;
  return v4;
}

- (float)brightenLuxThreshold
{
  return self->_brightenLuxThreshold;
}

- (void)setBrightenLuxThreshold:(float)a3
{
  self->_brightenLuxThreshold = a3;
}

- (float)dimLuxThreshold
{
  return self->_dimLuxThreshold;
}

- (void)setDimLuxThreshold:(float)a3
{
  self->_dimLuxThreshold = a3;
}

@end
