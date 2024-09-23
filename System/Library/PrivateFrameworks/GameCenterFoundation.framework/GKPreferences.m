@implementation GKPreferences

- (void)invalidate
{
  -[GKPreferences set_shouldSynchronizeOnNextRead:](self, "set_shouldSynchronizeOnNextRead:", 1);
}

- (int64_t)fakeFriendRequestCount
{
  return -[GKPreferences integerValueForKey:defaultValue:](self, "integerValueForKey:defaultValue:", CFSTR("GKFakeFriendRequestCount"), 0);
}

- (int64_t)integerValueForKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;
  void *v6;

  -[GKPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (BOOL)BOOLeanValueForKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;
  void *v6;

  -[GKPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)preferencesValueForKey:(id)a3
{
  __CFString *v4;
  void *v5;

  v4 = (__CFString *)a3;
  -[GKPreferences overrideValueForKey:](self, "overrideValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)CFPreferencesCopyAppValue(v4, CFSTR("com.apple.gamecenter"));

  return v5;
}

- (id)overrideValueForKey:(id)a3
{
  id v4;
  GKPreferences *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSDictionary objectForKey:](v5->_overrideValues, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

void __23__GKPreferences_shared__block_invoke()
{
  GKPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(GKPreferences);
  v1 = (void *)shared_sSharedPreferences;
  shared_sSharedPreferences = (uint64_t)v0;

}

- (GKPreferences)initWithNotifications
{
  GKPreferences *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  v2 = -[GKPreferences initWithoutNotifications](self, "initWithoutNotifications");
  GKGetRuntimeStrategy();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldRefreshPreferencesAfterBackgrounding");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKApplicationNotificationNames didEnterBackground](GKApplicationNotificationNames, "didEnterBackground");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_applicationWillEnterBackground_, v6, 0);

  }
  return v2;
}

- (GKPreferences)initWithoutNotifications
{
  GKPreferences *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKPreferences;
  v2 = -[GKPreferences init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSuiteNamed:", CFSTR("com.apple.demo-settings"));
    -[GKPreferences synchronize](v2, "synchronize");

  }
  return v2;
}

+ (GKPreferences)shared
{
  if (shared_sDispatchOnceToken != -1)
    dispatch_once(&shared_sDispatchOnceToken, &__block_literal_global_9);
  if (objc_msgSend((id)shared_sSharedPreferences, "_shouldSynchronizeOnNextRead"))
  {
    objc_msgSend((id)shared_sSharedPreferences, "synchronize");
    objc_msgSend((id)shared_sSharedPreferences, "set_shouldSynchronizeOnNextRead:", 0);
  }
  return (GKPreferences *)(id)shared_sSharedPreferences;
}

- (void)set_shouldSynchronizeOnNextRead:(BOOL)a3
{
  self->_shouldSynchronizeOnNextRead = a3;
}

- (BOOL)_shouldSynchronizeOnNextRead
{
  return self->_shouldSynchronizeOnNextRead;
}

- (void)synchronize
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.gamecenter"));
}

- (BOOL)inboxContactsOnly
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isUnderage");
  else
    v5 = 1;
  v6 = -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKFriendRequestsInboxContactsOnly"), v5);

  return v6;
}

- (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken_0 != -1)
    dispatch_once(&isInternalBuild_onceToken_0, &__block_literal_global_8);
  return isInternalBuild_isInternal;
}

void __32__GKPreferences_isInternalBuild__block_invoke()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  isInternalBuild_isInternal = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  CFRelease(v0);
}

- (void)_didWriteKey:(id)a3
{
  -[GKPreferences removeOverrideForKey:](self, "removeOverrideForKey:", a3);
  CFPreferencesAppSynchronize(CFSTR("com.apple.gamecenter"));
}

- (void)applicationWillEnterBackground:(id)a3
{
  -[GKPreferences set_shouldSynchronizeOnNextRead:](self, "set_shouldSynchronizeOnNextRead:", 1);
}

- (void)setOverrideValues:(id)a3
{
  NSDictionary *v4;
  NSDictionary *overrideValues;
  GKPreferences *obj;

  v4 = (NSDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  overrideValues = obj->_overrideValues;
  obj->_overrideValues = v4;

  objc_sync_exit(obj);
}

- (NSDictionary)overrideValues
{
  GKPreferences *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_overrideValues;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)BOOLeanValueForKey:(id)a3
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", a3, 0);
}

- (void)setBooleanValue:(BOOL)a3 forKey:(id)a4
{
  const void **v5;
  const void *v6;
  __CFString *v7;

  v5 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v5 = (const void **)MEMORY[0x1E0C9AE40];
  v6 = *v5;
  v7 = (__CFString *)a4;
  CFPreferencesSetAppValue(v7, v6, CFSTR("com.apple.gamecenter"));
  -[GKPreferences _didWriteKey:](self, "_didWriteKey:", v7);

}

- (void)setIntegerValue:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  void *v7;
  __CFString *key;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  key = (__CFString *)a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(key, v7, CFSTR("com.apple.gamecenter"));

  -[GKPreferences _didWriteKey:](self, "_didWriteKey:", key);
}

