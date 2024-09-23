@implementation AAPreferences

+ (BOOL)isExperimentalModeEnabled
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("AAExperimentalMode"), CFSTR("com.apple.appleaccount"), 0) != 0;
  return v2;
}

+ (BOOL)isMultipleFullAccountsEnabled
{
  BOOL v2;
  NSObject *v3;

  if (objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild"))
    v2 = CFPreferencesGetAppBooleanValue(CFSTR("AAMultipleFullAccounts"), CFSTR("com.apple.appleaccount"), 0) != 0;
  else
    v2 = 0;
  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[AAPreferences isMultipleFullAccountsEnabled].cold.1(v2, v3);

  return v2;
}

+ (void)setMultipleFullAccountsEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AAMultipleFullAccounts"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.appleaccount"));
}

+ (BOOL)shouldUseUnifiedLoginEndpoint
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AAUseLegacyLoginEndpoint"), CFSTR("com.apple.appleaccount"), 0) != 1;
}

+ (void)setShouldUseUnifiedLoginEndpoint:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AAUseLegacyLoginEndpoint"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !a3), CFSTR("com.apple.appleaccount"));
}

+ (BOOL)shouldEnableFastSignIn
{
  return _os_feature_enabled_impl();
}

+ (BOOL)shouldEnableAccountUserNotifications
{
  return _os_feature_enabled_impl();
}

+ (BOOL)shouldShowAccountContacts
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AAShowAccountContacts"), CFSTR("com.apple.appleaccount"), 0) != 0;
}

+ (void)setShouldShowAccountContacts:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AAShowAccountContacts"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.appleaccount"));
}

+ (BOOL)isRunningInStoreDemoMode
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

+ (void)setExperimentalModeEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AAExperimentalMode"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.appleaccount"));
}

+ (BOOL)isHealthCheckTTREnabled
{
  if (CFPreferencesGetAppBooleanValue(CFSTR("AADisableHealthCheckTTR"), CFSTR("com.apple.appleaccount"), 0))
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild");
}

+ (void)setHealthCheckTTREnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AADisableHealthCheckTTR"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !a3), CFSTR("com.apple.appleaccount"));
}

+ (BOOL)isSimulateUnhealthyCustodianEnabled
{
  int AppBooleanValue;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AASimulateUnhealthyCustodian"), CFSTR("com.apple.appleaccount"), 0);
  if (AppBooleanValue)
    LOBYTE(AppBooleanValue) = objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild");
  return AppBooleanValue;
}

+ (void)setSimulateUnhealthyCustodianEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AASimulateUnhealthyCustodian"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.appleaccount"));
}

+ (BOOL)isCustomHealthCheckIntervalEnabled
{
  int AppBooleanValue;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AACustomHealthCheckIntervalEnabled"), CFSTR("com.apple.appleaccount"), 0);
  if (AppBooleanValue)
    LOBYTE(AppBooleanValue) = objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild");
  return AppBooleanValue;
}

+ (void)setCustomHealthCheckIntervalEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AACustomHealthCheckIntervalEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.appleaccount"));
}

+ (BOOL)isNeverSkipCustodianCheckEnabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AANeverSkipCustodianCheck"), CFSTR("com.apple.appleaccount"), 0) != 0;
}

+ (void)setNeverSkipCustodianCheckEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AANeverSkipCustodianCheck"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.appleaccount"));
}

+ (int64_t)customHealthCheckIntervalMinutes
{
  return CFPreferencesGetAppIntegerValue(CFSTR("AACustomHealthCheckIntervalMinutes"), CFSTR("com.apple.appleaccount"), 0);
}

