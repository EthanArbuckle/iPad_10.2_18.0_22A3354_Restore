@implementation FCFeedItemScoreCache

- (FCFeedItemScoreCache)initWithFeedPersonalizer:(id)a3
{
  id v5;
  FCFeedItemScoreCache *v6;
  FCFeedItemScoreCache *v7;
  uint64_t v8;
  FCThreadSafeMutableDictionary *scoreProfilesByConfigurationSet;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCFeedItemScoreCache;
  v6 = -[FCFeedItemScoreCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedPersonalizer, a3);
    v8 = objc_opt_new();
    scoreProfilesByConfigurationSet = v7->_scoreProfilesByConfigurationSet;
    v7->_scoreProfilesByConfigurationSet = (FCThreadSafeMutableDictionary *)v8;

  }
  return v7;
}

- (id)scoreProfilesForFeedItems:(id)a3 configurationSet:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  FCFeedItemScoreCache *v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__88;
  v19 = __Block_byref_object_dispose__88;
  v20 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__FCFeedItemScoreCache_scoreProfilesForFeedItems_configurationSet___block_invoke;
  v10[3] = &unk_1E464B200;
  v7 = v6;
  v11 = v7;
  v12 = self;
  v13 = &v15;
  v14 = a4;
  -[FCFeedItemScoreCache _accessScoreCacheForForConfigurationSet:withBlock:](self, "_accessScoreCacheForForConfigurationSet:withBlock:", a4, v10);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __67__FCFeedItemScoreCache_scoreProfilesForFeedItems_configurationSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __67__FCFeedItemScoreCache_scoreProfilesForFeedItems_configurationSet___block_invoke_2;
  v32[3] = &unk_1E4645E30;
  v5 = v3;
  v33 = v5;
  objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)FCOperationLog;
  v9 = os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = v8;
      v11 = objc_msgSend(v6, "count");
      v12 = objc_msgSend(*(id *)(a1 + 32), "count");
      FCStringFromFeedPersonalizationConfigurationSet(*(_QWORD *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v35 = v11;
      v36 = 2048;
      v37 = v12;
      v38 = 2114;
      v39 = v13;
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "score cache is missing %lu of %lu requested feed item scores, context=%{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "feedPersonalizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sortItems:options:configurationSet:", v6, 1, *(_QWORD *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)MEMORY[0x1E0C99D68];
      v19 = v17;
      objc_msgSend(v18, "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v14);
      v22 = (unint64_t)(fmax(v21, 0.0) * 1000.0);
      v23 = objc_msgSend(v6, "count");
      FCStringFromFeedPersonalizationConfigurationSet(*(_QWORD *)(a1 + 56));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v35 = v22;
      v36 = 2048;
      v37 = v23;
      v38 = 2114;
      v39 = v24;
      _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "score cache took %llums to score %lu feed items, context=%{public}@", buf, 0x20u);

    }
    objc_msgSend(v16, "scoreProfiles");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromMapTable:", v25);

    goto LABEL_9;
  }
  if (v9)
  {
    v26 = *(void **)(a1 + 32);
    v14 = v8;
    v27 = objc_msgSend(v26, "count");
    FCStringFromFeedPersonalizationConfigurationSet(*(_QWORD *)(a1 + 56));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v35 = v27;
    v36 = 2114;
    v37 = (uint64_t)v28;
    _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "score cache has all %lu requested feed item scores, context=%{public}@", buf, 0x16u);

LABEL_9:
  }
  v29 = objc_msgSend(v5, "copy");
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v29;

}

BOOL __67__FCFeedItemScoreCache_scoreProfilesForFeedItems_configurationSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)addScoreProfiles:(id)a3 configurationSet:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__FCFeedItemScoreCache_addScoreProfiles_configurationSet___block_invoke;
  v8[3] = &unk_1E464B228;
  v9 = v6;
  v7 = v6;
  -[FCFeedItemScoreCache _accessScoreCacheForForConfigurationSet:withBlock:](self, "_accessScoreCacheForForConfigurationSet:withBlock:", a4, v8);

}

uint64_t __58__FCFeedItemScoreCache_addScoreProfiles_configurationSet___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObjectsFromMapTable:", *(_QWORD *)(a1 + 32));
}

- (void)_accessScoreCacheForForConfigurationSet:(int64_t)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a4;
  -[FCFeedItemScoreCache scoreProfilesByConfigurationSet](self, "scoreProfilesByConfigurationSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__FCFeedItemScoreCache__accessScoreCacheForForConfigurationSet_withBlock___block_invoke;
  v9[3] = &unk_1E464B250;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "readWriteWithAccessor:", v9);

}

void __74__FCFeedItemScoreCache__accessScoreCacheForForConfigurationSet_withBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[FCMapTable mapTableWithKeyOptions:valueOptions:](FCMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v4, v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (FCThreadSafeMutableDictionary)scoreProfilesByConfigurationSet
{
  return self->_scoreProfilesByConfigurationSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreProfilesByConfigurationSet, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end
