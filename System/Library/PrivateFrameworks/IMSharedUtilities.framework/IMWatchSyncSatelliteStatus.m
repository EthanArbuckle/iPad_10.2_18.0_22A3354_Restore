@implementation IMWatchSyncSatelliteStatus

+ (void)synchronizeSatelliteStatus:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v4;
  id v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1A1AE7D4C](CFSTR("NPSManager"), CFSTR("NanoPreferencesSync"));
  if (v4)
  {
    v5 = objc_alloc_init(v4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(CFSTR("SatelliteStatusActive"), v6, CFSTR("com.apple.MobileSMS"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v3)
          v8 = CFSTR("YES");
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Setting Satellite Active Status Nano Preference to: %@", (uint8_t *)&v11, 0xCu);
      }

    }
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SatelliteStatusActive"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.MobileSMS"), v9);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Could not weak link ____NPSManagerClass in synchronizeSatelliteStatus", (uint8_t *)&v11, 2u);
    }

  }
}

+ (BOOL)isCompanionSatelliteActive
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

@end
