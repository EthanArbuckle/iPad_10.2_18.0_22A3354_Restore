@implementation ACDPreferences

+ (ACDPreferences)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_0);
  return (ACDPreferences *)(id)sharedPreferences_sSharedPreferences;
}

void __35__ACDPreferences_sharedPreferences__block_invoke()
{
  ACDPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(ACDPreferences);
  v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = (uint64_t)v0;

}

- (id)objectForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.accounts"));
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.accounts"));
}

- (double)serverTimeoutInterval
{
  void *v2;
  void *v3;
  double v4;

  -[ACDPreferences objectForKey:](self, "objectForKey:", CFSTR("IdleTimeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (double)(int)objc_msgSend(v2, "intValue");
  else
    v4 = 15.0;

  return v4;
}

- (void)synchronize
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.accounts"));
}

- (void)reset
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFArray *v5;

  v3 = (const __CFString *)*MEMORY[0x24BDBD590];
  v4 = (const __CFString *)*MEMORY[0x24BDBD588];
  v5 = CFPreferencesCopyKeyList(CFSTR("com.apple.accounts"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  CFPreferencesSetMultiple(0, v5, CFSTR("com.apple.accounts"), v3, v4);
  if (v5)
    CFRelease(v5);
  -[ACDPreferences synchronize](self, "synchronize");
}

@end
