@implementation ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter

- (void)writeEventsToStreamWithXPCActivity:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "didDefer"))
  {
    __atxlog_handle_blending_ecosystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Deferring due to xpcActivity.", buf, 0xCu);

    }
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(&unk_1E83D0640, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(&unk_1E83D0640);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1CAA48B6C]();
          -[ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter writeForConsumerSubType:](self, "writeForConsumerSubType:", objc_msgSend(v12, "unsignedIntValue"));
          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(&unk_1E83D0640, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
  }

}

- (void)writeForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestioniOSUIFeedbackQuery *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("proactiveSuggestionUIFeedbackResultStreamWriterBookmarkURL"), "stringByAppendingFormat:", CFSTR("-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "bookmarksPathFile:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initFileURLWithPath:", v8);

  v10 = -[ATXProactiveSuggestioniOSUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:]([ATXProactiveSuggestioniOSUIFeedbackQuery alloc], "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:", 0, v3, 0, v9);
  v11 = (void *)objc_opt_new();
  __atxlog_handle_blending_ecosystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%@ - Beginning query for %@", buf, 0x16u);

  }
  v17[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke;
  v18[3] = &unk_1E82E95B0;
  v19 = v11;
  v20 = self;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke_22;
  v17[3] = &unk_1E82E6638;
  v16 = v11;
  -[ATXProactiveSuggestionUIFeedbackQuery enumerateUIFeedbackResultsWithBlock:completionBlock:](v10, "enumerateUIFeedbackResultsWithBlock:completionBlock:", v18, v17);

}

void __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81110]), "initWithProactiveSuggestionUIFeedbackResult:", v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "sendEvent:", v4);
    __atxlog_handle_blending_ecosystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Wrote UI Feedback Result to Biome:\n%@", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    __atxlog_handle_blending_ecosystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }

}

void __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __atxlog_handle_blending_ecosystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - Finished enumerating results with error - %@", (uint8_t *)&v6, 0x16u);

  }
}

void __83__ATXBiomeProactiveSuggestionUIFeedbackResultStreamWriter_writeForConsumerSubType___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - Unable to initialize corresponding biome object for feedback result:\n%@", (uint8_t *)&v7, 0x16u);

}

@end
