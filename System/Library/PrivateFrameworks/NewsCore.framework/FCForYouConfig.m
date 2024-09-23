@implementation FCForYouConfig

- (FCForYouConfig)initWithRecord:(id)a3 interestToken:(id)a4
{
  id v7;
  id v8;
  FCForYouConfig *v9;
  FCForYouConfig *v10;
  void *v11;
  void *v12;
  void *v13;
  FCTopStoriesGroupConfig *v14;
  void *v15;
  uint64_t v16;
  FCTopStoriesGroupConfig *topStoriesGroupConfig;
  FCGroupConfig *v18;
  void *v19;
  uint64_t v20;
  FCGroupConfig *trendingGroupConfig;
  FCSpotlightGroupConfig *v22;
  void *v23;
  uint64_t v24;
  FCSpotlightGroupConfig *spotlightGroupConfig;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSArray *editorialGroupConfigs;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)FCForYouConfig;
  v9 = -[FCForYouConfig init](&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_forYouConfigRecord, a3);
    objc_storeStrong((id *)&v10->_interestToken, a4);
    v11 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v7, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fc_dictionaryFromJSON:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = [FCTopStoriesGroupConfig alloc];
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("top_stories"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FCTopStoriesGroupConfig initWithDictionary:](v14, "initWithDictionary:", v15);
    topStoriesGroupConfig = v10->_topStoriesGroupConfig;
    v10->_topStoriesGroupConfig = (FCTopStoriesGroupConfig *)v16;

    v18 = [FCGroupConfig alloc];
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("trending"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[FCGroupConfig initWithDictionary:](v18, "initWithDictionary:", v19);
    trendingGroupConfig = v10->_trendingGroupConfig;
    v10->_trendingGroupConfig = (FCGroupConfig *)v20;

    v22 = [FCSpotlightGroupConfig alloc];
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("spotlight"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[FCSpotlightGroupConfig initWithDictionary:](v22, "initWithDictionary:", v23);
    spotlightGroupConfig = v10->_spotlightGroupConfig;
    v10->_spotlightGroupConfig = (FCSpotlightGroupConfig *)v24;

    objc_opt_class();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("editorial"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
    }
    else
    {
      v27 = 0;
    }
    v28 = v27;

    if (v28)
    {
      objc_msgSend(v28, "fc_arrayByTransformingWithBlock:", &__block_literal_global_62);
      v29 = objc_claimAutoreleasedReturnValue();
      editorialGroupConfigs = v10->_editorialGroupConfigs;
      v10->_editorialGroupConfigs = (NSArray *)v29;

    }
  }

  return v10;
}

FCGroupConfig *__47__FCForYouConfig_initWithRecord_interestToken___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FCGroupConfig *v3;

  v2 = a2;
  v3 = -[FCGroupConfig initWithDictionary:]([FCGroupConfig alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSArray)todayFeedTopStoriesArticleIDs
{
  void *v2;
  void *v3;

  -[FCForYouConfig forYouConfigRecord](self, "forYouConfigRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "todayFeedTopStoriesArticleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)trendingArticleListID
{
  void *v2;
  void *v3;

  -[FCForYouConfig forYouConfigRecord](self, "forYouConfigRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trendingArticleListID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)editorialArticleListIDs
{
  void *v2;
  void *v3;

  -[FCForYouConfig forYouConfigRecord](self, "forYouConfigRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorialArticleListIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)editorialSectionTagIDs
{
  void *v2;
  void *v3;

  -[FCForYouConfig forYouConfigRecord](self, "forYouConfigRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorialSectionTagIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)spotlightArticleID
{
  void *v2;
  void *v3;

  -[FCForYouConfig forYouConfigRecord](self, "forYouConfigRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spotlightArticleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)fetchedDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[FCForYouConfig forYouConfigRecord](self, "forYouConfigRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithPBDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (FCTopStoriesGroupConfig)topStoriesGroupConfig
{
  return self->_topStoriesGroupConfig;
}

- (void)setTopStoriesGroupConfig:(id)a3
{
  objc_storeStrong((id *)&self->_topStoriesGroupConfig, a3);
}

- (FCGroupConfig)trendingGroupConfig
{
  return self->_trendingGroupConfig;
}

- (void)setTrendingGroupConfig:(id)a3
{
  objc_storeStrong((id *)&self->_trendingGroupConfig, a3);
}

- (FCSpotlightGroupConfig)spotlightGroupConfig
{
  return self->_spotlightGroupConfig;
}

- (void)setSpotlightGroupConfig:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightGroupConfig, a3);
}

- (NSArray)editorialGroupConfigs
{
  return self->_editorialGroupConfigs;
}

- (void)setEditorialGroupConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_editorialGroupConfigs, a3);
}

- (NSArray)demoGroupConfigs
{
  return self->_demoGroupConfigs;
}

- (NSArray)topVideosArticleIDs
{
  return self->_topVideosArticleIDs;
}

- (NSString)moreVideosArticleListID
{
  return self->_moreVideosArticleListID;
}

- (NTPBForYouConfigRecord)forYouConfigRecord
{
  return self->_forYouConfigRecord;
}

- (void)setForYouConfigRecord:(id)a3
{
  objc_storeStrong((id *)&self->_forYouConfigRecord, a3);
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void)setInterestToken:(id)a3
{
  objc_storeStrong((id *)&self->_interestToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_forYouConfigRecord, 0);
  objc_storeStrong((id *)&self->_moreVideosArticleListID, 0);
  objc_storeStrong((id *)&self->_topVideosArticleIDs, 0);
  objc_storeStrong((id *)&self->_demoGroupConfigs, 0);
  objc_storeStrong((id *)&self->_editorialGroupConfigs, 0);
  objc_storeStrong((id *)&self->_spotlightGroupConfig, 0);
  objc_storeStrong((id *)&self->_trendingGroupConfig, 0);
  objc_storeStrong((id *)&self->_topStoriesGroupConfig, 0);
}

@end
