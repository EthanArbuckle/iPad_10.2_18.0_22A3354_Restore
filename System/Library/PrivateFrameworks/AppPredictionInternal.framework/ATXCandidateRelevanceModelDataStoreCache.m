@implementation ATXCandidateRelevanceModelDataStoreCache

- (ATXCandidateRelevanceModelDataStoreCache)init
{
  ATXCandidateRelevanceModelDataStoreCache *v2;
  uint64_t v3;
  NSMutableDictionary *featurizationManagers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXCandidateRelevanceModelDataStoreCache;
  v2 = -[ATXCandidateRelevanceModelDataStoreCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    featurizationManagers = v2->_featurizationManagers;
    v2->_featurizationManagers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)featurizationManagerForFeaturizationManagerId:(int64_t)a3
{
  NSMutableDictionary *featurizationManagers;
  void *v4;
  void *v5;

  featurizationManagers = self->_featurizationManagers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](featurizationManagers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setFeaturizationManager:(id)a3 forFeaturizationManagerId:(int64_t)a4
{
  NSMutableDictionary *featurizationManagers;
  void *v6;
  id v7;
  id v8;

  featurizationManagers = self->_featurizationManagers;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithLongLong:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](featurizationManagers, "setObject:forKeyedSubscript:", v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featurizationManagers, 0);
}

@end
