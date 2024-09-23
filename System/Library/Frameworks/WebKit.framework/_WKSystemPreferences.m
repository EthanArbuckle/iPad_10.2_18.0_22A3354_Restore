@implementation _WKSystemPreferences

+ (BOOL)isCaptivePortalModeEnabled
{
  const __CFString *v2;
  PAL *v3;
  PAL *v4;
  char isLockdownModeEnabled;

  v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "WKLockdownModeEnabled", 0x8000100u);
  v3 = (PAL *)CFPreferencesCopyValue(v2, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v4 = v3;
  if (v3 != (PAL *)*MEMORY[0x1E0C9AE50])
  {
    isLockdownModeEnabled = PAL::isLockdownModeEnabled(v3);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  isLockdownModeEnabled = 1;
  if (v3)
LABEL_3:
    CFRelease(v4);
LABEL_4:
  if (v2)
    CFRelease(v2);
  return isLockdownModeEnabled;
}

+ (void)setCaptivePortalModeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v4;
  const __CFString *v5;
  CFPropertyListRef *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = a3;
  v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "WKLockdownModeEnabled", 0x8000100u);
  v5 = v4;
  v6 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v6 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  v7 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v8 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v9 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(v4, *v6, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(v7, v8, v9);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("WKCaptivePortalModeContainerConfigurationChanged"), 0, 0, 1u);
  if (v5)
    CFRelease(v5);
}

+ (BOOL)isCaptivePortalModeIgnored:(id)a3
{
  uint64_t v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v5[0] = a3;
  v5[1] = CFSTR("System/Preferences/");
  v5[2] = CFSTR("com.apple.WebKit.cpmconfig_ignore");
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v3);
}

+ (void)setCaptivePortalModeIgnored:(id)a3 ignore:(BOOL)a4
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  char v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v4 = a4;
  v13[2] = *MEMORY[0x1E0C80C00];
  v13[0] = a3;
  v13[1] = CFSTR("System/Preferences/");
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2));
  v12[0] = v5;
  v12[1] = CFSTR("com.apple.WebKit.cpmconfig_ignore");
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2));
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v6) != v4)
  {
    v11 = 0;
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", v5, &v11);
    if (v11)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v5, 0);
      v8 = v11 != 0;
    }
    if ((v7 & v8 & 1) == 0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if (v4)
      objc_msgSend(v9, "createFileAtPath:contents:attributes:", v6, 0, 0);
    else
      objc_msgSend(v9, "removeItemAtPath:error:", v6, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("WKCaptivePortalModeContainerConfigurationChanged"), 0, 0, 1u);
  }
}

@end
