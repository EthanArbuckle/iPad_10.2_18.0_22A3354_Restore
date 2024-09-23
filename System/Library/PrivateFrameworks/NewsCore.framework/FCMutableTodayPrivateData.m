@implementation FCMutableTodayPrivateData

- (void)_deleteObjectsForOldKeys
{
  void *v2;
  void *v3;
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = CFSTR("FCTodayWidgetDropboxDataRecentlyReadArticlesDataDictionaryKey");
  v4[1] = CFSTR("FCTodayWidgetPrivateDataRecentlySeenArticlesDataDictionaryKey2");
  v4[2] = CFSTR("FCTodayWidgetPrivateDataRecentlyReadHistoryItemsDataDictionaryKey");
  v4[3] = CFSTR("FCTodayWidgetDropboxDataFeldsparIDDictionaryKey");
  v4[4] = CFSTR("FCTodayPrivateDataBundleSubscriptionStateDictionaryKey");
  v4[5] = CFSTR("FCTodayPrivateDataBundleIAPDictionaryKey");
  v4[6] = CFSTR("FCTodayPrivateDataAutoFavoriteTagIDsDataDictionaryKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsForKeys:", v3);

}

- (FCMutableTodayPrivateData)initWithDictionary:(id)a3
{
  id v4;
  FCMutableTodayPrivateData *v5;
  FCMutableTodayPrivateData *v6;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dictionary");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCMutableTodayPrivateData initWithDictionary:]";
    v12 = 2080;
    v13 = "FCFileCoordinatedTodayDropbox.m";
    v14 = 1024;
    v15 = 246;
    v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v9.receiver = self;
  v9.super_class = (Class)FCMutableTodayPrivateData;
  v5 = -[FCTodayPrivateData initWithDictionary:](&v9, sel_initWithDictionary_, v4);
  v6 = v5;
  if (v5)
    -[FCMutableTodayPrivateData _deleteObjectsForOldKeys](v5, "_deleteObjectsForOldKeys");

  return v6;
}

- (FCMutableTodayPrivateData)init
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
    v8 = "-[FCMutableTodayPrivateData init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedTodayDropbox.m";
    v11 = 1024;
    v12 = 241;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCMutableTodayPrivateData init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)setDerivedPersonalizationData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayWidgetDropboxDataDerivedPersonalizationDataDictionaryKey"));
}

- (void)setLocalNewsTagID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("FCTodayPrivateDataLocalNewsTagIDDataDictionaryKey"));

}

- (void)setMutedTagIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayWidgetDropboxDataMutedTagIDsDataDictionaryKey"));
}

- (void)setAutoFavoriteTagIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayPrivateDataAutoFavoriteTagIDsDataDictionaryKey2"));
}

- (void)setGroupableTagIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayPrivateDataGroupableTagIDsDataDictionaryKey"));
}

- (void)setPurchasedTagIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayWidgetDropboxDataPurchasedTagIDsDataDictionaryKey"));
}

- (void)setRankedAllSubscribedTagIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayWidgetDropboxDataRankedSubscribedTagIDsDataDictionaryKey"));
}

- (void)setRankedAllSubscriptionDates:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayPrivateDataRankedAllSubscriptionDatesDataDictionaryKey"));
}

- (void)setRecentlyReadHistoryItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayWidgetPrivateDataRecentlyReadHistoryItemsDataDictionaryKey2"));
}

- (void)setRecentlySeenHistoryItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayWidgetPrivateDataRecentlySeenHistoryItemsDataDictionaryKey"));
}

- (void)setBundleSubscription:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("FCTodayPrivateDataBundleSubscriptionDataDictionaryKey"));
}

- (void)setUserEmbeddingData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayPrivateData dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCTodayPrivateDataUserEmbeddingDataDictionaryKey"));
}

@end
