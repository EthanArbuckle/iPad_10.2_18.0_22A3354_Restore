@implementation ATXInfoSuggestionCriterionRegistry

- (ATXInfoSuggestionCriterionRegistry)init
{
  ATXInfoSuggestionCriterionRegistry *v2;
  uint64_t v3;
  NSDictionary *registry;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInfoSuggestionCriterionRegistry;
  v2 = -[ATXInfoSuggestionCriterionRegistry init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    registry = v2->_registry;
    v2->_registry = (NSDictionary *)v3;

  }
  return v2;
}

- (BOOL)isSourceIdentifierRegistered:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSDictionary objectForKeyedSubscript:](self->_registry, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)confidenceLevelForCriterion:(id)a3 sourceIdentifier:(id)a4
{
  NSDictionary *registry;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  registry = self->_registry;
  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](registry, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  return v9;
}

- (id)availableCriterionIdentifiersForSourceIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_registry, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
}

@end