- (int64_t)unsignedIntegerValueForKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;
  void *v6;

  -[GKPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "unsignedIntegerValue");

  return a4;
}

- (void)setUnsignedIntegerValue:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  void *v7;
  __CFString *key;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  key = (__CFString *)a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(key, v7, CFSTR("com.apple.gamecenter"));

  -[GKPreferences _didWriteKey:](self, "_didWriteKey:", key);
}

- (id)dictionaryValueForKey:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.gamecenter"));
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)setDictionaryValue:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.gamecenter"));
}

- (double)timeIntervalForKey:(id)a3 defaultValue:(double)a4
{
  void *v5;
  void *v6;
  double v7;

  -[GKPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    a4 = v7;
  }

  return a4;
}

- (void)setTimeInterval:(double)a3 forKey:(id)a4
{
  void *v6;
  void *v7;
  __CFString *key;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  key = (__CFString *)a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(key, v7, CFSTR("com.apple.gamecenter"));

  -[GKPreferences _didWriteKey:](self, "_didWriteKey:", key);
}

- (id)stringValueForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[GKPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (void)setStringValue:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.gamecenter"));
}

- (void)removeOverrideForKey:(id)a3
{
  GKPreferences *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4->_overrideValues);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);
  -[GKPreferences setOverrideValues:](v4, "setOverrideValues:", v5);

  objc_sync_exit(v4);
}

- (BOOL)supportLockdownMode
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKSupportLockdownMode"), 1);
}

- (void)setSupportLockdownMode:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKSupportLockdownMode"));
}

- (BOOL)lockedDown
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[GKPreferences supportLockdownMode](self, "supportLockdownMode");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D44630], "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "enabled");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (int64_t)environment
{
  if (-[GKPreferences isStoreDemoModeEnabled](self, "isStoreDemoModeEnabled"))
    return 5;
  else
    return -[GKPreferences integerValueForKey:defaultValue:](self, "integerValueForKey:defaultValue:", CFSTR("GKStoreBagEnvironment"), 5);
}

- (void)setEnvironment:(int64_t)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    if (a3 <= 11)
    {
      -[GKPreferences setIntegerValue:forKey:](self, "setIntegerValue:forKey:");
      GKGetRuntimeStrategy();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "utilityServicePrivate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "terminate");

    }
  }
}

- (NSString)storeBagURL
{
  return (NSString *)-[GKPreferences preferencesValueForKey:](self, "preferencesValueForKey:", CFSTR("GKCustomStoreBagURL"));
}

- (void)setStoreBagURL:(id)a3
{
  void *v4;
  id v5;

  CFPreferencesSetAppValue(CFSTR("GKCustomStoreBagURL"), a3, CFSTR("com.apple.gamecenter"));
  -[GKPreferences _didWriteKey:](self, "_didWriteKey:", CFSTR("GKCustomStoreBagURL"));
  GKGetRuntimeStrategy();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "utilityServicePrivate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshPreferences");

}

- (BOOL)useTestProtocols
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKUseTestProtocols"));
}

- (void)setUseTestProtocols:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKUseTestProtocols"));
}

- (BOOL)enterSandbox
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKEnterSandbox"), 1);
}

- (void)setEnterSandbox:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKEnterSandbox"));
}

- (BOOL)forcePrivacyNotice
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKForcePrivacyNotice"));
}

- (void)setForcePrivacyNotice:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKPreferences.shared.forcePrivacyNotice is set to %d", (uint8_t *)v7, 8u);
  }
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", v3, CFSTR("GKForcePrivacyNotice"));
}

- (BOOL)forceDefaultNickname
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKForceDefaultNickname"));
}

- (void)setForceDefaultNickname:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKForceDefaultNickname"));
}

- (BOOL)forceDefaultPrivacy
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKForceFriendSuggestions"));
}

- (void)setForceDefaultPrivacy:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKForceFriendSuggestions"));
}

- (BOOL)forceFriendSuggestions
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKForceDefaultPrivacy"));
}

- (void)setForceFriendSuggestions:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKForceDefaultPrivacy"));
}

- (BOOL)forceDefaultContactsIntegrationConsent
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKForceDefaultContactsIntegrationConsent"));
}

- (void)setForceDefaultContactsIntegrationConsent:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKForceDefaultContactsIntegrationConsent"));
}

- (BOOL)forceUnderage
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKForceUnderage"));
}

- (void)setForceUnderage:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKForceUnderage"));
}

- (unint64_t)mescalSetupRetries
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKMescalSetupRetries"), 3);
}

- (void)setMescalSetupRetries:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKMescalSetupRetries"));
}

- (unint64_t)coreRecentUpperLimit
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKCoreRecentUpperLimit"), 50);
}

- (void)setCoreRecentUpperLimit:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKCoreRecentUpperLimit"));
}

- (unint64_t)coreRecentMultiplier
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKCoreRecentMultiplier"), 3);
}

- (void)setCoreRecentMultiplier:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKCoreRecentMultiplier"));
}

