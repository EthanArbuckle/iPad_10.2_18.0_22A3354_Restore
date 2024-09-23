@implementation ATXUserEducationSuggestion(Internal)

- (BOOL)suggestionWasAlreadyShown
{
  return (unint64_t)(objc_msgSend(a1, "readSuggestionState") - 1) < 2;
}

- (BOOL)suggestionWasAlreadyDismissed
{
  return objc_msgSend(a1, "readSuggestionState") == 2;
}

- (const)userDefaultsKeyForTrackingSuggestionState
{
  return CFSTR("DiscoverySuggestions.State");
}

- (id)userDefaults
{
  id v0;

  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  return (id)objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
}

- (void)writeSuggestionState:()Internal
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userDefaultsKeyForTrackingSuggestionState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", a3, v6);

  __atxlog_handle_context_user_education_suggestions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    ATXUserEducationSuggestionStateToString(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = "-[ATXUserEducationSuggestion(Internal) writeSuggestionState:]";
    v11 = 2114;
    v12 = a1;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: Recorded suggestion %{public}@ as %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (uint64_t)readSuggestionState
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userDefaultsKeyForTrackingSuggestionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "integerForKey:", v3);

  return v4;
}

- (void)logFeedback:()Internal
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ATXUserEducationSuggestion_Internal__logFeedback___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "performBlockOnInternalSerialQueue:", v7);

}

- (uint64_t)metricClass
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("subclass must define metricClass:"));
  return 0;
}

- (uint64_t)server
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("subclass must define server:"));
  return 0;
}

@end
