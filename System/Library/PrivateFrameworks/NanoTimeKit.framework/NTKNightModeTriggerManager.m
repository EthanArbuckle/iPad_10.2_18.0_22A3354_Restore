@implementation NTKNightModeTriggerManager

- (NTKNightModeTriggerManager)initWithFaceAnalyticsIdentifier:(id)a3
{
  id v5;
  NTKNightModeTriggerManager *v6;
  uint64_t v7;
  NSHashTable *observers;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NTKNightModeTriggerSettings *settings;
  double v13;
  double v14;
  void *v15;
  objc_super v22;
  uint8_t buf[4];
  NTKNightModeTriggerManager *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NTKNightModeTriggerManager;
  v6 = -[NTKNightModeTriggerManager init](&v22, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v6;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode manager init", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel_thresholdsChanged_, CFSTR("com.apple.NanoTimeKit.NightModeThresholdsChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel_sampleSizeChanged_, CFSTR("com.apple.NanoTimeKit.NightModeSampleSize"), 0);
    v11 = objc_opt_new();
    settings = v6->_settings;
    v6->_settings = (NTKNightModeTriggerSettings *)v11;

    -[NTKNightModeTriggerSettings thresholdLuxLow](v6->_settings, "thresholdLuxLow");
    v6->_thresholdLuxLow = v13;
    -[NTKNightModeTriggerSettings thresholdLuxHigh](v6->_settings, "thresholdLuxHigh");
    v6->_thresholdLuxHigh = v14;
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_isN199 = objc_msgSend(v15, "productType") == 41;

    objc_storeStrong((id *)&v6->_faceAnalyticsIdentifier, a3);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v6->_activeTime = _Q0;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  NTKNightModeTriggerManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode manager teardown", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)NTKNightModeTriggerManager;
  -[NTKNightModeTriggerManager dealloc](&v5, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NTKNightModeTriggerManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode observer attaching %@", (uint8_t *)&v7, 0x16u);

  }
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  objc_msgSend(v4, "nightModeTriggerManager:didUpdateNightModeTriggeredState:", self, self->_nightModeTriggered);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NTKNightModeTriggerManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode observer detaching %@", (uint8_t *)&v7, 0x16u);

  }
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (void)setNightModeDetectionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NTKAmbientIlluminationMonitor *v6;
  NTKAmbientIlluminationMonitor *ambientIlluminationMonitor;
  NTKMovingMedian *v8;
  NTKMovingStatistic *luxStatistic;
  NTKMovingMedian *v10;
  NTKMovingStatistic *nitsStatistic;
  NSObject *v12;
  NTKAmbientIlluminationMonitor *v13;
  NSObject *v14;
  NTKAmbientIlluminationMonitor *v15;
  NTKAmbientIlluminationMonitor *v16;
  NTKMovingStatistic *v17;
  NTKMovingStatistic *v18;
  int v24;
  NTKNightModeTriggerManager *v25;
  __int16 v26;
  NTKAmbientIlluminationMonitor *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_nightModeDetectionEnabled != a3)
  {
    v3 = a3;
    self->_nightModeDetectionEnabled = a3;
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134218240;
      v25 = self;
      v26 = 1024;
      LODWORD(v27) = v3;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode detection-enabled changing to %d", (uint8_t *)&v24, 0x12u);
    }

    if (self->_nightModeDetectionEnabled)
    {
      v6 = (NTKAmbientIlluminationMonitor *)objc_opt_new();
      ambientIlluminationMonitor = self->_ambientIlluminationMonitor;
      self->_ambientIlluminationMonitor = v6;

      -[NTKAmbientIlluminationMonitor setDelegate:](self->_ambientIlluminationMonitor, "setDelegate:", self);
      v8 = -[NTKMovingMedian initWithSampleSize:]([NTKMovingMedian alloc], "initWithSampleSize:", -[NTKNightModeTriggerSettings sampleSize](self->_settings, "sampleSize"));
      luxStatistic = self->_luxStatistic;
      self->_luxStatistic = (NTKMovingStatistic *)v8;

      v10 = -[NTKMovingMedian initWithSampleSize:]([NTKMovingMedian alloc], "initWithSampleSize:", -[NTKNightModeTriggerSettings sampleSize](self->_settings, "sampleSize"));
      nitsStatistic = self->_nitsStatistic;
      self->_nitsStatistic = (NTKMovingStatistic *)v10;

      -[NTKNightModeTriggerManager _updateAverageWithCurrentLux](self, "_updateAverageWithCurrentLux");
      -[NTKNightModeTriggerManager _updateAverageWithCurrentNits](self, "_updateAverageWithCurrentNits");
      -[NTKNightModeTriggerManager _startClockTimer](self, "_startClockTimer");
      -[NTKNightModeTriggerManager _notifyObservers](self, "_notifyObservers");
      self->_activeTime = CFAbsoluteTimeGetCurrent();
      self->_sensorReadingsTime = -1.0;
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_ambientIlluminationMonitor;
        v24 = 134218240;
        v25 = self;
        v26 = 2048;
        v27 = v13;
        _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode created illumination monitor %p", (uint8_t *)&v24, 0x16u);
      }

    }
    else
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_ambientIlluminationMonitor;
        v24 = 134218240;
        v25 = self;
        v26 = 2048;
        v27 = v15;
        _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode deleting illumination monitor %p", (uint8_t *)&v24, 0x16u);
      }

      -[NTKAmbientIlluminationMonitor setDelegate:](self->_ambientIlluminationMonitor, "setDelegate:", 0);
      v16 = self->_ambientIlluminationMonitor;
      self->_ambientIlluminationMonitor = 0;

      v17 = self->_luxStatistic;
      self->_luxStatistic = 0;

      v18 = self->_nitsStatistic;
      self->_nitsStatistic = 0;

      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)&self->_activeTime = _Q0;
      -[NTKNightModeTriggerManager _stopClockTimer](self, "_stopClockTimer");
    }
  }
}

