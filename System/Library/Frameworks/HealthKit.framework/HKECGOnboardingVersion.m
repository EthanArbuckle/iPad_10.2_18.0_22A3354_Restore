@implementation HKECGOnboardingVersion

+ (unint64_t)newestAvailableVersion
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (+[_HKBehavior isAppleInternalInstall](_HKBehavior, "isAppleInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("ECGOnboardingVersionOverrideKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "unsignedIntegerValue"))
    {
      _HKInitializeLogging();
      v4 = (void *)HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        v9 = 136446466;
        v10 = "+[HKECGOnboardingVersion newestAvailableVersion]";
        v11 = 1024;
        v12 = objc_msgSend(v3, "unsignedIntegerValue");
        _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s] Apply override onboarding version: %i", (uint8_t *)&v9, 0x12u);

      }
      v6 = objc_msgSend(v3, "unsignedIntegerValue");

      return v6;
    }

  }
  _HKInitializeLogging();
  v7 = HKLogHeartRhythm;
  v6 = 4;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "+[HKECGOnboardingVersion newestAvailableVersion]";
    v11 = 1024;
    v12 = 4;
    _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s] Newest available version: %i", (uint8_t *)&v9, 0x12u);
  }
  return v6;
}

@end
