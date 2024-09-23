@implementation FCTopStoriesGroupConfig

- (FCTopStoriesGroupConfig)initWithDictionary:(id)a3
{
  FCTopStoriesGroupConfig *v3;
  NSArray *v4;
  NSArray *v5;
  NSDictionary *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *mandatoryArticleIDPairs;
  NSArray *v16;
  NSArray *optionalArticleIDs;
  NSArray *v18;
  NSDictionary *topStoriesMetadataByArticleID;
  NSDictionary *v20;
  NSDate *publishDate;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  NSArray *v27;
  NSDictionary *v28;
  _QWORD v29[4];
  NSDictionary *v30;
  NSArray *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)FCTopStoriesGroupConfig;
  v3 = -[FCGroupConfig initWithDictionary:](&v32, sel_initWithDictionary_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[FCGroupConfig dictionary](v3, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mandatory_articles"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __46__FCTopStoriesGroupConfig_initWithDictionary___block_invoke;
      v29[3] = &unk_1E4642D88;
      v30 = v6;
      v31 = v4;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v29);

    }
    -[FCGroupConfig dictionary](v3, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("personalized_articles"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v23 = v9;
      v24 = 3221225472;
      v25 = __46__FCTopStoriesGroupConfig_initWithDictionary___block_invoke_2;
      v26 = &unk_1E4642D88;
      v27 = v5;
      v28 = v6;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v23);

    }
    -[FCGroupConfig dictionary](v3, "dictionary", v23, v24, v25, v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("publishDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateFromStringWithISO8601Format:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    mandatoryArticleIDPairs = v3->_mandatoryArticleIDPairs;
    v3->_mandatoryArticleIDPairs = v4;
    v16 = v4;

    optionalArticleIDs = v3->_optionalArticleIDs;
    v3->_optionalArticleIDs = v5;
    v18 = v5;

    topStoriesMetadataByArticleID = v3->_topStoriesMetadataByArticleID;
    v3->_topStoriesMetadataByArticleID = v6;
    v20 = v6;

    publishDate = v3->_publishDate;
    v3->_publishDate = (NSDate *)v14;

  }
  return v3;
}

void __46__FCTopStoriesGroupConfig_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FCArticleMetadata *v4;
  void *v5;
  void *v6;
  FCArticleMetadata *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[FCArticleMetadata initWithDictionary:]([FCArticleMetadata alloc], "initWithDictionary:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v10);

  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("paidArticle"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[FCArticleMetadata initWithDictionary:]([FCArticleMetadata alloc], "initWithDictionary:", v5);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

    }
  }
  else
  {
    v6 = 0;
  }
  v8 = *(void **)(a1 + 40);
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v10, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

void __46__FCTopStoriesGroupConfig_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  FCArticleMetadata *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  v4 = -[FCArticleMetadata initWithDictionary:]([FCArticleMetadata alloc], "initWithDictionary:", v3);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, v5);
}

- (NSArray)mandatoryArticleIDPairs
{
  return self->_mandatoryArticleIDPairs;
}

- (NSArray)optionalArticleIDs
{
  return self->_optionalArticleIDs;
}

- (NSDictionary)topStoriesMetadataByArticleID
{
  return self->_topStoriesMetadataByArticleID;
}

- (void)setTopStoriesMetadataByArticleID:(id)a3
{
  objc_storeStrong((id *)&self->_topStoriesMetadataByArticleID, a3);
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_topStoriesMetadataByArticleID, 0);
  objc_storeStrong((id *)&self->_optionalArticleIDs, 0);
  objc_storeStrong((id *)&self->_mandatoryArticleIDPairs, 0);
}

@end
