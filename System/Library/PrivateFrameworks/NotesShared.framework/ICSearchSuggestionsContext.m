@implementation ICSearchSuggestionsContext

- (ICSearchSuggestionsContext)init
{
  void *v3;
  ICSearchSuggestionsContext *v4;

  objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICSearchSuggestionsContext initWithSearchSuggestion:](self, "initWithSearchSuggestion:", v3);

  return v4;
}

- (ICSearchSuggestionsContext)initWithSearchSuggestion:(id)a3
{
  id v5;
  ICSearchSuggestionsContext *v6;
  ICSearchSuggestionsContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSearchSuggestionsContext;
  v6 = -[ICSearchSuggestionsContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchSuggestion, a3);

  return v7;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CSSuggestion suggestionTokens](self->_searchSuggestion, "suggestionTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[CSSuggestion userQueryString](self->_searchSuggestion, "userQueryString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") == 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICSearchSuggestionsContext *v5;
  void *v6;
  void *v7;
  ICSearchSuggestionsContext *v8;

  v5 = +[ICSearchSuggestionsContext allocWithZone:](ICSearchSuggestionsContext, "allocWithZone:");
  -[ICSearchSuggestionsContext searchSuggestion](self, "searchSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[ICSearchSuggestionsContext initWithSearchSuggestion:](v5, "initWithSearchSuggestion:", v7);

  return v8;
}

- (void)updateTypedString:(id)a3 tokens:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "length") || objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CA6B70];
    -[ICSearchSuggestionsContext searchSuggestion](self, "searchSuggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v8, v11, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchSuggestionsContext setSearchSuggestion:](self, "setSearchSuggestion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchSuggestionsContext setSearchSuggestion:](self, "setSearchSuggestion:", v8);
  }

}

uint64_t __55__ICSearchSuggestionsContext_updateTypedString_tokens___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "csToken");
}

- (void)updateSearchSuggestion:(id)a3 interaction:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = v6;
  v13 = v6;
  if (a4 == 2)
  {
    v9 = (void *)MEMORY[0x1E0CA6B70];
    v10 = v7;
    v11 = 9;
LABEL_7:
    objc_msgSend(v9, "updatedSuggestionWithCurrentSuggestion:interaction:", v10, v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    v9 = (void *)MEMORY[0x1E0CA6B70];
    v10 = v7;
    v11 = 0;
    goto LABEL_7;
  }
  if (a4)
  {
    v12 = 0;
    goto LABEL_10;
  }
  v8 = v6;
LABEL_8:
  v12 = v8;
LABEL_10:
  -[ICSearchSuggestionsContext setSearchSuggestion:](self, "setSearchSuggestion:", v12);

}

- (void)changeScopeOfToken:(id)a3 toScopeAtIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CA6B70];
  v7 = a3;
  -[ICSearchSuggestionsContext searchSuggestion](self, "searchSuggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "csToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updatedSuggestionWithCurrentSuggestion:token:scopeSelection:", v8, v9, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ICSearchSuggestionsContext setSearchSuggestion:](self, "setSearchSuggestion:", v10);
}

- (CSSuggestion)searchSuggestion
{
  return self->_searchSuggestion;
}

- (void)setSearchSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_searchSuggestion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSuggestion, 0);
}

@end
