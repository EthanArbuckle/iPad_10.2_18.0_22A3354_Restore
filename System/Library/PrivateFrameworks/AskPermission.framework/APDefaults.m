@implementation APDefaults

+ (BOOL)APSDevelopmentEnvironment
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("APSDevelopmentEnvironment"), 0);
}

+ (BOOL)isApprover
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("isApprover"), 0);
}

+ (BOOL)isRequester
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("isRequester"), 0);
}

+ (BOOL)retryNotificationRegistration
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("retryRegistration"), 0);
}

+ (void)setAPSDevelopmentEnvironment:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("APSDevelopmentEnvironment"));
}

+ (void)setIsApprover:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("isApprover"));
}

+ (void)setIsRequester:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("isRequester"));
}

+ (void)setRetryNotificationRegistration:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("retryRegistration"));
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", a3, a4, CFSTR("com.apple.AskPermission"));
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5
{
  __CFString *v7;
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat)
    return AppBooleanValue != 0;
  else
    return a4;
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:domain:", a3, a4, CFSTR("com.apple.AskPermission"));
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4 domain:(__CFString *)a5
{
  __CFString *v7;
  CFIndex AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat)
    return AppIntegerValue;
  else
    return a4;
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  objc_msgSend(a1, "_setBool:forKey:domain:", a3, a4, CFSTR("com.apple.AskPermission"));
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  CFPropertyListRef *v6;

  v6 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v6 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue((CFStringRef)a4, *v6, a5);
  CFPreferencesAppSynchronize(a5);
}

+ (void)_setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setValue:forKey:", v8, v7);

}

+ (void)_setValue:(id)a3 forKey:(id)a4
{
  objc_msgSend(a1, "_setValue:forKey:domain:", a3, a4, CFSTR("com.apple.AskPermission"));
}

+ (void)_setValue:(id)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, a5);
  CFPreferencesAppSynchronize(a5);
}

+ (id)_valueForKey:(id)a3
{
  return (id)objc_msgSend(a1, "_valueForKey:domain:", a3, CFSTR("com.apple.AskPermission"));
}

+ (id)_valueForKey:(id)a3 domain:(__CFString *)a4
{
  __CFString *v5;
  void *v6;

  v5 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a4);
  v6 = (void *)CFPreferencesCopyAppValue(v5, a4);

  return v6;
}

@end
