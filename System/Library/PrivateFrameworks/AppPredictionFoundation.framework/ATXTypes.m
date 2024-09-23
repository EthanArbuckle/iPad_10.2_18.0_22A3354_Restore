@implementation ATXTypes

+ (unsigned)consumerSubtypeForString:(id)a3 found:(BOOL *)a4
{
  id v6;
  unsigned __int8 v7;
  unsigned int v8;
  void *v9;
  int v10;
  BOOL v11;

  v6 = a3;
  v7 = 0;
  while (1)
  {
    v8 = v7;
    objc_msgSend(a1, "stringForConsumerSubtype:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v6);

    if (v10)
      break;
    ++v7;
    if (v8 >= 0x2F)
    {
      v11 = 0;
      v7 = 0;
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  if (!a4)
    goto LABEL_9;
  v11 = 1;
LABEL_8:
  *a4 = v11;
LABEL_9:

  return v7;
}

+ (id)stringForConsumerSubtype:(unsigned __int8)a3
{
  unsigned int v3;
  NSObject *v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (a3 < 0x30u)
    return off_1E82BF958[(char)a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v7 = v3;
    _os_log_error_impl(&dword_1C99CA000, v5, OS_LOG_TYPE_ERROR, "stringForConsumerSubtype called with invalid ATXConsumerSubType value of %lu", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("stringForConsumerSubtype called with invalid ATXConsumerSubType value of %lu"), v3);
  return CFSTR("Error");
}

+ (id)stringForEngagementType:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;

  if (a3 < 7)
    return off_1E82BF870[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXTypes stringForEngagementType:].cold.1(a3, v5, v6);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("stringForConsumerType called with invalid ATXEngagementType value of %lu"), a3);
  return CFSTR("Error");
}

+ (id)stringForConsumerType:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;

  if (a3 < 0x16)
    return off_1E82BF8A8[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXTypes stringForConsumerType:].cold.1(a3, v5, v6);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("stringForConsumerType called with invalid ATXConsumerType value of %lu"), a3);
  return CFSTR("Error");
}

+ (id)safeStringForConsumerSubtype:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  switch(a3)
  {
    case '&':
      return CFSTR("ActionSuggestionAvocado");
    case '%':
      return CFSTR("AppSuggestionAvocado");
    case '#':
      v5 = CFSTR("Dewey");
      break;
    default:
      +[ATXTypes stringForConsumerSubtype:](ATXTypes, "stringForConsumerSubtype:", v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

+ (id)consumerMapping
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 22);
  for (i = 0; i != 22; ++i)
  {
    objc_msgSend(a1, "stringForConsumerType:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  }
  return v3;
}

+ (id)consumerSubtypeMapping
{
  void *v3;
  int v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 48);
  v4 = 0;
  do
  {
    v5 = v4;
    objc_msgSend(a1, "stringForConsumerSubtype:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

    ++v4;
  }
  while (v5 < 0x2F);
  return v3;
}

+ (id)inverseConsumerSubtypeMapping
{
  void *v3;
  int v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 48);
  v4 = 0;
  do
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringForConsumerSubtype:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

    ++v4;
  }
  while (v5 < 0x2F);
  return v3;
}

+ (id)validConsumerTypes
{
  void *v2;
  uint64_t i;
  void *v4;

  v2 = (void *)objc_opt_new();
  for (i = 0; i != 22; ++i)
  {
    +[ATXTypes stringForConsumerType:](ATXTypes, "stringForConsumerType:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  return v2;
}

+ (id)validConsumerTypeList
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "validConsumerTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v5);

      if (objc_msgSend(v2, "count") - 1 > v4)
        objc_msgSend(v3, "appendString:", CFSTR(", "));
      ++v4;
    }
    while (objc_msgSend(v2, "count") > v4);
  }

  return v3;
}

