@implementation ATXUserEducationSuggestionServerRequestHandler

- (void)logUserEducationSuggestionFeedback:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a3;
  __atxlog_handle_context_user_education_suggestions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ATXUserEducationSuggestionServerRequestHandler logUserEducationSuggestionFeedback:].cold.1((uint64_t)v3, v4);

  objc_msgSend(v3, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logFeedback:", v3);

}

- (void)logUserEducationSuggestionFeedback:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXUserEducationSuggestionServerRequestHandler logUserEducationSuggestionFeedback:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "%s: Received feedback: %@", (uint8_t *)&v2, 0x16u);
}

@end