- (unint64_t)loginDisableThreshold
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKLoginDisabledThreshold"), 3);
}

- (void)setNetworkManagerUserOverride:(id)a3
{
  -[GKPreferences setStringValue:forKey:](self, "setStringValue:forKey:", a3, CFSTR("GKNetworkManagerUserOverride"));
}

- (NSString)networkManagerUserOverride
{
  return (NSString *)-[GKPreferences stringValueForKey:defaultValue:](self, "stringValueForKey:defaultValue:", CFSTR("GKNetworkManagerUserOverride"), &stru_1E75BB5A8);
}

- (void)setNetworkManagerStateOverride:(int64_t)a3
{
  -[GKPreferences setIntegerValue:forKey:](self, "setIntegerValue:forKey:", a3, CFSTR("GKNetworkManagerStateOverride"));
}

- (int64_t)networkManagerStateOverride
{
  return -[GKPreferences integerValueForKey:defaultValue:](self, "integerValueForKey:defaultValue:", CFSTR("GKNetworkManagerStateOverride"), -1);
}

- (BOOL)networkManagerIgnoreCache
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKNetworkManagerIgnoreCache"), 0);
}

- (void)setNetworkManagerIgnoreCache:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKNetworkManagerIgnoreCache"));
}

- (void)setLoginDisableThreshold:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKLoginDisabledThreshold"));
}

- (double)operationTimeout
{
  double result;

  -[GKPreferences timeIntervalForKey:defaultValue:](self, "timeIntervalForKey:defaultValue:", CFSTR("GKOperationTimout"), 15.0);
  return result;
}

- (void)setOperationTimeout:(double)a3
{
  -[GKPreferences setTimeInterval:forKey:](self, "setTimeInterval:forKey:", CFSTR("GKOperationTimout"), a3);
}

- (double)operationRetryDelay
{
  double result;

  -[GKPreferences timeIntervalForKey:defaultValue:](self, "timeIntervalForKey:defaultValue:", CFSTR("GKOperationRetryDelay"), 1.0);
  return result;
}

- (void)setOperationRetryDelay:(double)a3
{
  -[GKPreferences setTimeInterval:forKey:](self, "setTimeInterval:forKey:", CFSTR("GKOperationRetryDelay"), a3);
}

- (unint64_t)operationRetryCount
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKOperationRetryCount"), 3);
}

- (void)setOperationRetryCount:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKOperationRetryCount"));
}

- (double)debugRequestTimeout
{
  double result;

  -[GKPreferences timeIntervalForKey:defaultValue:](self, "timeIntervalForKey:defaultValue:", CFSTR("GKDebugRequestTimeout"), 0.0);
  return result;
}

- (void)setDebugRequestTimeout:(double)a3
{
  -[GKPreferences setTimeInterval:forKey:](self, "setTimeInterval:forKey:", CFSTR("GKDebugRequestTimeout"), a3);
}

- (BOOL)isNotificationCenterEnabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKNotificationCenter"), 1);
}

- (void)setNotificationCenterEnabled:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKNotificationCenter"));
}

- (BOOL)notificationBadgesEnabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKNotificationBadges"), 1);
}

- (void)setNotificationBadgesEnabled:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKNotificationBadges"));
}

- (BOOL)notificationSoundsEnabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKNotificationSounds"), 1);
}

- (void)setNotificationSoundsEnabled:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKNotificationSounds"));
}

- (BOOL)notificationAlertsEnabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKNotificationAlerts"), 1);
}

- (void)setNotificationAlertsEnabled:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKNotificationAlerts"));
}

- (NSString)testRunID
{
  return (NSString *)-[GKPreferences stringValueForKey:defaultValue:](self, "stringValueForKey:defaultValue:", CFSTR("GKTestRunID"), 0);
}

- (void)setTestRunID:(id)a3
{
  -[GKPreferences setStringValue:forKey:](self, "setStringValue:forKey:", a3, CFSTR("GKTestRunID"));
}

- (BOOL)forceRelay
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKForceRelay"));
}

- (void)setForceRelay:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKForceRelay"));
}

- (BOOL)preemptiveRelay
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKPreemptiveRelay"), 1);
}

- (void)setPreemptiveRelay:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKPreemptiveRelay"));
}

- (BOOL)disableViceroyNearby
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKDisableViceroyNearby"), 0);
}

- (void)setDisableViceroyNearby:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKDisableViceroyNearby"));
}

- (NSArray)forceEnabledTransportVersions
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKPreferences multiplayerTransportOverrideV1Enabled](self, "multiplayerTransportOverrideV1Enabled"))
    objc_msgSend(v3, "addObject:", &unk_1E75FAFB0);
  if (-[GKPreferences multiplayerTransportOverrideV2Enabled](self, "multiplayerTransportOverrideV2Enabled"))
    objc_msgSend(v3, "addObject:", &unk_1E75FAFC8);
  return (NSArray *)v3;
}

