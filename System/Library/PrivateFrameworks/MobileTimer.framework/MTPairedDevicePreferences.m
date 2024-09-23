@implementation MTPairedDevicePreferences

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_42);
  return (id)sharedInstance___preferences;
}

void __43__MTPairedDevicePreferences_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___preferences;
  sharedInstance___preferences = v0;

}

- (MTPairedDevicePreferences)init
{
  MTPairedDevicePreferences *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTPairedDevicePreferences;
  v2 = -[MTPairedDevicePreferences init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_MTPairedDevicePreferences_HandlePreferencesChanged, CFSTR("BulletinDistributorBBSectionsDidChangeNotification"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    v2->_pushAlertsEnabled = -[MTPairedDevicePreferences _isPushAlertsEnabledInPreferences](v2, "_isPushAlertsEnabledInPreferences");
  }
  return v2;
}

- (BOOL)isPushAlertsEnabled
{
  MTPairedDevicePreferences *v2;
  BOOL pushAlertsEnabled;

  v2 = self;
  objc_sync_enter(v2);
  pushAlertsEnabled = v2->_pushAlertsEnabled;
  objc_sync_exit(v2);

  return pushAlertsEnabled;
}

- (BOOL)_isPushAlertsEnabledInPreferences
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.bulletinboard.apps"));
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("com.apple.mobiletimer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("BPSNanoBulletinShowsAlerts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)_handlePrefsChanged
{
  _BOOL4 v3;
  NSObject *v4;
  MTPairedDevicePreferences *v5;
  _QWORD block[5];
  uint8_t buf[4];
  MTPairedDevicePreferences *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[MTPairedDevicePreferences _isPushAlertsEnabledInPreferences](self, "_isPushAlertsEnabledInPreferences");
  MTLogForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ _handlePrefsChanged: pushAlertsEnabled = %d", buf, 0x12u);
  }

  v5 = self;
  objc_sync_enter(v5);
  v5->_pushAlertsEnabled = v3;
  objc_sync_exit(v5);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MTPairedDevicePreferences__handlePrefsChanged__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __48__MTPairedDevicePreferences__handlePrefsChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfChange");
}

- (void)_notifyClientsOfChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MTPairedDevicePreferencesChanged"), self);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)MTPairedDevicePreferences;
  -[MTPairedDevicePreferences dealloc](&v4, sel_dealloc);
}

- (BOOL)pushAlertsEnabled
{
  return self->_pushAlertsEnabled;
}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (void)setNpsManager:(id)a3
{
  objc_storeStrong((id *)&self->_npsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end
