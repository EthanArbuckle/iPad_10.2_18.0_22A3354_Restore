@implementation FMPreferencesUtil

+ (id)dateForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4;
  void *v5;
  CFTypeID v6;

  v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  v5 = (void *)v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != CFDateGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4 inDomain:(id)a5
{
  const void **v6;
  const void *v7;
  __CFString *applicationID;

  v6 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v6 = (const void **)MEMORY[0x1E0C9AE40];
  v7 = *v6;
  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, v7, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (BOOL)BOOLForKey:(id)a3 inDomain:(id)a4
{
  int AppBooleanValue;
  BOOL v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a3, (CFStringRef)a4, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v5 = AppBooleanValue == 0;
  else
    v5 = 1;
  return !v5;
}

+ (void)setString:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  __CFString *applicationID;

  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (id)stringForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4;
  void *v5;
  CFTypeID v6;

  v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  v5 = (void *)v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != CFStringGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

+ (void)synchronizeDomain:(id)a3
{
  CFPreferencesAppSynchronize((CFStringRef)a3);
}

+ (void)synchronizeDomain:(id)a3 user:(id)a4
{
  CFPreferencesSynchronize((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)*MEMORY[0x1E0C9B230]);
}

+ (void)removeKey:(id)a3 inDomain:(id)a4
{
  __CFString *applicationID;

  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue((CFStringRef)a3, 0, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (BOOL)BOOLForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  CFTypeID v7;
  BOOL v8;

  v5 = (const __CFBoolean *)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = CFGetTypeID(v5);
  v8 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) == 1;
  CFRelease(v6);
  return v8;
}

+ (int64_t)integerForKey:(id)a3 inDomain:(id)a4
{
  int64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue((CFStringRef)a3, (CFStringRef)a4, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 0;
  return result;
}

+ (int64_t)integerForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  int64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  int64_t valuePtr;

  result = (int64_t)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E0C9B230]);
  valuePtr = 0;
  if (result)
  {
    v6 = (const __CFNumber *)result;
    v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFNumberGetTypeID() && !CFNumberGetValue(v6, kCFNumberNSIntegerType, &valuePtr))
      valuePtr = 0;
    CFRelease(v6);
    return valuePtr;
  }
  return result;
}

+ (void)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5
{
  void *v7;
  __CFString *v8;
  __CFString *applicationID;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  applicationID = (__CFString *)a5;
  v8 = (__CFString *)a4;
  CFPreferencesSetAppValue(v8, (CFPropertyListRef)objc_msgSend(v7, "numberWithInteger:", a3), applicationID);

  CFPreferencesAppSynchronize(applicationID);
}

+ (id)stringForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5;
  void *v6;
  CFTypeID v7;

  v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = (void *)v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFStringGetTypeID())
    {
      CFRelease(v6);
      v6 = 0;
    }
  }
  return v6;
}

+ (id)dateForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5;
  void *v6;
  CFTypeID v7;

  v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = (void *)v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFDateGetTypeID())
    {
      CFRelease(v6);
      v6 = 0;
    }
  }
  return v6;
}

+ (void)setDate:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  __CFString *applicationID;

  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (id)dictionaryForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4;
  void *v5;
  CFTypeID v6;

  v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  v5 = (void *)v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != CFDictionaryGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

+ (id)dictionaryForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5;
  void *v6;
  CFTypeID v7;

  v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = (void *)v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFDictionaryGetTypeID())
    {
      CFRelease(v6);
      v6 = 0;
    }
  }
  return v6;
}

+ (void)setDictionary:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  __CFString *applicationID;

  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (id)arrayForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4;
  void *v5;
  CFTypeID v6;

  v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  v5 = (void *)v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != CFArrayGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

+ (id)arrayForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5;
  void *v6;
  CFTypeID v7;

  v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = (void *)v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFArrayGetTypeID())
    {
      CFRelease(v6);
      v6 = 0;
    }
  }
  return v6;
}

+ (void)setArray:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  __CFString *applicationID;

  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (id)dataForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4;
  void *v5;
  CFTypeID v6;

  v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  v5 = (void *)v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != CFDataGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

+ (id)dataForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5;
  void *v6;
  CFTypeID v7;

  v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = (void *)v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFDataGetTypeID())
    {
      CFRelease(v6);
      v6 = 0;
    }
  }
  return v6;
}

+ (void)setData:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  __CFString *applicationID;

  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (id)objectForKey:(id)a3 inDomain:(id)a4
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
}

+ (id)objectForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E0C9B230]);
}

+ (void)setObject:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  __CFString *applicationID;

  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

@end
