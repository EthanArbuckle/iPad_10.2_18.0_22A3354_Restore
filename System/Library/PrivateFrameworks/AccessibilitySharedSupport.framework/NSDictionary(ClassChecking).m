@implementation NSDictionary(ClassChecking)

- (id)axssDecodeObjectOfClass:()ClassChecking forKey:
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    AXSSLogForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = a3;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = (id)objc_opt_class();
      v11 = v17;
      _os_log_error_impl(&dword_1AF5CC000, v9, OS_LOG_TYPE_ERROR, "Tried to decode object of class %@ for key %@, but was class %@ instead", (uint8_t *)&v12, 0x20u);

    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (uint64_t)axssDecodeBoolForKey:()ClassChecking
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    AXSSLogForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSDictionary(ClassChecking) axssDecodeBoolForKey:].cold.1();

    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(v5, "BOOLValue");
  }

  return v6;
}

- (id)axssDecodeArrayOfClass:()ClassChecking forKey:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_12:
    v13 = v7;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            AXSSLogForCategory(1);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v17 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v24 = a3;
              v25 = 2112;
              v26 = v6;
              v27 = 2112;
              v28 = v17;
              v18 = v17;
              _os_log_error_impl(&dword_1AF5CC000, v15, OS_LOG_TYPE_ERROR, "Tried to decode array of class %@ for key %@, but objects were of class %@ instead", buf, 0x20u);

            }
            goto LABEL_19;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        if (v10)
          continue;
        break;
      }
    }

    goto LABEL_12;
  }
  AXSSLogForCategory(1);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[NSDictionary(ClassChecking) axssDecodeArrayOfClass:forKey:].cold.1();

LABEL_19:
  v13 = 0;
LABEL_20:

  return v13;
}

- (void)axssDecodeBoolForKey:()ClassChecking .cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_4_1();
  v1 = OUTLINED_FUNCTION_1_0(v0);
  OUTLINED_FUNCTION_2_1(&dword_1AF5CC000, v2, v3, "Tried to decode NSNumber for key %@, but was class %@ instead", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)axssDecodeArrayOfClass:()ClassChecking forKey:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_4_1();
  v1 = OUTLINED_FUNCTION_1_0(v0);
  OUTLINED_FUNCTION_2_1(&dword_1AF5CC000, v2, v3, "Tried to decode array for key %@, but was class %@ instead", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

@end
