@implementation MRUnarchiveObjectForKey

id ___MRUnarchiveObjectForKey_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = a2;
  MSVPropertyListDataClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v5, v3, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v7)
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ___MRUnarchiveObjectForKey_block_invoke_cold_1();

  }
  return v6;
}

void ___MRUnarchiveObjectForKey_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRSerializationUtility] unarchive failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
