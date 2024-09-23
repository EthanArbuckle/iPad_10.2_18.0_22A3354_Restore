@implementation MUISearchRecentSuggester

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MUISearchRecentSuggester_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1)
    dispatch_once(&log_onceToken_9, block);
  return (OS_os_log *)(id)log_log_9;
}

void __31__MUISearchRecentSuggester_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;

}

- (MUISearchRecentSuggester)initWithPersistentDirectory:(id)a3
{
  id v4;
  MUISearchRecentSuggester *v5;
  uint64_t v6;
  NSURL *storageURL;
  uint64_t v8;
  EFScheduler *excludeFromBackupScheduler;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *supportedCategories;
  uint64_t v14;
  NSMutableSet *recentSearches;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MUISearchRecentSuggester;
  v5 = -[MUISearchRecentSuggester init](&v30, sel_init);
  if (v5)
  {
    v25 = v4;
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("recentSearches.plist"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    storageURL = v5->_storageURL;
    v5->_storageURL = (NSURL *)v6;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mailui.MUISearchRecentSuggester.excludeFromBackupScheduler"), 17);
    v8 = objc_claimAutoreleasedReturnValue();
    excludeFromBackupScheduler = v5->_excludeFromBackupScheduler;
    v5->_excludeFromBackupScheduler = (EFScheduler *)v8;

    v5->_maxRecentCount = 3;
    +[MUISearchSuggestionCategory genericCategory](MUISearchSuggestionCategory, "genericCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v10;
    +[MUISearchSuggestionCategory recentGenericCategory](MUISearchSuggestionCategory, "recentGenericCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v12 = objc_claimAutoreleasedReturnValue();
    supportedCategories = v5->_supportedCategories;
    v5->_supportedCategories = (NSArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    recentSearches = v5->_recentSearches;
    v5->_recentSearches = (NSMutableSet *)v14;

    -[MUISearchRecentSuggester loadRecentSearches](v5, "loadRecentSearches");
    v5->_needSave = 0;
    v16 = *MEMORY[0x1E0DC4870];
    v32[0] = *MEMORY[0x1E0DC4868];
    v32[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObserver:selector:name:object:", v5, sel_saveRecentSearches, v22, 0);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v19);
    }

    -[MUISearchRecentSuggester _excludeStorageURLFromBackup](v5, "_excludeStorageURLFromBackup");
    v4 = v25;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MUISearchRecentSuggester saveRecentSearches](self, "saveRecentSearches");
  v3.receiver = self;
  v3.super_class = (Class)MUISearchRecentSuggester;
  -[MUISearchRecentSuggester dealloc](&v3, sel_dealloc);
}

+ (id)suggesterWithPersistentDirectory:(id)a3
{
  id v3;
  MUISearchRecentSuggester *v4;

  v3 = a3;
  v4 = -[MUISearchRecentSuggester initWithPersistentDirectory:]([MUISearchRecentSuggester alloc], "initWithPersistentDirectory:", v3);

  return v4;
}

- (BOOL)shouldQueryForAsYouType
{
  return 0;
}

- (NSString)logIdentifier
{
  return (NSString *)CFSTR("Recent");
}

- (NSArray)categories
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[MUISearchSuggestionCategory recentGenericCategory](MUISearchSuggestionCategory, "recentGenericCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_excludeStorageURLFromBackup
{
  NSURL *v3;
  EFScheduler *excludeFromBackupScheduler;
  NSURL *v5;
  _QWORD v6[4];
  NSURL *v7;

  v3 = self->_storageURL;
  excludeFromBackupScheduler = self->_excludeFromBackupScheduler;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__MUISearchRecentSuggester__excludeStorageURLFromBackup__block_invoke;
  v6[3] = &unk_1E99E1258;
  v7 = v3;
  v5 = v3;
  -[EFScheduler performBlock:](excludeFromBackupScheduler, "performBlock:", v6);

}

void __56__MUISearchRecentSuggester__excludeStorageURLFromBackup__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  v2 = (uint64_t *)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0C999D8];
  v7 = 0;
  v4 = objc_msgSend(v1, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v3, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    +[MUISearchRecentSuggester log](MUISearchRecentSuggester, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__MUISearchRecentSuggester__excludeStorageURLFromBackup__block_invoke_cold_1(v2, v6);

  }
}

- (void)deleteSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MUISearchRecentSuggester log](MUISearchRecentSuggester, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "Delete suggestion %{public}@.", (uint8_t *)&v8, 0xCu);

  }
  os_unfair_lock_lock(&self->_lock);
  -[MUISearchRecentSuggester recentSearches](self, "recentSearches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v4);

  self->_needSave = 1;
  os_unfair_lock_unlock(&self->_lock);

}

- (void)addSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSArray *supportedCategories;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MUISearchRecentSuggester log](MUISearchRecentSuggester, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "Add suggestion %{public}@.", (uint8_t *)&v13, 0xCu);

  }
  os_unfair_lock_lock(&self->_lock);
  supportedCategories = self->_supportedCategories;
  objc_msgSend(v4, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(supportedCategories) = -[NSArray containsObject:](supportedCategories, "containsObject:", v8);

  if ((_DWORD)supportedCategories)
  {
    -[MUISearchRecentSuggester recentSearches](self, "recentSearches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "member:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[MUISearchRecentSuggester recentSearches](self, "recentSearches");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v4);

      v10 = v4;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastUsedTime:", v12);

    self->_needSave = 1;
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_removeOldSuggestions
{
  void *v2;
  id v3;

  -[MUISearchRecentSuggester recentSearches](self, "recentSearches");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_29);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterUsingPredicate:", v2);

}

BOOL __49__MUISearchRecentSuggester__removeOldSuggestions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastUsedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6 <= 604800.0;

  return v7;
}

