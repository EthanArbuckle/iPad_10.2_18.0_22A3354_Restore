@implementation FCTodayPrivateData

- (NSSet)purchasedTagIDs
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayWidgetDropboxDataPurchasedTagIDsDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (FCBundleSubscription)bundleSubscription
{
  void *v2;
  void *v3;
  void *v4;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayPrivateDataBundleSubscriptionDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (FCBundleSubscription *)v4;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (FCTodayPrivateData)initWithDictionary:(id)a3
{
  id v5;
  FCTodayPrivateData *v6;
  FCTodayPrivateData *v7;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dictionary");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCTodayPrivateData initWithDictionary:]";
    v13 = 2080;
    v14 = "FCFileCoordinatedTodayDropbox.m";
    v15 = 1024;
    v16 = 140;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCTodayPrivateData;
  v6 = -[FCTodayPrivateData init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

- (FCTodayPrivateData)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTodayPrivateData init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedTodayDropbox.m";
    v11 = 1024;
    v12 = 135;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTodayPrivateData init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCDerivedPersonalizationData)derivedPersonalizationData
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayWidgetDropboxDataDerivedPersonalizationDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCDerivedPersonalizationData *)v3;
}

- (NSString)localNewsTagID
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayPrivateDataLocalNewsTagIDDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSSet)mutedTagIDs
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayWidgetDropboxDataMutedTagIDsDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSArray)autoFavoriteTagIDs
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayPrivateDataAutoFavoriteTagIDsDataDictionaryKey2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)rankedAllSubscribedTagIDs
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayWidgetDropboxDataRankedSubscribedTagIDsDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)rankedAllSubscriptionDates
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayPrivateDataRankedAllSubscriptionDatesDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)recentlyReadHistoryItems
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayWidgetPrivateDataRecentlyReadHistoryItemsDataDictionaryKey2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSArray)recentlySeenHistoryItems
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayWidgetPrivateDataRecentlySeenHistoryItemsDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSNumber)onboardingVersion
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayPrivateDataOnboardingVersionDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSData)userEmbeddingData
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayPrivateDataUserEmbeddingDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FCTodayPrivateData *v5;
  void *v6;
  void *v7;
  FCTodayPrivateData *v8;

  v5 = +[FCTodayPrivateData allocWithZone:](FCTodayPrivateData, "allocWithZone:");
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[FCTodayPrivateData initWithDictionary:](v5, "initWithDictionary:", v7);

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  FCMutableTodayPrivateData *v5;
  void *v6;
  void *v7;
  FCMutableTodayPrivateData *v8;

  v5 = +[FCMutableTodayPrivateData allocWithZone:](FCMutableTodayPrivateData, "allocWithZone:");
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", a3);
  v8 = -[FCMutableTodayPrivateData initWithDictionary:](v5, "initWithDictionary:", v7);

  return v8;
}

- (NSSet)groupableTagIDs
{
  void *v2;
  void *v3;

  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCTodayPrivateDataGroupableTagIDsDataDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)prepareForUseWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

@end
