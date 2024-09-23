@implementation ATXContextualActionManager

- (ATXContextualActionManager)init
{
  ATXContextualActionManager *v2;
  uint64_t v3;
  ATXContextualActionCountCache *actionCountCache;
  uint64_t v5;
  NSDate *actionCountCacheCreationDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXContextualActionManager;
  v2 = -[ATXContextualActionManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    actionCountCache = v2->actionCountCache;
    v2->actionCountCache = (ATXContextualActionCountCache *)v3;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = objc_claimAutoreleasedReturnValue();
    actionCountCacheCreationDate = v2->actionCountCacheCreationDate;
    v2->actionCountCacheCreationDate = (NSDate *)v5;

  }
  return v2;
}

- (id)getCountsForContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ATXContextualActionManager _updateCacheIfNeeded](self, "_updateCacheIfNeeded");
  -[ATXContextualActionCountCache getCountsForContext:](self->actionCountCache, "getCountsForContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getAllCounts
{
  -[ATXContextualActionManager _updateCacheIfNeeded](self, "_updateCacheIfNeeded");
  return -[ATXContextualActionCountCache getAllCounts](self->actionCountCache, "getAllCounts");
}

- (double)getIntervalSinceOldestEvent
{
  void *v3;
  double v4;
  double v5;

  -[ATXContextualActionManager _updateCacheIfNeeded](self, "_updateCacheIfNeeded");
  -[ATXContextualActionCountCache oldestAction](self->actionCountCache, "oldestAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = -v4;

  return v5;
}

- (void)_updateCacheIfNeeded
{
  void *v3;
  double v4;
  double v5;
  NSObject *p_super;
  _BOOL4 v7;
  NSDate *v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->actionCountCacheCreationDate);
  v5 = v4;
  __atxlog_handle_dailyroutines();
  p_super = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_INFO);
  if (v5 <= 3600.0)
  {
    if (v7)
    {
      v9 = 134217984;
      v10 = v5;
      _os_log_impl(&dword_1C9A3B000, p_super, OS_LOG_TYPE_INFO, "Using cached counts. Cache age: %f", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      v9 = 134217984;
      v10 = v5;
      _os_log_impl(&dword_1C9A3B000, p_super, OS_LOG_TYPE_INFO, "Updating cached counts. Cache age: %f", (uint8_t *)&v9, 0xCu);
    }

    -[ATXContextualActionManager _getActionsFromLastMonth](self, "_getActionsFromLastMonth");
    v8 = v3;
    p_super = &self->actionCountCacheCreationDate->super;
    self->actionCountCacheCreationDate = v8;
  }

}

- (void)_getActionsFromLastMonth
{
  void *v3;
  void *v4;
  ATXContextualActionCountCache *v5;
  ATXContextualActionCountCache *actionCountCache;
  id v7;

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -2419200.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minimalActionParametersforActionsBetweenStartDate:endDate:limit:", v4, v3, 2000);
  v5 = (ATXContextualActionCountCache *)objc_claimAutoreleasedReturnValue();
  actionCountCache = self->actionCountCache;
  self->actionCountCache = v5;

}

- (ATXContextualActionManager)initWithStaticActions:(id)a3
{
  id v4;
  ATXContextualActionManager *v5;
  uint64_t v6;
  ATXContextualActionCountCache *actionCountCache;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSDate *actionCountCacheCreationDate;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ATXContextualActionManager;
  v5 = -[ATXContextualActionManager init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    actionCountCache = v5->actionCountCache;
    v5->actionCountCache = (ATXContextualActionCountCache *)v6;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          -[ATXContextualActionCountCache addMinimalActionParameter:](v5->actionCountCache, "addMinimalActionParameter:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12++), (_QWORD)v16);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v13 = objc_claimAutoreleasedReturnValue();
    actionCountCacheCreationDate = v5->actionCountCacheCreationDate;
    v5->actionCountCacheCreationDate = (NSDate *)v13;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->actionCountCacheCreationDate, 0);
  objc_storeStrong((id *)&self->actionCountCache, 0);
}

@end
