@implementation HMIPreference

+ (HMIPreference)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__HMIPreference_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (HMIPreference *)(id)sharedInstance_instance_0;
}

void __31__HMIPreference_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v1;

}

+ (NSDictionary)qosMap
{
  if (qosMap_onceToken != -1)
    dispatch_once(&qosMap_onceToken, &__block_literal_global_31);
  return (NSDictionary *)(id)qosMap_map;
}

void __23__HMIPreference_qosMap__block_invoke()
{
  void *v0;

  v0 = (void *)qosMap_map;
  qosMap_map = (uint64_t)&unk_24DC156D0;

}

+ (BOOL)isInternalInstall
{
  return MGGetBoolAnswer();
}

+ (BOOL)pretendProductTypeIsUnknown
{
  return _pretendProductTypeIsUnknown;
}

+ (void)setPretendProductTypeIsUnknown:(BOOL)a3
{
  _pretendProductTypeIsUnknown = a3;
}

+ (int)productType
{
  if ((objc_msgSend(a1, "pretendProductTypeIsUnknown") & 1) != 0)
    return -1;
  else
    return MGGetProductType();
}

+ (BOOL)isProductTypeJ42
{
  return objc_msgSend(a1, "productType") == 1110205732;
}

+ (BOOL)isProductTypeJ105
{
  return objc_msgSend(a1, "productType") == 33245053;
}

+ (BOOL)isProductTypeJ305
{
  return objc_msgSend(a1, "productType") == 1114644381;
}

+ (BOOL)isProductTypeJ255
{
  return objc_msgSend(a1, "productType") == 3865897231;
}

+ (BOOL)isProductTypeB238
{
  return objc_msgSend(a1, "productType") == 4240173202 || objc_msgSend(a1, "productType") == 2702125347;
}

+ (BOOL)isProductTypeB520
{
  return objc_msgSend(a1, "productType") == 3348380076;
}

+ (BOOL)isProductTypeB620
{
  return objc_msgSend(a1, "productType") == 1540760353;
}

+ (BOOL)isAudioAccessory
{
  return +[HMIPreference isProductTypeB238](HMIPreference, "isProductTypeB238")
      || +[HMIPreference isProductTypeB520](HMIPreference, "isProductTypeB520")
      || +[HMIPreference isProductTypeB620](HMIPreference, "isProductTypeB620");
}

- (BOOL)usesCPUOnly
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = +[HMIPreference isProductTypeJ105](HMIPreference, "isProductTypeJ105");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIPreference numberPreferenceForKey:defaultValue:withMap:](self, "numberPreferenceForKey:defaultValue:withMap:", CFSTR("processingDevice"), v4, &unk_24DC156F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)shouldUseCPUOnlyForVisionFaceDetection
{
  return +[HMIPreference isProductTypeB520](HMIPreference, "isProductTypeB520")
      || +[HMIPreference isProductTypeB620](HMIPreference, "isProductTypeB620");
}

- (unint64_t)maxConcurrentAnalyzersForCurrentThermalLevel
{
  void *v2;
  uint64_t v3;
  unint64_t result;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[HMIThermalMonitor sharedInstance](HMIThermalMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "thermalLevel");

  if (+[HMIPreference isProductTypeJ105](HMIPreference, "isProductTypeJ105"))
  {
    result = 0;
    v5 = xmmword_219E9D490;
    v6 = xmmword_219E9D4A0;
    v7 = 0x3FF0000000000000;
    do
    {
      if (*((double *)&v5 + result) <= (double)v3)
        break;
      ++result;
    }
    while (result != 5);
  }
  else if (+[HMIPreference isProductTypeB238](HMIPreference, "isProductTypeB238"))
  {
    result = 0;
    while (dbl_219E9D4B0[result] > (double)v3)
    {
      if (++result == 3)
        return 2;
    }
  }
  else if (+[HMIPreference isProductTypeB520](HMIPreference, "isProductTypeB520"))
  {
    return 2 * (v3 < 10);
  }
  else if (+[HMIPreference isProductTypeB620](HMIPreference, "isProductTypeB620"))
  {
    if (v3 <= 9)
      return 3;
    else
      return 0;
  }
  else if (+[HMIPreference isProductTypeJ255](HMIPreference, "isProductTypeJ255"))
  {
    result = 0;
    v5 = xmmword_219E9D470;
    v6 = xmmword_219E9D480;
    v7 = 0x4010000000000000;
    do
    {
      if (*((double *)&v5 + result) <= (double)v3)
        break;
      ++result;
    }
    while (result != 5);
  }
  else
  {
    return 5;
  }
  return result;
}

