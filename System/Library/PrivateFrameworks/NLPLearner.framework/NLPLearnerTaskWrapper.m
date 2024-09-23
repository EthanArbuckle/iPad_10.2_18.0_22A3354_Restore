@implementation NLPLearnerTaskWrapper

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLP", "NLPLearnerTaskWrapper");
    v3 = (void *)sLog_2;
    sLog_2 = (uint64_t)v2;

  }
}

+ (int64_t)taskFromRecipe:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("emoji")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("lm")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("char_lm")) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fragment_lm")) & 1) != 0)
    {
      v5 = 5;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("act")) & 1) != 0)
    {
      v5 = 7;
    }
    else
    {
      v7 = sLog_2;
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        +[NLPLearnerTaskWrapper taskFromRecipe:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)privacyIdentifierForTask:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
    +[NLPLearnerTaskWrapper privacyIdentifierForTask:].cold.1(a3, v4, v5, v6, v7, v8, v9, v10);
  return &stru_24EDB9588;
}

+ (void)taskFromRecipe:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "Unexpected recipe parameter '%@'", a5, a6, a7, a8, 2u);
}

+ (void)privacyIdentifierForTask:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "Task %ld doesn't have an associated privacy identifier", a5, a6, a7, a8, 0);
}

@end
