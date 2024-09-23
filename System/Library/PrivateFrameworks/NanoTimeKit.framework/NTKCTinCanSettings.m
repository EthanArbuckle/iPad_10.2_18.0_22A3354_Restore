@implementation NTKCTinCanSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_59);
  return (id)sharedInstance_tinCanSettings;
}

void __36__NTKCTinCanSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_tinCanSettings;
  sharedInstance_tinCanSettings = v0;

}

- (NTKCTinCanSettings)init
{
  NTKCTinCanSettings *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKCTinCanSettings;
  v2 = -[NTKCTinCanSettings init](&v6, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKCTinCanSettings_HandleSettingsChanged, (CFStringRef)*MEMORY[0x1E0DBF138], v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__handlePrefsChanged, *MEMORY[0x1E0D517A8], 0);

    -[NTKCTinCanSettings _readValue](v2, "_readValue");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0DBF138], self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D517A8], 0);

  v5.receiver = self;
  v5.super_class = (Class)NTKCTinCanSettings;
  -[NTKCTinCanSettings dealloc](&v5, sel_dealloc);
}

- (void)_readValue
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;
  char v8;
  BOOL v9;
  char v10;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPaired");

  if ((v4 & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0D51610]);
    v6 = (void *)objc_msgSend(v5, "initWithDomain:", *MEMORY[0x1E0DBF148]);
    v7 = (id)objc_msgSend(v6, "synchronize");
    v10 = 0;
    v8 = objc_msgSend(v6, "BOOLForKey:keyExistsAndHasValidFormat:", *MEMORY[0x1E0DBF140], &v10);
    if (v10)
      v9 = v8;
    else
      v9 = 1;
    self->_tinCanEnabled = v9;

  }
  else
  {
    self->_tinCanEnabled = 1;
  }
}

- (void)_handlePrefsChanged
{
  -[NTKCTinCanSettings _readValue](self, "_readValue");
  -[NTKCTinCanSettings _notifyClientsOfChange](self, "_notifyClientsOfChange");
}

- (void)_notifyClientsOfChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NTKCTinCanSettingsChangedNotification"), self);

}

- (BOOL)tinCanEnabled
{
  return self->_tinCanEnabled;
}

@end
