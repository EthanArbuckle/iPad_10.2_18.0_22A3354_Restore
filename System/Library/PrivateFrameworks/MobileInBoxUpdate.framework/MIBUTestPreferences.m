@implementation MIBUTestPreferences

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_14);
  return (id)sharedInstance_instance;
}

void __37__MIBUTestPreferences_sharedInstance__block_invoke()
{
  MIBUTestPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(MIBUTestPreferences);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (BOOL)useLiveTatsu
{
  void *v2;
  char v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("UseLiveTatsu"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (id)fakeTatsuPayloadPath
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FakeTatsuPayloadPath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)useAppleConnect
{
  void *v2;
  char v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("UseAppleConnect"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)nfcIdleTime
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("NFCIdleTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)isActivated
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("IsActivated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)factorySUCertExist
{
  void *v2;
  char v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FactorySUCertExist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)inBoxUpdateMode
{
  void *v2;
  char v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("InBoxUpdateMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)initialBuddySetupComplete
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("InitialBuddySetupComplete"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)isOnLockScreen
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("IsOnLockScreen"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)factorySUCertPath
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FactorySUCertPath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)factorySUKeyPath
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FactorySUKeyPath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)factorySUKeyIsSEP
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FactorySUKeyIsSEP"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)iseTrustCertPaths
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ISETrustCertPaths"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)iseTrustCertName
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ISETrustCertName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)wifiSSID
{
  void *v2;
  id v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("WiFiSSID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)skipWiFiAssociation
{
  void *v2;
  char v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipWiFiAssociation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)skipDaemonDisable
{
  void *v2;
  BOOL v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipDaemonDisable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = 1;
  }

  return v3;
}

- (BOOL)skipCertDeletion
{
  void *v2;
  BOOL v3;

  -[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipCertDeletion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = 1;
  }

  return v3;
}

- (id)getValueFromTestPreferencesForKey:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (__CFString *)a3;
  v4 = (const __CFString *)*MEMORY[0x24BDBD578];
  v5 = (const __CFString *)*MEMORY[0x24BDBD588];
  if (!CFPreferencesSynchronize(CFSTR("com.apple.MobileInBoxUpdater.test"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD588]))
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_41_2);
    v6 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUTestPreferences getValueFromTestPreferencesForKey:].cold.1(v6);
  }
  v7 = (void *)CFPreferencesCopyValue(v3, CFSTR("com.apple.MobileInBoxUpdater.test"), v4, v5);

  return v7;
}

void __57__MIBUTestPreferences_getValueFromTestPreferencesForKey___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __57__MIBUTestPreferences_getValueFromTestPreferencesForKey___block_invoke_cold_1();
}

- (void)getValueFromTestPreferencesForKey:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_222C3F000, v1, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to synchronize with CFPreferences.", (uint8_t *)&v3, 0xCu);

}

void __57__MIBUTestPreferences_getValueFromTestPreferencesForKey___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_222C3F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t", v0, 2u);
}

@end
