@implementation HMIVideoAnalyzerScheduler

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HMIVideoAnalyzerScheduler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_instance;
}

void __43__HMIVideoAnalyzerScheduler_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (HMIVideoAnalyzerScheduler)init
{
  HMIVideoAnalyzerScheduler *v2;
  HMIVideoAnalyzerScheduler *v3;
  uint64_t v4;
  HMFTimer *tick;
  uint64_t v6;
  NSPointerArray *internalAnalyzers;
  HMISystemResourceUsageMonitor *v8;
  HMISystemResourceUsageMonitor *usageMonitor;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HMIVideoAnalyzerScheduler;
  v2 = -[HMIVideoAnalyzerScheduler init](&v20, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  v2->_lock._os_unfair_lock_opaque = 0;
  v2->_registerLock._os_unfair_lock_opaque = 0;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 28, 1.0);
  tick = v3->_tick;
  v3->_tick = (HMFTimer *)v4;

  -[HMFTimer setDelegate:](v3->_tick, "setDelegate:", v3);
  objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
  v6 = objc_claimAutoreleasedReturnValue();
  internalAnalyzers = v3->_internalAnalyzers;
  v3->_internalAnalyzers = (NSPointerArray *)v6;

  v8 = objc_alloc_init(HMISystemResourceUsageMonitor);
  usageMonitor = v3->_usageMonitor;
  v3->_usageMonitor = v8;

  -[HMISystemResourceUsageMonitor setDelegate:](v3->_usageMonitor, "setDelegate:", v3);
  -[HMISystemResourceUsageMonitor start](v3->_usageMonitor, "start");
  v3->_ignoreThermalAndSystemResourceUsageLevel = 0;
  if (+[HMIPreference isProductTypeB620](HMIPreference, "isProductTypeB620"))
  {
    v10 = 3;
  }
  else if (+[HMIPreference isAudioAccessory](HMIPreference, "isAudioAccessory"))
  {
    v10 = 2;
  }
  else
  {
    v10 = 5;
  }
  v3->_maxH264VideoDecoders = v10;
  v11 = +[HMIPreference isAudioAccessory](HMIPreference, "isAudioAccessory");
  v12 = 4;
  if (v11)
    v12 = 2;
  v3->_maxH264VideoEncoders = v12;
  v3->_maxH265VideoEncoders = 0;
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "BOOLPreferenceForKey:defaultValue:", CFSTR("useHEVC"), 1))
  {
    if (+[HMIPreference isProductTypeJ305](HMIPreference, "isProductTypeJ305")
      || +[HMIPreference isProductTypeJ105](HMIPreference, "isProductTypeJ105"))
    {

    }
    else
    {
      v19 = +[HMIPreference isProductTypeJ255](HMIPreference, "isProductTypeJ255");

      if (!v19)
        goto LABEL_15;
    }
    v3->_maxH265VideoEncoders = v3->_maxH264VideoEncoders;
    v3->_maxH264VideoEncoders = 0;
  }
  else
  {

  }
LABEL_15:
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberPreferenceForKey:", CFSTR("maxH265Encoders"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v3->_maxH265VideoEncoders = objc_msgSend(v15, "unsignedIntegerValue");
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberPreferenceForKey:", CFSTR("maxH264Encoders"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v3->_maxH264VideoEncoders = objc_msgSend(v17, "unsignedIntegerValue");

  return v3;
}

- (void)registerAnalyzer:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSPointerArray hmf_addObject:](self->_internalAnalyzers, "hmf_addObject:", v4);
  -[HMFTimer resume](self->_tick, "resume");
  os_unfair_lock_unlock(&self->_lock);

}

- (id)analyzerWithConfiguration:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  os_unfair_lock_lock_with_options();
  -[HMIVideoAnalyzerScheduler reducedConfiguration:](self, "reducedConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerScheduler registerAnalyzer:](self, "registerAnalyzer:", v9);
  os_unfair_lock_unlock(&self->_registerLock);

  return v9;
}

- (NSArray)analyzerConfigurations
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x220735570](self, a2);
  -[HMIVideoAnalyzerScheduler analyzers](self, "analyzers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSArray *)v5;
}

