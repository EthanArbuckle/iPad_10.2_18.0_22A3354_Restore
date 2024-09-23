@implementation NTKTimeTravelSettings

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__NTKTimeTravelSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (id)sharedInstance___sharedInstance_0;
}

void __39__NTKTimeTravelSettings_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v1;

}

- (NTKTimeTravelSettings)init
{
  NTKTimeTravelSettings *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *prefsQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKTimeTravelSettings;
  v2 = -[NTKTimeTravelSettings init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ntk.timetravelsettings", 0);
    prefsQueue = v2->_prefsQueue;
    v2->_prefsQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKTimeTravelSettings_HandleSettingsChanged, CFSTR("com.apple.NanoTimeKit.NTKNanoPrefsChanges"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(CFSTR("com.apple.NanoTimeKit"));
    v2->_timeTravelEnabled = -[NTKTimeTravelSettings _isTimeTravelEnabledInPreferences](v2, "_isTimeTravelEnabledInPreferences");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handlePrefsChanged, *MEMORY[0x1E0D517A8], 0);

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)NTKTimeTravelSettings;
  -[NTKTimeTravelSettings dealloc](&v5, sel_dealloc);
}

- (BOOL)isTimeTravelEnabled
{
  return self->_timeTravelEnabled;
}

- (BOOL)_isTimeTravelEnabledInPreferences
{
  void *v2;
  char v3;
  BOOL v4;
  char v6;

  v6 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.NanoTimeKit"));
  v3 = objc_msgSend(v2, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("timeTravelEnabled"), &v6);
  if (v6)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)setTimeTravelEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NPSManager *npsManager;
  NPSManager *v7;
  NPSManager *v8;
  void *v9;
  id v10;

  v3 = a3;
  self->_timeTravelEnabled = a3;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.NanoTimeKit"));
  objc_msgSend(v10, "setBool:forKey:", v3, CFSTR("timeTravelEnabled"));
  v5 = (id)objc_msgSend(v10, "synchronize");
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    v7 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
    v8 = self->_npsManager;
    self->_npsManager = v7;

    npsManager = self->_npsManager;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("timeTravelEnabled"));
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
  block[2] = __44__NTKTimeTravelSettings__handlePrefsChanged__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(prefsQueue, block);
}

void __44__NTKTimeTravelSettings__handlePrefsChanged__block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[5];
  char v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.NanoTimeKit"));
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isTimeTravelEnabledInPreferences");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__NTKTimeTravelSettings__handlePrefsChanged__block_invoke_2;
  v3[3] = &unk_1E6BCF930;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __44__NTKTimeTravelSettings__handlePrefsChanged__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(v1 + 16);
  v3 = *(unsigned __int8 *)(a1 + 40);
  *(_BYTE *)(v1 + 16) = v3;
  if (v2 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("NTKTimeTravelIsEnabledUserInfoKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("NTKTimeTravelSettingsDidChange"), 0, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefsQueue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end
