@implementation GEOAllCollectionsViewResultFilterTypeKeyword

- (GEOAllCollectionsViewResultFilterTypeKeyword)initWithFilterKeywordIdentifier:(id)a3
{
  id v5;
  GEOAllCollectionsViewResultFilterTypeKeyword *v6;
  GEOAllCollectionsViewResultFilterTypeKeyword *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAllCollectionsViewResultFilterTypeKeyword;
  v6 = -[GEOAllCollectionsViewResultFilterTypeKeyword init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_filterKeywordIdentifier, a3);

  return v7;
}

- (GEORelatedSearchSuggestion)searchSuggestion
{
  GEORelatedSearchSuggestion *v3;
  void *v4;
  GEORelatedSearchSuggestion *v5;

  v3 = [GEORelatedSearchSuggestion alloc];
  -[GEOPDAllCollectionsViewResultFilterTypeKeyword relatedSearchSuggestion]((id *)&self->_filterKeywordIdentifier->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEORelatedSearchSuggestion initWithPDRelatedSearchSuggestion:](v3, "initWithPDRelatedSearchSuggestion:", v4);

  return v5;
}

- (GEOPDAllCollectionsViewResultFilterTypeKeyword)keywordIdentifier
{
  return self->_filterKeywordIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterKeywordIdentifier, 0);
}

@end