uint64_t __51__HMIVideoAnalyzerScheduler_analyzerConfigurations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "configuration");
}

- (NSArray)analyzerStates
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x220735570](self, a2);
  -[HMIVideoAnalyzerScheduler analyzers](self, "analyzers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_51);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSArray *)v5;
}

uint64_t __43__HMIVideoAnalyzerScheduler_analyzerStates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state");
}

- (id)reducedConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMIVideoAnalyzerScheduler analyzerConfigurations](self, "analyzerConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerScheduler reducedConfiguration:configurations:](self, "reducedConfiguration:configurations:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reducedConfiguration:(id)a3 states:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "na_map:", &__block_literal_global_53);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerScheduler reducedConfiguration:configurations:](self, "reducedConfiguration:configurations:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __57__HMIVideoAnalyzerScheduler_reducedConfiguration_states___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "configuration");
}

- (id)reducedConfiguration:(id)a3 configurations:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  HMIVideoAnalyzerScheduler *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  HMIVideoAnalyzerScheduler *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  HMIVideoAnalyzerScheduler *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v34;
  HMIVideoAnalyzerScheduler *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  HMIVideoAnalyzerScheduler *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[7];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "allowReducedConfiguration") & 1) != 0)
  {
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __65__HMIVideoAnalyzerScheduler_reducedConfiguration_configurations___block_invoke;
    v52[3] = &unk_24DBECF28;
    v52[4] = &v61;
    v52[5] = &v57;
    v52[6] = &v53;
    objc_msgSend(v7, "na_each:", v52);
    v8 = (id)objc_msgSend(v6, "copy");
    if (!-[HMIVideoAnalyzerScheduler ignoreThermalAndSystemResourceUsageLevel](self, "ignoreThermalAndSystemResourceUsageLevel"))
    {
      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerScheduler setMaxH264VideoDecoders:](self, "setMaxH264VideoDecoders:", objc_msgSend(v9, "maxConcurrentAnalyzersForSystemResourceUsageLevel:", self->_usageLevel));

    }
    if (objc_msgSend(v8, "decodeMode"))
    {
      v10 = v62[3];
      if (v10 >= -[HMIVideoAnalyzerScheduler maxH264VideoDecoders](self, "maxH264VideoDecoders"))
      {
        v11 = (void *)MEMORY[0x220735570]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v62[3];
          *(_DWORD *)buf = 138543618;
          v66 = v14;
          v67 = 2048;
          v68 = v15;
          _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Cannot decode additional streams using H.264, %lu H.264 decoders are already being used.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v8, "setDecodeMode:", 0);
      }
    }
    if (objc_msgSend(v8, "decodeMode"))
    {
      if (objc_msgSend(v8, "transcode"))
      {
        v16 = v54[3];
        if (v16 >= -[HMIVideoAnalyzerScheduler maxH265VideoEncoders](self, "maxH265VideoEncoders"))
        {
          v17 = (void *)MEMORY[0x220735570]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v54[3];
            *(_DWORD *)buf = 138543618;
            v66 = v20;
            v67 = 2048;
            v68 = v21;
            _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Cannot transcode additional streams using H.265, %lu H.265 encoders are already being used, trying with H.264.", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
          v22 = v58[3];
          if (v22 >= -[HMIVideoAnalyzerScheduler maxH264VideoEncoders](v18, "maxH264VideoEncoders"))
          {
            v23 = (void *)MEMORY[0x220735570]();
            v24 = v18;
            HMFGetOSLogHandle();
            v25 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v58[3];
              *(_DWORD *)buf = 138543618;
              v66 = v26;
              v67 = 2048;
              v68 = v27;
              _os_log_impl(&dword_219D45000, v25, OS_LOG_TYPE_INFO, "%{public}@Cannot transcode additional streams, %lu H.264 encoders are already being used.", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v23);
            objc_msgSend(v8, "setTranscode:", 0);
          }
          else
          {
            ++v58[3];
            objc_msgSend(v8, "setTranscodeCodecType:", 1635148593);
          }
        }
        else
        {
          ++v54[3];
          objc_msgSend(v8, "setTranscodeCodecType:", 1752589105);
        }
      }
      if (v8)
      {
        objc_msgSend(v8, "timelapseInterval");
        if ((v50 & 0x100000000) != 0)
        {
          v28 = v54[3];
          if (v28 >= -[HMIVideoAnalyzerScheduler maxH265VideoEncoders](self, "maxH265VideoEncoders"))
          {
            v34 = (void *)MEMORY[0x220735570]();
            v35 = self;
            HMFGetOSLogHandle();
            v36 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v54[3];
              *(_DWORD *)buf = 138543618;
              v66 = v37;
              v67 = 2048;
              v68 = v38;
              _os_log_impl(&dword_219D45000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Cannot encode timelapse using H.265, %lu H.265 encoders are already being used, trying with H.264.", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v34);
            v39 = v58[3];
            if (v39 >= -[HMIVideoAnalyzerScheduler maxH264VideoEncoders](v35, "maxH264VideoEncoders"))
            {
              v40 = (void *)MEMORY[0x220735570]();
              v41 = v35;
              HMFGetOSLogHandle();
              v42 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v58[3];
                *(_DWORD *)buf = 138543618;
                v66 = v43;
                v67 = 2048;
                v68 = v44;
                _os_log_impl(&dword_219D45000, v42, OS_LOG_TYPE_INFO, "%{public}@Cannot encode timelapse, %lu H.264 encoders are already being used.", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v40);
              v47 = *MEMORY[0x24BDC0D40];
              v48 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
              objc_msgSend(v8, "setTimelapseInterval:", &v47);
            }
            else
            {
              ++v58[3];
              objc_msgSend(v8, "setTimelapseCodecType:", 1635148593);
            }
          }
          else
          {
            ++v54[3];
            objc_msgSend(v8, "setTimelapseCodecType:", 1752589105);
          }
        }
      }
      else
      {
        v49 = 0;
        v50 = 0;
        v51 = 0;
      }
    }
    else
    {
      objc_msgSend(v8, "setTranscode:", 0);
      v45 = *MEMORY[0x24BDC0D40];
      v46 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
      objc_msgSend(v8, "setTimelapseInterval:", &v45);
    }
    if (!-[HMIVideoAnalyzerScheduler ignoreThermalAndSystemResourceUsageLevel](self, "ignoreThermalAndSystemResourceUsageLevel"))
    {
      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "maxAnalysisFPSForSystemResourceUsageLevel:", self->_usageLevel);
      v31 = v30;

      objc_msgSend(v6, "analysisFPS");
      if (v31 < v32)
        v32 = v31;
      objc_msgSend(v8, "setAnalysisFPS:", v32);
    }
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