- (void)_setNightModeTriggered:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  NTKNightModeTriggerManager *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_nightModeTriggered != a3)
  {
    v3 = a3;
    self->_nightModeTriggered = a3;
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode night-mode-triggered changing to %d", (uint8_t *)&v6, 0x12u);
    }

    -[NTKNightModeTriggerManager _notifyObservers](self, "_notifyObservers");
  }
}

- (void)_notifyObservers
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "nightModeTriggerManager:didUpdateNightModeTriggeredState:", self, self->_nightModeTriggered, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setThresholdLuxLow:(double)a3
{
  NSObject *v5;
  int v6;
  NTKNightModeTriggerManager *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  self->_thresholdLuxLow = a3;
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218240;
    v7 = self;
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode threshold low set to %f", (uint8_t *)&v6, 0x16u);
  }

  -[NTKNightModeTriggerManager _updateTriggerState](self, "_updateTriggerState");
}

- (void)setThresholdLuxHigh:(double)a3
{
  NSObject *v5;
  int v6;
  NTKNightModeTriggerManager *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  self->_thresholdLuxHigh = a3;
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218240;
    v7 = self;
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode threshold high set to %f", (uint8_t *)&v6, 0x16u);
  }

  -[NTKNightModeTriggerManager _updateTriggerState](self, "_updateTriggerState");
}

- (void)setThresholdOffset:(double)a3
{
  NSObject *v5;
  int v6;
  NTKNightModeTriggerManager *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  self->_thresholdOffset = a3;
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218240;
    v7 = self;
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode threshold offset set to %f", (uint8_t *)&v6, 0x16u);
  }

  -[NTKNightModeTriggerManager _updateTriggerState](self, "_updateTriggerState");
}

- (void)ambientIlluminationMonitor:(id)a3 receivedAmbientLux:(double)a4
{
  if (!-[NTKMovingStatistic sampleCount](self->_luxStatistic, "sampleCount", a3))
    self->_sensorReadingsTime = CFAbsoluteTimeGetCurrent();
  -[NTKNightModeTriggerManager _updateAverageWithLux:](self, "_updateAverageWithLux:", a4);
}

