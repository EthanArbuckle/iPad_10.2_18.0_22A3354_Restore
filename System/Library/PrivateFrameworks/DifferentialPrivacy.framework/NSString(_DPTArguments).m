@implementation NSString(_DPTArguments)

- (id)dp_stringsFromCSVString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dp_numbersFromCSVString
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(a1, "dp_stringsFromCSVString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setNumberStyle:", 1);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__NSString__DPTArguments__dp_numbersFromCSVString__block_invoke;
  v9[3] = &unk_1E95D9B20;
  v10 = v2;
  v4 = v3;
  v11 = v4;
  v5 = v2;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v9);
  v6 = v11;
  v7 = v4;

  return v7;
}

- (id)dp_numbersVectorsFromCSVString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(";"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__NSString__DPTArguments__dp_numbersVectorsFromCSVString__block_invoke;
  v11[3] = &unk_1E95D9B20;
  v12 = v2;
  v6 = v5;
  v13 = v6;
  v7 = v2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)dp_bitVectorsFromCSVString
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a1, "dp_stringsFromCSVString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__NSString__DPTArguments__dp_bitVectorsFromCSVString__block_invoke;
  v5[3] = &unk_1E95D9B48;
  v3 = v2;
  v6 = v3;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

- (id)dp_floatVectorsFromCSVString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(";"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__NSString__DPTArguments__dp_floatVectorsFromCSVString__block_invoke;
  v7[3] = &unk_1E95D9B48;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (id)dp_wordRecordsFromCSVString
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  objc_msgSend(a1, "dp_stringsFromCSVString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__NSString__DPTArguments__dp_wordRecordsFromCSVString__block_invoke;
  v11[3] = &unk_1E95D9B70;
  v12 = v3;
  v13 = v2;
  v5 = v4;
  v14 = v5;
  v6 = v2;
  v7 = v3;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v11);
  v8 = v14;
  v9 = v5;

  return v9;
}

- (id)dp_dictionaryFromJsonString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\{"), CFSTR("{"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\}"), CFSTR("}"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 16, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v9)
  {
    +[_DPLog tool](_DPLog, "tool");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NSString(_DPTArguments) dp_dictionaryFromJsonString].cold.1(a1, v9);

  }
  return v8;
}

- (void)dp_dictionaryFromJsonString
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v4, v5, "Failed to parse JSON string: '%@'. %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
