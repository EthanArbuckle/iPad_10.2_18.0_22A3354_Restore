@implementation NSMutableDictionary(ICCloudContext)

- (void)ic_addZoneID:()ICCloudContext forAccountID:
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NSMutableDictionary(ICCloudContext) ic_addZoneID:forAccountID:].cold.1();
    goto LABEL_10;
  }
  if (!v6)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NSMutableDictionary(ICCloudContext) ic_addZoneID:forAccountID:].cold.2();
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, v7);
  objc_msgSend(v8, "addObject:", v6);

LABEL_11:
}

- (void)ic_removeZoneID:()ICCloudContext forAccountID:
{
  id v6;
  NSObject *v7;
  NSObject *v8;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      -[NSObject removeObject:](v7, "removeObject:", v6);
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NSMutableDictionary(ICCloudContext) ic_removeZoneID:forAccountID:].cold.1();
  }

}

- (void)ic_addZoneID:()ICCloudContext forAccountID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to add zoneID without an account ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)ic_addZoneID:()ICCloudContext forAccountID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to add nil zoneID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)ic_removeZoneID:()ICCloudContext forAccountID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to remove zoneID without an account ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
