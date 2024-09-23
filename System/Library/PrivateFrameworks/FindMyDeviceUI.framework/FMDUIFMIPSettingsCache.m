@implementation FMDUIFMIPSettingsCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance__instance;
}

void __40__FMDUIFMIPSettingsCache_sharedInstance__block_invoke()
{
  FMDUIFMIPSettingsCache *v0;
  void *v1;

  v0 = objc_alloc_init(FMDUIFMIPSettingsCache);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

- (FMDUIFMIPSettingsCache)init
{
  FMDUIFMIPSettingsCache *v2;
  FMDUIFMIPSettingsCache *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDUIFMIPSettingsCache;
  v2 = -[FMDUIFMIPSettingsCache init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fmipState = 4;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_fmipStateChangeNotificationReceived, (CFStringRef)*MEMORY[0x24BE31CE0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)_lowBatteryLocateStateChangeNotificationReceived, (CFStringRef)*MEMORY[0x24BE31CD8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[FMDUIFMIPSettingsCache _loadFMIPState](v3, "_loadFMIPState");
    -[FMDUIFMIPSettingsCache _loadLowBatteryState](v3, "_loadLowBatteryState");
  }
  return v3;
}

- (BOOL)fmipEnabled
{
  unint64_t v3;

  v3 = -[FMDUIFMIPSettingsCache fmipState](self, "fmipState");
  if (v3 != 1)
    LOBYTE(v3) = -[FMDUIFMIPSettingsCache fmipState](self, "fmipState") == 0;
  return v3;
}

- (BOOL)fmipStateChangeInProgress
{
  return -[FMDUIFMIPSettingsCache fmipState](self, "fmipState") == 2
      || -[FMDUIFMIPSettingsCache fmipState](self, "fmipState") == 0;
}

- (void)_loadLowBatteryState
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__FMDUIFMIPSettingsCache__loadLowBatteryState__block_invoke;
  v3[3] = &unk_24F536F40;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "lowBatteryLocateEnabledWithCompletion:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __46__FMDUIFMIPSettingsCache__loadLowBatteryState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "setLowBatteryLocateEnabled:", a2);
    objc_msgSend(v7, "setLowBatteryLocateStateAvailable:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("FMDUIFMIPSettingsCacheDidUpdateNotification"), 0);

    WeakRetained = v7;
  }

}

- (void)_loadFMIPState
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__FMDUIFMIPSettingsCache__loadFMIPState__block_invoke;
  v3[3] = &unk_24F536F68;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "fmipStateWithCompletion:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __40__FMDUIFMIPSettingsCache__loadFMIPState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "setFmipState:", a2);
    objc_msgSend(v7, "setFmipStateAvailable:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("FMDUIFMIPSettingsCacheDidUpdateNotification"), 0);

    WeakRetained = v7;
  }

}

- (BOOL)fmipStateAvailable
{
  return self->_fmipStateAvailable;
}

- (void)setFmipStateAvailable:(BOOL)a3
{
  self->_fmipStateAvailable = a3;
}

- (unint64_t)fmipState
{
  return self->_fmipState;
}

- (void)setFmipState:(unint64_t)a3
{
  self->_fmipState = a3;
}

- (BOOL)lowBatteryLocateStateAvailable
{
  return self->_lowBatteryLocateStateAvailable;
}

- (void)setLowBatteryLocateStateAvailable:(BOOL)a3
{
  self->_lowBatteryLocateStateAvailable = a3;
}

- (BOOL)lowBatteryLocateEnabled
{
  return self->_lowBatteryLocateEnabled;
}

- (void)setLowBatteryLocateEnabled:(BOOL)a3
{
  self->_lowBatteryLocateEnabled = a3;
}

@end
