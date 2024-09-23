@implementation NSString(HealthRecordsUI)

- (id)removeSpecialCharactersAndWhiteSpaces
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  objc_msgSend(a1, "hk_stringByRemovingCharactersInSet:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stripRTF
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "hasPrefix:", CFSTR("{\\rtf")) & 1) == 0)
    return a1;
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  v12 = *MEMORY[0x1E0DC1118];
  v13[0] = *MEMORY[0x1E0DC1190];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithData:options:documentAttributes:error:", v2, v4, 0, &v11);
  v6 = v11;

  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
    {
      -[NSString(HealthRecordsUI) stripRTF].cold.1(v7);
      if (v5)
        goto LABEL_5;
LABEL_8:
      v8 = a1;
      goto LABEL_9;
    }
  }
  if (!v5)
    goto LABEL_8;
LABEL_5:
  objc_msgSend(v5, "string");
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v10 = v8;

  return v10;
}

- (id)stripHTML
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  v12 = *MEMORY[0x1E0DC1118];
  v13[0] = *MEMORY[0x1E0DC1148];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithData:options:documentAttributes:error:", v2, v4, 0, &v11);
  v6 = v11;

  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
    {
      -[NSString(HealthRecordsUI) stripHTML].cold.1(v7);
      if (v5)
        goto LABEL_4;
LABEL_6:
      v8 = a1;
      goto LABEL_7;
    }
  }
  if (!v5)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v5, "string");
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = v8;

  return v9;
}

- (id)stripRTFOrHTML
{
  if (objc_msgSend(a1, "hasPrefix:", CFSTR("{\\rtf")))
    objc_msgSend(a1, "stripRTF");
  else
    objc_msgSend(a1, "stripHTML");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)stripRTF
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = a1;
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2_0(&dword_1BC30A000, v3, v4, "NSString stripRTF: failed to create NSAttributedString from RTF: %{public}@. Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)stripHTML
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = a1;
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2_0(&dword_1BC30A000, v3, v4, "NSString stripHTML: failed to create NSAttributedString from HTML: %{public}@. Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