- (unint64_t)maxConcurrentAnalyzersForCurrentPeakPowerPressureLevel
{
  void *v2;
  uint64_t v3;

  +[HMIPeakPowerPressureMonitor sharedInstance](HMIPeakPowerPressureMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "peakPowerPressureLevel");

  if (+[HMIPreference isProductTypeJ255](HMIPreference, "isProductTypeJ255")
    && (unint64_t)(v3 - 1) <= 3)
  {
    return qword_219E9D4C8[v3 - 1];
  }
  else
  {
    return 5;
  }
}

- (unint64_t)maxConcurrentAnalyzersForSystemResourceUsageLevel:(int64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;

  v5 = -[HMIPreference maxConcurrentAnalyzersForCurrentThermalLevel](self, "maxConcurrentAnalyzersForCurrentThermalLevel");
  v6 = -[HMIPreference maxConcurrentAnalyzersForCurrentPeakPowerPressureLevel](self, "maxConcurrentAnalyzersForCurrentPeakPowerPressureLevel");
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  v8 = +[HMIPreference isProductTypeJ105](HMIPreference, "isProductTypeJ105");
  v9 = 3;
  if (v7 < 3)
    v9 = v7;
  if (a3 > 1 && v8)
    v10 = v9;
  else
    v10 = v7;
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "productClass");

  if (v12 != 3 || a3 <= 2)
    v14 = v10;
  else
    v14 = 0;
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberPreferenceForKey:defaultValue:", CFSTR("maxConcurrentAnalyzers"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (int)objc_msgSend(v17, "intValue");

  return v18;
}

- (BOOL)shouldEnableTorsoRecognition
{
  void *v3;
  char v4;

  if (+[HMIPreference isProductTypeB238](HMIPreference, "isProductTypeB238")
    || +[HMIPreference isProductTypeJ42](HMIPreference, "isProductTypeJ42"))
  {
    return 0;
  }
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLPreferenceForKey:defaultValue:", CFSTR("enableTorsoRecognition"), 1);

  return v4;
}

- (double)maxAnalysisFPSForCurrentThermalLevel
{
  void *v2;
  uint64_t v3;
  double result;

  +[HMIThermalMonitor sharedInstance](HMIThermalMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "thermalLevel");

  if (!+[HMIPreference isProductTypeB238](HMIPreference, "isProductTypeB238")
    || (result = 0.125, v3 <= 3) && (result = 0.25, v3 != 3) && (result = 0.5, v3 <= 1))
  {
    if (!+[HMIPreference isProductTypeJ105](HMIPreference, "isProductTypeJ105")
      || (result = 0.125, v3 <= 3) && (result = 0.25, v3 != 3) && (result = 0.5, v3 <= 1))
    {
      if (!+[HMIPreference isProductTypeB520](HMIPreference, "isProductTypeB520")
        || (result = 0.125, v3 <= 7) && (result = 0.25, v3 != 7) && (result = 0.5, v3 <= 5))
      {
        if (!+[HMIPreference isProductTypeB620](HMIPreference, "isProductTypeB620")
          || (result = 0.125, v3 <= 7) && (result = 0.25, v3 != 7) && (result = 0.5, v3 <= 5))
        {
          if (!+[HMIPreference isProductTypeJ255](HMIPreference, "isProductTypeJ255"))
            return 1.0;
          result = 0.125;
          if (v3 <= 3)
          {
            result = 0.25;
            if (v3 != 3)
            {
              result = 0.5;
              if (v3 <= 1)
                return 1.0;
            }
          }
        }
      }
    }
  }
  return result;
}

- (double)maxAnalysisFPSForCurrentPeakPowerPressureLevel
{
  void *v2;
  uint64_t v3;
  _BOOL4 v4;
  double result;

  +[HMIPeakPowerPressureMonitor sharedInstance](HMIPeakPowerPressureMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "peakPowerPressureLevel");

  v4 = +[HMIPreference isProductTypeJ255](HMIPreference, "isProductTypeJ255");
  result = 1.0;
  if (v4 && (unint64_t)(v3 - 2) <= 2)
    return dbl_219E9D4E8[v3 - 2];
  return result;
}

