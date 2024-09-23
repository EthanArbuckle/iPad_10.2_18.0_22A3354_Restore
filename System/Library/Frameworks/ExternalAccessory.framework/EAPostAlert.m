@implementation EAPostAlert

+ (void)EANotificationPostAccessoryNotification:(__CFString *)a3 forMsg:(__CFString *)a4 forDefaultButton:(__CFString *)a5 withAlternateButton:(__CFString *)a6 forNotification:(__CFUserNotification *)a7 withCallback:(void *)a8 andTimeout:(double)a9
{
  void *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  id v22;
  const __CFDictionary *v23;
  id v24;
  const __CFAllocator *v25;
  __CFUserNotification *v26;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v28;
  __CFRunLoop *Main;
  SInt32 error;

  v17 = (void *)MEMORY[0x1BCC9F98C](a1, a2);
  error = 0;
  if (a3)
  {
    v18 = (__CFString *)objc_msgSend(a1, "CopyLocalizedString:", a3);
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v18 = &stru_1E6B07EE0;
    if (a4)
    {
LABEL_3:
      v19 = (__CFString *)objc_msgSend(a1, "CopyLocalizedString:", a4);
      if (a5)
        goto LABEL_4;
LABEL_8:
      v20 = &stru_1E6B07EE0;
      if (a6)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  v19 = &stru_1E6B07EE0;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  v20 = (__CFString *)objc_msgSend(a1, "CopyLocalizedString:", a5);
  if (a6)
  {
LABEL_5:
    v21 = (void *)objc_msgSend(a1, "CopyLocalizedString:", a6);
    v22 = objc_alloc(MEMORY[0x1E0C99D80]);
    v23 = (const __CFDictionary *)objc_msgSend(v22, "initWithObjectsAndKeys:", v18, *MEMORY[0x1E0C9B800], v19, *MEMORY[0x1E0C9B810], v20, *MEMORY[0x1E0C9B838], v21, *MEMORY[0x1E0C9B830], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0C9B820], *MEMORY[0x1E0C9AE50], CFSTR("DismissOnLock"), 0);

    goto LABEL_10;
  }
LABEL_9:
  v24 = objc_alloc(MEMORY[0x1E0C99D80]);
  v23 = (const __CFDictionary *)objc_msgSend(v24, "initWithObjectsAndKeys:", v18, *MEMORY[0x1E0C9B800], v19, *MEMORY[0x1E0C9B810], v20, *MEMORY[0x1E0C9B838], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0C9B820], *MEMORY[0x1E0C9AE50], CFSTR("DismissOnLock"), 0);
LABEL_10:

  +[EAPostAlert EATearDownAccessoryNotification:](EAPostAlert, "EATearDownAccessoryNotification:", a7);
  if (a7)
  {
    v25 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v26 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a9, 3uLL, &error, v23);
    *a7 = v26;
    if (v26)
    {
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v25, v26, (CFUserNotificationCallBack)a8, 0);
      if (RunLoopSource)
      {
        v28 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v28, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        CFRelease(v28);
      }
      else
      {
        CFRelease(*a7);
        *a7 = 0;
      }
    }
    else
    {
      NSLog(CFSTR("[#ExternalAccessory] %s:%d ERROR: CFUserNotificationCreate returned NULL! notificationDict=%@"), "+[EAPostAlert EANotificationPostAccessoryNotification:forMsg:forDefaultButton:withAlternateButton:forNotification:withCallback:andTimeout:]", 95, v23);
    }
  }

  objc_autoreleasePoolPop(v17);
}

+ (void)EATearDownAccessoryNotification:(__CFUserNotification *)a3
{
  if (a3)
  {
    if (*a3)
    {
      CFUserNotificationCancel(*a3);
      CFRelease(*a3);
      *a3 = 0;
    }
  }
}

+ (id)CopyLocalizedString:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CFPropertyListRef v9;
  CFTypeRef v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.ExternalAccessory"));
  if (!v4)
    return &stru_1E6B07EE0;
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1BCC9F98C]();
  v7 = objc_msgSend(v5, "localizations");
  if (a3)
  {
    v8 = v7;
    if (v7)
    {
      v9 = CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
      v10 = (id)CFMakeCollectable(v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", v8, v10);
        if (objc_msgSend(v11, "count"))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            while (2)
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v11);
                v16 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:localization:", a3, 0, CFSTR("Localization"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15));
                if (v16)
                {
                  v17 = v16;
                  objc_autoreleasePoolPop(v6);
                  return v17;
                }
                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
              if (v13)
                continue;
              break;
            }
          }
        }
      }
    }
  }
  objc_autoreleasePoolPop(v6);
  v17 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", a3, &stru_1E6B07EE0, CFSTR("Localization"));
  if (!v17)
    return &stru_1E6B07EE0;
  return v17;
}

@end
