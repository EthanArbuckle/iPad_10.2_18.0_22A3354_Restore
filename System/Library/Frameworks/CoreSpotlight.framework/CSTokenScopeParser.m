@implementation CSTokenScopeParser

- (void)loadScopeKeyMapTableForCurrentLocale
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CSTokenScopeParser tokenScopeConfigurationTable](self, "tokenScopeConfigurationTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        CSGetLocalizedString(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedLowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":,"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v20 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend((id)_scopeKeyMapTable, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v15);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

}

- (void)loadDefaultScopeKeyMapTable
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[CSTokenScopeParser tokenScopeConfigurationTable](self, "tokenScopeConfigurationTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7);
        -[CSTokenScopeParser tokenScopeConfigurationTable](self, "tokenScopeConfigurationTable");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":,"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend((id)_scopeKeyMapTable, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18++));
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v16);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

}

- (id)tokenScopeConfigurationTable
{
  if (tokenScopeConfigurationTable_once != -1)
    dispatch_once(&tokenScopeConfigurationTable_once, &__block_literal_global_25);
  return (id)tokenScopeConfigurationTable_configuration;
}

void __50__CSTokenScopeParser_tokenScopeConfigurationTable__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[6];
  _QWORD v21[8];

  v21[6] = *MEMORY[0x1E0C80C00];
  +[_CSTokenScope tokenScopesForPerson](_CSTokenScope, "tokenScopesForPerson");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CSTokenScope tokenScopesForSubjectContains](_CSTokenScope, "tokenScopesForSubjectContains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CSTokenScope tokenScopesForAttachmentType](_CSTokenScope, "tokenScopesForAttachmentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CSTokenScope tokenScopesForMessageWithAttachments](_CSTokenScope, "tokenScopesForMessageWithAttachments");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CSTokenScope tokenScopesForAllTokens](_CSTokenScope, "tokenScopesForAllTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("FROM_SCOPE_KEY");
  v19[0] = v0;
  v19[1] = &unk_1E2430168;
  v3 = MEMORY[0x1E0C9AAA0];
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = CFSTR("from");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v20[1] = CFSTR("TO_SCOPE_KEY");
  v18[0] = v0;
  v18[1] = &unk_1E2430180;
  v18[2] = v3;
  v18[3] = CFSTR("to");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  v20[2] = CFSTR("SUBJECT_SCOPE_KEY");
  v17[0] = v13;
  v17[1] = &unk_1E2430168;
  v17[2] = v3;
  v17[3] = CFSTR("subject");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v6;
  v20[3] = CFSTR("ATTACHMENT_TYPE_SCOPE_KEY");
  v16[0] = v12;
  v16[1] = &unk_1E2430168;
  v16[2] = v3;
  v16[3] = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v7;
  v20[4] = CFSTR("ATTACHMENTS_SCOPE_KEY");
  v15[0] = v1;
  v15[1] = &unk_1E2430168;
  v15[2] = MEMORY[0x1E0C9AAB0];
  v15[3] = CFSTR("attachment:attachments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v8;
  v20[5] = CFSTR("MESSAGE_SCOPE_KEY");
  v14[0] = v2;
  v14[1] = &unk_1E2430198;
  v14[2] = v3;
  v14[3] = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)tokenScopeConfigurationTable_configuration;
  tokenScopeConfigurationTable_configuration = v10;

}

- (id)scopeKeyMapTable
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSTokenScopeParser_scopeKeyMapTable__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  if (scopeKeyMapTable_once != -1)
    dispatch_once(&scopeKeyMapTable_once, block);
  return (id)_scopeKeyMapTable;
}

uint64_t __38__CSTokenScopeParser_scopeKeyMapTable__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_scopeKeyMapTable;
  _scopeKeyMapTable = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadDefaultScopeKeyMapTable");
}

