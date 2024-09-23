@implementation EMSearchableIndexQueryExpression

+ (EMSearchableIndexQueryExpression)expressionWithQueryString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithQueryString:searchString:updatedSuggestion:", v4, 0, 0);

  return (EMSearchableIndexQueryExpression *)v5;
}

+ (EMSearchableIndexQueryExpression)expressionWithQueryString:(id)a3 searchString:(id)a4 updatedSuggestion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithQueryString:searchString:updatedSuggestion:", v8, v9, v10);

  return (EMSearchableIndexQueryExpression *)v11;
}

- (EMSearchableIndexQueryExpression)init
{
  -[EMSearchableIndexQueryExpression doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMSearchableIndexQueryExpression init]", "EMSearchableIndexQueryExpression.m", 30, "0");
}

- (EMSearchableIndexQueryExpression)initWithQueryString:(id)a3 searchString:(id)a4 updatedSuggestion:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMSearchableIndexQueryExpression *v11;
  uint64_t v12;
  NSString *queryString;
  uint64_t v14;
  NSString *searchString;
  uint64_t v16;
  CSSuggestion *updatedSuggestion;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMSearchableIndexQueryExpression;
  v11 = -[EMSearchableIndexQueryExpression init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    queryString = v11->_queryString;
    v11->_queryString = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    searchString = v11->_searchString;
    v11->_searchString = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    updatedSuggestion = v11->_updatedSuggestion;
    v11->_updatedSuggestion = (CSSuggestion *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[EMSearchableIndexQueryExpression queryString](self, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSearchableIndexQueryExpression searchString](self, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSearchableIndexQueryExpression updatedSuggestion](self, "updatedSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithQueryString:searchString:updatedSuggestion:", v5, v6, v7);

  return v8;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D1EF48];
    -[EMSearchableIndexQueryExpression searchString](self, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "partiallyRedactedStringForString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    -[EMSearchableIndexQueryExpression updatedSuggestion](self, "updatedSuggestion");
    v8 = objc_claimAutoreleasedReturnValue();
    -[EMSearchableIndexQueryExpression queryString](self, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7 | v8)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[EMCSLoggingAdditions publicDescriptionForSuggestion:](EMCSLoggingAdditions, "publicDescriptionForSuggestion:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("(%@) %@ %@"), v7, v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v9;
      v13 = v10;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (void *)MEMORY[0x1E0D1EF48];
    -[EMSearchableIndexQueryExpression searchString](self, "searchString");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "partiallyRedactedStringForString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    -[EMSearchableIndexQueryExpression updatedSuggestion](self, "updatedSuggestion");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[EMSearchableIndexQueryExpression queryString](self, "queryString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("(%@) %p queryString %{BOOL}d"), v8, v10, v16 != 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v13;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[EMSearchableIndexQueryExpression queryString](self, "queryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[EMSearchableIndexQueryExpression searchString](self, "searchString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v4 = 1;
    }
    else
    {
      -[EMSearchableIndexQueryExpression updatedSuggestion](self, "updatedSuggestion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CSSuggestion)updatedSuggestion
{
  return self->_updatedSuggestion;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_updatedSuggestion, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end
