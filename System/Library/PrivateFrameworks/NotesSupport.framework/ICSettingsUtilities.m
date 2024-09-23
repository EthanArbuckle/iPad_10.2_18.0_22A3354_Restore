@implementation ICSettingsUtilities

+ (void)setObject:(id)a3 forKey:(id)a4
{
  __CFString *v5;
  id v6;
  const __CFString *v7;
  const __CFString *v8;

  v5 = (__CFString *)a4;
  v6 = a3;
  if (ICIsSandboxModeEnabled())
    v7 = CFSTR("com.apple.mobilenotesdebug");
  else
    v7 = CFSTR("com.apple.mobilenotes");
  CFPreferencesSetAppValue(v5, v6, v7);

  if (ICIsSandboxModeEnabled())
    v8 = CFSTR("com.apple.mobilenotesdebug");
  else
    v8 = CFSTR("com.apple.mobilenotes");
  CFPreferencesAppSynchronize(v8);
}

+ (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  objc_msgSend(a1, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  ICCheckedDynamicCast(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

+ (id)objectForKey:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  void *v5;

  v3 = (__CFString *)a3;
  if (ICIsSandboxModeEnabled())
    v4 = CFSTR("com.apple.mobilenotesdebug");
  else
    v4 = CFSTR("com.apple.mobilenotes");
  v5 = (void *)CFPreferencesCopyAppValue(v3, v4);

  return v5;
}

+ (void)registerDefaults:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  if (ICIsSandboxModeEnabled())
    v4 = CFSTR("com.apple.mobilenotesdebug");
  else
    v4 = CFSTR("com.apple.mobilenotes");
  v5 = (void *)objc_msgSend(v3, "initWithSuiteName:", v4);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "registerDefaults:", v6);

}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

@end
