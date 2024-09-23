@implementation BKUIBundleSettings

+ (void)synchronize
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1DB281000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Synchronize bundle settings", v0, 2u);
  OUTLINED_FUNCTION_1();
}

+ (BOOL)isFpEnrollHapticFeedbackDisabled
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  BOOL v4;

  v2 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("enableEnrollVibe"), CFSTR("com.apple.biometrickitd"));
  if (v2)
  {
    v3 = v2;
    v4 = CFBooleanGetValue(v2) == 0;
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[BKUIBundleSettings isFpEnrollHapticFeedbackDisabled].cold.1();
  return v4;
}

+ (BOOL)isUserStudy
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("userStudy"));

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[BKUIBundleSettings isUserStudy].cold.1();
  return v3;
}

+ (void)setBool:(BOOL)a3 forUserDefaultsKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[BKUIBundleSettings setBool:forUserDefaultsKey:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v7, v6);

  objc_msgSend(a1, "synchronize");
}

+ (void)setInteger:(int64_t)a3 forUserDefaultsKey:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[BKUIBundleSettings setInteger:forUserDefaultsKey:].cold.1((uint64_t)v6, a3, v7, v8, v9, v10, v11, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v13, v6);

  objc_msgSend(a1, "synchronize");
}

+ (BOOL)BOOLForUserDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[BKUIBundleSettings BOOLForUserDefaultsKey:].cold.1();
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v6 = objc_msgSend(v5, "BOOLValue");
LABEL_6:

  return v6;
}

+ (int64_t)integerForUserDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[BKUIBundleSettings integerForUserDefaultsKey:].cold.1();
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v6 = objc_msgSend(v5, "integerValue");
LABEL_6:

  return v6;
}

+ (float)floatForUserDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[BKUIBundleSettings floatForUserDefaultsKey:].cold.1();
    if (v5)
      goto LABEL_3;
LABEL_5:
    v7 = 0.0;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v5, "floatValue");
  v7 = v6;
LABEL_6:

  return v7;
}

+ (id)objectForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.biometrickitui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  CFPreferencesSetValue((CFStringRef)a4, a3, CFSTR("com.apple.biometrickitui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

+ (void)isFpEnrollHapticFeedbackDisabled
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB281000, MEMORY[0x1E0C81028], v0, "BiometricKitUI: Is haptic feedback disabled: %i", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

+ (void)isUserStudy
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB281000, MEMORY[0x1E0C81028], v0, "BiometricKitUI: Is user study: %i", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

+ (void)setBool:forUserDefaultsKey:.cold.1()
{
  uint64_t v0;
  uint8_t v1[8];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v2 = 2112;
  v3 = v0;
  _os_log_debug_impl(&dword_1DB281000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Setting BOOL: \"%i\", for key: \"%@\", v1, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)setInteger:(uint64_t)a3 forUserDefaultsKey:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DB281000, MEMORY[0x1E0C81028], a3, "BiometricKitUI: Setiing integer: %li, for key: \"%@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)BOOLForUserDefaultsKey:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1DB281000, MEMORY[0x1E0C81028], v0, "BiometricKitUI: Bool for key: \"%@\", is: \"%@\", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

+ (void)integerForUserDefaultsKey:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1DB281000, MEMORY[0x1E0C81028], v0, "BiometricKitUI: Integer for key: \"%@\", is: \"%@\", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

+ (void)floatForUserDefaultsKey:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1DB281000, MEMORY[0x1E0C81028], v0, "BiometricKitUI: Float for key: \"%@\", is: \"%@\", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

@end
