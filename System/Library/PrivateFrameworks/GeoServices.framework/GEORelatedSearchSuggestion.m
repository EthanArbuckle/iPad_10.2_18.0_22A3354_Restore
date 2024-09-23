@implementation GEORelatedSearchSuggestion

- (GEORelatedSearchSuggestion)initWithPDRelatedSearchSuggestion:(id)a3
{
  id v5;
  GEORelatedSearchSuggestion *v6;
  GEORelatedSearchSuggestion *v7;
  GEORelatedSearchSuggestion *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORelatedSearchSuggestion;
  v6 = -[GEORelatedSearchSuggestion init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_relatedSearchSuggestion, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)displayString
{
  id *v2;
  void *v3;

  -[GEORelatedSearchSuggestion relatedSearchSuggestion](self, "relatedSearchSuggestion");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRelatedSearchSuggestion displayString](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)searchBarDisplayToken
{
  id *v2;
  void *v3;

  -[GEORelatedSearchSuggestion relatedSearchSuggestion](self, "relatedSearchSuggestion");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRelatedSearchSuggestion searchBarDisplayToken](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_suggestionEntryMetadata
{
  id *v2;
  void *v3;

  -[GEORelatedSearchSuggestion relatedSearchSuggestion](self, "relatedSearchSuggestion");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRelatedSearchSuggestion suggestionEntryMetadata](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GEOPDRelatedSearchSuggestion)relatedSearchSuggestion
{
  return self->_relatedSearchSuggestion;
}

- (void)setRelatedSearchSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_relatedSearchSuggestion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedSearchSuggestion, 0);
}

@end
