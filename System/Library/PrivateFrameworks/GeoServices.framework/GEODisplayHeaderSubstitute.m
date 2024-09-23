@implementation GEODisplayHeaderSubstitute

- (GEODisplayHeaderSubstitute)initWithPDDisplayHeaderSubstitute:(id)a3
{
  id *v5;
  GEODisplayHeaderSubstitute *v6;
  GEODisplayHeaderSubstitute *v7;
  void *v8;
  GEORelatedSearchSuggestion *v9;
  GEORelatedSearchSuggestion *relatedSearchSuggestion;
  GEODisplayHeaderSubstitute *v11;
  objc_super v13;

  v5 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)GEODisplayHeaderSubstitute;
  v6 = -[GEODisplayHeaderSubstitute init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayHeaderSubstitute, a3);
    -[GEOPDDisplayHeaderSubstitute relatedSearchSuggestion](v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[GEORelatedSearchSuggestion initWithPDRelatedSearchSuggestion:]([GEORelatedSearchSuggestion alloc], "initWithPDRelatedSearchSuggestion:", v8);
      relatedSearchSuggestion = v7->_relatedSearchSuggestion;
      v7->_relatedSearchSuggestion = v9;

    }
    v11 = v7;

  }
  return v7;
}

- (int)substituteType
{
  void *v2;
  int v3;

  -[GEODisplayHeaderSubstitute displayHeaderSubstitute](self, "displayHeaderSubstitute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOPDDisplayHeaderSubstitute substituteType]((uint64_t)v2);

  if (v3 == 2)
    return 2;
  else
    return v3 == 1;
}

- (NSString)interpretedQuery
{
  id *v2;
  void *v3;

  -[GEODisplayHeaderSubstitute displayHeaderSubstitute](self, "displayHeaderSubstitute");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDisplayHeaderSubstitute interpretedQuery](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOPDDisplayHeaderSubstitute)displayHeaderSubstitute
{
  return self->_displayHeaderSubstitute;
}

- (void)setDisplayHeaderSubstitute:(id)a3
{
  objc_storeStrong((id *)&self->_displayHeaderSubstitute, a3);
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
  objc_storeStrong((id *)&self->_displayHeaderSubstitute, 0);
}

@end
