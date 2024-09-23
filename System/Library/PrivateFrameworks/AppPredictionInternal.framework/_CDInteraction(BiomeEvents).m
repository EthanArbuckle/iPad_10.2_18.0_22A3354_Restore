@implementation _CDInteraction(BiomeEvents)

+ (id)eventWithData:()BiomeEvents dataVersion:
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  objc_autoreleasePoolPop(v4);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[_CDInteraction(BiomeEvents) eventWithData:dataVersion:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
  return v5;
}

- (uint64_t)dataVersion
{
  return 1;
}

- (id)serialize
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  objc_autoreleasePoolPop(v2);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[_CDInteraction(BiomeEvents) serialize].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
  return v3;
}

+ (void)eventWithData:()BiomeEvents dataVersion:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "Failed to initialize CDInteraction from NSData in ATXInteractionEventProvider with error: %@", a5, a6, a7, a8, 2u);
}

- (void)serialize
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "Failed to serialize CDInteraction data in ATXInteractionEventProvider with error: %@", a5, a6, a7, a8, 2u);
}

@end
