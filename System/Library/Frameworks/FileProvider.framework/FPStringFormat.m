@implementation FPStringFormat

- (NSArray)keyPaths
{
  return (NSArray *)(id)-[NSArray copy](self->_keyPaths, "copy");
}

+ (id)formatForPlistObject:(id)a3 localizationLookup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "localizedStringForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = v9;
    else
      v10 = v6;
    objc_msgSend(v8, "setFormat:", v10);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "formatForStringFormatDict:localizationLookup:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[FPStringFormat formatForPlistObject:localizationLookup:].cold.1();

      v8 = 0;
    }
  }

  return v8;
}

+ (id)formatForStringFormatDict:(id)a3 localizationLookup:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("NSStringFormat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "localizedStringForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;

      v7 = v10;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("NSStringFormatValues"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x1E0C9AA60];
    if (v11)
      v13 = (void *)v11;
    v14 = v13;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v14, "count") < 0xB)
      {
        v24 = v6;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v17 = v14;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v26;
          while (2)
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v26 != v20)
                objc_enumerationMutation(v17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                fp_current_or_default_log();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  +[FPStringFormat formatForStringFormatDict:localizationLookup:].cold.2();

                v16 = 0;
                goto LABEL_28;
              }
              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            if (v19)
              continue;
            break;
          }
        }

        v16 = (void *)objc_opt_new();
        objc_msgSend(v16, "setFormat:", v7);
        objc_msgSend(v16, "setKeyPaths:", v17);
LABEL_28:
        v6 = v24;
        goto LABEL_29;
      }
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[FPStringFormat formatForStringFormatDict:localizationLookup:].cold.1(v14, v15);
    }
    else
    {
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[FPStringFormat formatForStringFormatDict:localizationLookup:].cold.3();
    }

    v16 = 0;
LABEL_29:

    goto LABEL_30;
  }
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[FPStringFormat formatForStringFormatDict:localizationLookup:].cold.4();
  v16 = 0;
LABEL_30:

  return v16;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (void)setKeyPaths:(id)a3
{
  objc_storeStrong((id *)&self->_keyPaths, a3);
}

- (unint64_t)length
{
  return -[NSString length](self->_format, "length");
}

- (id)evaluateWithValuesByName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[FPStringFormat format](self, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPStringFormat keyPaths](self, "keyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_localizedFormatWithKeys:fromDictionary:error:", v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)format
{
  return self->_format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
}

+ (void)formatForPlistObject:localizationLookup:.cold.1()
{
  id v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = (id)objc_opt_class();
  v1 = (id)objc_opt_class();
  v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_8_2(&dword_1A0A34000, v3, v4, "[ERROR] Malformed format. Object should have class %@ or %@, but it has %@", v5, v6, v7, v8, 2u);

}

+ (void)formatForStringFormatDict:(void *)a1 localizationLookup:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = CFSTR("NSStringFormatValues");
  v5 = 1024;
  v6 = 10;
  v7 = 2048;
  v8 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Malformed format. %@ should have at most %d values, but it has %lu", (uint8_t *)&v3, 0x1Cu);
}

+ (void)formatForStringFormatDict:localizationLookup:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (void *)objc_opt_class();
  OUTLINED_FUNCTION_5_6(v1);
  v2 = (void *)OUTLINED_FUNCTION_4_4();
  v3 = OUTLINED_FUNCTION_0_14(v2);
  OUTLINED_FUNCTION_8_2(&dword_1A0A34000, v4, v5, "[ERROR] Malformed format. Value in %@ should have class %@, but it has %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_11_1();
}

+ (void)formatForStringFormatDict:localizationLookup:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (void *)objc_opt_class();
  OUTLINED_FUNCTION_5_6(v1);
  v2 = (void *)OUTLINED_FUNCTION_4_4();
  v3 = OUTLINED_FUNCTION_0_14(v2);
  OUTLINED_FUNCTION_8_2(&dword_1A0A34000, v4, v5, "[ERROR] Malformed format. %@ should have class %@, but it has %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_11_1();
}

+ (void)formatForStringFormatDict:localizationLookup:.cold.4()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (void *)objc_opt_class();
  OUTLINED_FUNCTION_5_6(v1);
  v2 = (void *)OUTLINED_FUNCTION_4_4();
  v3 = OUTLINED_FUNCTION_0_14(v2);
  OUTLINED_FUNCTION_8_2(&dword_1A0A34000, v4, v5, "[ERROR] Malformed format. %@ should have class %@, but it has %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_11_1();
}

@end
