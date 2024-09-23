@implementation FCOfflineDownloadsConfiguration

- (FCOfflineDownloadsConfiguration)initWithDictionary:(id)a3 optimized:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FCOfflineDownloadsConfiguration *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  FCOfflineFeedRules *v18;
  void *v19;
  uint64_t v20;
  FCOfflineFeedRules *todayFeedRules;
  FCOfflineFeedRules *v22;
  void *v23;
  uint64_t v24;
  FCOfflineFeedRules *puzzleHubFeedRules;
  FCOfflineFeedRules *v26;
  void *v27;
  uint64_t v28;
  FCOfflineFeedRules *puzzleTypeFeedRules;
  FCOfflineFeedRules *v30;
  void *v31;
  uint64_t v32;
  FCOfflineFeedRules *sportsFeedRules;
  FCOfflineFeedRules *v34;
  void *v35;
  uint64_t v36;
  FCOfflineFeedRules *magazineFeedRules;
  FCOfflineFeedRules *v38;
  void *v39;
  uint64_t v40;
  FCOfflineFeedRules *audioFeedRules;
  FCOfflineFeedRules *v42;
  void *v43;
  uint64_t v44;
  FCOfflineFeedRules *savedFeedRules;
  FCOfflineFeedRules *v46;
  void *v47;
  uint64_t v48;
  FCOfflineFeedRules *historyFeedRules;
  FCOfflineFeedRules *v50;
  void *v51;
  uint64_t v52;
  FCOfflineFeedRules *sharedWithYouFeedRules;
  uint64_t v55;
  uint64_t v56;
  objc_super v57;

  v4 = a4;
  v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)FCOfflineDownloadsConfiguration;
  v7 = -[FCOfflineDownloadsConfiguration init](&v57, sel_init);
  if (v7)
  {
    v7->_minDeviceStorage = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("minDeviceStorage"), 1000000000);
    if (v4)
      v8 = 2000000000;
    else
      v8 = 5000000000;
    if (v4)
      v9 = 100;
    else
      v9 = 250;
    if (v4)
      v10 = 5;
    else
      v10 = 10;
    if (v4)
      v11 = 50;
    else
      v11 = 250;
    if (v4)
      v12 = 10;
    else
      v12 = 25;
    if (v4)
      v13 = 5;
    else
      v13 = 0x7FFFFFFFLL;
    if (v4)
      v14 = 25;
    else
      v14 = 50;
    if (v4)
      v15 = 0;
    else
      v15 = 5;
    if (v4)
      v16 = 10;
    else
      v16 = 20;
    v17 = 15;
    if (v4)
      v17 = 10;
    v55 = v16;
    v56 = v17;
    v7->_maxDownloadStorage = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("maxDownloadStorage"), v8);
    v7->_maxArticleDownloads = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("maxArticleDownloads"), v9);
    v7->_maxIssueDownloads = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("maxIssueDownloads"), v10);
    v7->_maxPuzzleDownloads = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("maxPuzzleDownloads"), v11);
    v7->_maxAudioDownloads = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("maxAudioDownloads"), v12);
    v7->_maxImagesPerArticle = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("maxImagesPerArticle"), v13);
    v7->_useSmallestArticleThumbnails = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("useSmallestArticleThumbnails"), v4);
    v7->_useSmallestPuzzleThumbnails = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("useSmallestPuzzleThumbnails"), v4);
    v7->_useSmallestArticleImages = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("useSmallestArticleImages"), v4);
    v18 = [FCOfflineFeedRules alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("todayFeed"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[FCOfflineFeedRules initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:](v18, "initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:", v19, 20, v14, 1, 0x7FFFFFFFLL, v15);
    todayFeedRules = v7->_todayFeedRules;
    v7->_todayFeedRules = (FCOfflineFeedRules *)v20;

    v22 = [FCOfflineFeedRules alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("puzzleHubFeed"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[FCOfflineFeedRules initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:](v22, "initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:", v23, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0x7FFFFFFFLL);
    puzzleHubFeedRules = v7->_puzzleHubFeedRules;
    v7->_puzzleHubFeedRules = (FCOfflineFeedRules *)v24;

    v26 = [FCOfflineFeedRules alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("puzzleFeed"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[FCOfflineFeedRules initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:](v26, "initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:", v27, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0x7FFFFFFFLL);
    puzzleTypeFeedRules = v7->_puzzleTypeFeedRules;
    v7->_puzzleTypeFeedRules = (FCOfflineFeedRules *)v28;

    v30 = [FCOfflineFeedRules alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("sportsFeed"), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[FCOfflineFeedRules initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:](v30, "initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:", v31, 0x7FFFFFFFLL, v55, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0x7FFFFFFFLL);
    sportsFeedRules = v7->_sportsFeedRules;
    v7->_sportsFeedRules = (FCOfflineFeedRules *)v32;

    v34 = [FCOfflineFeedRules alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("magazineFeed"), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[FCOfflineFeedRules initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:](v34, "initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:", v35, 0x7FFFFFFFLL, v55, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0x7FFFFFFFLL);
    magazineFeedRules = v7->_magazineFeedRules;
    v7->_magazineFeedRules = (FCOfflineFeedRules *)v36;

    v38 = [FCOfflineFeedRules alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("audioFeed"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[FCOfflineFeedRules initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:](v38, "initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:", v39, 0x7FFFFFFFLL, v56, 0x7FFFFFFFLL, 0x7FFFFFFFLL, v56);
    audioFeedRules = v7->_audioFeedRules;
    v7->_audioFeedRules = (FCOfflineFeedRules *)v40;

    v42 = [FCOfflineFeedRules alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("savedFeed"), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[FCOfflineFeedRules initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:](v42, "initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:", v43, 0x7FFFFFFFLL, v14, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0);
    savedFeedRules = v7->_savedFeedRules;
    v7->_savedFeedRules = (FCOfflineFeedRules *)v44;

    v46 = [FCOfflineFeedRules alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("historyFeed"), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[FCOfflineFeedRules initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:](v46, "initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:", v47, 0x7FFFFFFFLL, v14, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0);
    historyFeedRules = v7->_historyFeedRules;
    v7->_historyFeedRules = (FCOfflineFeedRules *)v48;

    v50 = [FCOfflineFeedRules alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("sharedWithYouFeed"), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[FCOfflineFeedRules initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:](v50, "initWithDictionary:defaultMaxGroups:defaultMaxArticleDownloads:defaultMaxIssueDownloads:defaultMaxPuzzleDownloads:defaultMaxAudioDownloads:", v51, 0x7FFFFFFFLL, v10, 0x7FFFFFFFLL, 0x7FFFFFFFLL, 0);
    sharedWithYouFeedRules = v7->_sharedWithYouFeedRules;
    v7->_sharedWithYouFeedRules = (FCOfflineFeedRules *)v52;

  }
  return v7;
}

- (FCOfflineFeedRules)todayFeedRules
{
  return self->_todayFeedRules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedWithYouFeedRules, 0);
  objc_storeStrong((id *)&self->_historyFeedRules, 0);
  objc_storeStrong((id *)&self->_savedFeedRules, 0);
  objc_storeStrong((id *)&self->_audioFeedRules, 0);
  objc_storeStrong((id *)&self->_magazineFeedRules, 0);
  objc_storeStrong((id *)&self->_sportsFeedRules, 0);
  objc_storeStrong((id *)&self->_puzzleTypeFeedRules, 0);
  objc_storeStrong((id *)&self->_puzzleHubFeedRules, 0);
  objc_storeStrong((id *)&self->_todayFeedRules, 0);
}

- (int64_t)minDeviceStorage
{
  return self->_minDeviceStorage;
}

- (int64_t)maxDownloadStorage
{
  return self->_maxDownloadStorage;
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

- (int64_t)maxImagesPerArticle
{
  return self->_maxImagesPerArticle;
}

- (BOOL)useSmallestArticleThumbnails
{
  return self->_useSmallestArticleThumbnails;
}

- (BOOL)useSmallestPuzzleThumbnails
{
  return self->_useSmallestPuzzleThumbnails;
}

- (BOOL)useSmallestArticleImages
{
  return self->_useSmallestArticleImages;
}

- (FCOfflineFeedRules)puzzleHubFeedRules
{
  return self->_puzzleHubFeedRules;
}

- (FCOfflineFeedRules)puzzleTypeFeedRules
{
  return self->_puzzleTypeFeedRules;
}

- (FCOfflineFeedRules)sportsFeedRules
{
  return self->_sportsFeedRules;
}

- (FCOfflineFeedRules)magazineFeedRules
{
  return self->_magazineFeedRules;
}

- (FCOfflineFeedRules)audioFeedRules
{
  return self->_audioFeedRules;
}

- (FCOfflineFeedRules)savedFeedRules
{
  return self->_savedFeedRules;
}

- (FCOfflineFeedRules)historyFeedRules
{
  return self->_historyFeedRules;
}

- (FCOfflineFeedRules)sharedWithYouFeedRules
{
  return self->_sharedWithYouFeedRules;
}

@end
