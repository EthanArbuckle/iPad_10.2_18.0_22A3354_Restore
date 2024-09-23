@implementation EMFQuery

- (EMFQuery)initWithQueryString:(id)a3 andLocale:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *normalizedString;
  EMFQuery *v10;

  v6 = a4;
  v7 = a3;
  _createNormalizedString(v7, v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  normalizedString = self->_normalizedString;
  self->_normalizedString = v8;

  v10 = -[EMFQuery initWithQueryString:andQueryTokens:andLocale:](self, "initWithQueryString:andQueryTokens:andLocale:", v7, 0, v6);
  return v10;
}

- (EMFQuery)initWithQueryString:(id)a3 andQueryTokens:(id)a4 andLocale:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMFQuery *v11;
  uint64_t v12;
  NSString *queryString;
  uint64_t v14;
  NSArray *queryTokens;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EMFQuery;
  v11 = -[EMFQuery init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    queryString = v11->_queryString;
    v11->_queryString = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    queryTokens = v11->_queryTokens;
    v11->_queryTokens = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_queryTokensAnalyzed, v11->_queryTokens);
    objc_storeStrong((id *)&v11->_locale, a5);
  }

  return v11;
}

- (EMFQuery)initWithLocale:(id)a3
{
  return -[EMFQuery initWithQueryString:andQueryTokens:andLocale:](self, "initWithQueryString:andQueryTokens:andLocale:", 0, 0, a3);
}

- (EMFQuery)initWithQueryTokens:(id)a3 andLocale:(id)a4
{
  return -[EMFQuery initWithQueryString:andQueryTokens:andLocale:](self, "initWithQueryString:andQueryTokens:andLocale:", 0, a3, a4);
}

- (id)finalTokenAnalyzed
{
  return -[EMFQuery _finalTokenAnalyzed:](self, "_finalTokenAnalyzed:", 1);
}

- (id)finalTokenUnanalyzed
{
  return -[EMFQuery _finalTokenAnalyzed:](self, "_finalTokenAnalyzed:", 0);
}

- (NSString)trimmedQueryString
{
  void *v2;
  void *v3;
  void *v4;

  -[EMFQuery queryString](self, "queryString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)normalizedQueryString
{
  void *v3;
  void *v4;

  -[EMFQuery trimmedQueryString](self, "trimmedQueryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _createNormalizedString(v3, self->_locale);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setQueryString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *queryString;
  NSString *v7;
  NSString *normalizedString;
  NSArray *queryTokens;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  queryString = self->_queryString;
  self->_queryString = v5;

  _createNormalizedString(v4, self->_locale);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  normalizedString = self->_normalizedString;
  self->_normalizedString = v7;

  queryTokens = self->_queryTokens;
  self->_queryTokens = 0;

}

- (void)setTokens:(id)a3
{
  id v4;
  NSArray *queryTokensAnalyzed;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)&self->_queryTokens, v4);
  v6 = v4;
  queryTokensAnalyzed = self->_queryTokensAnalyzed;
  self->_queryTokensAnalyzed = 0;

}

- (NSArray)tokens
{
  void *v3;
  void *v4;
  EMFStringStemmer *stringStemmer;
  uint64_t v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSArray *queryTokens;
  NSArray *v16;
  NSArray *queryTokensAnalyzed;
  NSArray *v18;
  NSArray *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_queryTokens)
  {
    _createTokensForString(self->_normalizedString, self->_locale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    stringStemmer = self->_stringStemmer;
    if (stringStemmer)
    {
      _createStemmedTokensForTokenArray(v3, stringStemmer);
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[EMFQuery tokens].cold.1((id *)&self->_locale);
        __assert_rtn("-[EMFQuery tokens]", "EMFQuery.m", 150, "stemmedTokens");
      }
      v7 = (void *)v6;

      v4 = v7;
    }
    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v4;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEqualToString:", &stru_1E670BD50, (_QWORD)v21) & 1) == 0)
            -[NSArray addObject:](v8, "addObject:", v14);
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    queryTokens = self->_queryTokens;
    self->_queryTokens = v9;
    v16 = v9;

    queryTokensAnalyzed = self->_queryTokensAnalyzed;
    self->_queryTokensAnalyzed = v8;

  }
  if (self->_queryString && (v18 = self->_queryTokensAnalyzed) != 0)
    v19 = (NSArray *)-[NSArray copy](v18, "copy");
  else
    v19 = self->_queryTokens;
  return v19;
}

- (id)tokenCounts
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[EMFQuery tokens](self, "tokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
          v11 = (void *)v10;
        else
          v11 = &unk_1E6724390;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "integerValue") + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setObject:forKey:", v12, v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)reset
{
  NSArray *queryTokens;

  queryTokens = self->_queryTokens;
  self->_queryTokens = 0;

}

- (id)_finalTokenAnalyzed:(BOOL)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[EMFQuery tokens](self, "tokens");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray lastObject](self->_queryTokens, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithQueryString:andQueryTokens:andLocale:", self->_queryString, self->_queryTokens, self->_locale);
  objc_msgSend(v4, "setStringStemmer:", self->_stringStemmer);
  return v4;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (EMFStringStemmer)stringStemmer
{
  return self->_stringStemmer;
}

- (void)setStringStemmer:(id)a3
{
  objc_storeStrong((id *)&self->_stringStemmer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringStemmer, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
  objc_storeStrong((id *)&self->_queryTokensAnalyzed, 0);
  objc_storeStrong((id *)&self->_queryTokens, 0);
}

- (void)tokens
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_1B3DE1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Stemming failed for locale %@", (uint8_t *)&v2, 0xCu);

}

@end
