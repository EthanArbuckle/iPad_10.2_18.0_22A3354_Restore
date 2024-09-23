@implementation ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery

- (id)uiFeedbackPublisherChain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXProactiveSuggestionPartialIntentHandlingPublisher *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery;
  -[ATXProactiveSuggestionUIFeedbackQuery uiFeedbackPublisherChain](&v19, sel_uiFeedbackPublisherChain);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "App");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "InFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackQuery startDateForResults](self, "startDateForResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atx_publisherFromStartDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "App");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Intent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackQuery startDateForResults](self, "startDateForResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "atx_publisherFromStartDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && v8 && v13)
  {
    v14 = -[ATXProactiveSuggestionPartialIntentHandlingPublisher initWithUIFeedbackPublisher:appLaunchPublisher:intentPublisher:]([ATXProactiveSuggestionPartialIntentHandlingPublisher alloc], "initWithUIFeedbackPublisher:appLaunchPublisher:intentPublisher:", v3, v8, v13);
    -[ATXProactiveSuggestionPartialIntentHandlingPublisher partialIntentUIFeedbackPublisher](v14, "partialIntentUIFeedbackPublisher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  if (v3)
  {
    if (v8)
      goto LABEL_7;
LABEL_12:
    __atxlog_handle_blending_ecosystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery uiFeedbackPublisherChain].cold.2();

    if (v13)
      goto LABEL_8;
LABEL_15:
    __atxlog_handle_blending_ecosystem();
    v14 = (ATXProactiveSuggestionPartialIntentHandlingPublisher *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
      -[ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery uiFeedbackPublisherChain].cold.1();
    v15 = 0;
    goto LABEL_18;
  }
  __atxlog_handle_blending_ecosystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery uiFeedbackPublisherChain].cold.3();

  if (!v8)
    goto LABEL_12;
LABEL_7:
  if (!v13)
    goto LABEL_15;
LABEL_8:
  v15 = 0;
LABEL_19:

  return v15;
}

- (void)uiFeedbackPublisherChain
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "%@ - could not initialize uiFeedbackPublisherChain, returning early", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
