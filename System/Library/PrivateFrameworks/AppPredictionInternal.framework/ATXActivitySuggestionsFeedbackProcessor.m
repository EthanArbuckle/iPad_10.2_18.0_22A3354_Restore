@implementation ATXActivitySuggestionsFeedbackProcessor

- (ATXActivitySuggestionsFeedbackProcessor)init
{
  void *v3;
  void *v4;
  ATXActivitySuggestionsFeedbackProcessor *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXActivitySuggestionsFeedbackProcessor initWithFeedbackStream:feedbackHistogramHelper:](self, "initWithFeedbackStream:feedbackHistogramHelper:", v3, v4);

  return v5;
}

- (ATXActivitySuggestionsFeedbackProcessor)initWithFeedbackStream:(id)a3 feedbackHistogramHelper:(id)a4
{
  id v7;
  id v8;
  ATXActivitySuggestionsFeedbackProcessor *v9;
  ATXActivitySuggestionsFeedbackProcessor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXActivitySuggestionsFeedbackProcessor;
  v9 = -[ATXActivitySuggestionsFeedbackProcessor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feedbackStream, a3);
    objc_storeStrong((id *)&v10->_feedbackHistogramHelper, a4);
  }

  return v10;
}

+ (id)queue
{
  if (queue__pasOnceToken6 != -1)
    dispatch_once(&queue__pasOnceToken6, &__block_literal_global_84);
  return (id)queue__pasExprOnceResult;
}

void __48__ATXActivitySuggestionsFeedbackProcessor_queue__block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("ATXActivitySuggestionsFeedbackProcessorQueue", v1);
  v3 = (void *)queue__pasExprOnceResult;
  queue__pasExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

- (void)processFeedbackWithXPCActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke;
  block[3] = &unk_1E82DACB0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_activitySuggestionsFeedbackBookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "publisherFromStartTime:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_2;
  v14[3] = &unk_1E82DAF68;
  v6 = v2;
  v15 = v6;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_3;
  v12[3] = &unk_1E82E1538;
  v7 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v8 = (id)objc_msgSend(v3, "drivableSinkWithBookmark:completion:shouldContinue:", v4, v14, v12);

  v11 = 0;
  objc_msgSend(v6, "saveBookmarkWithError:", &v11);
  v9 = v11;
  if (v9)
  {
    __atxlog_handle_modes();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_cold_1((uint64_t)v9, v10);

  }
}

uint64_t __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBookmark:");
}

uint64_t __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  id v9;
  void *v10;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_3_cold_1((uint64_t)v3, v4);

    objc_msgSend(v3, "activity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "activityType") == 4 && !objc_msgSend(v3, "eventType"))
    {
      v8 = objc_msgSend(v3, "suggestionType");

      if (v8)
        goto LABEL_7;
      v9 = objc_alloc(MEMORY[0x1E0C99EA0]);
      v5 = (void *)objc_msgSend(v9, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
      objc_msgSend(v3, "eventDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("dateDrivingSetupSuggestionLastShown"));

    }
LABEL_7:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "updateFeedbackHistogramWithEvent:", v3);
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "didDefer") ^ 1;

  return v6;
}

- (id)_activitySuggestionsFeedbackBookmark
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "bookmarksPathFile:", CFSTR("activitySuggestionsFeedbackPublisherBookmarkFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initFileURLWithPath:", v3);

  objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 1000000, &unk_1E83CC868);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF94A0]), "initWithURLPath:versionNumber:bookmark:metadata:", v4, &unk_1E83CC868, 0, 0);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackHistogramHelper, 0);
  objc_storeStrong((id *)&self->_feedbackStream, 0);
}

void __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXActivitySuggestionsFeedbackProcessor: Unable to save activity suggestion bookmark, error: %@", (uint8_t *)&v2, 0xCu);
}

void __74__ATXActivitySuggestionsFeedbackProcessor_processFeedbackWithXPCActivity___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXActivitySuggestionsFeedbackProcessor processFeedbackWithXPCActivity:]_block_invoke_3";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "%s: Processing feedback eventBody: %@", (uint8_t *)&v2, 0x16u);
}

@end
