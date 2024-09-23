@implementation SecKeychainForceUpgradeIfNeeded

void ___SecKeychainForceUpgradeIfNeeded_block_invoke_36(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "upgradeIfNeeded result: %i", (uint8_t *)v5, 8u);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

void ___SecKeychainForceUpgradeIfNeeded_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  secLogObjForScope("SecError");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "xpc: failure to obtain XPC proxy object for upgradeIfNeeded, %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
