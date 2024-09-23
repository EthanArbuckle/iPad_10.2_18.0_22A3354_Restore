@implementation _CNAutocompleteAggregateSourceInclusionPolicy

- (_CNAutocompleteAggregateSourceInclusionPolicy)initWithPolicies:(id)a3
{
  id v4;
  _CNAutocompleteAggregateSourceInclusionPolicy *v5;
  uint64_t v6;
  NSArray *policies;
  _CNAutocompleteAggregateSourceInclusionPolicy *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAutocompleteAggregateSourceInclusionPolicy;
  v5 = -[_CNAutocompleteAggregateSourceInclusionPolicy init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    policies = v5->_policies;
    v5->_policies = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)includeContacts
{
  void *v2;
  char v3;

  -[_CNAutocompleteAggregateSourceInclusionPolicy policies](self, "policies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_27);

  return v3;
}

- (BOOL)includeRecents
{
  void *v2;
  char v3;

  -[_CNAutocompleteAggregateSourceInclusionPolicy policies](self, "policies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_121);

  return v3;
}

- (BOOL)includeStewie
{
  void *v2;
  char v3;

  -[_CNAutocompleteAggregateSourceInclusionPolicy policies](self, "policies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_122);

  return v3;
}

- (BOOL)includeSuggestions
{
  void *v2;
  char v3;

  -[_CNAutocompleteAggregateSourceInclusionPolicy policies](self, "policies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_123);

  return v3;
}

- (BOOL)includeLocalExtensions
{
  void *v2;
  char v3;

  -[_CNAutocompleteAggregateSourceInclusionPolicy policies](self, "policies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_124_0);

  return v3;
}

- (BOOL)includePredictions
{
  void *v2;
  char v3;

  -[_CNAutocompleteAggregateSourceInclusionPolicy policies](self, "policies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_125);

  return v3;
}

- (BOOL)includeDirectoryServers
{
  void *v2;
  char v3;

  -[_CNAutocompleteAggregateSourceInclusionPolicy policies](self, "policies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_126);

  return v3;
}

- (BOOL)includeCalendarServers
{
  void *v2;
  char v3;

  -[_CNAutocompleteAggregateSourceInclusionPolicy policies](self, "policies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_127);

  return v3;
}

- (BOOL)includeSupplementalResults
{
  void *v2;
  char v3;

  -[_CNAutocompleteAggregateSourceInclusionPolicy policies](self, "policies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_128);

  return v3;
}

- (NSArray)policies
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
}

@end
