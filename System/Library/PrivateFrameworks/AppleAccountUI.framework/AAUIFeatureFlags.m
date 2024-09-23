@implementation AAUIFeatureFlags

+ (BOOL)isTobleroneEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D20F38], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateForFeature:domain:", CFSTR("Toblerone"), CFSTR("AppleAccountUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "value") == 1;
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isNewSignInProgressEnabled
{
  char v2;
  NSObject *v3;

  v2 = _os_feature_enabled_impl();
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[AAUIFeatureFlags isNewSignInProgressEnabled].cold.1();

  return v2;
}

+ (BOOL)isLCInviteAcceptanceEnabled
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationAtKey:", CFSTR("inheritanceCfgs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "LCInvite: inheritanceCfgs from urlbag: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inviteAcceptance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "LCInvite: Returning LCInviteAcceptance from urlbag: %@", (uint8_t *)&v9, 0xCu);
    }

    LOBYTE(v6) = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    LODWORD(v6) = _os_feature_enabled_impl();
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109120;
      LODWORD(v10) = (_DWORD)v6;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "LCInvite: No IdMS feature flag found. is OS FeatureFlag Enabled %d", (uint8_t *)&v9, 8u);
    }

  }
  return (char)v6;
}

+ (BOOL)isPrintableSummaryEnabled
{
  char v2;
  NSObject *v3;

  v2 = _os_feature_enabled_impl();
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[AAUIFeatureFlags isPrintableSummaryEnabled].cold.1();

  return v2;
}

+ (BOOL)isConvertToMAIDEnabled
{
  char v2;
  NSObject *v3;

  v2 = _os_feature_enabled_impl();
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[AAUIFeatureFlags isConvertToMAIDEnabled].cold.1();

  return v2;
}

+ (BOOL)isAccountDataclassListRedesignEnabled
{
  char v2;
  NSObject *v3;

  v2 = _os_feature_enabled_impl();
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[AAUIFeatureFlags isAccountDataclassListRedesignEnabled].cold.1();

  return v2;
}

+ (BOOL)isSignInSecurityRedesignEnabled
{
  char v2;
  NSObject *v3;

  v2 = _os_feature_enabled_impl();
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[AAUIFeatureFlags isSignInSecurityRedesignEnabled].cold.1();

  return v2;
}

+ (BOOL)isSignInSecurityRedesignMacOSEnabled
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[AAUIFeatureFlags isSignInSecurityRedesignMacOSEnabled].cold.1(v2);

  return 0;
}

+ (BOOL)isRecoveryContactUpsellTipEnabled
{
  char v2;
  NSObject *v3;

  v2 = _os_feature_enabled_impl();
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[AAUIFeatureFlags isRecoveryContactUpsellTipEnabled].cold.1();

  return v2;
}

+ (void)isNewSignInProgressEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5(&dword_1DB4ED000, v0, v1, "AppleAccountUI/AppleIDSignInProgress=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isPrintableSummaryEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5(&dword_1DB4ED000, v0, v1, "AppleAccountUI/PrintableAccountRecoverySummary=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isConvertToMAIDEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5(&dword_1DB4ED000, v0, v1, "AppleAccountUI/ConvertToMAID=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isAccountDataclassListRedesignEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5(&dword_1DB4ED000, v0, v1, "AppleAccountUI/AccountDataclassListRedesign=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isSignInSecurityRedesignEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5(&dword_1DB4ED000, v0, v1, "AppleAccountUI/SignInSecurityRedesign=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isSignInSecurityRedesignMacOSEnabled
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "AppleAccountUI/SignInSecurityRedesignMacOS is disabled.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isRecoveryContactUpsellTipEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5(&dword_1DB4ED000, v0, v1, "AppleAccountUI/RecoveryContactUpsellTip=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
