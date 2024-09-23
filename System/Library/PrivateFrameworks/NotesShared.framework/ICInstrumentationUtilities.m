@implementation ICInstrumentationUtilities

+ (int64_t)autoSortSelectionChangeCountForState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "autoSortSelectionCountUserDefaultsKeyForState:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "integerForKey:", v6);

  return v7;
}

+ (void)incrementAutoSortSelectionChangeCountForState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "autoSortSelectionCountUserDefaultsKeyForState:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v6, "integerForKey:", v5) + 1, v5);

}

+ (void)clearAutoSortSelectionChangeCountForState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "autoSortSelectionCountUserDefaultsKeyForState:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteger:forKey:", 0, v5);

}

+ (id)autoSortSelectionCountUserDefaultsKeyForState:(BOOL)a3
{
  if (a3)
    return CFSTR("AnalyticsChecklistAutoSortSelectionCountOn");
  else
    return CFSTR("AnalyticsChecklistAutoSortSelectionCountOff");
}

+ (int64_t)recentPasswordChangeCountAsReset:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passwordChangeCountUserDefaultsKeyAsReset:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "integerForKey:", v6);

  return v7;
}

+ (void)incrementRecentPasswordChangeCountAsReset:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passwordChangeCountUserDefaultsKeyAsReset:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "integerForKey:", v6);
  v8 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134218496;
    v10 = v7;
    v11 = 2048;
    v12 = v7 + 1;
    v13 = 1024;
    v14 = v3;
    _os_log_debug_impl(&dword_1BD918000, v8, OS_LOG_TYPE_DEBUG, "Incrementing password change count from %lu to %lu, isReset = %d", (uint8_t *)&v9, 0x1Cu);
  }

  objc_msgSend(v5, "setInteger:forKey:", v7 + 1, v6);
}

+ (void)clearRecentPasswordChangeCountAsReset:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[ICInstrumentationUtilities clearRecentPasswordChangeCountAsReset:].cold.1(v3, v5);

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passwordChangeCountUserDefaultsKeyAsReset:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteger:forKey:", 0, v7);

}

+ (id)passwordChangeCountUserDefaultsKeyAsReset:(BOOL)a3
{
  if (a3)
    return CFSTR("ICInstrumentationUtilitiesRecentPasswordResetCountKey");
  else
    return CFSTR("ICInstrumentationUtilitiesRecentPasswordChangeCountKey");
}

+ (id)recentPasswordModesKeyForAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ICInstrumentationUtilitiesRecentPasswordMode-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)recentPasswordModesForAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0D64188];
  v5 = a3;
  objc_msgSend(v4, "sharedAppGroupDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recentPasswordModesKeyForAccount:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedArrayOfObjectsOfClass:fromData:error:", objc_opt_class(), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

+ (void)addRecentPasswordMode:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "recentPasswordModesForAccount:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recentPasswordModesKeyForAccount:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKey:", v9, v11);
}

+ (void)clearRecentPasswordModesForAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB36F8];
  v5 = a3;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", MEMORY[0x1E0C9AA60], 1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recentPasswordModesKeyForAccount:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v8, v7);
}

+ (void)clearRecentPasswordChangeCountAsReset:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Clearing password change count for isReset = %d", (uint8_t *)v2, 8u);
}

@end
