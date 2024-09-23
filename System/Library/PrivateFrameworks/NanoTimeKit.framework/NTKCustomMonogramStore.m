@implementation NTKCustomMonogramStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_34);
  return (id)sharedInstance_sInstance;
}

void __40__NTKCustomMonogramStore_sharedInstance__block_invoke()
{
  NTKCustomMonogramStore *v0;
  void *v1;

  v0 = objc_alloc_init(NTKCustomMonogramStore);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;

}

- (NTKCustomMonogramStore)init
{
  NTKCustomMonogramStore *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCustomMonogramStore;
  v2 = -[NTKCustomMonogramStore init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKCustomMonogramStore_HandleStoreChanged, CFSTR("com.apple.NanoTimeKit.NTKNanoPrefsChanges"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKCustomMonogramStore_BroadcastChanges, CFSTR("NTKCustomMonogramChangedNotification"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(CFSTR("com.apple.NanoTimeKit"));
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
  v4.super_class = (Class)NTKCustomMonogramStore;
  -[NTKCustomMonogramStore dealloc](&v4, sel_dealloc);
}

- (id)_customMonogramFromPrefs
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.NanoTimeKit"));
  v3 = (id)objc_msgSend(v2, "synchronize");
  objc_msgSend(v2, "stringForKey:", CFSTR("customMonogram"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setCustomMonogram:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NPSManager *npsManager;
  NPSManager *v8;
  NPSManager *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0D51610];
  v5 = a3;
  v12 = (id)objc_msgSend([v4 alloc], "initWithDomain:", CFSTR("com.apple.NanoTimeKit"));
  objc_msgSend(v12, "setObject:forKey:", v5, CFSTR("customMonogram"));

  v6 = (id)objc_msgSend(v12, "synchronize");
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    v8 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
    v9 = self->_npsManager;
    self->_npsManager = v8;

    npsManager = self->_npsManager;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("customMonogram"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPSManager synchronizeNanoDomain:keys:](npsManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.NanoTimeKit"), v10);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("NTKCustomMonogramChangedNotification"), 0, 0, 1u);

}

- (void)_notifyClientsOfChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NTKCustomMonogramChangedNotification"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end