- (void)_startClockTimer
{
  NSObject *v3;
  void *v4;
  CLKClockTimerToken *v5;
  CLKClockTimerToken *clockTimerToken;
  _QWORD v7[4];
  id v8;
  id location;
  uint8_t buf[4];
  NTKNightModeTriggerManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = self;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode manager start clock timer", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__NTKNightModeTriggerManager__startClockTimer__block_invoke;
    v7[3] = &unk_1E6BCED08;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 2, v7, &__block_literal_global_70);
    v5 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __46__NTKNightModeTriggerManager__startClockTimer__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    ++_startClockTimer__cycle;
    if (0xAAAAAAAAAAAAAAABLL * _startClockTimer__cycle <= 0x5555555555555555)
      objc_msgSend(WeakRetained, "_updateAverageWithCurrentLux");
    objc_msgSend(v6, "_updateAverageWithCurrentNits");
  }

}

const __CFString *__46__NTKNightModeTriggerManager__startClockTimer__block_invoke_14()
{
  return CFSTR("night mode trigger manager");
}

- (void)_stopClockTimer
{
  NSObject *v3;
  void *v4;
  CLKClockTimerToken *clockTimerToken;
  int v6;
  NTKNightModeTriggerManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_clockTimerToken)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode manager stop clock timer", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopUpdatesForToken:", self->_clockTimerToken);

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;

  }
}

- (void)_updateAverageWithLux:(double)a3
{
  -[NTKMovingStatistic addNewValue:](self->_luxStatistic, "addNewValue:", a3);
  -[NTKNightModeTriggerManager _updateTriggerState](self, "_updateTriggerState");
}

- (void)_updateAverageWithCurrentLux
{
  double v3;

  -[NTKAmbientIlluminationMonitor ambientLux](self->_ambientIlluminationMonitor, "ambientLux");
  if (v3 >= 0.0)
  {
    -[NTKAmbientIlluminationMonitor ambientLux](self->_ambientIlluminationMonitor, "ambientLux");
    -[NTKNightModeTriggerManager _updateAverageWithLux:](self, "_updateAverageWithLux:");
  }
}

- (void)_updateAverageWithNits:(double)a3
{
  -[NTKMovingStatistic addNewValue:](self->_nitsStatistic, "addNewValue:", a3);
  -[NTKNightModeTriggerManager _updateTriggerState](self, "_updateTriggerState");
}

- (void)_updateAverageWithCurrentNits
{
  double v3;

  -[NTKAmbientIlluminationMonitor displayNits](self->_ambientIlluminationMonitor, "displayNits");
  if (v3 >= 0.0)
    -[NTKNightModeTriggerManager _updateAverageWithNits:](self, "_updateAverageWithNits:");
}

- (double)_smoothedLux
{
  double result;

  -[NTKMovingStatistic currentValue](self->_luxStatistic, "currentValue");
  return result;
}

- (double)_smoothedNits
{
  double result;

  -[NTKMovingStatistic currentValue](self->_nitsStatistic, "currentValue");
  return result;
}

- (double)_alsLatency
{
  double activeTime;
  double result;
  double sensorReadingsTime;

  activeTime = self->_activeTime;
  result = -1.0;
  if (activeTime != -1.0)
  {
    sensorReadingsTime = self->_sensorReadingsTime;
    if (sensorReadingsTime != -1.0)
      return sensorReadingsTime - activeTime;
  }
  return result;
}

- (BOOL)_isReady
{
  unint64_t v3;

  v3 = -[NTKMovingStatistic sampleCount](self->_luxStatistic, "sampleCount");
  return v3 >= -[NTKNightModeTriggerSettings activateSampleCount](self->_settings, "activateSampleCount");
}

