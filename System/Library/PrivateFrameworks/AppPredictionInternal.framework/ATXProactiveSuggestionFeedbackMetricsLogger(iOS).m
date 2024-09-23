@implementation ATXProactiveSuggestionFeedbackMetricsLogger(iOS)

- (id)bookmarkURLPathForConsumerSubType:()iOS
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@-%@"), v6, v7);

  objc_msgSend(MEMORY[0x1E0CF94D8], "metricsRootDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initFileURLWithPath:", v11);

  return v12;
}

- (uint64_t)logMetricsForiOSUIFeedbackQueries
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ATXProactiveSuggestioniOSUIFeedbackQuery *v8;
  void *v9;
  ATXProactiveSuggestioniOSUIFeedbackQuery *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = objc_msgSend(&unk_1E83D04A8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(&unk_1E83D04A8);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1CAA48B6C]();
        LOBYTE(v6) = objc_msgSend(v6, "unsignedIntValue");
        v8 = [ATXProactiveSuggestioniOSUIFeedbackQuery alloc];
        objc_msgSend(a1, "bookmarkURLPathForConsumerSubType:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[ATXProactiveSuggestioniOSUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:](v8, "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:", 0, v6, 0, v9);

        objc_msgSend(a1, "logMetricsWithUIFeedbackQuery:", v10);
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      result = objc_msgSend(&unk_1E83D04A8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

@end
