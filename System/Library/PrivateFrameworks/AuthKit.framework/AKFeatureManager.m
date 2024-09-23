@implementation AKFeatureManager

- (BOOL)isForgotPasswordNativeTakeoverEnabled
{
  return self->_cachedIsForgotPasswordNativeTakeoverEnabled;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_33);
  return (id)sharedManager_sharedManager;
}

void __33__AKFeatureManager_sharedManager__block_invoke()
{
  AKFeatureManager *v0;
  void *v1;

  v0 = objc_alloc_init(AKFeatureManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (AKFeatureManager)init
{
  AKFeatureManager *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  AKFeatureManager *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AKFeatureManager;
  v2 = -[AKFeatureManager init](&v23, sel_init);
  if (v2)
  {
    v2->_cachedIsLisbonAvailable = _os_feature_enabled_impl();
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.18();

    v2->_cachedIsAppleIDPasskeyFeatureEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.17();

    v2->_cachedIsTiburonU13Enabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.16();

    v2->_cachedIsHawksbillEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.15();

    v2->_cachedIsChildPasscodeEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.14();

    v2->_cachedIsDTOEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.13();

    v2->_cachedIsForgotPasswordNativeTakeoverEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.12();

    v2->_appleIDSessionTelemetryEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.11();

    v2->_cachedIsDeviceListCacheEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.10();

    v2->_cachedSiwaCredentialSharingEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.9();

    v2->_cachedIsSiwaInPasswordsFeatureEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.8();

    v2->_cachedIsConvertToMAIDEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.7();

    v2->_cachedPltUpgradeEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.6();

    v2->_cachedAuthenticatedRequestSerializationEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.5();

    v2->_cachedSilentAuthenticationRequestSerializationEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.4();

    v2->_cachedAABrandingEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.3();

    v2->_adpExpansionViaCFUEnabled = _os_feature_enabled_impl();
    _AKLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.2();

    v2->_baaSupportedForVirtualMachines = _os_feature_enabled_impl();
    _AKLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[AKFeatureManager init].cold.1();

    v21 = v2;
  }

  return v2;
}

- (BOOL)isLisbonAvailable
{
  return self->_cachedIsLisbonAvailable;
}

+ (BOOL)isProxAuthEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isProxForAuthkitEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isAppleIDPasskeyFeatureEnabled
{
  return self->_cachedIsAppleIDPasskeyFeatureEnabled;
}

+ (BOOL)isYorktownEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isTiburonU13Enabled
{
  return self->_cachedIsTiburonU13Enabled;
}

- (BOOL)isHawksbillEnabled
{
  return self->_cachedIsHawksbillEnabled;
}

+ (BOOL)isEnforceMDMPolicyEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isChildPasscodeEnabled
{
  return self->_cachedIsChildPasscodeEnabled;
}

- (BOOL)isDTOEnabled
{
  return self->_cachedIsDTOEnabled;
}

+ (BOOL)isEasyDependentSignInEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDeviceListCacheEnabled
{
  return self->_cachedIsDeviceListCacheEnabled;
}

- (BOOL)backgroundiCloudSignInEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDogfishEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isTokenCacheEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isSiwaCredentialSharingEnabled
{
  return self->_cachedSiwaCredentialSharingEnabled;
}

- (BOOL)isSiwaInPasswordsFeatureEnabled
{
  return self->_cachedIsSiwaInPasswordsFeatureEnabled;
}

- (BOOL)isConvertToMAIDEnabled
{
  return self->_cachedIsConvertToMAIDEnabled;
}

- (BOOL)isTokenCreationTimeEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isPltUpgradeEnabled
{
  return self->_cachedPltUpgradeEnabled;
}

- (BOOL)isAuthenticatedRequestSerializationEnabled
{
  return self->_cachedAuthenticatedRequestSerializationEnabled;
}

- (BOOL)isSilentAuthenticationRequestSerializationEnabled
{
  return (objc_msgSend(MEMORY[0x1E0CF0E90], "deviceIsAudioAccessory") & 1) != 0
      || self->_cachedSilentAuthenticationRequestSerializationEnabled;
}

- (BOOL)isAABrandingEnabled
{
  return self->_cachedAABrandingEnabled;
}

- (BOOL)isADPExpansionViaCFUEnabled
{
  return self->_adpExpansionViaCFUEnabled;
}

- (BOOL)isBAASupportedForVirtualMachines
{
  return self->_baaSupportedForVirtualMachines;
}

- (BOOL)isAppleIDSessionTelemetryEnabled
{
  return self->_appleIDSessionTelemetryEnabled;
}

- (BOOL)isBackgroundiCloudSignInEnabled
{
  return self->_backgroundiCloudSignInEnabled;
}

- (BOOL)isUplevelSignInWithAppleEnabled
{
  return self->_uplevelSignInWithAppleEnabled;
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Feature Lisbon is supported. Is Lisbon available - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