- (double)maxAnalysisFPSForSystemResourceUsageLevel:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  -[HMIPreference maxAnalysisFPSForCurrentThermalLevel](self, "maxAnalysisFPSForCurrentThermalLevel");
  v6 = v5;
  -[HMIPreference maxAnalysisFPSForCurrentPeakPowerPressureLevel](self, "maxAnalysisFPSForCurrentPeakPowerPressureLevel");
  if (v6 >= v7)
    v6 = v7;
  v8 = +[HMIPreference isProductTypeJ105](HMIPreference, "isProductTypeJ105");
  v9 = fmin(v6, 0.5);
  if (a3 > 1 && v8)
    v6 = v9;
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberPreferenceForKey:defaultValue:", CFSTR("maxAnalysisFPS"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  return v14;
}

- (BOOL)isIdle
{
  return 1;
}

- (BOOL)shouldGenerateThumbnailForAnalysisFPS:(double)a3
{
  return a3 >= 0.4;
}

- (unsigned)analysisQOS
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIPreference qosMap](HMIPreference, "qosMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberPreferenceForKey:defaultValue:withMap:", CFSTR("analysisQOS"), &unk_24DC148E8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  return v5;
}

- (HMIPreference)init
{
  HMIPreference *v2;
  HMIPreference *v3;
  uint64_t v4;
  HMFTimer *preferenceCacheFlushTimer;
  uint64_t v6;
  NSMutableDictionary *preferenceCache;
  uint64_t v8;
  NSMutableDictionary *preferenceLoggedValues;
  uint64_t v10;
  NSMutableDictionary *preferenceOverridesInternal;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMIPreference;
  v2 = -[HMIPreference init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 12, 8.0);
    preferenceCacheFlushTimer = v3->_preferenceCacheFlushTimer;
    v3->_preferenceCacheFlushTimer = (HMFTimer *)v4;

    -[HMFTimer setDelegate:](v3->_preferenceCacheFlushTimer, "setDelegate:", v3);
    -[HMFTimer resume](v3->_preferenceCacheFlushTimer, "resume");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    preferenceCache = v3->_preferenceCache;
    v3->_preferenceCache = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    preferenceLoggedValues = v3->_preferenceLoggedValues;
    v3->_preferenceLoggedValues = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    preferenceOverridesInternal = v3->_preferenceOverridesInternal;
    v3->_preferenceOverridesInternal = (NSMutableDictionary *)v10;

  }
  return v3;
}

- (void)timerDidFire:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x220735570]();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIPreference preferenceCache](self, "preferenceCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
  objc_autoreleasePoolPop(v4);

}

- (NSDictionary)preferenceOverrides
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIPreference preferenceOverridesInternal](self, "preferenceOverridesInternal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v5;
}

- (void)addPreferenceOverrideFromDictionary:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIPreference preferenceOverridesInternal](self, "preferenceOverridesInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)setPreferenceOverrideFromDictionary:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIPreference preferenceOverridesInternal](self, "preferenceOverridesInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HMIPreference preferenceOverridesInternal](self, "preferenceOverridesInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllPreferenceOverrides
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIPreference preferenceOverridesInternal](self, "preferenceOverridesInternal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
}

- (void)logPreferenceForKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  id v10;
  void *v11;
  HMIPreference *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIPreference preferenceLoggedValues](self, "preferenceLoggedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v7 && (objc_msgSend(v10, "isEqual:", v7) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x220735570]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v14;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Preference %@ is now %@, previously was %@", (uint8_t *)&v16, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    -[HMIPreference preferenceLoggedValues](v12, "preferenceLoggedValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, v6);
    else
      objc_msgSend(v15, "removeObjectForKey:", v6);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)systemPreferenceValueForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIPreference preferenceOverridesInternal](self, "preferenceOverridesInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v7)
    goto LABEL_2;
  os_unfair_lock_lock_with_options();
  -[HMIPreference preferenceCache](self, "preferenceCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v11)
      goto LABEL_12;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F290]), "initWithKey:options:domain:defaultValue:", v4, 0, CFSTR("com.apple.homed"), 0);
    objc_msgSend(v12, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIPreference preferenceCache](self, "preferenceCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, v4);

LABEL_12:
      os_unfair_lock_unlock(p_lock);
      v7 = 0;
      goto LABEL_2;
    }
    -[HMIPreference preferenceCache](self, "preferenceCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, v4);

  }
  os_unfair_lock_unlock(p_lock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Only NSNumber and NSString properties are supported."), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
  }
