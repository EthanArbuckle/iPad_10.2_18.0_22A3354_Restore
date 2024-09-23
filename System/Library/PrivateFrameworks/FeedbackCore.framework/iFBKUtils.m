@implementation iFBKUtils

+ (BOOL)deviceSupportsFaceID
{
  if (deviceSupportsFaceID_onceToken != -1)
    dispatch_once(&deviceSupportsFaceID_onceToken, &__block_literal_global_29);
  return deviceSupportsFaceID__usesFaceID;
}

+ (void)addToHomeScreen
{
  NSObject *v3;
  uint8_t v4[16];

  +[FBKLog appHandle](FBKLog, "appHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "Adding to home screen", v4, 2u);
  }

  objc_msgSend(a1, "setFBKVisibleInHomeScreen:", 1);
}

+ (void)removeFromHomeScreen
{
  NSObject *v3;
  uint8_t v4[16];

  +[FBKLog appHandle](FBKLog, "appHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "Removing from home screen", v4, 2u);
  }

  objc_msgSend(a1, "setFBKVisibleInHomeScreen:", 0);
}

+ (void)exitCaptiveModeRemovingFromHomeScreen:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loginManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__iFBKUtils_exitCaptiveModeRemovingFromHomeScreen___block_invoke;
  v7[3] = &__block_descriptor_41_e5_v8__0l;
  v8 = a3;
  v7[4] = a1;
  objc_msgSend(v6, "logOutIfNeededAndRun:", v7);

}

+ (void)setFBKVisibleInHomeScreen:(BOOL)a3
{
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setPreferencesValue:forKey:domain:", v4, CFSTR("SBIconVisibility"), CFSTR("com.apple.appleseed.FeedbackAssistant"));

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, 0, 1u);
}

+ (BOOL)wasFBAVisibleAtFirstLaunch
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__iFBKUtils_wasFBAVisibleAtFirstLaunch__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (wasFBAVisibleAtFirstLaunch_onceToken != -1)
    dispatch_once(&wasFBAVisibleAtFirstLaunch_onceToken, block);
  return wasFBAVisibleAtFirstLaunch__wasVisible;
}

+ (BOOL)isFBAVisibleInHomeScreen
{
  void *v2;
  char v3;

  objc_msgSend(a1, "getPreferencesValueforKey:domain:", CFSTR("SBIconVisibility"), CFSTR("com.apple.appleseed.FeedbackAssistant"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (id)getPreferencesValueforKey:(id)a3 domain:(__CFString *)a4
{
  __CFString *v5;
  void *v6;

  v5 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a4);
  v6 = (void *)CFPreferencesCopyAppValue(v5, a4);

  return v6;
}

+ (void)setPreferencesValue:(id)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  const __CFString *v6;
  const __CFString *v7;

  v6 = (const __CFString *)*MEMORY[0x24BDBD590];
  v7 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue((CFStringRef)a4, a3, a5, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSynchronize(a5, v6, v7);
}

@end