+ (id)validConsumerSubTypes
{
  void *v2;
  int v3;
  unsigned int v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  v3 = 0;
  do
  {
    v4 = v3;
    +[ATXTypes stringForConsumerSubtype:](ATXTypes, "stringForConsumerSubtype:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

    ++v3;
  }
  while (v4 < 0x2F);
  return v2;
}

+ (id)validConsumerSubTypeList
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "validConsumerSubTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v5);

      if (objc_msgSend(v2, "count") - 1 > v4)
        objc_msgSend(v3, "appendString:", CFSTR(", "));
      ++v4;
    }
    while (objc_msgSend(v2, "count") > v4);
  }

  return v3;
}

+ (id)uiTypeForActionConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  char v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v5 = a3 - 16;
  if ((a3 - 16) < 0x19 && ((0x1D0007Fu >> v5) & 1) != 0)
    return off_1E82BFAD8[v5];
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[ATXTypes uiTypeForActionConsumerSubType:].cold.1(a1, v3, v6);

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(a1, "stringForConsumerSubtype:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("unsupported consumerSubType of %@ passed into uiTypeForActionConsumerSubType"), v9);

  return CFSTR("SPOTLIGHT");
}

+ (unint64_t)engagementTypeForString:(id)a3 found:(BOOL *)a4
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
    objc_msgSend(a1, "stringForEngagementType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

    if (v9)
      break;
    if (++v7 == 7)
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

+ (unint64_t)consumerTypeForString:(id)a3 found:(BOOL *)a4
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
    objc_msgSend(a1, "stringForConsumerType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

    if (v9)
      break;
    if (++v7 == 22)
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

+ (unint64_t)consumerTypeForSubType:(unsigned __int8)a3
{
  if (a3 > 0x30u)
    return 0;
  else
    return qword_1C99D8060[(char)a3];
}

+ (BOOL)isActionSpotlightConsumerSubType:(unsigned __int8)a3
{
  return (a3 & 0xFE) == 0x12 || (a3 & 0xFE) == 20;
}

+ (void)iterConsumerTypesWithBlock:(id)a3
{
  void (**v3)(id, uint64_t, unsigned __int8 *);
  uint64_t v4;
  void *v5;
  int v6;
  BOOL v7;
  unsigned __int8 v8;

  v3 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  v4 = 0;
  v8 = 0;
  do
  {
    v5 = (void *)MEMORY[0x1CAA46674]();
    v3[2](v3, v4, &v8);
    v6 = v8;
    objc_autoreleasePoolPop(v5);
    if (v6)
      v7 = 1;
    else
      v7 = v4 == 21;
    ++v4;
  }
  while (!v7);

}

+ (void)iterConsumerSubTypesWithBlock:(id)a3
{
  void (**v3)(id, _QWORD, unsigned __int8 *);
  uint64_t v4;
  void *v5;
  int v6;
  unsigned __int8 v8;

  v3 = (void (**)(id, _QWORD, unsigned __int8 *))a3;
  v4 = 0;
  v8 = 0;
  do
  {
    v5 = (void *)MEMORY[0x1CAA46674]();
    v3[2](v3, v4, &v8);
    v6 = v8;
    objc_autoreleasePoolPop(v5);
    if (v6)
      break;
  }
  while (v4++ != 47);

}

+ (void)stringForEngagementType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1C99CA000, a2, a3, "stringForConsumerType called with invalid ATXEngagementType value of %lu", (uint8_t *)&v3);
}

+ (void)stringForConsumerType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1C99CA000, a2, a3, "stringForConsumerType called with invalid ATXConsumerType value of %lu", (uint8_t *)&v3);
}

+ (void)uiTypeForActionConsumerSubType:(NSObject *)a3 .cold.1(void *a1, unsigned __int8 a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stringForConsumerSubtype:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1C99CA000, a3, v5, "unsupported consumerSubType of %@ passed into uiTypeForActionConsumerSubType", (uint8_t *)&v6);

}

@end
