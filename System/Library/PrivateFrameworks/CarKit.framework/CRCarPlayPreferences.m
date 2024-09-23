@implementation CRCarPlayPreferences

- (BOOL)cachedCarPlayAllowed
{
  return self->_cachedCarPlayAllowed;
}

- (CRCarPlayPreferences)init
{
  CRCarPlayPreferences *v2;
  uint64_t v3;
  MCProfileConnection *profileConnection;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRCarPlayPreferences;
  v2 = -[CRCarPlayPreferences init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v3;

    -[MCProfileConnection registerObserver:](v2->_profileConnection, "registerObserver:", v2);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)CRLostModeStateChanged, (CFStringRef)*MEMORY[0x1E0D21398], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[CRCarPlayPreferences setCachedCarPlayAllowed:](v2, "setCachedCarPlayAllowed:", -[CRCarPlayPreferences _isCarPlayAllowed](v2, "_isCarPlayAllowed"));
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
  -[MCProfileConnection unregisterObserver:](self->_profileConnection, "unregisterObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)CRCarPlayPreferences;
  -[CRCarPlayPreferences dealloc](&v5, sel_dealloc);
}

- (void)_updateCarPlayAllowed
{
  _BOOL8 v3;
  id v4;

  v3 = -[CRCarPlayPreferences _isCarPlayAllowed](self, "_isCarPlayAllowed");
  if (v3 != -[CRCarPlayPreferences cachedCarPlayAllowed](self, "cachedCarPlayAllowed"))
  {
    -[CRCarPlayPreferences setCachedCarPlayAllowed:](self, "setCachedCarPlayAllowed:", v3);
    -[CRCarPlayPreferences preferencesDelegate](self, "preferencesDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "handleCarPlayAllowedDidChange");

  }
}

- (id)_BOOLValueInCarPlayDomainForKey:(__CFString *)a3
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  void *v6;

  v3 = (const __CFBoolean *)CFPreferencesCopyValue(a3, CRPreferencesNotMigratedDomain, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", CFBooleanGetValue(v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isCarPlayCapable
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  __int16 v9;

  v2 = MGGetBoolAnswer();
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v9 = 0;
      v5 = "device is CarPlay capable";
      v6 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    v8 = 0;
    v5 = "device is not CarPlay capable";
    v6 = (uint8_t *)&v8;
    goto LABEL_6;
  }

  return v2;
}

- (BOOL)_isCarPlayAllowed
{
  NSObject *v3;
  NSObject *v4;
  BOOL v5;
  uint8_t v7[16];
  uint8_t buf[16];

  if (-[CRCarPlayPreferences isCarPlayCapable](self, "isCarPlayCapable"))
  {
    if ((-[MCProfileConnection isVehicleUIAllowed](self->_profileConnection, "isVehicleUIAllowed") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
      v3 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isLostModeActive](v3, "isLostModeActive") & 1) == 0
        && !-[NSObject isManagedLostModeActive](v3, "isManagedLostModeActive"))
      {
        v5 = 1;
        goto LABEL_12;
      }
      CarGeneralLogging();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay disabled by lost mode.", v7, 2u);
      }

    }
    else
    {
      CarGeneralLogging();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay disabled by restrictions", buf, 2u);
      }
    }
    v5 = 0;
LABEL_12:

    return v5;
  }
  return 0;
}

- (BOOL)isWirelessCarPlayEnabled
{
  return 1;
}

- (id)isCCCHeadUnitPairingOverrideEnabled
{
  return -[CRCarPlayPreferences _BOOLValueInCarPlayDomainForKey:](self, "_BOOLValueInCarPlayDomainForKey:", CFSTR("EnableHeadUnitPairingOverride"));
}

- (id)shouldAlwaysAcceptCCCHeadUnitPairing
{
  return -[CRCarPlayPreferences _BOOLValueInCarPlayDomainForKey:](self, "_BOOLValueInCarPlayDomainForKey:", CFSTR("AlwaysAcceptHeadUnitPairing"));
}

- (id)isCarPlaySetupEnabled
{
  void *v2;
  void *v3;
  id v4;

  -[CRCarPlayPreferences _BOOLValueInCarPlayDomainForKey:](self, "_BOOLValueInCarPlayDomainForKey:", CFSTR("EnableCarPlaySetup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)MEMORY[0x1E0C9AAB0];

  return v4;
}

- (id)isCarPlayThemeSupportEnabled
{
  void *v2;
  void *v3;
  id v4;

  -[CRCarPlayPreferences _BOOLValueInCarPlayDomainForKey:](self, "_BOOLValueInCarPlayDomainForKey:", CFSTR("EnableFerrite"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)MEMORY[0x1E0C9AAA0];

  return v4;
}

- (CRCarPlayPreferencesDelegate)preferencesDelegate
{
  return (CRCarPlayPreferencesDelegate *)objc_loadWeakRetained((id *)&self->_preferencesDelegate);
}

- (void)setPreferencesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_preferencesDelegate, a3);
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void)setProfileConnection:(id)a3
{
  objc_storeStrong((id *)&self->_profileConnection, a3);
}

- (void)setCachedCarPlayAllowed:(BOOL)a3
{
  self->_cachedCarPlayAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_destroyWeak((id *)&self->_preferencesDelegate);
}

@end
