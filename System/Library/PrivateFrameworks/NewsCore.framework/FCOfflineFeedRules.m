@implementation FCOfflineFeedRules

- (FCOfflineFeedRules)initWithMaxGroups:(int64_t)a3 maxArticleDownloads:(int64_t)a4 maxIssueDownloads:(int64_t)a5 maxPuzzleDownloads:(int64_t)a6 maxAudioDownloads:(int64_t)a7
{
  FCOfflineFeedRules *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FCOfflineFeedRules;
  result = -[FCOfflineFeedRules init](&v13, sel_init);
  if (result)
  {
    result->_maxGroups = a3;
    result->_maxArticleDownloads = a4;
    result->_maxIssueDownloads = a5;
    result->_maxPuzzleDownloads = a6;
    result->_maxAudioDownloads = a7;
  }
  return result;
}

- (FCOfflineFeedRules)initWithDictionary:(id)a3 defaultMaxGroups:(int64_t)a4 defaultMaxArticleDownloads:(int64_t)a5 defaultMaxIssueDownloads:(int64_t)a6 defaultMaxPuzzleDownloads:(int64_t)a7 defaultMaxAudioDownloads:(int64_t)a8
{
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14 = a3;
  v15 = FCAppConfigurationIntegerValue(v14, (uint64_t)CFSTR("maxGroups"), a4);
  v16 = FCAppConfigurationIntegerValue(v14, (uint64_t)CFSTR("maxArticleDownloads"), a5);
  v17 = FCAppConfigurationIntegerValue(v14, (uint64_t)CFSTR("maxIssueDownloads"), a6);
  v18 = FCAppConfigurationIntegerValue(v14, (uint64_t)CFSTR("maxPuzzleDownloads"), a7);
  v19 = FCAppConfigurationIntegerValue(v14, (uint64_t)CFSTR("maxAudioDownloads"), a8);

  return -[FCOfflineFeedRules initWithMaxGroups:maxArticleDownloads:maxIssueDownloads:maxPuzzleDownloads:maxAudioDownloads:](self, "initWithMaxGroups:maxArticleDownloads:maxIssueDownloads:maxPuzzleDownloads:maxAudioDownloads:", v15, v16, v17, v18, v19);
}

- (int64_t)maxGroups
{
  return self->_maxGroups;
}

- (int64_t)maxArticleDownloads
{
  return self->_maxArticleDownloads;
}

- (int64_t)maxIssueDownloads
{
  return self->_maxIssueDownloads;
}

- (int64_t)maxPuzzleDownloads
{
  return self->_maxPuzzleDownloads;
}

- (int64_t)maxAudioDownloads
{
  return self->_maxAudioDownloads;
}

@end
