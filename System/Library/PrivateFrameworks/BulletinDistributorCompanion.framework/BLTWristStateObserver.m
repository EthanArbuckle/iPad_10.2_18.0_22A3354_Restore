@implementation BLTWristStateObserver

- (BLTWristStateObserver)init
{
  BLTWristStateObserver *v2;
  BLTWristStateObserver *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLTWristStateObserver;
  v2 = -[BLTWristStateObserver init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BLTWristStateObserver _updateWristDetectSetting](v2, "_updateWristDetectSetting");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)WristDetectSettingChanged, CFSTR("CSLDisableWristDetectionChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", v3);

  }
  return v3;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("CSLDisableWristDetectionChangedNotification"), 0);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)BLTWristStateObserver;
  -[BLTWristStateObserver dealloc](&v5, sel_dealloc);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  BLTWorkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__BLTWristStateObserver_profileConnectionDidReceiveRestrictionChangedNotification_userInfo___block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __92__BLTWristStateObserver_profileConnectionDidReceiveRestrictionChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWristDetectSetting");
}

- (BOOL)_wristDetectionEnabledRestriction
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63B08]) == 1;

  return v3;
}

- (BOOL)_wristDetectionDisabledPreference
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.Carousel"));
  objc_msgSend(v2, "objectForKey:", CFSTR("DisableWristDetection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)_isWristDetectionDisabled
{
  return !-[BLTWristStateObserver _wristDetectionEnabledRestriction](self, "_wristDetectionEnabledRestriction")
      && -[BLTWristStateObserver _wristDetectionDisabledPreference](self, "_wristDetectionDisabledPreference");
}

- (void)_updateWristDetectSetting
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = -[BLTWristStateObserver _isWristDetectionDisabled](self, "_isWristDetectionDisabled");
  blt_settings_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = "DISABLED";
    if (self->_isWristDetectDisabled)
      v6 = "DISABLED";
    else
      v6 = "ENABLED";
    if (!v3)
      v5 = "ENABLED";
    v7 = 136315394;
    v8 = v6;
    v9 = 2080;
    v10 = v5;
    _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_INFO, "Updating wrist detect from %s to %s", (uint8_t *)&v7, 0x16u);
  }

  self->_isWristDetectDisabled = v3;
}

- (BOOL)isWristDetectDisabled
{
  return self->_isWristDetectDisabled;
}

@end
