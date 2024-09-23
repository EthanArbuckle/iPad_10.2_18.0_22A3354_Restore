@implementation CalSubscribedCalendarExternalRepresentation

+ (id)logHandle
{
  if (logHandle_onceToken_0 != -1)
    dispatch_once(&logHandle_onceToken_0, &__block_literal_global_8);
  return (id)logHandle_logHandle_0;
}

void __56__CalSubscribedCalendarExternalRepresentation_logHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "SubscribedCalendarExternalDataRepresentation");
  v1 = (void *)logHandle_logHandle_0;
  logHandle_logHandle_0 = (uint64_t)v0;

}

+ (id)externalRepresentationDataWithDictionary:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (!v4)
  {
    objc_msgSend(a1, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[CalSubscribedCalendarExternalRepresentation externalRepresentationDataWithDictionary:].cold.1((uint64_t)v5, v6, v7);

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
  if (!v4)
    goto LABEL_11;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 1, 0, &v11);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
    objc_msgSend(a1, "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      +[CalSubscribedCalendarExternalRepresentation dictionaryWithExternalRepresentationData:].cold.3(v8, (uint64_t)v12, v7);
    }

  }
  else
  {
    objc_msgSend(a1, "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CalSubscribedCalendarExternalRepresentation dictionaryWithExternalRepresentationData:].cold.1((uint64_t)v6, v5, v9);
  }

  v5 = 0;
LABEL_10:

  if (!v5)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (unint64_t)subscribedCalendarRefreshFlagsFromDictionary:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SCRefreshFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = (int)objc_msgSend(v3, "intValue");
  else
    v4 = 4;

  return v4;
}

+ (void)setSubscribedCalendarRefreshFlags:(unint64_t)a3 inDictionary:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("SCRefreshFlags"));

}

+ (id)lastHolidayLanguageFromDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("LastLanguage"));
}

+ (void)setLastHolidayLanguage:(id)a3 inDictionary:(id)a4
{
  objc_msgSend(a4, "setObject:forKeyedSubscript:", a3, CFSTR("LastLanguage"));
}

+ (id)lastHolidayRegionFromDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("LastRegion"));
}

+ (void)setLastHolidayRegion:(id)a3 inDictionary:(id)a4
{
  objc_msgSend(a4, "setObject:forKeyedSubscript:", a3, CFSTR("LastRegion"));
}

+ (int)migrationVersionFromDictionary:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("migrationVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (void)setMigrationVersion:(int)a3 inDictionary:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend(v5, "numberWithInt:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("migrationVersion"));

}

+ (void)externalRepresentationDataWithDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_18FC12000, a2, a3, "Failed to serialize subscribed calendar external representation data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

+ (void)dictionaryWithExternalRepresentationData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_18FC12000, a2, a3, "Failed to deserialize subscribed calendar external representation data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

+ (void)dictionaryWithExternalRepresentationData:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_18FC12000, a2, a3, "Exception caught while deserializating subscribed calendar external representation data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

+ (void)dictionaryWithExternalRepresentationData:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_18FC12000, a3, (uint64_t)a3, "Got unexpected data type (%{public}@) after deserializing subscribed calendar external representation data", (uint8_t *)a2);
}

@end
