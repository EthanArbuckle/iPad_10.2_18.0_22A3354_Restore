@implementation EMSearchableIndexSuggestionsQueryResult

- (EMSearchableIndexSuggestionsQueryResult)initWithSuggestions:(id)a3
{
  id v4;
  EMSearchableIndexSuggestionsQueryResult *v5;
  uint64_t v6;
  NSArray *suggestions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMSearchableIndexSuggestionsQueryResult;
  v5 = -[EMSearchableIndexSuggestionsQueryResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
