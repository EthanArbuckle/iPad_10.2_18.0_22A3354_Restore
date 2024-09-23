@implementation ATXCategoricalFeatureTimeOfDayHour

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend(v4, "timeContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "timeContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "timeOfDay"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_relevance_model();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXCategoricalFeatureTimeOfDayHour categoricalFeatureValueForContext:candidate:].cold.1();

    v9 = CFSTR("<Unexpected Category Value>");
  }

  return v9;
}

- (void)categoricalFeatureValueForContext:candidate:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "%@ - Nil timeContext passed in. Returning unexpected category value.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
