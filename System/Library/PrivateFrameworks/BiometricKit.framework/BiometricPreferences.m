@implementation BiometricPreferences

+ (id)preferenceValueOfClass:(Class)a3 forKey:(id)a4
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  CFPropertyListRef v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/Library/Managed Preferences/mobile/com.apple.biometrickitd.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v7)
        goto LABEL_22;
    }
    else
    {

    }
  }
  v8 = CFPreferencesCopyValue(v4, CFSTR("com.apple.biometrickitd"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v8)
  {
    v7 = (void *)v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_22;
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "0";
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = &unk_1AF575226;
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      v20 = 1024;
      v21 = 1031;
      _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    CFRelease(v7);
  }
  v7 = (void *)CFPreferencesCopyValue(v4, CFSTR("com.apple.biometrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "0";
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = &unk_1AF575226;
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      v20 = 1024;
      v21 = 1049;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    CFRelease(v7);
    v7 = 0;
  }
LABEL_22:

  return v7;
}

+ (BOOL)setPreferenceValue:(id)a3 forKey:(id)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue((CFStringRef)a4, a3, CFSTR("com.apple.biometrickitd"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  return CFPreferencesSynchronize(CFSTR("com.apple.biometrickitd"), v4, v5) != 0;
}

@end
