@implementation CalExchangeCalendarItemExternalRepresentation

+ (id)logHandle
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global_14);
  return (id)logHandle_logHandle;
}

void __58__CalExchangeCalendarItemExternalRepresentation_logHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.database", "CalExchangeCalendarItemExternalRepresentation");
  v1 = (void *)logHandle_logHandle;
  logHandle_logHandle = (uint64_t)v0;

}

+ (id)externalRepresentationDataWithDictionary:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CalExchangeCalendarItemExternalRepresentation externalRepresentationDataWithDictionary:].cold.1((uint64_t)v5, v7, v8);

  }
  return v4;
}

+ (id)dictionaryWithExternalRepresentationData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(a1, "logHandle");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_opt_class();
        +[CalExchangeCalendarItemExternalRepresentation dictionaryWithExternalRepresentationData:].cold.3(v8, (uint64_t)v12, v7);
      }

    }
    else
    {
      objc_msgSend(a1, "logHandle");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[CalExchangeCalendarItemExternalRepresentation dictionaryWithExternalRepresentationData:].cold.1((uint64_t)v6, v5, v9);
    }

    v5 = 0;
    goto LABEL_11;
  }
  v5 = 0;
LABEL_12:

  return v5;
}

+ (void)externalRepresentationDataWithDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A5CCB000, a2, a3, "Failed to serialize Exchange calendar item external representation data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)dictionaryWithExternalRepresentationData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A5CCB000, a2, a3, "Failed to deserialize Exchange calendar item external representation data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)dictionaryWithExternalRepresentationData:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A5CCB000, a2, a3, "Exception caught while deserializating Exchange calendar item external representation data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)dictionaryWithExternalRepresentationData:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A5CCB000, a3, (uint64_t)a3, "Got unexpected data type (%{public}@) after deserializing Exchange calendar item external representation data", (uint8_t *)a2);
}

@end
