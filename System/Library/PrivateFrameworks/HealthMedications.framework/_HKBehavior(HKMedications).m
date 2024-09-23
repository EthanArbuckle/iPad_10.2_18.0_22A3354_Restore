@implementation _HKBehavior(HKMedications)

- (uint64_t)hkmd_supportsTimeZone
{
  NSObject *v2;
  const char *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "healthAppHiddenOrNotInstalled"))
  {
    _HKInitializeLogging();
    HKLogMedication();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = a1;
      v3 = "[%{public}@]: Scheduling disabled. Health app is hidden or not installed.";
LABEL_7:
      _os_log_impl(&dword_1B77D4000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v5, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "isAppleWatch"))
  {
    _HKInitializeLogging();
    HKLogMedication();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = a1;
      v3 = "[%{public}@]: Timezone changes are no-op on watch.";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  return 1;
}

- (uint64_t)hkmd_supportsMedicationsWidget
{
  uint64_t result;
  void *v3;
  int v4;

  result = objc_msgSend(a1, "isDeviceSupported");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "currentDeviceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone"));

    return objc_msgSend(a1, "isAppleWatch") | v4;
  }
  return result;
}

@end
