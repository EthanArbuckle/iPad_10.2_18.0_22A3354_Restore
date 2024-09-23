@implementation _DKEvent(ATX)

- (id)atx_efficientRelevantShortcut
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(a1, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AD8], "serializedRelevantShortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_DKEvent(ATX) atx_efficientRelevantShortcut].cold.2((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  else
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_DKEvent(ATX) atx_efficientRelevantShortcut].cold.1(v7);
    v6 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v6;
}

- (void)atx_efficientRelevantShortcut
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error unarchiving relevant shortcut: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
