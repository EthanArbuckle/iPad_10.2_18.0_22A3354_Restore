@implementation NTKNightModeTriggerSettings

- (NTKNightModeTriggerSettings)init
{
  NTKNightModeTriggerSettings *v2;
  NTKNightModeTriggerSettings *v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKNightModeTriggerSettings;
  v2 = -[NTKNightModeTriggerSettings init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKNightModeTriggerSettings _readThresholdLuxLowFromPrefs](v2, "_readThresholdLuxLowFromPrefs");
    v3->_thresholdLuxLow = v4;
    -[NTKNightModeTriggerSettings _readThresholdLuxHighFromPrefs](v3, "_readThresholdLuxHighFromPrefs");
    v3->_thresholdLuxHigh = v5;
    v3->_sampleSize = -[NTKNightModeTriggerSettings _readSampleSizeFromPrefs](v3, "_readSampleSizeFromPrefs");
    v3->_activateSampleCount = -[NTKNightModeTriggerSettings _readActivateSampleCountFromPrefs](v3, "_readActivateSampleCountFromPrefs");
    -[NTKNightModeTriggerSettings _registerForDarwinNotifications](v3, "_registerForDarwinNotifications");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKNightModeTriggerSettings _unregisterForDarwinNotifications](self, "_unregisterForDarwinNotifications");
  v3.receiver = self;
  v3.super_class = (Class)NTKNightModeTriggerSettings;
  -[NTKNightModeTriggerSettings dealloc](&v3, sel_dealloc);
}

- (void)_registerForDarwinNotifications
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  id location;

  objc_initWeak(&location, self);
  +[NTKDarwinNotificationCenter defaultCenter](NTKDarwinNotificationCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke;
  v9[3] = &unk_1E6BCF6D8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v3, "addObserver:notificationName:usingBlock:", self, CFSTR("com.apple.NanoTimeKit.NightModeThresholdsChanged"), v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke_2;
  v7[3] = &unk_1E6BCF6D8;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v3, "addObserver:notificationName:usingBlock:", self, CFSTR("com.apple.NanoTimeKit.NightModeSampleSize"), v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke_3;
  v5[3] = &unk_1E6BCF6D8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v3, "addObserver:notificationName:usingBlock:", self, CFSTR("com.apple.NanoTimeKit.NightModeActivateSampleCount"), v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_readThresholdLuxLowFromPrefs");
    WeakRetained[1] = v2;
    objc_msgSend(*(id *)(a1 + 32), "_readThresholdLuxHighFromPrefs");
    WeakRetained[2] = v3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("com.apple.NanoTimeKit.NightModeThresholdsChanged"), 0);

  }
}

void __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[3] = objc_msgSend(*(id *)(a1 + 32), "_readSampleSizeFromPrefs");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.NanoTimeKit.NightModeSampleSize"), 0);

  }
}

void __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[4] = objc_msgSend(*(id *)(a1 + 32), "_readActivateSampleCountFromPrefs");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.NanoTimeKit.NightModeActivateSampleCount"), 0);

  }
}

- (void)_unregisterForDarwinNotifications
{
  id v3;

  +[NTKDarwinNotificationCenter defaultCenter](NTKDarwinNotificationCenter, "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:notificationName:", self, CFSTR("com.apple.NanoTimeKit.NightModeThresholdsChanged"));
  objc_msgSend(v3, "removeObserver:notificationName:", self, CFSTR("com.apple.NanoTimeKit.NightModeSampleSize"));
  objc_msgSend(v3, "removeObserver:notificationName:", self, CFSTR("com.apple.NanoTimeKit.NightModeActivateSampleCount"));

}

- (double)_readThresholdLuxLowFromPrefs
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("NTKNightModeLuxThresholdLow"), CFSTR("com.apple.NanoTimeKit"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 2.0;
  }

  return v5;
}

- (double)_readThresholdLuxHighFromPrefs
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("NTKNightModeLuxThresholdHigh"), CFSTR("com.apple.NanoTimeKit"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 7.0;
  }

  return v5;
}

- (unint64_t)_readSampleSizeFromPrefs
{
  void *v2;
  void *v3;
  double v4;
  unint64_t v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("NTKNightModeSampleSize"), CFSTR("com.apple.NanoTimeKit"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = (unint64_t)v4;
  }
  else
  {
    v5 = 20;
  }

  return v5;
}

- (unint64_t)_readActivateSampleCountFromPrefs
{
  void *v2;
  void *v3;
  double v4;
  unint64_t v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("NTKNightModeActivateSampleCount"), CFSTR("com.apple.NanoTimeKit"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = (unint64_t)v4;
  }
  else
  {
    v5 = 10;
  }

  return v5;
}

- (double)thresholdLuxLow
{
  return self->_thresholdLuxLow;
}

- (void)setThresholdLuxLow:(double)a3
{
  self->_thresholdLuxLow = a3;
}

- (double)thresholdLuxHigh
{
  return self->_thresholdLuxHigh;
}

- (void)setThresholdLuxHigh:(double)a3
{
  self->_thresholdLuxHigh = a3;
}

- (unint64_t)sampleSize
{
  return self->_sampleSize;
}

- (void)setSampleSize:(unint64_t)a3
{
  self->_sampleSize = a3;
}

- (unint64_t)activateSampleCount
{
  return self->_activateSampleCount;
}

- (void)setActivateSampleCount:(unint64_t)a3
{
  self->_activateSampleCount = a3;
}

@end