void __65__HMIVideoAnalyzerScheduler_reducedConfiguration_configurations___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = a2;
  if (objc_msgSend(v3, "decodeMode"))
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (objc_msgSend(v3, "transcode"))
  {
    if (objc_msgSend(v3, "transcodeCodecType") == 1635148593)
    {
      v4 = a1[5];
LABEL_8:
      ++*(_QWORD *)(*(_QWORD *)(v4 + 8) + 24);
      goto LABEL_9;
    }
    if (objc_msgSend(v3, "transcodeCodecType") == 1752589105)
    {
      v4 = a1[6];
      goto LABEL_8;
    }
  }
LABEL_9:
  if (v3)
  {
    objc_msgSend(v3, "timelapseInterval");
    if ((v6 & 1) != 0)
    {
      if (objc_msgSend(v3, "timelapseCodecType") == 1635148593)
      {
        v5 = a1[5];
LABEL_16:
        ++*(_QWORD *)(*(_QWORD *)(v5 + 8) + 24);
        goto LABEL_17;
      }
      if (objc_msgSend(v3, "timelapseCodecType") == 1752589105)
      {
        v5 = a1[6];
        goto LABEL_16;
      }
    }
  }
LABEL_17:

}

- (void)_compactInternalAnalyzers
{
  -[NSPointerArray addPointer:](self->_internalAnalyzers, "addPointer:", 0);
  -[NSPointerArray compact](self->_internalAnalyzers, "compact");
}

