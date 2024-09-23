@implementation MapsSuggestionsSiri

+ (id)isEnabledCondition
{
  if (_MergedGlobals_42 != -1)
    dispatch_once(&_MergedGlobals_42, &__block_literal_global_23);
  return (id)qword_1ED22F038;
}

void __41__MapsSuggestionsSiri_isEnabledCondition__block_invoke()
{
  MapsSuggestionsBlockCondition *v0;
  void *v1;

  v0 = -[MapsSuggestionsBlockCondition initWithName:block:]([MapsSuggestionsBlockCondition alloc], "initWithName:block:", CFSTR("siriEnabledCondition"), &__block_literal_global_7);
  v1 = (void *)qword_1ED22F038;
  qword_1ED22F038 = (uint64_t)v0;

}

BOOL __41__MapsSuggestionsSiri_isEnabledCondition__block_invoke_2()
{
  return +[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled");
}

+ (id)isAllowedOnHomeScreenCondition
{
  if (qword_1ED22F040 != -1)
    dispatch_once(&qword_1ED22F040, &__block_literal_global_9);
  return (id)qword_1ED22F048;
}

void __53__MapsSuggestionsSiri_isAllowedOnHomeScreenCondition__block_invoke()
{
  MapsSuggestionsBlockCondition *v0;
  void *v1;

  v0 = -[MapsSuggestionsBlockCondition initWithName:block:]([MapsSuggestionsBlockCondition alloc], "initWithName:block:", CFSTR("siriAllowedOnHomeScreenCondition"), &__block_literal_global_12_0);
  v1 = (void *)qword_1ED22F048;
  qword_1ED22F048 = (uint64_t)v0;

}

BOOL __53__MapsSuggestionsSiri_isAllowedOnHomeScreenCondition__block_invoke_2()
{
  return +[MapsSuggestionsSiri isAllowedOnHomeScreen](MapsSuggestionsSiri, "isAllowedOnHomeScreen");
}

+ (id)isAllowedOnLockScreenCondition
{
  if (qword_1ED22F050 != -1)
    dispatch_once(&qword_1ED22F050, &__block_literal_global_13_0);
  return (id)qword_1ED22F058;
}

void __53__MapsSuggestionsSiri_isAllowedOnLockScreenCondition__block_invoke()
{
  MapsSuggestionsBlockCondition *v0;
  void *v1;

  v0 = -[MapsSuggestionsBlockCondition initWithName:block:]([MapsSuggestionsBlockCondition alloc], "initWithName:block:", CFSTR("siriAllowedOnLockScreenCondition"), &__block_literal_global_16_0);
  v1 = (void *)qword_1ED22F058;
  qword_1ED22F058 = (uint64_t)v0;

}

BOOL __53__MapsSuggestionsSiri_isAllowedOnLockScreenCondition__block_invoke_2()
{
  return +[MapsSuggestionsSiri isAllowedOnLockScreen](MapsSuggestionsSiri, "isAllowedOnLockScreen");
}

+ (BOOL)isAllowedOnHomeScreen
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  v5 = *MEMORY[0x1E0D26D08];
  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = "NO";
    if (v4)
      v10 = "YES";
    else
      v10 = "NO";
    if (!v7)
      v9 = "YES";
    v12 = 136315394;
    v13 = v10;
    v14 = 2080;
    v15 = v9;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "allowedOnHomeScreen Global: %s Maps:%s", (uint8_t *)&v12, 0x16u);
  }

  return v4 & ~(_BYTE)v7;
}

+ (BOOL)isAllowedOnLockScreen
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("LockScreenSuggestionsDisabled"), CFSTR("com.apple.lockscreen.shared"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    v4 = 1;

  v5 = *MEMORY[0x1E0D26D08];
  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("LockscreenSuggestionsDisabledBundles"), CFSTR("com.apple.duetexpertd"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = "NO";
    if (v4)
      v10 = "YES";
    else
      v10 = "NO";
    if (!v7)
      v9 = "YES";
    v12 = 136315394;
    v13 = v10;
    v14 = 2080;
    v15 = v9;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "allowedOnLockScreen Global: %s Maps:%s", (uint8_t *)&v12, 0x16u);
  }

  return v4 & ~(_BYTE)v7;
}

+ (BOOL)isEnabled
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D26D08];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v4 = objc_msgSend(v3, "containsObject:", v2);

  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = "YES";
    if (v4)
      v6 = "NO";
    v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "SiriEnabled : %s", (uint8_t *)&v8, 0xCu);
  }

  return v4 ^ 1;
}

+ (BOOL)canLearnFromBundleID:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if (v5)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Can't learn from: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5 ^ 1;
}

@end