- (NSArray)forceDisabledTransportVersions
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKPreferences multiplayerTransportOverrideV1Disabled](self, "multiplayerTransportOverrideV1Disabled"))
    objc_msgSend(v3, "addObject:", &unk_1E75FAFB0);
  if (-[GKPreferences multiplayerTransportOverrideV2Disabled](self, "multiplayerTransportOverrideV2Disabled"))
    objc_msgSend(v3, "addObject:", &unk_1E75FAFC8);
  return (NSArray *)v3;
}

- (BOOL)multiplayerTransportOverrideV1Enabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKMultiplayerTransportOverrideV1Enabled"), 0);
}

- (void)setMultiplayerTransportOverrideV1Enabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKMultiplayerTransportOverrideV1Enabled"));
  if (v3)
    -[GKPreferences setMultiplayerTransportOverrideV1Disabled:](self, "setMultiplayerTransportOverrideV1Disabled:", 0);
}

- (BOOL)multiplayerTransportOverrideV1Disabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKMultiplayerTransportOverrideV1Disabled"), 0);
}

- (void)setMultiplayerTransportOverrideV1Disabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKMultiplayerTransportOverrideV1Disabled"));
  if (v3)
    -[GKPreferences setMultiplayerTransportOverrideV1Enabled:](self, "setMultiplayerTransportOverrideV1Enabled:", 0);
}

- (BOOL)multiplayerTransportOverrideV2Enabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKMultiplayerTransportOverrideV2Enabled"), 0);
}

- (void)setMultiplayerTransportOverrideV2Enabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKMultiplayerTransportOverrideV2Enabled"));
  if (v3)
    -[GKPreferences setMultiplayerTransportOverrideV2Disabled:](self, "setMultiplayerTransportOverrideV2Disabled:", 0);
}

- (BOOL)multiplayerTransportOverrideV2Disabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKMultiplayerTransportOverrideV2Disabled"), 0);
}

- (void)setMultiplayerTransportOverrideV2Disabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKMultiplayerTransportOverrideV2Disabled"));
  if (v3)
    -[GKPreferences setMultiplayerTransportOverrideV2Enabled:](self, "setMultiplayerTransportOverrideV2Enabled:", 0);
}

- (int64_t)pushEnvironment
{
  return -[GKPreferences integerValueForKey:defaultValue:](self, "integerValueForKey:defaultValue:", CFSTR("GKPushEnvironment"), 1);
}

- (void)setPushEnvironment:(int64_t)a3
{
  -[GKPreferences setIntegerValue:forKey:](self, "setIntegerValue:forKey:", a3, CFSTR("GKPushEnvironment"));
}

- (int64_t)pipeliningSetting
{
  return -[GKPreferences integerValueForKey:defaultValue:](self, "integerValueForKey:defaultValue:", CFSTR("GKHTTPPipelining"), 0);
}

- (void)setPipeliningSetting:(int64_t)a3
{
  -[GKPreferences setIntegerValue:forKey:](self, "setIntegerValue:forKey:", a3, CFSTR("GKHTTPPipelining"));
}

- (BOOL)restrictToAutomatch
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKRestrictToAutomatch"), 0);
}

- (void)setRestrictToAutomatch:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKRestrictToAutomatch"));
}

- (unint64_t)maximumInviteVersionSupported
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKMaximumInviteVersionSupported"), 2);
}

- (void)setMaximumInviteVersionSupported:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKMaximumInviteVersionSupported"));
}

- (unint64_t)recentNumberOfPlayers
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("com.apple.gamecenter.recentnumberofplayers"), 0);
}

- (void)setRecentNumberOfPlayers:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("com.apple.gamecenter.recentnumberofplayers"));
}

- (NSDictionary)recentNumberOfPlayersPerGame
{
  return (NSDictionary *)-[GKPreferences dictionaryValueForKey:](self, "dictionaryValueForKey:", CFSTR("com.apple.gamecenter.recentnumberofplayerspergame"));
}

- (void)setRecentNumberOfPlayersPerGame:(id)a3
{
  -[GKPreferences setDictionaryValue:forKey:](self, "setDictionaryValue:forKey:", a3, CFSTR("com.apple.gamecenter.recentnumberofplayerspergame"));
}

- (unint64_t)recentNumberOfPlayersForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  -[GKPreferences recentNumberOfPlayersPerGame](self, "recentNumberOfPlayersPerGame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = -[GKPreferences recentNumberOfPlayers](self, "recentNumberOfPlayers");
  v8 = v7;

  return v8;
}

- (void)setRecentNumberOfPlayers:(unint64_t)a3 forBundleID:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = [v6 alloc];
  -[GKPreferences recentNumberOfPlayersPerGame](self, "recentNumberOfPlayersPerGame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "initWithDictionary:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v7);

  -[GKPreferences setRecentNumberOfPlayersPerGame:](self, "setRecentNumberOfPlayersPerGame:", v11);
}

- (NSDictionary)recentPickerSortPreferencePerGame
{
  return (NSDictionary *)-[GKPreferences dictionaryValueForKey:](self, "dictionaryValueForKey:", CFSTR("com.apple.gamecenter.recentpickersortpreferencepergame"));
}

