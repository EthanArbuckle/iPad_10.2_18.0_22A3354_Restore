@implementation NRMagicSwitchHelper

+ (id)companionSeed
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock_with_options();
  if (!qword_1ECE23918)
  {
    v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AdvertisingIdentifierSeed"), CFSTR("com.apple.NanoRegistry"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
      v4 = (void *)qword_1ECE23918;
      qword_1ECE23918 = v3;

    }
    if (!qword_1ECE23918)
    {
      v5 = objc_opt_new();
      v6 = (void *)qword_1ECE23918;
      qword_1ECE23918 = v5;

      CFPreferencesSetAppValue(CFSTR("AdvertisingIdentifierSeed"), (CFPropertyListRef)objc_msgSend((id)qword_1ECE23918, "UUIDString"), CFSTR("com.apple.NanoRegistry"));
      v7 = CFPreferencesAppSynchronize(CFSTR("com.apple.NanoRegistry"));
      nr_framework_log();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        nr_framework_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)qword_1ECE23918, "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412546;
          v14 = v11;
          v15 = 1024;
          v16 = v7;
          _os_log_impl(&dword_1A0BDB000, v10, OS_LOG_TYPE_DEFAULT, "Generated and persisted new companion seed: (%@); ret: (%u)",
            (uint8_t *)&v13,
            0x12u);

        }
      }
    }

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_12);
  return (id)qword_1ECE23918;
}

+ (void)clearCompanionSeed
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock_with_options();
  v2 = (void *)qword_1ECE23918;
  qword_1ECE23918 = 0;

  CFPreferencesSetAppValue(CFSTR("AdvertisingIdentifierSeed"), 0, CFSTR("com.apple.NanoRegistry"));
  v3 = CFPreferencesAppSynchronize(CFSTR("com.apple.NanoRegistry"));
  nr_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    nr_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_DEFAULT, "Cleared Advertising Identifier Seed; ret: (%u)",
        (uint8_t *)v7,
        8u);
    }

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_12);
}

@end
