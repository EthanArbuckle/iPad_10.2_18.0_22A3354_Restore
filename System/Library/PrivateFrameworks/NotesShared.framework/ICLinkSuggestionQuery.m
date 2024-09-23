@implementation ICLinkSuggestionQuery

- (ICLinkSuggestionQuery)initWithQueryString:(id)a3
{
  return -[ICLinkSuggestionQuery initWithQueryString:includeNotes:includeWebsites:](self, "initWithQueryString:includeNotes:includeWebsites:", a3, 1, 1);
}

- (ICLinkSuggestionQuery)initWithQueryString:(id)a3 includeNotes:(BOOL)a4 includeWebsites:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  ICLinkSuggestionQuery *v9;
  void *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICLinkSuggestionQuery;
  v9 = -[ICSearchQuery initWithExternalRankingQueries:](&v12, sel_initWithExternalRankingQueries_, 0);
  if (v9)
  {
    +[ICSearchQueryOperation prefixMatchingQueryStringTitleForSearchString:](ICSearchQueryOperation, "prefixMatchingQueryStringTitleForSearchString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLinkSuggestionQuery setQueryString:](v9, "setQueryString:", v10);

    -[ICLinkSuggestionQuery setIncludeNotes:](v9, "setIncludeNotes:", v6);
    -[ICLinkSuggestionQuery setIncludeWebsites:](v9, "setIncludeWebsites:", v5);
  }

  return v9;
}

- (id)newSearchQueryContext
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v2, "setDisableBlockingOnIndex:", 1);
  return v2;
}

- (id)newSearchQueryWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CA6B28];
  v5 = a3;
  v6 = [v4 alloc];
  -[ICLinkSuggestionQuery queryString](self, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithQueryString:queryContext:", v7, v5);

  return v8;
}

- (id)attributesToFetch
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA60F8];
  v6[0] = *MEMORY[0x1E0D64110];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0CA60F0];
  v6[2] = *MEMORY[0x1E0CA6158];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0CA6820];
  v6[4] = *MEMORY[0x1E0CA62F0];
  v6[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)includeNotes
{
  return self->_includeNotes;
}

- (void)setIncludeNotes:(BOOL)a3
{
  self->_includeNotes = a3;
}

- (BOOL)includeWebsites
{
  return self->_includeWebsites;
}

- (void)setIncludeWebsites:(BOOL)a3
{
  self->_includeWebsites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end