- (void)_updateTriggerState
{
  uint64_t v3;
  unsigned int v4;
  double v5;
  double v6;
  double v7;
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
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  uint64_t v28;
  double lastSensorLux;
  double v30;
  double v31;
  _BOOL4 v32;
  double v33;
  int lastIsTriggered;
  double lastCurrentNits;
  double v36;
  double v37;
  _BOOL4 v38;
  double v39;
  double lastThresholdLow;
  double lastThresholdOffset;
  double lastThresholdHigh;
  int lastTargetTrigger;
  unint64_t lastSampleSize;
  unint64_t lastIsReady;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t skippedLogs;
  uint64_t v71;
  void *v72;
  char v73;
  uint64_t v74;
  unsigned int v75;
  unint64_t v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  uint8_t buf[4];
  NTKNightModeTriggerManager *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  double v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  double v102;
  __int16 v103;
  double v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  __int16 v111;
  unint64_t v112;
  __int16 v113;
  void *v114;
  _QWORD v115[6];
  _QWORD v116[9];

  v116[6] = *MEMORY[0x1E0C80C00];
  if (-[NTKNightModeTriggerManager isNightModeDetectionEnabled](self, "isNightModeDetectionEnabled"))
  {
    v3 = -[NTKNightModeTriggerManager isNightModeTriggered](self, "isNightModeTriggered");
    v4 = -[NTKNightModeTriggerManager _isReady](self, "_isReady");
    -[NTKNightModeTriggerManager _smoothedLux](self, "_smoothedLux");
    v6 = v5;
    -[NTKNightModeTriggerManager thresholdOffset](self, "thresholdOffset");
    v8 = v7;
    -[NTKNightModeTriggerManager thresholdLuxLow](self, "thresholdLuxLow");
    v10 = v8 + v9;
    -[NTKNightModeTriggerManager thresholdLuxHigh](self, "thresholdLuxHigh");
    v12 = v8 + v11;
    -[NTKNightModeTriggerManager _smoothedNits](self, "_smoothedNits");
    v14 = v13;
    -[NTKNightModeTriggerManager currentFaceAPL](self, "currentFaceAPL");
    if (v15 >= 0.1)
    {
      -[NTKNightModeTriggerManager currentFaceAPL](self, "currentFaceAPL");
      if (v18 >= 0.25)
      {
        v17 = 5.0;
        if (!self->_isN199)
          v17 = 1.0;
        v16 = 8.0;
        if (!self->_isN199)
          v16 = 17.0;
      }
      else
      {
        v17 = 5.0;
        if (!self->_isN199)
          v17 = 0.0;
        v16 = 80.0;
        if (self->_isN199)
          v16 = 7.0;
      }
    }
    else
    {
      v16 = 100.0;
      v17 = 0.0;
    }
    v80 = v14;
    v19 = fmax(v17 + v14 / v16, 0.0);
    v20 = v10 + v19;
    v21 = v12 - v10 + v10 + v19;
    if (v21 < v12 + v19 / 3.0)
      v21 = v12 + v19 / 3.0;
    v78 = v21;
    v79 = v19;
    if ((_DWORD)v3)
      v22 = v6 <= v21;
    else
      v22 = v6 < v20;
    -[NTKAmbientIlluminationMonitor ambientLux](self->_ambientIlluminationMonitor, "ambientLux");
    v24 = v23;
    -[NTKAmbientIlluminationMonitor displayNits](self->_ambientIlluminationMonitor, "displayNits");
    v26 = v25;
    v27 = -[NTKMovingStatistic sampleSize](self->_luxStatistic, "sampleSize");
    v28 = -[NTKMovingStatistic sampleCount](self->_luxStatistic, "sampleCount");
    lastSensorLux = self->_lastSensorLux;
    v30 = fabs(lastSensorLux);
    v31 = fabs(v24);
    v32 = v31 < 0.00000011920929;
    if (v30 >= 0.00000011920929)
      v32 = 0;
    if (v31 >= 0.00000011920929 && v30 >= 0.00000011920929)
    {
      v32 = v24 == -1.0;
      if (lastSensorLux != -1.0)
        v32 = 0;
      if (v24 != -1.0 && lastSensorLux != -1.0)
      {
        v33 = lastSensorLux / v24 + -1.0;
        if (v33 < 0.0)
          v33 = -v33;
        v32 = v33 < 0.05;
      }
    }
    lastIsTriggered = self->_lastIsTriggered;
    lastCurrentNits = self->_lastCurrentNits;
    v36 = fabs(lastCurrentNits);
    v37 = fabs(v26);
    v38 = v37 < 0.00000011920929;
    if (v36 >= 0.00000011920929)
      v38 = 0;
    if (v37 >= 0.00000011920929 && v36 >= 0.00000011920929)
    {
      v38 = v26 == -1.0;
      if (lastCurrentNits != -1.0)
        v38 = 0;
      if (v26 != -1.0 && lastCurrentNits != -1.0)
      {
        v39 = lastCurrentNits / v26 + -1.0;
        if (v39 < 0.0)
          v39 = -v39;
        v38 = v39 < 0.1;
      }
    }
    lastThresholdOffset = self->_lastThresholdOffset;
    lastThresholdLow = self->_lastThresholdLow;
    lastThresholdHigh = self->_lastThresholdHigh;
    lastTargetTrigger = self->_lastTargetTrigger;
    lastSampleSize = self->_lastSampleSize;
    lastIsReady = self->_lastIsReady;
    if (lastIsTriggered == (_DWORD)v3
      && lastIsReady == v4
      && lastThresholdOffset == v8
      && lastThresholdLow == v10
      && lastThresholdHigh == v12
      && lastTargetTrigger == (_DWORD)v22
      && v32
      && v38
      && lastSampleSize == v27)
    {
      ++self->_skippedLogs;
    }
    else
    {
      v74 = v28;
      v76 = v4;
      if (lastIsTriggered == (_DWORD)v3)
        v46 = &stru_1E6BDC918;
      else
        v46 = CFSTR("IsTr");
      if (lastIsReady == v4)
        v47 = &stru_1E6BDC918;
      else
        v47 = CFSTR("Redy");
      v48 = CFSTR("Offs");
      if (lastThresholdOffset == v8)
        v48 = &stru_1E6BDC918;
      v49 = CFSTR("TLow");
      if (lastThresholdLow == v10)
        v49 = &stru_1E6BDC918;
      v50 = CFSTR("THgh");
      if (lastThresholdHigh == v12)
        v50 = &stru_1E6BDC918;
      if (lastTargetTrigger == (_DWORD)v22)
        v51 = &stru_1E6BDC918;
      else
        v51 = CFSTR("Trig");
      if (v32)
        v52 = &stru_1E6BDC918;
      else
        v52 = CFSTR("SLux");
      if (v38)
        v53 = &stru_1E6BDC918;
      else
        v53 = CFSTR("Nits");
      if (lastSampleSize == v27)
        v54 = &stru_1E6BDC918;
      else
        v54 = CFSTR("SSiz");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@%@%@"), v46, v47, v48, v49, v50, v51, v52, v53, v54);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = self->_faceAnalyticsIdentifier;
      v115[0] = CFSTR("faceIdentifier");
      v115[1] = CFSTR("faceAPL");
      v55 = (void *)MEMORY[0x1E0CB37E8];
      -[NTKNightModeTriggerManager currentFaceAPL](self, "currentFaceAPL");
      objc_msgSend(v55, "numberWithDouble:");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v56;
      v115[2] = CFSTR("ALSLatency");
      v57 = (void *)MEMORY[0x1E0CB37E8];
      -[NTKNightModeTriggerManager _alsLatency](self, "_alsLatency");
      objc_msgSend(v57, "numberWithDouble:");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v116[2] = v58;
      v115[3] = CFSTR("triggerThreshold");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v116[3] = v59;
      v115[4] = CFSTR("smoothedALS");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v116[4] = v60;
      v115[5] = CFSTR("triggered");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v116[5] = v61;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 6);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v74);
        v75 = v22;
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
        v73 = v3;
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKNightModeTriggerManager currentFaceAPL](self, "currentFaceAPL");
        skippedLogs = self->_skippedLogs;
        *(_DWORD *)buf = 134222082;
        v82 = self;
        v83 = 2112;
        v84 = v72;
        v85 = 2112;
        v86 = v64;
        v87 = 2112;
        v88 = v65;
        v89 = 2112;
        v90 = v66;
        v91 = 2112;
        v92 = v67;
        v93 = 2112;
        v94 = v3;
        v95 = 2112;
        v96 = v68;
        v97 = 2048;
        v98 = v20;
        v99 = 2112;
        v100 = v69;
        v101 = 2048;
        v102 = v78;
        v103 = 2048;
        v104 = v79;
        v105 = 2048;
        v106 = v71;
        v107 = 2048;
        v108 = v26;
        v109 = 2048;
        v110 = v80;
        v111 = 2048;
        v112 = skippedLogs;
        v113 = 2112;
        v114 = v77;
        _os_log_impl(&dword_1B72A3000, v63, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode updateTriggerState currentlyTriggered:%@ shouldTrigger:%@ samples:%@ of %@ (lux--sensorLux:%@ smoothedLux:%@ threshLow:%@ calib:%0.0f threshHigh:%@ calib:%0.0f calibration:%0.0f apl:%0.2f) (nits--currentNits:%0.3f smoothedNits:%0.3f) [skipped %lu]  %@", buf, 0xACu);

        LOBYTE(v3) = v73;
        v22 = v75;

      }
      if (-[NTKNightModeTriggerManager _isReady](self, "_isReady"))
        -[NTKNightModeTriggerManager _setNightModeTriggered:](self, "_setNightModeTriggered:", v22);
      self->_lastIsTriggered = v3;
      self->_lastSmoothedLux = v6;
      self->_lastThresholdOffset = v8;
      self->_lastThresholdLow = v10;
      self->_lastThresholdHigh = v12;
      self->_lastSmoothedNits = v80;
      self->_lastTargetTrigger = v22;
      self->_lastSensorLux = v24;
      self->_lastCurrentNits = v26;
      self->_lastSampleSize = v27;
      self->_lastIsReady = v76;
      self->_skippedLogs = 0;

    }
  }
}

