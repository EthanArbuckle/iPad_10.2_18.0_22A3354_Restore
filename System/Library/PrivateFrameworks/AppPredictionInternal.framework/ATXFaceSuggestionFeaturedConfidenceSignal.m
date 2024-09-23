@implementation ATXFaceSuggestionFeaturedConfidenceSignal

- (double)valueForDescriptor:(id)a3
{
  void *v3;
  uint64_t v4;
  double result;
  NSObject *v6;

  objc_msgSend(a3, "galleryOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "featuredConfidenceLevel");

  if (v4 == 2)
    return 2.0;
  result = 1.0;
  if (!v4)
  {
    __atxlog_handle_lock_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXFaceSuggestionFeaturedConfidenceSignal valueForDescriptor:].cold.1(v6);

    return -1000.0;
  }
  return result;
}

- (double)weight
{
  return 5.0;
}

- (void)valueForDescriptor:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXFaceSuggestionFeaturedConfidenceSignal valueForDescriptor:]";
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "%s: warning: attempting to score descriptor with no featured confidence, returning -1000.0", (uint8_t *)&v1, 0xCu);
}

@end