- (void)saveRecentSearches
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ef_publicDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D5522000, v2, v3, "Failed to archive recent searches %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

id __46__MUISearchRecentSuggester_saveRecentSearches__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("s");
  v2 = a2;
  objc_msgSend(v2, "spotlightSuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("l");
  v8[0] = v3;
  objc_msgSend(v2, "lastUsedTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadRecentSearches
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ef_publicDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D5522000, v2, v3, "Failed to read recent searches %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "phraseKind") == 1)
  {
    os_unfair_lock_lock(&self->_lock);
    -[MUISearchRecentSuggester recentSearches](self, "recentSearches");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastUsedTime"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "ef_prefix:", -[MUISearchRecentSuggester maxRecentCount](self, "maxRecentCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[MUISearchRecentSuggester log](MUISearchRecentSuggester, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "ef_mapSelector:", sel_ef_publicDescription);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_1D5522000, v14, OS_LOG_TYPE_DEFAULT, "Found recent suggestions %@", (uint8_t *)&v17, 0xCu);

    }
    v7[2](v7, v13);

  }
  return 0;
}

- (unint64_t)maxRecentCount
{
  return self->_maxRecentCount;
}

- (void)setMaxRecentCount:(unint64_t)a3
{
  self->_maxRecentCount = a3;
}

- (NSMutableSet)recentSearches
{
  return self->_recentSearches;
}

- (void)setRecentSearches:(id)a3
{
  objc_storeStrong((id *)&self->_recentSearches, a3);
}

- (NSArray)supportedCategories
{
  return self->_supportedCategories;
}

- (void)setSupportedCategories:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCategories, a3);
}

- (EFScheduler)excludeFromBackupScheduler
{
  return self->_excludeFromBackupScheduler;
}

- (void)setExcludeFromBackupScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_excludeFromBackupScheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeFromBackupScheduler, 0);
  objc_storeStrong((id *)&self->_supportedCategories, 0);
  objc_storeStrong((id *)&self->_recentSearches, 0);
  objc_storeStrong((id *)&self->_storageURL, 0);
}

void __56__MUISearchRecentSuggester__excludeStorageURLFromBackup__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D5522000, a2, OS_LOG_TYPE_ERROR, "Failed to set NSURLIsExcludedFromBackupKey property on recent search plist at %@", (uint8_t *)&v3, 0xCu);
}

@end