- (void)setRecentPickerSortPreferencePerGame:(id)a3
{
  -[GKPreferences setDictionaryValue:forKey:](self, "setDictionaryValue:forKey:", a3, CFSTR("com.apple.gamecenter.recentpickersortpreferencepergame"));
}

- (int64_t)recentPlayerPickerSortPreferenceForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[GKPreferences recentPickerSortPreferencePerGame](self, "recentPickerSortPreferencePerGame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = -1;

  return v7;
}

- (void)setRecentPlayerPickerSortPreference:(int64_t)a3 forBundleID:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = [v6 alloc];
  -[GKPreferences recentPickerSortPreferencePerGame](self, "recentPickerSortPreferencePerGame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "initWithDictionary:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v7);

  -[GKPreferences setRecentPickerSortPreferencePerGame:](self, "setRecentPickerSortPreferencePerGame:", v11);
}

- (unint64_t)maxPlayersP2P
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKMaxPlayersP2P"), -[GKPreferences maxDefaultPlayersP2P](self, "maxDefaultPlayersP2P"));
}

- (void)setMaxPlayersP2P:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKMaxPlayersP2P"));
}

- (unint64_t)maxPlayersHosted
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKMaxPlayersHosted"), -[GKPreferences maxDefaultPlayersHosted](self, "maxDefaultPlayersHosted"));
}

- (void)setMaxPlayersHosted:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKMaxPlayersHosted"));
}

- (unint64_t)maxPlayersTurnBased
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKMaxPlayersTurnBased"), -[GKPreferences maxDefaultPlayersTurnBased](self, "maxDefaultPlayersTurnBased"));
}

- (void)setMaxPlayersTurnBased:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKMaxPlayersTurnBased"));
}

- (unint64_t)maxGameStateSizeTurnBased
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKMaxGameStateSizeTurnBased"), -[GKPreferences maxDefaultGameStateSizeTurnBased](self, "maxDefaultGameStateSizeTurnBased"));
}

- (void)setMaxGameStateSizeTurnBased:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKMaxGameStateSizeTurnBased"));
}

- (unint64_t)exchangeDataMaximumSize
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKExchangeDataMaximumSize"), -[GKPreferences exchangeDataDefaultMaximumSize](self, "exchangeDataDefaultMaximumSize"));
}

- (void)setExchangeDataMaximumSize:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKExchangeDataMaximumSize"));
}

- (unint64_t)exchangeMaxInitiatedExchangesPerPlayer
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKExchangeMaxPerPlayer"), -[GKPreferences exchangeDefaultMaxInitiatedExchangesPerPlayer](self, "exchangeDefaultMaxInitiatedExchangesPerPlayer"));
}

- (void)setExchangeMaxInitiatedExchangesPerPlayer:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKExchangeMaxPerPlayer"));
}

- (BOOL)useInternalHeader
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKInternalHeader"));
}

- (void)setUseInternalHeader:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKInternalHeader"));
}

- (double)terminationInterval
{
  double result;

  -[GKPreferences timeIntervalForKey:defaultValue:](self, "timeIntervalForKey:defaultValue:", CFSTR("GKTerminationInterval"), 30.0);
  return result;
}

- (void)setTerminationInterval:(double)a3
{
  -[GKPreferences setTimeInterval:forKey:](self, "setTimeInterval:forKey:", CFSTR("GKTerminationInterval"), a3);
}

- (double)garbageCollectionInterval
{
  double result;

  -[GKPreferences timeIntervalForKey:defaultValue:](self, "timeIntervalForKey:defaultValue:", CFSTR("GKGarbageCollectionInterval"), 300.0);
  return result;
}

- (void)setGarbageCollectionInterval:(double)a3
{
  -[GKPreferences setTimeInterval:forKey:](self, "setTimeInterval:forKey:", CFSTR("GKGarbageCollectionInterval"), a3);
}

- (double)minimumCacheTTL
{
  double result;

  -[GKPreferences timeIntervalForKey:defaultValue:](self, "timeIntervalForKey:defaultValue:", CFSTR("GKMinimumCacheTTL"), 0.0);
  return result;
}

- (void)setMinimumCacheTTL:(double)a3
{
  -[GKPreferences setTimeInterval:forKey:](self, "setTimeInterval:forKey:", CFSTR("GKMinimumCacheTTL"), a3);
}

- (double)cacheTTLOverride
{
  double result;

  -[GKPreferences timeIntervalForKey:defaultValue:](self, "timeIntervalForKey:defaultValue:", CFSTR("GKCacheTTLOverride"), 0.0);
  return result;
}

- (void)setCacheTTLOverride:(double)a3
{
  -[GKPreferences setTimeInterval:forKey:](self, "setTimeInterval:forKey:", CFSTR("GKCacheTTLOverride"), a3);
}

+ (id)hostNameForEnvironment:(int64_t)a3
{
  __CFString **v3;

  if ((unint64_t)(a3 - 3) > 7)
    v3 = GKURLComponentHostProduction;
  else
    v3 = off_1E75B1E28[a3 - 3];
  return *v3;
}