- (void)timerDidFire:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v4 = (void *)MEMORY[0x220735570]();
  os_unfair_lock_lock_with_options();
  -[HMIVideoAnalyzerScheduler _compactInternalAnalyzers](self, "_compactInternalAnalyzers");
  if (!-[NSPointerArray count](self->_internalAnalyzers, "count"))
    -[HMFTimer suspend](self->_tick, "suspend");
  os_unfair_lock_unlock(&self->_lock);
  -[HMIVideoAnalyzerScheduler analyzers](self, "analyzers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__HMIVideoAnalyzerScheduler_timerDidFire___block_invoke;
  v7[3] = &unk_24DBECF50;
  v7[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  -[HMIVideoAnalyzerScheduler _logState](self, "_logState");
  objc_autoreleasePoolPop(v4);

}

uint64_t __42__HMIVideoAnalyzerScheduler_timerDidFire___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnalyzer:withIndex:", a2, a3);
}

- (void)systemResourceUsageDidChangeTo:(int64_t)a3
{
  self->_usageLevel = a3;
}

- (void)_updateAnalyzer:(id)a3 withIndex:(unint64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "monitored"))
  {
    objc_msgSend(v12, "delay");
    v6 = 0.0;
    if (v5 <= 16.0)
    {
      v7 = 0.25;
      v8 = 1.0;
      if (v5 > 2.0)
        v8 = 0.5;
      if (v5 <= 4.0)
        v7 = v8;
      if (v5 <= 8.0)
        v6 = v7;
      else
        v6 = 0.125;
    }
    if (!-[HMIVideoAnalyzerScheduler ignoreThermalAndSystemResourceUsageLevel](self, "ignoreThermalAndSystemResourceUsageLevel"))
    {
      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "maxAnalysisFPSForSystemResourceUsageLevel:", self->_usageLevel);
      v11 = v10;

      if (v11 < v6)
        v6 = v11;
    }
    objc_msgSend(v12, "setAnalysisFPS:", v6);
  }

}

- (BOOL)_shouldSkipLogState
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[HMIVideoAnalyzerScheduler logStateCount](self, "logStateCount");
  -[HMIVideoAnalyzerScheduler setLogStateCount:](self, "setLogStateCount:", -[HMIVideoAnalyzerScheduler logStateCount](self, "logStateCount") + 1);
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberPreferenceForKey:defaultValue:", CFSTR("schedulerStateLogFrequency"), &unk_24DC14828);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v3 % v6 != 0;
}

- (int64_t)_getPeakPowerPressureLevel
{
  void *v2;
  int64_t v3;

  if (!+[HMIPreference isProductTypeJ255](HMIPreference, "isProductTypeJ255"))
    return -1;
  +[HMIPeakPowerPressureMonitor sharedInstance](HMIPeakPowerPressureMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "peakPowerPressureLevel");

  return v3;
}