+ (void)setCustomHealthCheckIntervalMinutes:(int64_t)a3
{
  CFPreferencesSetAppValue(CFSTR("AACustomHealthCheckIntervalMinutes"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("com.apple.appleaccount"));
}

+ (int64_t)customHealthCheckReachabilityIntervalMinutes
{
  return CFPreferencesGetAppIntegerValue(CFSTR("AACustomHealthCheckReachabilityIntervalMinutes"), CFSTR("com.apple.appleaccount"), 0);
}

+ (void)setCustomHealthFailureReachabilityIntervalMinutes:(int64_t)a3
{
  CFPreferencesSetAppValue(CFSTR("AACustomHealthCheckReachabilityIntervalMinutes"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("com.apple.appleaccount"));
}

+ (int64_t)customHealthCheckVersion
{
  return CFPreferencesGetAppIntegerValue(CFSTR("AACustomHealthCheckversion"), CFSTR("com.apple.appleaccount"), 0);
}

+ (void)setCustomHealthCheckVersion:(int64_t)a3
{
  CFPreferencesSetAppValue(CFSTR("AACustomHealthCheckversion"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("com.apple.appleaccount"));
}

+ (BOOL)isCustomIdentityTaskIntervalEnabled
{
  int AppBooleanValue;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AACustomIdentityTaskIntervalEnabled"), CFSTR("com.apple.appleaccount"), 0);
  if (AppBooleanValue)
    LOBYTE(AppBooleanValue) = objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild");
  return AppBooleanValue;
}

+ (void)setCustomIdentityTaskIntervalEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AACustomIdentityTaskIntervalEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.appleaccount"));
}

+ (int64_t)customIdentityTaskIntervalMinutes
{
  return CFPreferencesGetAppIntegerValue(CFSTR("AACustomIdentityTaskIntervalMinutes"), CFSTR("com.apple.appleaccount"), 0);
}

+ (void)setCustomIdentityTaskIntervalMinutes:(int64_t)a3
{
  CFPreferencesSetAppValue(CFSTR("AACustomIdentityTaskIntervalMinutes"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("com.apple.appleaccount"));
}

+ (BOOL)isYorktownEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isIdentityPresentationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSpyglass2023Enabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMomentsDataclassEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAppleAccountInformationCacheEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSignInSecurityRedesignEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSignInSecurityRedesignMacOSEnabled
{
  return 0;
}

+ (BOOL)shouldSkipIdMSKeyUpdate
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("AASkipIdMSKeyUpdate"), CFSTR("com.apple.appleaccount"), 0) != 0;
  return v2;
}

+ (BOOL)shouldSkipIdMSFinalizeCustodian
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("AASkipIdMSFinalizeCustodian"), CFSTR("com.apple.appleaccount"), 0) != 0;
  return v2;
}

+ (void)setCustodianInfo:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("AACustodianInfo"), a3, CFSTR("com.apple.appleaccount"));
  CFPreferencesSynchronize(CFSTR("com.apple.appleaccount"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

+ (id)getCustodianInfo
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.appleaccount"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  return (id)(id)CFPreferencesCopyValue(CFSTR("AACustodianInfo"), CFSTR("com.apple.appleaccount"), v2, v3);
}

+ (BOOL)simulate2FAFA
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("AASimulate2FAFA"), CFSTR("com.apple.appleaccount"), 0) != 0;
  return v2;
}

+ (BOOL)isRCUpsellEnabled
{
  return 0;
}

+ (BOOL)disableADPStateHealing
{
  _BOOL4 v2;

  v2 = +[AADeviceInfo isInternalBuild](AADeviceInfo, "isInternalBuild");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("disableWalrusStatusMismatchDetectionEnabled"), CFSTR("com.apple.appleaccount"), 0) != 0;
  return v2;
}

+ (void)setDisableADPStateHealing:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (+[AADeviceInfo isInternalBuild](AADeviceInfo, "isInternalBuild"))
  {
    CFPreferencesSetAppValue(CFSTR("disableWalrusStatusMismatchDetectionEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("com.apple.appleaccount"));
    CFPreferencesSynchronize(CFSTR("com.apple.appleaccount"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  }
}

+ (void)isMultipleFullAccountsEnabled
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_19EACA000, a2, OS_LOG_TYPE_DEBUG, "AAPreferences: Multiple full accounts are enabled on this platform: %@", (uint8_t *)&v3, 0xCu);
}

@end