+ (id)displayNameForEnvironment:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;

  v3 = a3 - 3;
  if ((unint64_t)(a3 - 3) < 8 && ((0xA7u >> v3) & 1) != 0)
  {
    v4 = off_1E75B1E68[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown (%d)"), a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)shouldAnnotateImageUsage
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKAnnotateImageUsage"));
}

- (void)setShouldAnnotateImageUsage:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKAnnotateImageUsage"));
}

- (BOOL)shouldTrackAtlasImageUsage
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKTrackAtlasUsage"));
}

- (void)setShouldTrackAtlasImageUsage:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKTrackAtlasUsage"));
}

- (BOOL)shouldUseTestIcons
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKUseTestGameIcons"));
}

- (void)setShouldUseTestIcons:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKUseTestGameIcons"));
}

- (BOOL)shouldLinkPlayerToICloud
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKLinkICloud"), 1);
}

- (void)setShouldLinkPlayerToICloud:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKLinkICloud"));
}

- (BOOL)shouldLinkPlayerToTwitter
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("GKLinkTwitter"));
}

- (void)setShouldLinkPlayerToTwitter:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKLinkTwitter"));
}

- (BOOL)shouldLinkPlayerToFacebook
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKLinkFacebook"), 1);
}

- (void)setShouldLinkPlayerToFacebook:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKLinkFacebook"));
}

- (BOOL)shouldDisallowInvitesFromStrangers
{
  return -[GKPreferences BOOLeanValueForKey:](self, "BOOLeanValueForKey:", CFSTR("IncomingMessageAlertFiltration"));
}

- (BOOL)shouldAllowNearbyMultiplayer
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  GKGetRuntimeStrategy();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isUnderage") ^ 1;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("GKAllowNearbyMultiplayer"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", v8, v5))
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isNearbyMultiplayerRestricted") ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setShouldAllowNearbyMultiplayer:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  GKGetRuntimeStrategy();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("GKAllowNearbyMultiplayer"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", v3, v8);
}

- (BOOL)shouldAllowSharing
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  GKGetRuntimeStrategy();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isUnderage") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isSharingRestricted") ^ 1;

  }
  return v4;
}

- (BOOL)shouldAddPlayerInfoToAddressBook
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKShouldAddGameCenterToAddressBook"), 1);
}

- (void)setShouldAddPlayerInfoToAddressBook:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKShouldAddGameCenterToAddressBook"));
}

- (BOOL)notifyAboutScoreSubmissions
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKNotifyScoreSubmit"), 0);
}

- (void)setNotifyAboutScoreSubmissions:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKNotifyScoreSubmit"));
}

- (BOOL)shouldAllowCustomCommunication
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  GKGetRuntimeStrategy();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isUnderage") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isCustomizedCommunicationRestricted") ^ 1;

  }
  return v4;
}

- (BOOL)multiplayerShouldAlwaysReloadCollectionView
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKMuiltplayerShouldAlwaysReloadCollectionView"), 0);
}

- (void)setMultiplayerShouldAlwaysReloadCollectionView:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKMuiltplayerShouldAlwaysReloadCollectionView"));
}

- (void)setMaxRecentPlayersCount:(unint64_t)a3
{
  -[GKPreferences setUnsignedIntegerValue:forKey:](self, "setUnsignedIntegerValue:forKey:", a3, CFSTR("GKMaxRecentPlayersCount"));
}

- (unint64_t)maxRecentPlayersCount
{
  return -[GKPreferences unsignedIntegerValueForKey:defaultValue:](self, "unsignedIntegerValueForKey:defaultValue:", CFSTR("GKMaxRecentPlayersCount"), 200);
}

- (void)setMaxRecentPlayersTime:(double)a3
{
  -[GKPreferences setTimeInterval:forKey:](self, "setTimeInterval:forKey:", CFSTR("GKMaxRecentPlayersTime"), a3);
}

- (double)maxRecentPlayersTime
{
  double result;

  -[GKPreferences timeIntervalForKey:defaultValue:](self, "timeIntervalForKey:defaultValue:", CFSTR("GKMaxRecentPlayersTime"), 5184000.0);
  return result;
}

