@implementation ICTopHitLegacyQuery

- (ICTopHitLegacyQuery)initWithQueryString:(id)a3 keyboardLanguage:(id)a4
{
  id v7;
  id v8;
  ICTopHitLegacyQuery *v9;
  ICTopHitLegacyQuery *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICTopHitLegacyQuery;
  v9 = -[ICSearchQuery initWithExternalRankingQueries:](&v12, sel_initWithExternalRankingQueries_, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queryString, a3);
    objc_storeStrong((id *)&v10->_keyboardLanguage, a4);
    v10->_modernResultsOnly = 1;
  }

  return v10;
}

- (double)timeoutInterval
{
  return 0.75;
}

- (id)newSearchQueryContext
{
  return 0;
}

- (id)newSearchQueryWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalLocaleIdentifierFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTopHitLegacyQuery keyboardLanguage](self, "keyboardLanguage");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v8;
  v12 = v11;

  v13 = objc_alloc(MEMORY[0x1E0CA6B88]);
  -[ICTopHitLegacyQuery queryString](self, "queryString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchQuery attributesToFetch](self, "attributesToFetch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithSearchString:keyboardLanguage:attributes:hitCount:", v14, v12, v15, 2);

  return v16;
}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (NSString)highlightString
{
  return self->_highlightString;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_queryString, a3);
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (void)setKeyboardLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardLanguage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_highlightString, 0);
}

@end
