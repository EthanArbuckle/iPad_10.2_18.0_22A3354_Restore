@implementation MSParsecSearchSessionQueryComponent

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MSParsecSearchSessionQueryComponent_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (OS_os_log *)(id)log_log_1;
}

void __42__MSParsecSearchSessionQueryComponent_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;

}

+ (id)freeTextQueryComponentWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCategory:scope:queryString:cannedSuggestion:", CFSTR("free_text"), 0, v4, 0);

  return v5;
}

+ (id)userTypedQueryComponentWithString:(id)a3 removingFreeTextTokens:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSParsecSearchSessionQueryComponent userTypedQueryComponentWithString:removingFreeTextTokenString:](MSParsecSearchSessionQueryComponent, "userTypedQueryComponentWithString:removingFreeTextTokenString:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)userTypedQueryComponentWithString:(id)a3 removingFreeTextTokenString:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, &stru_1E7171180, 8, 0, objc_msgSend(v7, "length"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (objc_msgSend(v9, "length"))
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCategory:scope:queryString:cannedSuggestion:", CFSTR("user_typed"), 0, v9, 0);
  else
    v11 = 0;

  return v11;
}

+ (id)suggestionAtomQueryComponentWithCategory:(id)a3 scope:(id)a4 queryString:(id)a5 cannedSuggestion:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCategory:scope:queryString:cannedSuggestion:", v10, v11, v12, v6);

  return v13;
}

+ (id)_structuredQueryForComponents:(id)a3 hasCurrentMailboxScope:(BOOL)a4 languages:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v6 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __102__MSParsecSearchSessionQueryComponent__structuredQueryForComponents_hasCurrentMailboxScope_languages___block_invoke;
    v20 = &unk_1E716E208;
    v21 = v8;
    objc_msgSend(v7, "ef_compactMap:", &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10, v17, v18, v19, v20);
    v11 = CFSTR("all");
    if (v6)
      v11 = CFSTR("curr");
    v12 = v11;
    v22 = CFSTR("mf");
    v23[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);

  return v15;
}

id __102__MSParsecSearchSessionQueryComponent__structuredQueryForComponents_hasCurrentMailboxScope_languages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    +[MSParsecSearchSessionQueryComponent log](MSParsecSearchSessionQueryComponent, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __102__MSParsecSearchSessionQueryComponent__structuredQueryForComponents_hasCurrentMailboxScope_languages___block_invoke_cold_1(v6);

    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "_structuredQueryComponentWithLanguages:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (MSParsecSearchSessionQueryComponent)initWithCategory:(id)a3 scope:(id)a4 queryString:(id)a5 cannedSuggestion:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  MSParsecSearchSessionQueryComponent *v14;
  MSParsecSearchSessionQueryComponent *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MSParsecSearchSessionQueryComponent;
  v14 = -[MSParsecSearchSessionQueryComponent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_category, a3);
    objc_storeStrong((id *)&v15->_scope, a4);
    objc_storeStrong((id *)&v15->_queryString, a5);
    v15->_cannedSuggestion = a6;
  }

  return v15;
}

- (id)_structuredQueryComponentWithLanguages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MSParsecSearchSessionQueryComponent cannedSuggestion](self, "cannedSuggestion"))
  {
    -[MSParsecSearchSessionQueryComponent category](self, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v5);

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MSParsecSearchSessionQueryComponent category](self, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[MSParsecSearchSessionQueryComponent scope](self, "scope");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[MSParsecSearchSessionQueryComponent scope](self, "scope");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("s"));

      }
    }
    -[MSParsecSearchSessionQueryComponent queryString](self, "queryString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "ef_localesFromLanguages:", v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ef_wordComponentsForLocale:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v13;
    v16 = 0;
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v16 += objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19++), "length");
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("nc"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("nw"));
    -[MSParsecSearchSessionQueryComponent category](self, "category");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v21);

  }
  return v4;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)scope
{
  return self->_scope;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (BOOL)cannedSuggestion
{
  return self->_cannedSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

void __102__MSParsecSearchSessionQueryComponent__structuredQueryForComponents_hasCurrentMailboxScope_languages___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9D1A000, log, OS_LOG_TYPE_ERROR, "Could not get a MSParsecSearchSessionQueryComponent", v1, 2u);
}

@end
