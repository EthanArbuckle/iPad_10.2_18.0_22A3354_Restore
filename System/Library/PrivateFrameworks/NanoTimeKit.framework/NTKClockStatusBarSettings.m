@implementation NTKClockStatusBarSettings

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NTKClockStatusBarSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, block);
  return (id)sharedInstance___sharedInstance_2;
}

void __43__NTKClockStatusBarSettings_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v1;

}

- (NTKClockStatusBarSettings)init
{
  NTKClockStatusBarSettings *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *prefsQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKClockStatusBarSettings;
  v2 = -[NTKClockStatusBarSettings init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ntk.clockstatusbarsettings", 0);
    prefsQueue = v2->_prefsQueue;
    v2->_prefsQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKClockStatusBarSettings_HandleSettingsChanged, CFSTR("com.apple.NanoTimeKit.NTKNanoPrefsChanges"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(CFSTR("com.apple.NanoTimeKit"));
    v2->_notificationsIndicatorEnabled = -[NTKClockStatusBarSettings _isNotificationsIndicatorEnabledInPreferences](v2, "_isNotificationsIndicatorEnabledInPreferences");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NTKClockStatusBarSettings;
  -[NTKClockStatusBarSettings dealloc](&v4, sel_dealloc);
}

- (BOOL)isNotificationsIndicatorEnabled
{
  return self->_notificationsIndicatorEnabled;
}

- (BOOL)_isNotificationsIndicatorEnabledInPreferences
{
  void *v2;
  char v3;
  BOOL v4;
  char v6;

  v6 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.NanoTimeKit"));
  v3 = objc_msgSend(v2, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("notificationsIndicatorEnabled"), &v6);
  if (v6)
    v4 = v3;
  else
    v4 = 1;

  return v4;
}

- (void)setNotificationsIndicatorEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NPSManager *npsManager;
  NPSManager *v7;
  NPSManager *v8;
  void *v9;
  id v10;

  v3 = a3;
  self->_notificationsIndicatorEnabled = a3;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.NanoTimeKit"));
  objc_msgSend(v10, "setBool:forKey:", v3, CFSTR("notificationsIndicatorEnabled"));
  v5 = (id)objc_msgSend(v10, "synchronize");
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    v7 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
    v8 = self->_npsManager;
    self->_npsManager = v7;

    npsManager = self->_npsManager;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("notificationsIndicatorEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPSManager synchronizeNanoDomain:keys:](npsManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.NanoTimeKit"), v9);

}

- (void)_handlePrefsChanged
{
  NSObject *prefsQueue;
  _QWORD block[5];

  prefsQueue = self->_prefsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NTKClockStatusBarSettings__handlePrefsChanged__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(prefsQueue, block);
}

void __48__NTKClockStatusBarSettings__handlePrefsChanged__block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[5];
  char v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.NanoTimeKit"));
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isNotificationsIndicatorEnabledInPreferences");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__NTKClockStatusBarSettings__handlePrefsChanged__block_invoke_2;
  v3[3] = &unk_1E6BCF930;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __48__NTKClockStatusBarSettings__handlePrefsChanged__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfChange");
}

- (void)_notifyClientsOfChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NTKClockStatusBarSettingsDidChangeNotification"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefsQueue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end
