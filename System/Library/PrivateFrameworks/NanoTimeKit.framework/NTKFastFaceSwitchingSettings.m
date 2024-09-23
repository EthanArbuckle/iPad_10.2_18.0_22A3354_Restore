@implementation NTKFastFaceSwitchingSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17 != -1)
    dispatch_once(&sharedInstance_onceToken_17, &__block_literal_global_116);
  return (id)sharedInstance_fastFaceSettings;
}

void __46__NTKFastFaceSwitchingSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_fastFaceSettings;
  sharedInstance_fastFaceSettings = v0;

}

- (NTKFastFaceSwitchingSettings)init
{
  NTKFastFaceSwitchingSettings *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKFastFaceSwitchingSettings;
  v2 = -[NTKFastFaceSwitchingSettings init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleSettingsChanged, CFSTR("FaceSupportFastSwitching"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[NTKFastFaceSwitchingSettings _readValue](v2, "_readValue");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("FaceSupportFastSwitching"), self);
  v4.receiver = self;
  v4.super_class = (Class)NTKFastFaceSwitchingSettings;
  -[NTKFastFaceSwitchingSettings dealloc](&v4, sel_dealloc);
}

- (void)_readValue
{
  void *v3;
  id v4;
  char v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.NanoTimeKit.face"));
  v4 = (id)objc_msgSend(v3, "synchronize");
  v9 = 0;
  v5 = objc_msgSend(v3, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("FaceSupportFastSwitching"), &v9);
  if (v9)
    v6 = v5;
  else
    v6 = 0;
  self->_fastFaceSwitchingEnabled = v6;
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fastFaceSwitchingEnabled);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[NTKFastFaceSwitchingSettings _readValue]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "%s - fastFaceSwitchingEnabled:%@", buf, 0x16u);

  }
}

- (void)_handlePrefsChanged
{
  -[NTKFastFaceSwitchingSettings _readValue](self, "_readValue");
  -[NTKFastFaceSwitchingSettings _notifyClientsOfChange](self, "_notifyClientsOfChange");
}

- (void)_notifyClientsOfChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NTKFastFaceSwitchingEnabledChanged"), self);

}

- (BOOL)fastFaceSwitchingEnabled
{
  return self->_fastFaceSwitchingEnabled;
}

@end