- (unint64_t)maxDefaultPlayersP2P
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[GKPreferences overrideValueForKey:](self, "overrideValueForKey:", CFSTR("maxDefaultPlayersP2P"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 16;

  return v4;
}

- (unint64_t)maxDefaultPlayersHosted
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[GKPreferences overrideValueForKey:](self, "overrideValueForKey:", CFSTR("maxDefaultPlayersHosted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 16;

  return v4;
}

- (unint64_t)maxDefaultPlayersTurnBased
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[GKPreferences overrideValueForKey:](self, "overrideValueForKey:", CFSTR("maxDefaultPlayersTurnBased"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 16;

  return v4;
}

- (unint64_t)maxDefaultGameStateSizeTurnBased
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[GKPreferences overrideValueForKey:](self, "overrideValueForKey:", CFSTR("maxDefaultGameStateSizeTurnBased"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0x10000;

  return v4;
}

- (unint64_t)exchangeDataDefaultMaximumSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[GKPreferences overrideValueForKey:](self, "overrideValueForKey:", CFSTR("exchangeDataDefaultMaximumSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 1024;

  return v4;
}

- (unint64_t)exchangeDefaultMaxInitiatedExchangesPerPlayer
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[GKPreferences overrideValueForKey:](self, "overrideValueForKey:", CFSTR("exchangeDefaultMaxInitiatedExchangesPerPlayer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 30;

  return v4;
}

- (BOOL)HTTPShouldUsePipelining
{
  void *v2;
  void *v3;
  char v4;

  -[GKPreferences overrideValueForKey:](self, "overrideValueForKey:", CFSTR("exchangeDefaultMaxInitiatedExchangesPerPlayer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)isClipGestureEnabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKUseClipGesture"), 0);
}

- (void)setClipGestureEnabled:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKUseClipGesture"));
}

- (BOOL)fastSyncTransportEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)fetchFriendCodeInExtensionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)easySignInSheetEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)requestHeadersPrivacyEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)dashboardDeepLinkEnabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKDashboardDeepLinkEnabled"), 1);
}

- (void)setDashboardDeepLinkEnabled:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKDashboardDeepLinkEnabled"));
}

- (BOOL)multiplayerInGameOverlayEnabled
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKMultiplayerInGameOverlayEnabled"), 0);
}

- (void)setMultiplayerInGameOverlayEnabled:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKMultiplayerInGameOverlayEnabled"));
}

- (void)setInboxContactsOnly:(BOOL)a3
{
  -[GKPreferences setInboxContactsOnly:refresh:](self, "setInboxContactsOnly:refresh:", a3, 1);
}

- (void)setInboxContactsOnly:(BOOL)a3 refresh:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;

  v4 = a4;
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKFriendRequestsInboxContactsOnly"));
  if (v4)
  {
    GKGetRuntimeStrategy();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "utilityServicePrivate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "refreshPreferencesWithDataType:", 3);

  }
}

- (void)setFakeFriendRequestCount:(int64_t)a3
{
  -[GKPreferences setIntegerValue:forKey:](self, "setIntegerValue:forKey:", a3, CFSTR("GKFakeFriendRequestCount"));
}

- (BOOL)activityFeedTestFeedOnly
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKActivityFeedTestFeedOnly"), 0);
}

- (void)setActivityFeedTestFeedOnly:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKActivityFeedTestFeedOnly"));
}

- (double)multiplayerActivityFeedMaxSessionDuration
{
  double result;

  -[GKPreferences timeIntervalForKey:defaultValue:](self, "timeIntervalForKey:defaultValue:", CFSTR("GKMultiplayerActivityFeedMaxSessionDuration"), 10800.0);
  return result;
}

- (void)setMultiplayerActivityFeedMaxSessionDuration:(double)a3
{
  -[GKPreferences setTimeInterval:forKey:](self, "setTimeInterval:forKey:", CFSTR("GKMultiplayerActivityFeedMaxSessionDuration"), a3);
}

- (BOOL)accessPointIsOnAutomatically
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKAccessPointIsOnAutomatically"), 0);
}

- (void)setAccessPointIsOnAutomatically:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKAccessPointIsOnAutomatically"));
}

- (BOOL)accessPointShowHighlights
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKAccessPointShowHighlights"), 1);
}

- (void)setAccessPointShowHighlights:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKAccessPointShowHighlights"));
}

- (int64_t)accessPointLocation
{
  return -[GKPreferences integerValueForKey:defaultValue:](self, "integerValueForKey:defaultValue:", CFSTR("GKAccessPointCorner"), 1);
}

- (void)setAccessPointLocation:(int64_t)a3
{
  -[GKPreferences setIntegerValue:forKey:](self, "setIntegerValue:forKey:", a3, CFSTR("GKAccessPointCorner"));
}

- (BOOL)accessPointCustomTransition
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKAccessPointCustomTransition"), 0);
}

- (void)setAccessPointCustomTransition:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKAccessPointCustomTransition"));
}

- (BOOL)supportsChallenges
{
  return -[GKPreferences BOOLeanValueForKey:defaultValue:](self, "BOOLeanValueForKey:defaultValue:", CFSTR("GKSupportsChallenges"), 0);
}

- (void)setSupportsChallenges:(BOOL)a3
{
  -[GKPreferences setBooleanValue:forKey:](self, "setBooleanValue:forKey:", a3, CFSTR("GKSupportsChallenges"));
}

- (BOOL)isWebKitInspectElementEnabled
{
  return self->_webKitInspectElementEnabled;
}

- (void)setWebKitInspectElementEnabled:(BOOL)a3
{
  self->_webKitInspectElementEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValues, 0);
}