LABEL_2:
  v8 = v7;

  return v8;
}

- (id)numberPreferenceForKey:(id)a3 defaultValue:(id)a4 withParser:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = v9;
  -[HMIPreference systemPreferenceValueForKey:](self, "systemPreferenceValueForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v12)
  {
    v10[2](v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v13 = v11;
    if (v14)
    {
      v13 = v14;

    }
  }
  -[HMIPreference logPreferenceForKey:value:](self, "logPreferenceForKey:value:", v8, v13);

  return v13;
}

- (id)numberPreferenceForKey:(id)a3 defaultValue:(id)a4 withMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  -[HMIPreference systemPreferenceValueForKey:](self, "systemPreferenceValueForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objectAsString(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v11;
  if (v13)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v10;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    v14 = v11;
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      v14 = v11;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (!objc_msgSend(v13, "caseInsensitiveCompare:", v20))
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v20);
            v21 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v21;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    v10 = v23;
  }
  -[HMIPreference logPreferenceForKey:value:](self, "logPreferenceForKey:value:", v8, v14);

  return v14;
}

- (id)valuePreferenceForKey:(id)a3 defaultValue:(id)a4 withParser:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = v9;
  -[HMIPreference systemPreferenceValueForKey:](self, "systemPreferenceValueForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v12)
  {
    v10[2](v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v13 = v11;
    if (v14)
    {
      v13 = v14;

    }
  }
  -[HMIPreference logPreferenceForKey:value:](self, "logPreferenceForKey:value:", v8, v13);

  return v13;
}

- (id)valuePreferenceForKey:(id)a3 defaultValue:(id)a4 withMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  -[HMIPreference systemPreferenceValueForKey:](self, "systemPreferenceValueForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objectAsString(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v11;
  if (v13)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v10;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    v14 = v11;
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      v14 = v11;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (!objc_msgSend(v13, "caseInsensitiveCompare:", v20))
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v20);
            v21 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v21;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    v10 = v23;
  }
  -[HMIPreference logPreferenceForKey:value:](self, "logPreferenceForKey:value:", v8, v14);

  return v14;
}

- (id)numberPreferenceForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  -[HMIPreference systemPreferenceValueForKey:](self, "systemPreferenceValueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objectAsNumber(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v7;
  if (v9)
  {
    v10 = v9;

  }
  -[HMIPreference logPreferenceForKey:value:](self, "logPreferenceForKey:value:", v6, v10);

  return v10;
}

- (id)numberPreferenceForKey:(id)a3
{
  void *v3;
  void *v4;

  -[HMIPreference systemPreferenceValueForKey:](self, "systemPreferenceValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objectAsNumber(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasPreferenceForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[HMIPreference systemPreferenceValueForKey:](self, "systemPreferenceValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)BOOLPreferenceForKey:(id)a3 defaultValue:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIPreference numberPreferenceForKey:defaultValue:](self, "numberPreferenceForKey:defaultValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "BOOLValue");
  return (char)v6;
}

- (id)stringPreferenceForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  -[HMIPreference systemPreferenceValueForKey:](self, "systemPreferenceValueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objectAsString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v7;
  if (v9)
  {
    v10 = v9;

  }
  -[HMIPreference logPreferenceForKey:value:](self, "logPreferenceForKey:value:", v6, v10);

  return v10;
}

- (HMFTimer)preferenceCacheFlushTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)preferenceCache
{
  return self->_preferenceCache;
}

- (NSMutableDictionary)preferenceLoggedValues
{
  return self->_preferenceLoggedValues;
}

- (NSMutableDictionary)preferenceOverridesInternal
{
  return self->_preferenceOverridesInternal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceOverridesInternal, 0);
  objc_storeStrong((id *)&self->_preferenceLoggedValues, 0);
  objc_storeStrong((id *)&self->_preferenceCache, 0);
  objc_storeStrong((id *)&self->_preferenceCacheFlushTimer, 0);
}

@end
