@implementation GEOGuidesHomeResultFilterTypeConcept

- (GEOGuidesHomeResultFilterTypeConcept)initWithGuidesHomeResultFilterTypeConcept:(id)a3
{
  id v5;
  GEOGuidesHomeResultFilterTypeConcept *v6;
  GEOGuidesHomeResultFilterTypeConcept *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOGuidesHomeResultFilterTypeConcept;
  v6 = -[GEOGuidesHomeResultFilterTypeConcept init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_conceptFilter, a3);

  return v7;
}

- (GEORelatedSearchSuggestion)searchSuggestion
{
  GEORelatedSearchSuggestion *v3;
  void *v4;
  GEORelatedSearchSuggestion *v5;

  v3 = [GEORelatedSearchSuggestion alloc];
  -[GEOPDGuidesHomeResultFilterTypeConcept relatedSearchSuggestion]((id *)&self->_conceptFilter->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEORelatedSearchSuggestion initWithPDRelatedSearchSuggestion:](v3, "initWithPDRelatedSearchSuggestion:", v4);

  return v5;
}

- (GEOPDGuidesHomeResultFilterTypeConcept)conceptFilter
{
  return self->_conceptFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conceptFilter, 0);
}

@end
