@implementation NTKCustomWorldCityAbbreviationsStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1)
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_80);
  return (id)sharedInstance_sInstance_0;
}

void __54__NTKCustomWorldCityAbbreviationsStore_sharedInstance__block_invoke()
{
  NTKCustomWorldCityAbbreviationsStore *v0;
  void *v1;

  v0 = objc_alloc_init(NTKCustomWorldCityAbbreviationsStore);
  v1 = (void *)sharedInstance_sInstance_0;
  sharedInstance_sInstance_0 = (uint64_t)v0;

}

- (NTKCustomWorldCityAbbreviationsStore)init
{
  NTKCustomWorldCityAbbreviationsStore *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCustomWorldCityAbbreviationsStore;
  v2 = -[NTKCustomWorldCityAbbreviationsStore init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKCustomWorldCityAbbreviationsStore_HandleStoreChanged, CFSTR("com.apple.NanoTimeKit.NTKNanoPrefsChanges"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
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
  v4.super_class = (Class)NTKCustomWorldCityAbbreviationsStore;
  -[NTKCustomWorldCityAbbreviationsStore dealloc](&v4, sel_dealloc);
}

- (id)_getCustomAbbreviationsFromPrefs
{
  CFPropertyListRef v2;
  const void *v3;
  CFTypeID v4;
  void *v5;

  v2 = CFPreferencesCopyAppValue(CFSTR("customWorldCities"), CFSTR("com.apple.NanoTimeKit"));
  if (!v2)
    goto LABEL_6;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  if (v4 != CFDictionaryGetTypeID())
  {
    CFRelease(v3);
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v3);
  if (!v5)
    goto LABEL_6;
  return v5;
}

- (void)setCustomAbbreviation:(id)a3 forCityIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NPSManager *npsManager;
  NPSManager *v10;
  NPSManager *v11;
  void *v12;
  void *value;

  v6 = a4;
  v7 = a3;
  -[NTKCustomWorldCityAbbreviationsStore _getCustomAbbreviationsFromPrefs](self, "_getCustomAbbreviationsFromPrefs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  value = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(value, "setObject:forKey:", v7, v6);
  CFPreferencesSetAppValue(CFSTR("customWorldCities"), value, CFSTR("com.apple.NanoTimeKit"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.NanoTimeKit"));
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    v10 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
    v11 = self->_npsManager;
    self->_npsManager = v10;

    npsManager = self->_npsManager;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("customWorldCities"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPSManager synchronizeUserDefaultsDomain:keys:](npsManager, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.NanoTimeKit"), v12);

  -[NTKCustomWorldCityAbbreviationsStore _notifyClientsOfChange](self, "_notifyClientsOfChange");
}

- (void)_handlePrefsChanged
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.NanoTimeKit"));
  -[NTKCustomWorldCityAbbreviationsStore _notifyClientsOfChange](self, "_notifyClientsOfChange");
}

- (void)_notifyClientsOfChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NTKCustomWorldCityAbbreviationsChangedNotification"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end
