@implementation CSSuggestion(MailUI)

+ (id)mui_log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CSSuggestion_MailUI__mui_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mui_log_onceToken != -1)
    dispatch_once(&mui_log_onceToken, block);
  return (id)mui_log_log;
}

+ (id)mui_emptySuggestion
{
  if (mui_emptySuggestion_onceToken != -1)
    dispatch_once(&mui_emptySuggestion_onceToken, &__block_literal_global);
  return (id)mui_emptySuggestion_emptySuggestion;
}

+ (id)mui_spotlightSuggestionForEmailAddress:()MailUI scope:currentSuggestion:
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  if (a4 > 2)
  {
    v10 = 0;
  }
  else
  {
    -[__CFString stringByAppendingString:](off_1E99E1190[a4], "stringByAppendingString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CA6B70], "mui_emptySuggestion");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CA6B70], "updatedSuggestionWithCurrentSuggestion:highlightedText:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)mui_spotlightSuggestionFromSerializedRepresentation:()MailUI
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[16];

  v3 = a3;
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CA6B70], "mui_log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[CSSuggestion(MailUI) mui_spotlightSuggestionFromSerializedRepresentation:].cold.1(v5);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA6B70], "mui_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "Could not decode data as CSSuggestion. Reason: Data is nil", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)mui_mergeCurrentSuggestion:()MailUI suggestion:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "userQueryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length") || objc_msgSend(v8, "count"))
  {
    v9 = objc_msgSend(v7, "length");
    objc_msgSend(v5, "userQueryString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v7, "stringByAppendingString:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    objc_msgSend(v5, "userQueryString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v7);

    if (v13)
    {
      objc_msgSend(v5, "userQueryString");
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "currentTokens");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CA6B70];
    objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v20, v16, v18);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = v5;
  }

  return v21;
}

- (id)mui_serializedSpotlightSuggestionRepresentation
{
  void *v1;
  id v2;
  NSObject *v3;
  id v5;

  v5 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CA6B70], "mui_log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[CSSuggestion(MailUI) mui_serializedSpotlightSuggestionRepresentation].cold.1(v2);

  }
  return v1;
}

- (BOOL)mui_isEmpty
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "suggestionTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "userQueryString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length") == 0;

  }
  return v3;
}

+ (id)mui_suggestionForSpotlightQueryWithString:()MailUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CA6B70];
  v4 = a3;
  objc_msgSend(v3, "emptySuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v5, v4, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)mui_spotlightSuggestionFromSerializedRepresentation:()MailUI .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "ef_publicDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1D5522000, v2, v3, "Could not decode data as CSSuggestion. Error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)mui_serializedSpotlightSuggestionRepresentation
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "ef_publicDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1D5522000, v2, v3, "Failed to encode data from CSSuggestion. Error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
