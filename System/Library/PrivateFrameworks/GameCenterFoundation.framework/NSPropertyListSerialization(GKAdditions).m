@implementation NSPropertyListSerialization(GKAdditions)

+ (id)_gkTypesafePropertyListWithData:()GKAdditions withClass:
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v8;
  uint64_t v9;

  if (a3)
  {
    v8 = 0;
    v9 = 200;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, &v9, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      if (!os_log_GKGeneral)
        v5 = GKOSLoggers();
      v6 = (void *)os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
        +[NSPropertyListSerialization(GKAdditions) _gkTypesafePropertyListWithData:withClass:].cold.1(v6);
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (void)_gkTypesafePropertyListWithData:()GKAdditions withClass:.cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[14];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  v6 = 0;
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v1, v4, "unexpected class %@ encountered during property list deserialization to %@. will return a nil result", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