- (void)setPreferencesDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id value;

  value = a3;
  -[GKPreferences preferencesDelegate](self, "preferencesDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    -[GKPreferences preferencesDelegate](self, "preferencesDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (value)
      {
LABEL_7:
        objc_setAssociatedObject(self, "GKPreferencesDelegate", value, 0);
        v5 = value;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:", self);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:", self);
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (GKPreferencesDelegate)preferencesDelegate
{
  return (GKPreferencesDelegate *)objc_getAssociatedObject(self, "GKPreferencesDelegate");
}

- (BOOL)isStoreDemoModeEnabled
{
  void *v2;
  void *v3;
  const __CFString *v4;
  int AppBooleanValue;
  BOOL v6;
  Boolean keyExistsAndHasValidFormat;

  -[GKPreferences overrideValueForKey:](self, "overrideValueForKey:", CFSTR("storeDemoModeEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    LOBYTE(v4) = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v4 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
    if (v4)
    {
      keyExistsAndHasValidFormat = 0;
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), v4, &keyExistsAndHasValidFormat);
      CFRelease(v4);
      if (keyExistsAndHasValidFormat)
        v6 = AppBooleanValue == 0;
      else
        v6 = 1;
      LOBYTE(v4) = !v6;
    }
  }

  return (char)v4;
}

- (BOOL)isMultiplayerGamingRestricted
{
  return -[GKPreferences restrictionEnabledForKey:](self, "restrictionEnabledForKey:", *MEMORY[0x1E0D470D0]);
}

- (unint64_t)multiplayerAllowedPlayerType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[GKPreferences valueRestrictionForKey:](self, "valueRestrictionForKey:", *MEMORY[0x1E0D47038]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 2;

  return v4;
}

- (void)getMultiplayerAllowedPlayerTypeWithHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v8 = v4;
    -[GKPreferences valueRestrictionForKey:](self, "valueRestrictionForKey:", *MEMORY[0x1E0D47038]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "unsignedIntegerValue");
    else
      v7 = 2;
    v8[2](v8, v7);

    v4 = v8;
  }

}

- (BOOL)isAddingFriendsRestricted
{
  return -[GKPreferences restrictionEnabledForKey:](self, "restrictionEnabledForKey:", *MEMORY[0x1E0D46EE0]);
}

- (BOOL)isAppInstallationRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUIAppInstallationAllowed") ^ 1;

  return v3;
}

- (BOOL)isAccountModificationRestricted
{
  return -[GKPreferences restrictionEnabledForKey:](self, "restrictionEnabledForKey:", *MEMORY[0x1E0D46ED8]);
}

- (BOOL)isGameCenterDisabled
{
  return -[GKPreferences lockedDown](self, "lockedDown")
      || -[GKPreferences isGameCenterRestricted](self, "isGameCenterRestricted")
      || -[GKPreferences isStoreDemoModeEnabled](self, "isStoreDemoModeEnabled");
}

- (BOOL)isGameCenterRestricted
{
  return -[GKPreferences restrictionEnabledForKey:](self, "restrictionEnabledForKey:", *MEMORY[0x1E0D47030]);
}

- (BOOL)isSharingRestricted
{
  return 0;
}

- (BOOL)isProfileModificationRestricted
{
  return -[GKPreferences restrictionEnabledForKey:](self, "restrictionEnabledForKey:", *MEMORY[0x1E0D47058]);
}

- (BOOL)isCustomizedCommunicationRestricted
{
  return -[GKPreferences restrictionEnabledForKey:](self, "restrictionEnabledForKey:", *MEMORY[0x1E0D47050]);
}

- (BOOL)isNearbyMultiplayerRestricted
{
  return -[GKPreferences restrictionEnabledForKey:](self, "restrictionEnabledForKey:", *MEMORY[0x1E0D47048]);
}

- (BOOL)isProfilePrivacyModificationRestricted
{
  return -[GKPreferences restrictionEnabledForKey:](self, "restrictionEnabledForKey:", *MEMORY[0x1E0D47060]);
}

- (BOOL)isFriendsSharingRestricted
{
  return -[GKPreferences restrictionEnabledForKey:](self, "restrictionEnabledForKey:", *MEMORY[0x1E0D47040]);
}

- (BOOL)isFriendRequestsRestricted
{
  return -[GKPreferences isAccountModificationRestricted](self, "isAccountModificationRestricted")
      || -[GKPreferences isAddingFriendsRestricted](self, "isAddingFriendsRestricted")
      || -[GKPreferences isGameCenterRestricted](self, "isGameCenterRestricted");
}

- (BOOL)restrictionEnabledForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;

  v3 = (void *)MEMORY[0x1E0D47230];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", v4);

  return v6 == 2;
}

- (id)valueRestrictionForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D47230];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveValueForSetting:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5;

  if (-[GKPreferences isGameCenterRestricted](self, "isGameCenterRestricted", a3, a4))
  {
    -[GKPreferences preferencesDelegate](self, "preferencesDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gameCenterDidBecomeRestricted");
  }
  else
  {
    if (!-[GKPreferences isNearbyMultiplayerRestricted](self, "isNearbyMultiplayerRestricted"))
      return;
    +[GKPreferences shared](GKPreferences, "shared");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShouldAllowNearbyMultiplayer:", 0);
  }

}

@end
