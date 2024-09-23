@implementation CNObservableContractEnforcementPreferences

+ (BOOL)shouldSwizzleNilResults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CNObservableContractEnforcementPreferences_shouldSwizzleNilResults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shouldSwizzleNilResults_cn_once_token_17 != -1)
    dispatch_once(&shouldSwizzleNilResults_cn_once_token_17, block);
  return objc_msgSend((id)shouldSwizzleNilResults_cn_once_object_17, "BOOLValue");
}

void __69__CNObservableContractEnforcementPreferences_shouldSwizzleNilResults__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "primitiveShouldSwizzleNilResults"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)shouldSwizzleNilResults_cn_once_object_17;
  shouldSwizzleNilResults_cn_once_object_17 = v1;

}

+ (BOOL)primitiveShouldSwizzleNilResults
{
  void *v2;
  char v3;

  +[CNUserDefaults standardPreferences](CNUserDefaults, "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedInToPreference:", CFSTR("CNSwizzleNilResults"));

  return v3;
}

+ (BOOL)shouldEnforceRxProtocols
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CNObservableContractEnforcementPreferences_shouldEnforceRxProtocols__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shouldEnforceRxProtocols_cn_once_token_16 != -1)
    dispatch_once(&shouldEnforceRxProtocols_cn_once_token_16, block);
  return objc_msgSend((id)shouldEnforceRxProtocols_cn_once_object_16, "BOOLValue");
}

void __70__CNObservableContractEnforcementPreferences_shouldEnforceRxProtocols__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "primitiveShouldEnforceRxProtocols"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)shouldEnforceRxProtocols_cn_once_object_16;
  shouldEnforceRxProtocols_cn_once_object_16 = v1;

}

+ (BOOL)primitiveShouldEnforceRxProtocols
{
  void *v2;
  char v3;

  +[CNUserDefaults standardPreferences](CNUserDefaults, "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedInToPreference:", CFSTR("CNThrowOnProtocolViolations"));

  return v3;
}

@end