- (void)_logState
{
  unint64_t usageLevel;
  const __CFString *v4;
  void *v5;
  int v6;
  _BOOL8 v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  HMIVideoAnalyzerScheduler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMIVideoAnalyzerScheduler *v34;
  NSObject *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  HMIVideoAnalyzerSchedulerJSONLogger *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[4];
  id v76;
  HMIVideoAnalyzerScheduler *v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[7];
  _QWORD v93[7];
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  void *v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  if (!-[HMIVideoAnalyzerScheduler _shouldSkipLogState](self, "_shouldSkipLogState"))
  {
    usageLevel = self->_usageLevel;
    if (usageLevel > 3)
      v4 = CFSTR("Undefined");
    else
      v4 = off_24DBED020[usageLevel];
    v82 = 0;
    v83 = 0;
    v80 = 0;
    v81 = 0;
    v78 = 0;
    v79 = 0;
    HMIGetMemoryFootprint(&v83, &v82);
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLPreferenceForKey:defaultValue:", CFSTR("logOtherProcessMemorySchedulerState"), 0);

    if (v6)
    {
      v8 = HMIGetProcessID(CFSTR("mediaserverd"));
      HMIGetMemoryFootprintForProcessID(v8, &v79, &v78);
      v9 = HMIGetProcessID(CFSTR("homed"));
      v7 = HMIGetMemoryFootprintForProcessID(v9, &v81, &v80);
    }
    v10 = (void *)MEMORY[0x220735570](v7);
    -[HMIVideoAnalyzerScheduler analyzers](self, "analyzers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v73 = v10;
      objc_msgSend(v11, "na_each:", &__block_literal_global_72);
      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLPreferenceForKey:defaultValue:", CFSTR("logHumanFriendlySchedulerState"), 0);

      v15 = 0x24DBE8000;
      v74 = v11;
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("Scheduler state: "));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR("usage: %@"), v4);
        +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "isIdle");
        HMFBooleanToString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR(", idle: %@"), v18);

        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "processName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR(", %@: (%llu MB | %llu MB)"), v20, v83 >> 20, v82 >> 20);

        +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = objc_msgSend(v21, "BOOLPreferenceForKey:defaultValue:", CFSTR("logOtherProcessMemorySchedulerState"), 0);

        if ((_DWORD)v20)
        {
          objc_msgSend(v16, "appendFormat:", CFSTR(", mediaserverd: (%llu MB | %llu MB)"), v79 >> 20, v78 >> 20);
          objc_msgSend(v16, "appendFormat:", CFSTR(", homed: (%llu MB | %llu MB)"), v81 >> 20, v80 >> 20);
        }
        +[HMIThermalMonitor sharedInstance](HMIThermalMonitor, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR(", thermalLevel: %lu"), objc_msgSend(v22, "thermalLevel"));

        objc_msgSend(v16, "appendFormat:", CFSTR(", peakPowerPressureLevel: %lu"), -[HMIVideoAnalyzerScheduler _getPeakPowerPressureLevel](self, "_getPeakPowerPressureLevel"));
        v23 = HMIIsDebug();
        v24 = CFSTR("Release");
        if (v23)
          v24 = CFSTR("Debug");
        objc_msgSend(v16, "appendFormat:", CFSTR(", build: %@"), v24);
        +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR(", maxConcurrentAnalyzers: %lu"), objc_msgSend(v25, "maxConcurrentAnalyzersForSystemResourceUsageLevel:", self->_usageLevel));

        v26 = (void *)MEMORY[0x220735570]();
        v27 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v95 = v29;
          v96 = 2112;
          v97 = v16;
          _os_log_impl(&dword_219D45000, v28, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

          v11 = v74;
        }

        objc_autoreleasePoolPop(v26);
        objc_msgSend(v11, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "state");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "tableColumns");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = (void *)MEMORY[0x220735570]();
        v34 = v27;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "componentsJoinedByString:", CFSTR(" | "));
          v37 = v4;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v95 = v36;
          v96 = 2112;
          v97 = v38;
          _os_log_impl(&dword_219D45000, v35, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

          v4 = v37;
        }

        objc_autoreleasePoolPop(v33);
        v75[0] = MEMORY[0x24BDAC760];
        v75[1] = 3221225472;
        v75[2] = __38__HMIVideoAnalyzerScheduler__logState__block_invoke_102;
        v75[3] = &unk_24DBECFE0;
        v76 = v32;
        v77 = v34;
        v39 = v32;
        v11 = v74;
        objc_msgSend(v74, "na_each:", v75);

        v15 = 0x24DBE8000uLL;
      }
      v68 = (void *)MEMORY[0x24BDBCED8];
      v93[0] = v4;
      v92[0] = CFSTR("usage");
      v92[1] = CFSTR("idle");
      v40 = (void *)MEMORY[0x24BDD16E0];
      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "numberWithBool:", objc_msgSend(v72, "isIdle"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v93[1] = v71;
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "processName");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v92[2] = v69;
      v90[0] = CFSTR("footprint");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v83 >> 20);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = v41;
      v90[1] = CFSTR("maxFootprint");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v82 >> 20);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v91[1] = v42;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v93[2] = v43;
      v92[3] = CFSTR("thermalLevel");
      v44 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(v15 + 3008), "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "numberWithUnsignedInteger:", objc_msgSend(v45, "thermalLevel"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v93[3] = v46;
      v92[4] = CFSTR("peakPowerPressureLevel");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMIVideoAnalyzerScheduler _getPeakPowerPressureLevel](self, "_getPeakPowerPressureLevel"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v93[4] = v47;
      v92[5] = CFSTR("build");
      v48 = HMIIsDebug();
      v49 = CFSTR("Release");
      if (v48)
        v49 = CFSTR("Debug");
      v93[5] = v49;
      v92[6] = CFSTR("analyzers");
      objc_msgSend(v11, "na_map:", &__block_literal_global_129);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v93[6] = v50;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92, 7);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "dictionaryWithDictionary:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "BOOLPreferenceForKey:defaultValue:", CFSTR("logOtherProcessMemorySchedulerState"), 0);

      if (v54)
      {
        v88[0] = CFSTR("mediaserverd");
        v86[0] = CFSTR("footprint");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v79 >> 20);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = CFSTR("maxFootprint");
        v87[0] = v55;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v78 >> 20);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v87[1] = v56;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v88[1] = CFSTR("homed");
        v89[0] = v57;
        v84[0] = CFSTR("footprint");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v81 >> 20);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v84[1] = CFSTR("maxFootprint");
        v85[0] = v58;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v80 >> 20);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v85[1] = v59;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v89[1] = v60;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addEntriesFromDictionary:", v61);

      }
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v52, 0, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)MEMORY[0x220735570]();
      v64 = objc_alloc_init(HMIVideoAnalyzerSchedulerJSONLogger);
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v62, 4);
        *(_DWORD *)buf = 138543618;
        v95 = v66;
        v96 = 2112;
        v97 = v67;
        _os_log_impl(&dword_219D45000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v63);

      v10 = v73;
      v11 = v74;
    }

    objc_autoreleasePoolPop(v10);
  }
}

