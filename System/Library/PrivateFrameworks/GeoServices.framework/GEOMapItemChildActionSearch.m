@implementation GEOMapItemChildActionSearch

- (GEOMapItemChildActionSearch)initWithChildActionSearch:(id)a3
{
  id *v4;
  GEOMapItemChildActionSearch *v5;
  void *v6;
  GEORelatedSearchSuggestion *v7;
  void *v8;
  uint64_t v9;
  GEORelatedSearchSuggestion *relatedSearchSuggestion;
  objc_super v12;

  v4 = (id *)a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapItemChildActionSearch;
  v5 = -[GEOMapItemChildActionSearch init](&v12, sel_init);
  if (v5)
  {
    -[GEOPDChildActionSearch relatedSearchSuggestion](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [GEORelatedSearchSuggestion alloc];
      -[GEOPDChildActionSearch relatedSearchSuggestion](v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[GEORelatedSearchSuggestion initWithPDRelatedSearchSuggestion:](v7, "initWithPDRelatedSearchSuggestion:", v8);
      relatedSearchSuggestion = v5->_relatedSearchSuggestion;
      v5->_relatedSearchSuggestion = (GEORelatedSearchSuggestion *)v9;

    }
  }

  return v5;
}

- (NSString)displayString
{
  void *v2;
  void *v3;

  -[GEOMapItemChildActionSearch relatedSearchSuggestion](self, "relatedSearchSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEORelatedSearchSuggestion)relatedSearchSuggestion
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
