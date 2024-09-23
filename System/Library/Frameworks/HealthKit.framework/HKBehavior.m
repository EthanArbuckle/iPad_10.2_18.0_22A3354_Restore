@implementation HKBehavior

_HKFeatureFlags *__23___HKBehavior_features__block_invoke()
{
  return objc_alloc_init(_HKFeatureFlags);
}

uint64_t __38___HKBehavior_shouldReceiveECGSamples__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  void *v2;
  uint64_t v3;

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[218])
    return 1;
  objc_msgSend(v1, "currentDeviceRegionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("LM/A")) & 1) != 0)
    v3 = 0;
  else
    v3 = MGGetBoolAnswer();

  return v3;
}

uint64_t __30___HKBehavior_isRealityDevice__block_invoke()
{
  return 0;
}

BOOL __40___HKBehavior_supportsSharedSummarySync__block_invoke(uint64_t a1)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 32) + 218) == 0;
}

BOOL __42___HKBehavior_canPerformOwnershipTakeover__block_invoke(uint64_t a1)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 32) + 218) == 0;
}

uint64_t __32___HKBehavior_supportsCloudSync__block_invoke()
{
  return 1;
}

uint64_t __40___HKBehavior_supportsCloudSyncSharding__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (!objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"))
    return 1;
  result = objc_msgSend(*(id *)(a1 + 32), "tinkerModeEnabled");
  if ((_DWORD)result)
    return 1;
  return result;
}

uint64_t __44___HKBehavior_supportsCloudSyncStagingShard__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (!objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"))
    return 1;
  result = objc_msgSend(*(id *)(a1 + 32), "tinkerModeEnabled");
  if ((_DWORD)result)
    return 1;
  return result;
}

uint64_t __44___HKBehavior_supportsPeriodicFullCloudSync__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (!objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"))
    return 1;
  result = objc_msgSend(*(id *)(a1 + 32), "tinkerModeEnabled");
  if ((_DWORD)result)
    return 1;
  return result;
}

BOOL __44___HKBehavior_supportsPeriodicLiteCloudSync__block_invoke(uint64_t a1)
{
  return !objc_msgSend(*(id *)(a1 + 32), "isAppleWatch")
      || (objc_msgSend(*(id *)(a1 + 32), "tinkerModeEnabled") & 1) == 0;
}

BOOL __43___HKBehavior_supportsCoordinatedCloudSync__block_invoke()
{
  return +[_HKBehavior hasPairedWatch](_HKBehavior, "hasPairedWatch");
}

void __33___HKBehavior__isDeviceSupported__block_invoke()
{
  NSObject *v0;
  id v1;
  int v2;
  id v3;
  __int16 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 138543618;
    v3 = (id)objc_opt_class();
    v4 = 2114;
    v5 = CFSTR("healthkit");
    v1 = v3;
    _os_log_impl(&dword_19A0E6000, v0, OS_LOG_TYPE_DEFAULT, "%{public}@: Overriding %{public}@", (uint8_t *)&v2, 0x16u);

  }
}

void __33___HKBehavior__isDeviceSupported__block_invoke_165()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG);

  if (v1)
  {
    HKLogInfrastructure();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = (void *)objc_opt_class();
      __33___HKBehavior__isDeviceSupported__block_invoke_165_cold_1(v3, (uint64_t)v4, v2);
    }

  }
}

void __38___HKBehavior__isAppleInternalInstall__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;

  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
  {
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __38___HKBehavior__isAppleInternalInstall__block_invoke_cold_1(a1, v4);

  }
}

void __33___HKBehavior__isDeviceSupported__block_invoke_165_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  v5 = a1;
  _os_log_debug_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Device is not supported", (uint8_t *)a2, 0xCu);

}

void __38___HKBehavior__isAppleInternalInstall__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 32))
    v2 = "n ";
  else
    v2 = " NON-";
  v3 = 136446210;
  v4 = v2;
  _os_log_debug_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_DEBUG, "Device is a%{public}sAppleInternal install", (uint8_t *)&v3, 0xCu);
}

@end
