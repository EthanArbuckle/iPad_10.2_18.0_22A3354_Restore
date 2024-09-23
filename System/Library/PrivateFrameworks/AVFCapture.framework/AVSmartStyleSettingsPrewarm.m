@implementation AVSmartStyleSettingsPrewarm

uint64_t __AVSmartStyleSettingsPrewarm_block_invoke()
{
  id v0;
  id v1;
  id v2;
  __CFString *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&sSystemStyleSettingsLock);
  sSmartStyleSettingsStatesByBundleID = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  v5[0] = 0x1E4221E08;
  v5[1] = 0x1E4221D48;
  sAllowedFirstPartyAppsInSystemStyleEnabledList = objc_msgSend(v0, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2));
  v1 = objc_alloc(MEMORY[0x1E0C99D20]);
  v4 = CFSTR("com.apple.continuitycaptured");
  sDisallowedFirstPartyAppsInSystemStyleEnabledList = objc_msgSend(v1, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 1));
  +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", CFSTR("warmup"));
  v2 = +[AVSmartStyleSettingsState smartStyleSettingsStateForBundleID:](AVSmartStyleSettingsState, "smartStyleSettingsStateForBundleID:", AVSmartStyleSettingsSystemStyle);
  objc_msgSend((id)sSmartStyleSettingsStatesByBundleID, "setObject:forKeyedSubscript:", v2, AVSmartStyleSettingsSystemStyle);
  os_unfair_lock_unlock((os_unfair_lock_t)&sSystemStyleSettingsLock);
  return objc_msgSend(v2, "installProprietaryDefaultListeners");
}

@end
