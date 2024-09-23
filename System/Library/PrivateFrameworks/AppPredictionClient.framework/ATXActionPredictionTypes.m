@implementation ATXActionPredictionTypes

+ (id)engagementTypeToString:(unint64_t)a3
{
  NSObject *v5;

  if (a3 < 0xB)
    return off_1E4D57B38[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXActionPredictionTypes engagementTypeToString:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid value of %lu passed to engagementTypeToString"), a3);
  return CFSTR("Error");
}

+ (id)actionExperienceToString:(unint64_t)a3
{
  NSObject *v5;

  if (a3 < 5)
    return off_1E4D57B90[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXActionPredictionTypes actionExperienceToString:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid value of %lu passed to actionExperienceToString"), a3);
  return CFSTR("Error");
}

+ (id)actionTypeToString:(unint64_t)a3
{
  NSObject *v5;

  if (a3 < 7)
    return off_1E4D57BB8[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXActionPredictionTypes actionTypeToString:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid value of %lu passed to actionTypeToString"), a3);
  return CFSTR("Error");
}

+ (id)actionFeedbackStageToString:(unint64_t)a3
{
  NSObject *v5;

  if (a3 < 9)
    return off_1E4D57BF0[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXActionPredictionTypes actionFeedbackStageToString:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid value of %lu passed to actionFeedbackStageString"), a3);
  return CFSTR("Error");
}

+ (id)actionFeedbackTypeToString:(unint64_t)a3
{
  NSObject *v5;

  if (a3 < 4)
    return off_1E4D57C38[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXActionPredictionTypes actionFeedbackTypeToString:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid value of %lu passed to actionFeedbackTypeToString"), a3);
  return CFSTR("Error");
}

+ (unint64_t)stringToActionExperience:(id)a3 found:(BOOL *)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  int v8;
  BOOL v9;

  v5 = a3;
  v6 = 0;
  while (1)
  {
    objc_msgSend((id)objc_opt_class(), "actionExperienceToString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v5);

    if (v8)
      break;
    if (++v6 == 4)
    {
      v6 = 0;
      if (!a4)
        goto LABEL_9;
      v9 = 0;
      goto LABEL_8;
    }
  }
  if (!a4)
    goto LABEL_9;
  v9 = 1;
LABEL_8:
  *a4 = v9;
LABEL_9:

  return v6;
}

+ (unint64_t)stringToActionFeedbackStage:(id)a3 found:(BOOL *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  int v9;
  BOOL v10;

  v6 = a3;
  v7 = 0;
  while (1)
  {
    objc_msgSend(a1, "actionFeedbackStageToString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

    if (v9)
      break;
    if (++v7 == 8)
    {
      v7 = 0;
      if (!a4)
        goto LABEL_9;
      v10 = 0;
      goto LABEL_8;
    }
  }
  if (!a4)
    goto LABEL_9;
  v10 = 1;
LABEL_8:
  *a4 = v10;
LABEL_9:

  return v7;
}

+ (id)inverseActionFeedbackTypeMapping
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "actionFeedbackTypeToString:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  }
  return v3;
}

+ (id)actionTypeToPETString:(unint64_t)a3
{
  if (a3 > 5)
    return CFSTR("other");
  else
    return off_1E4D57C58[a3];
}

+ (void)engagementTypeToString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Invalid value of %lu passed to engagementTypeToString", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)actionExperienceToString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Invalid value of %lu passed to actionExperienceToString", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)actionTypeToString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Invalid value of %lu passed to actionTypeToString", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)actionFeedbackStageToString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Invalid value of %lu passed to actionFeedbackStageString", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)actionFeedbackTypeToString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Invalid value of %lu passed to actionFeedbackTypeToString", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
