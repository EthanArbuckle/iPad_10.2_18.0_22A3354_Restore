@implementation ML3SpotlightMatchPredicate

- (ML3SpotlightMatchPredicate)initWithSearchString:(id)a3 matchingProperties:(id)a4
{
  id v7;
  id v8;
  ML3SpotlightMatchPredicate *v9;
  ML3SpotlightMatchPredicate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3SpotlightMatchPredicate;
  v9 = -[ML3SpotlightMatchPredicate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchString, a3);
    objc_storeStrong((id *)&v10->_searchProperties, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3SpotlightMatchPredicate;
  -[ML3SpotlightMatchPredicate dealloc](&v2, sel_dealloc);
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_searchProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("ML3SpotlightMatch("));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_searchProperties;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      v10 = 1;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
          if ((v10 & 1) == 0)
            objc_msgSend(v6, "appendString:", CFSTR(", "));
          objc_msgSend(v6, "appendString:", v12);
          v10 = 0;
          ++v11;
        }
        while (v8 != v11);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v10 = 0;
      }
      while (v8);
    }

    objc_msgSend(v6, "appendString:", CFSTR(")"));
    objc_msgSend(v5, "appendString:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ML3SpotlightMatch(%@, %@, %@, %@)"), CFSTR("item_search.search_title"), CFSTR("item_search.search_album"), CFSTR("item_search.search_artist"), CFSTR("item_search.search_composer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v13);

  }
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", CFSTR("JOIN item_search USING (item_pid)"));
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchProperties, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

+ (id)predicateWithProperties:(id)a3 searchString:(id)a4
{
  id v5;
  id v6;
  ML3SpotlightMatchPredicate *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[ML3SpotlightMatchPredicate initWithSearchString:matchingProperties:]([ML3SpotlightMatchPredicate alloc], "initWithSearchString:matchingProperties:", v6, v5);

  return v7;
}

@end
