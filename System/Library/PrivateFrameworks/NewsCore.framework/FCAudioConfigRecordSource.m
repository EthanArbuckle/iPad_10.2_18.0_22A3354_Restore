@implementation FCAudioConfigRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C618;
}

- (id)recordType
{
  return CFSTR("AudioConfig");
}

- (int)pbRecordType
{
  return 13;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F7DC8 != -1)
    dispatch_once(&qword_1ED0F7DC8, &__block_literal_global_3);
  return (id)_MergedGlobals_142;
}

- (unint64_t)storeVersion
{
  return 1;
}

- (id)storeFilename
{
  return CFSTR("audio-config-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

void __47__FCAudioConfigRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("configuration"), CFSTR("curatedArticleIDs"), CFSTR("dailyBriefingArticleID"), CFSTR("featuredAudioArticleListID"), CFSTR("feedConfiguration"), CFSTR("heroArticleIDs"), CFSTR("latestAudioArticleListID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_142;
  _MergedGlobals_142 = v0;

}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
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

  v5 = (objc_class *)MEMORY[0x1E0D62648];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("curatedArticleIDs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCuratedArticleIDs:", v10);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dailyBriefingArticleID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDailyBriefingArticleID:", v11);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("featuredAudioArticleListID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFeaturedAudioArticleListID:", v12);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("feedConfiguration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFeedConfiguration:", v13);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("heroArticleIDs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeroArticleIDs:", v14);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("latestAudioArticleListID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLatestAudioArticleListID:", v15);
  return v8;
}

@end
