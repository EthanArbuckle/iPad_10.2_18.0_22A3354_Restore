@implementation ATXUserEducationSuggestion

void __52__ATXUserEducationSuggestion_Internal__logFeedback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_context_user_education_suggestions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "-[ATXUserEducationSuggestion(Internal) logFeedback:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%s: Processing feedback: %@", (uint8_t *)&v9, 0x16u);
  }

  v4 = objc_msgSend(*(id *)(a1 + 32), "feedbackType") - 1;
  if (v4 <= 5 && ((0x2Du >> v4) & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "writeSuggestionState:", qword_1C9E80658[v4]);
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 40), "metricClass")), "initWithFeedback:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "logToCoreAnalytics");
  objc_msgSend(v5, "coreAnalyticsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "suggestionType");
  ATXUserEducationSuggestionTypeToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("suggestionType"));

  AnalyticsSendEvent();
}

@end
