@implementation NSUserDefaults(HKHeartRhythm)

+ (id)hk_heartRhythmDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.private.health.heart-rhythm"));
}

- (id)hk_demoResultKeys
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "arrayForKey:", CFSTR("DemoResultKeys"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x1E0C9AA60];
  v3 = v1;

  return v3;
}

- (uint64_t)hk_setDemoResultKeys:()HKHeartRhythm
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("DemoResultKeys"));
}

- (uint64_t)hk_hfeModeEnabled
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("EnableHFEMode"));
}

- (uint64_t)hk_setElectrocardiogramWatchAppInstallIsAllowed:()HKHeartRhythm
{
  return objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("ElectrocardiogramWatchAppInstallIsAllowed"));
}

- (uint64_t)hk_electrocardiogramWatchAppInstallHasBeenAllowed
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("ElectrocardiogramWatchAppInstallIsAllowed"));
}

- (void)hk_setElectrocardiogramFirstRecordingCompleted:()HKHeartRhythm
{
  id v5;

  if (objc_msgSend(a1, "BOOLForKey:", CFSTR("HKElectrocardiogramFirstRecordingCompleted")) != (_DWORD)a3)
  {
    objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("HKElectrocardiogramFirstRecordingCompleted"));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("HKElectrocardiogramFirstRecordingCompleted"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults(CFSTR("com.apple.private.health.heart-rhythm"), v5);

  }
}

- (uint64_t)hk_electrocardiogramFirstRecordingCompleted
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("HKElectrocardiogramFirstRecordingCompleted"));
}

@end
