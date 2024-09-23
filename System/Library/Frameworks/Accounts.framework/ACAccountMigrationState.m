@implementation ACAccountMigrationState

+ (BOOL)isMigrationFinished
{
  return objc_msgSend(a1, "migrationFinishedForKey:", CFSTR("LastMigrationSystemVersion"));
}

+ (BOOL)migrationFinishedForKey:(__CFString *)a3
{
  __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  BOOL v7;

  objc_msgSend(a1, "_currentSystemVersion");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.accountsd"));
  v5 = (const __CFString *)CFPreferencesCopyAppValue(a3, CFSTR("com.apple.accountsd"));
  if (v5)
  {
    v6 = v5;
    v7 = CFStringCompare(v4, v5, 1uLL) == kCFCompareEqualTo;
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_currentSystemVersion
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  void *Value;
  void *v5;

  v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    v3 = v2;
    Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0C9AB90]);
    v5 = Value;
    if (Value)
      CFRetain(Value);
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (void)writeMigrationVersionPref
{
  objc_msgSend(a1, "writeMigrationVersionPrefForKey:", CFSTR("LastMigrationSystemVersion"));
}

+ (void)writeMigrationVersionPrefForKey:(__CFString *)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  __int16 v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_currentSystemVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = a3;
    _os_log_impl(&dword_1A2BCD000, v5, OS_LOG_TYPE_DEFAULT, "\"Writing Accounts ACLastMigrationSystemVersion version pref %@ for key %@\", (uint8_t *)&v6, 0x16u);
  }

  if (v4)
  {
    CFPreferencesSetAppValue(a3, v4, CFSTR("com.apple.accountsd"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.accountsd"));
  }

}

@end