- (CSTokenScopeParser)init
{
  CSTokenScopeParser *v2;
  CSTokenScopeParser *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSTokenScopeParser;
  v2 = -[CSTokenScopeParser init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[CSTokenScopeParser scopeKeyMapTable](v2, "scopeKeyMapTable");
    -[CSTokenScopeParser updateScopeKeyMapTableIfNeeded](v3, "updateScopeKeyMapTableIfNeeded");
  }
  return v3;
}

- (id)tokenScopeConfigurationForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (id)_scopeKeyMapTable;
    objc_sync_enter(v5);
    objc_msgSend((id)_scopeKeyMapTable, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryQuery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CSTokenScopeParser tokenScopeConfigurationForKey:].cold.1(v7);

    objc_sync_exit(v5);
    -[CSTokenScopeParser tokenScopeConfigurationTable](self, "tokenScopeConfigurationTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateScopeKeyMapTableIfNeeded
{
  void *v3;
  void *v4;
  id obj;

  obj = (id)_scopeKeyMapTable;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend((id)updateScopeKeyMapTableIfNeeded_lastLocalIdentifer, "isEqualToString:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&updateScopeKeyMapTableIfNeeded_lastLocalIdentifer, v4);
    -[CSTokenScopeParser loadScopeKeyMapTableForCurrentLocale](self, "loadScopeKeyMapTableForCurrentLocale");
  }

  objc_sync_exit(obj);
}

- (int64_t)indexForScopeKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  -[CSTokenScopeParser tokenScopeConfigurationTable](self, "tokenScopeConfigurationTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (id)tokenFromConfiguration:(id)a3 userString:(id)a4 displayString:(id)a5 handle:(id)a6
{
  __CFString *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  _CSSuggestionToken *v19;
  _CSSuggestionToken *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v16 = v9;
  else
    v16 = &stru_1E2406B38;
  v22[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CSTokenScope scopesFromCSTokenScopes:displayString:handles:](_CSTokenScope, "scopesFromCSTokenScopes:displayString:handles:", v15, v10, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [_CSSuggestionToken alloc];
  v20 = -[_CSSuggestionToken initWithUserString:scopes:selectedIndex:displayString:](v19, "initWithUserString:scopes:selectedIndex:displayString:", v11, v18, v14, v10);

  return v20;
}

- (id)suggestionTokenForString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":："));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v8);
  v11 = v10;
  v12 = v7;
  v13 = v12;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
    v15 = v12;
  }
  else
  {
    objc_msgSend(v12, "substringToIndex:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "substringFromIndex:", v9 + v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedLowercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSTokenScopeParser tokenScopeConfigurationForKey:](self, "tokenScopeConfigurationForKey:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    goto LABEL_7;
  objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  v25 = objc_msgSend(v20, "length");
  if (v24)
  {
    if (v25)
    {
LABEL_7:
      v26 = 0;
      goto LABEL_13;
    }
  }
  else if (!v25)
  {
    goto LABEL_7;
  }
  CSGetLocalizedString(CFSTR("TOKEN_TEXT_ANY"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
    v28 = v20;
  else
    v28 = v27;
  -[CSTokenScopeParser tokenFromConfiguration:userString:displayString:handle:](self, "tokenFromConfiguration:userString:displayString:handle:", v22, v13, v28, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v26;
}

- (id)messageSuggestionTokenForString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    -[CSTokenScopeParser tokenScopeConfigurationForKey:](self, "tokenScopeConfigurationForKey:", CFSTR("message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSTokenScopeParser tokenFromConfiguration:userString:displayString:handle:](self, "tokenFromConfiguration:userString:displayString:handle:", v8, v7, v7, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tokenScopeConfigurationForKey:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = _scopeKeyMapTable;
  _os_log_debug_impl(&dword_18C42F000, log, OS_LOG_TYPE_DEBUG, "scopeKeyMapTable: %@", (uint8_t *)&v1, 0xCu);
}

@end
