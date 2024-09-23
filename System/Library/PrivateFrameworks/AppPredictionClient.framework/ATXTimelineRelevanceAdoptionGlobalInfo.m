@implementation ATXTimelineRelevanceAdoptionGlobalInfo

- (ATXTimelineRelevanceAdoptionGlobalInfo)init
{
  ATXTimelineRelevanceAdoptionGlobalInfo *v2;
  uint64_t v3;
  NSDictionary *globalAdoptionPlist;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXTimelineRelevanceAdoptionGlobalInfo;
  v2 = -[ATXTimelineRelevanceAdoptionGlobalInfo init](&v6, sel_init);
  if (v2)
  {
    +[ATXAssets2 dictionaryFromLazyPlistForClassName:](ATXAssets2, "dictionaryFromLazyPlistForClassName:", CFSTR("ATXTimelineRelevanceAdoption"));
    v3 = objc_claimAutoreleasedReturnValue();
    globalAdoptionPlist = v2->_globalAdoptionPlist;
    v2->_globalAdoptionPlist = (NSDictionary *)v3;

  }
  return v2;
}

- (id)globalDiverseSchemaRawNumber:(id)a3 kind:(id)a4
{
  void *v4;
  NSDictionary *globalAdoptionPlist;
  id v7;
  void *v8;
  void *v9;

  v4 = 0;
  if (a3 && a4)
  {
    globalAdoptionPlist = self->_globalAdoptionPlist;
    v7 = a4;
    -[NSDictionary objectForKeyedSubscript:](globalAdoptionPlist, "objectForKeyedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("diverseScores"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalAdoptionPlist, 0);
}

@end
