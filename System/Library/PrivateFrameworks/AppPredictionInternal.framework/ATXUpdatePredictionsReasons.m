@implementation ATXUpdatePredictionsReasons

+ (id)stringForUpdatePredictionsReason:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;

  if (a3 < 0x18)
    return off_1E82DF680[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:].cold.1(a3, v5, v6);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("stringForUpdatePredictionsReason called with invalid ATXUpdatePredictionsReason value of %lu"), a3);
  return CFSTR("Error");
}

+ (void)stringForUpdatePredictionsReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "stringForUpdatePredictionsReason called with invalid ATXUpdatePredictionsReason value of %lu", (uint8_t *)&v3);
}

@end
