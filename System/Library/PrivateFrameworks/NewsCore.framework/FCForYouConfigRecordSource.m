@implementation FCForYouConfigRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C768;
}

- (id)recordType
{
  return CFSTR("ForYouConfig");
}

- (int)pbRecordType
{
  return 7;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F85B8 != -1)
    dispatch_once(&qword_1ED0F85B8, &__block_literal_global_3_5);
  return (id)_MergedGlobals_191;
}

- (unint64_t)storeVersion
{
  return 5;
}

- (id)storeFilename
{
  return CFSTR("for-you-config-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

void __48__FCForYouConfigRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("configuration"), CFSTR("todayFeedConfiguration"), CFSTR("editorialArticleListIDs"), CFSTR("todayFeedTopStoriesArticleIDs"), CFSTR("trendingArticleListID"), CFSTR("editorialSectionTagIDs"), CFSTR("spotlightArticleID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_191;
  _MergedGlobals_191 = v0;

}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (objc_class *)MEMORY[0x1E0D626D8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("todayFeedConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTodayFeedConfiguration:", v10);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("todayFeedTopStoriesArticleIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTodayFeedTopStoriesArticleIDs:", v11);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trendingArticleListID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTrendingArticleListID:", v12);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("editorialArticleListIDs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEditorialArticleListIDs:", v13);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("editorialSectionTagIDs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEditorialSectionTagIDs:", v14);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("spotlightArticleID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSpotlightArticleID:", v15);
  return v8;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

@end