- (void)thresholdsChanged:(id)a3
{
  -[NTKNightModeTriggerSettings thresholdLuxLow](self->_settings, "thresholdLuxLow", a3);
  -[NTKNightModeTriggerManager setThresholdLuxLow:](self, "setThresholdLuxLow:");
  -[NTKNightModeTriggerSettings thresholdLuxHigh](self->_settings, "thresholdLuxHigh");
  -[NTKNightModeTriggerManager setThresholdLuxHigh:](self, "setThresholdLuxHigh:");
}

- (void)sampleSizeChanged:(id)a3
{
  -[NTKMovingStatistic setSampleSize:](self->_luxStatistic, "setSampleSize:", -[NTKNightModeTriggerSettings sampleSize](self->_settings, "sampleSize", a3));
}

- (BOOL)isNightModeDetectionEnabled
{
  return self->_nightModeDetectionEnabled;
}

- (BOOL)isNightModeTriggered
{
  return self->_nightModeTriggered;
}

- (double)currentFaceAPL
{
  return self->_currentFaceAPL;
}

- (void)setCurrentFaceAPL:(double)a3
{
  self->_currentFaceAPL = a3;
}

- (double)thresholdOffset
{
  return self->_thresholdOffset;
}

- (NSString)faceAnalyticsIdentifier
{
  return self->_faceAnalyticsIdentifier;
}

- (double)thresholdLuxLow
{
  return self->_thresholdLuxLow;
}

- (double)thresholdLuxHigh
{
  return self->_thresholdLuxHigh;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_nitsStatistic, 0);
  objc_storeStrong((id *)&self->_luxStatistic, 0);
  objc_storeStrong((id *)&self->_ambientIlluminationMonitor, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