void __38__HMIVideoAnalyzerScheduler__logState__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "check");

}

void __38__HMIVideoAnalyzerScheduler__logState__block_invoke_102(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __38__HMIVideoAnalyzerScheduler__logState__block_invoke_2;
  v16 = &unk_24DBECFB8;
  v17 = *(id *)(a1 + 32);
  v7 = v6;
  v18 = v7;
  v8 = (void *)MEMORY[0x220735570](objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v13));
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" | "), v13, v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

void __38__HMIVideoAnalyzerScheduler__logState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (objc_msgSend(v11, "length") <= v6)
  {
    objc_msgSend(&stru_24DBF1B40, "stringByPaddingToLength:withString:startingAtIndex:", v6 - objc_msgSend(v11, "length"), CFSTR(" "), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v8, "stringByAppendingString:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  else
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v11, "substringToIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);
  }

}

id __38__HMIVideoAnalyzerScheduler__logState__block_invoke_128(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "JSONObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)analyzers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSPointerArray allObjects](self->_internalAnalyzers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)ignoreThermalAndSystemResourceUsageLevel
{
  return self->_ignoreThermalAndSystemResourceUsageLevel;
}

- (void)setIgnoreThermalAndSystemResourceUsageLevel:(BOOL)a3
{
  self->_ignoreThermalAndSystemResourceUsageLevel = a3;
}

- (unint64_t)maxH264VideoDecoders
{
  return self->_maxH264VideoDecoders;
}

- (void)setMaxH264VideoDecoders:(unint64_t)a3
{
  self->_maxH264VideoDecoders = a3;
}

- (unint64_t)maxH264VideoEncoders
{
  return self->_maxH264VideoEncoders;
}

- (void)setMaxH264VideoEncoders:(unint64_t)a3
{
  self->_maxH264VideoEncoders = a3;
}

- (unint64_t)maxH265VideoEncoders
{
  return self->_maxH265VideoEncoders;
}

- (void)setMaxH265VideoEncoders:(unint64_t)a3
{
  self->_maxH265VideoEncoders = a3;
}

- (NSPointerArray)internalAnalyzers
{
  return (NSPointerArray *)objc_getProperty(self, a2, 72, 1);
}

- (int64_t)logStateCount
{
  return self->_logStateCount;
}

- (void)setLogStateCount:(int64_t)a3
{
  self->_logStateCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAnalyzers, 0);
  objc_storeStrong((id *)&self->_usageMonitor, 0);
  objc_storeStrong((id *)&self->_tick, 0);
}

@end
