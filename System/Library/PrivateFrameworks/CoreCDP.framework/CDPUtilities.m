@implementation CDPUtilities

+ (BOOL)isMultiUserManateeFeatureEnabled
{
  return 0;
}

+ (BOOL)canEnableMultiUserManatee
{
  _BOOL4 v2;

  v2 = +[CDPUtilities isMultiUserManateeFeatureEnabled](CDPUtilities, "isMultiUserManateeFeatureEnabled");
  if (v2)
    LOBYTE(v2) = !+[CDPUtilities isAudioAccessory](CDPUtilities, "isAudioAccessory");
  return v2;
}

+ (BOOL)hasFullCDPSupport
{
  return 1;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_11);
  return _isInternalBuild;
}

uint64_t __31__CDPUtilities_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  _isInternalBuild = result;
  return result;
}

+ (BOOL)isDemoDevice
{
  return CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0) != 0;
}

+ (BOOL)useCDPContextSecretInsteadOfSBDSecretFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSilentEscrowRecordViabilityRepairEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)deferSOSFromSignIn
{
  char v2;
  NSObject *v3;

  v2 = _os_feature_enabled_impl();
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[CDPUtilities deferSOSFromSignIn].cold.1();

  return v2;
}

+ (BOOL)isAudioAccessory
{
  return objc_msgSend(MEMORY[0x24BDFC2D0], "deviceIsAudioAccessory");
}

+ (BOOL)shouldCentralizeRPDFlow
{
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((objc_msgSend(a1, "readPreferencesFor:", CFSTR("CentralizedRPDFlow")) & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "BOOLFromAKConfigurations:", CFSTR("disableRPDCentralization")))
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[CDPUtilities shouldCentralizeRPDFlow].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    v3 = 0;
  }
  else
  {
    v3 = _os_feature_enabled_impl();
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[CDPUtilities shouldCentralizeRPDFlow].cold.2();
  }

  return v3;
}

+ (BOOL)shouldUseNewMacOSRPDFlow
{
  char v2;
  NSObject *v3;

  v2 = _os_feature_enabled_impl();
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[CDPUtilities shouldUseNewMacOSRPDFlow].cold.1();

  return v2;
}

+ (BOOL)isKeyboardOOPEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isKeyboardOOPiPadEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isICSCHarmonizationEnabled
{
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((objc_msgSend(a1, "readPreferencesFor:", CFSTR("SwiftUIRemoteSecretFlow")) & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "BOOLFromAKConfigurations:", CFSTR("disableiCSCHarmonizationFlow")))
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[CDPUtilities isICSCHarmonizationEnabled].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    v3 = 0;
  }
  else
  {
    v3 = _os_feature_enabled_impl();
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[CDPUtilities isICSCHarmonizationEnabled].cold.2();
  }

  return v3;
}

+ (BOOL)BOOLFromAKConfigurations:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  BOOL v9;

  v3 = (void *)MEMORY[0x24BE0ADF0];
  v4 = a3;
  objc_msgSend(v3, "sharedBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationAtKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    v9 = objc_msgSend(v8, "intValue") == 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)isSilentBurnInMiniBuddyEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCDPRepairWithProximityBasedPiggybackingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)shouldValidatePasscodeGenerations
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isVirtualMachine
{
  if (isVirtualMachine_onceToken != -1)
    dispatch_once(&isVirtualMachine_onceToken, &__block_literal_global_48);
  return isVirtualMachine_result;
}

uint64_t __32__CDPUtilities_isVirtualMachine__block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!(_DWORD)result)
    isVirtualMachine_result = v2 != 0;
  return result;
}

+ (BOOL)readPreferencesFor:(id)a3
{
  __CFString *v4;
  BOOL v5;
  Boolean keyExistsAndHasValidFormat;

  v4 = (__CFString *)a3;
  if (objc_msgSend(a1, "isInternalBuild"))
  {
    keyExistsAndHasValidFormat = 0;
    v5 = CFPreferencesGetAppBooleanValue(v4, CFSTR("com.apple.corecdp"), &keyExistsAndHasValidFormat) != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldClearRKCacheAfterGeneration
{
  if (shouldClearRKCacheAfterGeneration_once != -1)
    dispatch_once(&shouldClearRKCacheAfterGeneration_once, &__block_literal_global_52);
  return shouldClearRKCacheAfterGeneration_shouldClear;
}

void __49__CDPUtilities_shouldClearRKCacheAfterGeneration__block_invoke()
{
  int v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = +[CDPUtilities isInternalBuild](CDPUtilities, "isInternalBuild");
  if (v0)
    LOBYTE(v0) = _os_feature_enabled_impl();
  shouldClearRKCacheAfterGeneration_shouldClear = v0;
  _CDPLogSystem();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __49__CDPUtilities_shouldClearRKCacheAfterGeneration__block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

}

+ (BOOL)isBuddyFinished
{
  BOOL result;

  if (isBuddyFinished__buddyFinished)
    return 1;
  result = _BYSetupAssistantNeedsToRun() ^ 1;
  isBuddyFinished__buddyFinished = result;
  return result;
}

+ (void)isWalrusStatusMismatchDetectionEnabledWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  if (+[CDPUtilities isInternalBuild](CDPUtilities, "isInternalBuild")
    && CFPreferencesGetAppBooleanValue(CFSTR("disableWalrusStatusMismatchDetectionEnabled"), CFSTR("com.apple.corecdp"), 0))
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[CDPUtilities isWalrusStatusMismatchDetectionEnabledWithCompletion:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0ADF0], "sharedBag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke;
    v13[3] = &unk_24C7C1228;
    v14 = v3;
    objc_msgSend(v12, "requestNewURLBagIfNecessaryWithCompletion:", v13);

  }
}

void __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;

  v4 = a3;
  if (v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke_cold_2((uint64_t)v4, v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0ADF0], "sharedBag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationAtKey:", CFSTR("isWalrusStatusMismatchDetectionEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_opt_class();
      v8 = v7;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;

      objc_msgSend(v9, "intValue");
    }
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (void)deferSOSFromSignIn
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3(&dword_20D7E6000, v0, v1, "\"DeferSOSFromSignIn = %{BOOL}d\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)shouldCentralizeRPDFlow
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3(&dword_20D7E6000, v0, v1, "\"CentralizedRPDFlow = %{BOOL}d\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)shouldUseNewMacOSRPDFlow
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3(&dword_20D7E6000, v0, v1, "\"UseNewMacOSRPDFlow = %{BOOL}d\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isICSCHarmonizationEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3(&dword_20D7E6000, v0, v1, "\"ICSCHarmonizationIOS = %{BOOL}d\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__CDPUtilities_shouldClearRKCacheAfterGeneration__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20D7E6000, a1, a3, "\"ShouldClearRKCacheAfterGeneration: %{BOOL}d\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isWalrusStatusMismatchDetectionEnabledWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D7E6000, a1, a3, "\"isWalrusStatusMismatchDetectionEnabled has overrider set, returning false\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3(&dword_20D7E6000, v0, v1, "\"Received isWalrusStatusMismatchDetectionEnabled = %d\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_DEBUG, "\"Error %@ getting isWalrusStatusMismatchDetectionEnabled from URLBag, returning false\", (uint8_t *)&v2, 0xCu);
}

@end
