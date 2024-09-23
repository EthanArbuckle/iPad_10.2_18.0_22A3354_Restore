@implementation FLEnvironment

void __35__FLEnvironment_currentEnvironment__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)currentEnvironment_env;
  currentEnvironment_env = (uint64_t)v1;

}

- (FLEnvironment)init
{
  FLEnvironment *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FLEnvironment;
  v2 = -[FLEnvironment init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.followup"));
    -[FLEnvironment setFollowupDefaults:](v2, "setFollowupDefaults:", v3);

  }
  return v2;
}

- (void)setFollowupDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_followupDefaults, a3);
}

+ (id)currentEnvironment
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FLEnvironment_currentEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentEnvironment_onceToken != -1)
    dispatch_once(&currentEnvironment_onceToken, block);
  return (id)currentEnvironment_env;
}

- (BOOL)shouldHideAllFollowUps
{
  if (shouldHideAllFollowUps_onceToken != -1)
    dispatch_once(&shouldHideAllFollowUps_onceToken, &__block_literal_global_7_0);
  return shouldHideAllFollowUps_hideAll;
}

- (BOOL)isInternal
{
  if (isInternal_onceToken != -1)
    dispatch_once(&isInternal_onceToken, &__block_literal_global_7);
  return isInternal_isInternalBuild;
}

- (id)supportedBundleIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__FLEnvironment_supportedBundleIdentifiers__block_invoke;
  block[3] = &unk_1E6F1E670;
  block[4] = self;
  if (supportedBundleIdentifiers_onceToken != -1)
    dispatch_once(&supportedBundleIdentifiers_onceToken, block);
  return (id)supportedBundleIdentifiers_bundleIdentifiers;
}

uint64_t __27__FLEnvironment_isInternal__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternal_isInternalBuild = result;
  return result;
}

- (BOOL)shouldShowUnapprovedItems
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FLEnvironment_shouldShowUnapprovedItems__block_invoke;
  block[3] = &unk_1E6F1E670;
  block[4] = self;
  if (shouldShowUnapprovedItems_onceToken != -1)
    dispatch_once(&shouldShowUnapprovedItems_onceToken, block);
  return shouldShowUnapprovedItems_shouldShowUnapprovedItems;
}

void __42__FLEnvironment_shouldShowUnapprovedItems__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "followupDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKey:", CFSTR("ShouldShowUnapprovedItems"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B8D53000, v3, OS_LOG_TYPE_DEFAULT, "Read ShouldShowUnapprovedItems: %@", (uint8_t *)&v4, 0xCu);
  }

  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      shouldShowUnapprovedItems_shouldShowUnapprovedItems = objc_msgSend(v2, "BOOLValue");
  }

}

- (BOOL)isUnlocked
{
  return !MEMORY[0x1E0D4E4C8] || MKBGetDeviceLockState() == 0;
}

void __39__FLEnvironment_shouldHideAllFollowUps__block_invoke()
{
  NSObject *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  shouldHideAllFollowUps_hideAll = CFPreferencesGetAppBooleanValue(CFSTR("HideAll"), CFSTR("com.apple.followup"), 0) != 0;
  _FLLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldHideAllFollowUps_hideAll);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_1B8D53000, v0, OS_LOG_TYPE_DEFAULT, "Read HideAll: %@", (uint8_t *)&v2, 0xCu);

  }
}

- (BOOL)followUpExtensionSupportEnabled
{
  return 1;
}

- (BOOL)followUpZeroActionsForTheWorld
{
  return CFPreferencesGetAppBooleanValue(CFSTR("ZeroActionsEnabled"), CFSTR("com.apple.followup"), 0) != 0;
}

- (BOOL)stressMode
{
  if (stressMode_onceToken != -1)
    dispatch_once(&stressMode_onceToken, &__block_literal_global_12);
  return stressMode_stress;
}

void __27__FLEnvironment_stressMode__block_invoke()
{
  NSObject *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  stressMode_stress = CFPreferencesGetAppBooleanValue(CFSTR("StressMode"), CFSTR("com.apple.followup"), 0) != 0;
  _FLLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", stressMode_stress);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_1B8D53000, v0, OS_LOG_TYPE_DEFAULT, "Read StressMode: %@", (uint8_t *)&v2, 0xCu);

  }
}

void __43__FLEnvironment_supportedBundleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "stressMode") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "stressBundleIdentifiers");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)supportedBundleIdentifiers_bundleIdentifiers;
    supportedBundleIdentifiers_bundleIdentifiers = v2;

  }
  else
  {
    v6[0] = CFSTR("com.apple.Preferences");
    v6[1] = CFSTR("com.apple.Bridge");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)supportedBundleIdentifiers_bundleIdentifiers;
    supportedBundleIdentifiers_bundleIdentifiers = v4;

  }
}

- (id)stressBundleIdentifiers
{
  if (stressBundleIdentifiers_onceToken != -1)
    dispatch_once(&stressBundleIdentifiers_onceToken, &__block_literal_global_16);
  return (id)stressBundleIdentifiers_bundleIdentifiers;
}

void __40__FLEnvironment_stressBundleIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.Preferences");
  v2[1] = CFSTR("com.apple.Bridge");
  v2[2] = CFSTR("com.apple.Home");
  v2[3] = CFSTR("com.apple.mobilesafari");
  v2[4] = CFSTR("com.apple.MobileSMS");
  v2[5] = CFSTR("com.apple.mobileslideshow");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stressBundleIdentifiers_bundleIdentifiers;
  stressBundleIdentifiers_bundleIdentifiers = v0;

}

- (BOOL)normalizeExpirationToMidnight
{
  void *v2;
  void *v3;
  NSObject *v4;
  char v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[FLEnvironment followupDefaults](self, "followupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("NormalizeToMidnight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B8D53000, v4, OS_LOG_TYPE_DEFAULT, "Read NormalizeToMidnight: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = normalizeExpirationToMidnight_result != 0;
  normalizeExpirationToMidnight_result = v5;

  return v5;
}

- (double)oneDayTimeInterval
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FLEnvironment_oneDayTimeInterval__block_invoke;
  block[3] = &unk_1E6F1E670;
  block[4] = self;
  if (oneDayTimeInterval_onceToken != -1)
    dispatch_once(&oneDayTimeInterval_onceToken, block);
  return *(double *)&oneDayTimeInterval_timeInterval;
}

void __35__FLEnvironment_oneDayTimeInterval__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  double v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "followupDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKey:", CFSTR("OneDayInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_impl(&dword_1B8D53000, v3, OS_LOG_TYPE_DEFAULT, "Read OneDayInterval: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(v2, "doubleValue");
  if (v4 > 0.0)
  {
    objc_msgSend(v2, "doubleValue");
    oneDayTimeInterval_timeInterval = v5;
  }

}

- (id)supportedNotifyingAppIds
{
  if (supportedNotifyingAppIds_onceToken != -1)
    dispatch_once(&supportedNotifyingAppIds_onceToken, &__block_literal_global_29);
  return (id)supportedNotifyingAppIds_appIds;
}

void __41__FLEnvironment_supportedNotifyingAppIds__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.Preferences");
  v2[1] = CFSTR("com.apple.iCloud.FollowUp");
  v2[2] = CFSTR("com.apple.NDO.FollowUp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedNotifyingAppIds_appIds;
  supportedNotifyingAppIds_appIds = v0;

}

- (NSUserDefaults)followupDefaults
{
  return self->_followupDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followupDefaults, 0);
}

@end
