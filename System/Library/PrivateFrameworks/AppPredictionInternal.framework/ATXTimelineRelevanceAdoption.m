@implementation ATXTimelineRelevanceAdoption

- (ATXTimelineRelevanceAdoption)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXTimelineRelevanceAdoption *v6;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryFromLazyPlistForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = -[ATXTimelineRelevanceAdoption initWithGlobalAdoptionPlist:informationStore:abuseControlConfig:](self, "initWithGlobalAdoptionPlist:informationStore:abuseControlConfig:", v3, v4, v5);

  return v6;
}

- (ATXTimelineRelevanceAdoption)initWithGlobalAdoptionPlist:(id)a3 informationStore:(id)a4 abuseControlConfig:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXTimelineRelevanceAdoption *v12;
  ATXTimelineRelevanceAdoption *v13;
  ATXAdoptionTypeToBudgetMapper *v14;
  ATXAdoptionTypeToBudgetMapper *budgetMapper;
  uint64_t v16;
  NSDictionary *distinctScoreCounts;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXTimelineRelevanceAdoption;
  v12 = -[ATXTimelineRelevanceAdoption init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_globalAdoptionPlist, a3);
    if (v11)
    {
      objc_storeStrong((id *)&v13->_abuseControlConfig, a5);
      v14 = -[ATXAdoptionTypeToBudgetMapper initWithAbuseControlConfig:]([ATXAdoptionTypeToBudgetMapper alloc], "initWithAbuseControlConfig:", v11);
      budgetMapper = v13->_budgetMapper;
      v13->_budgetMapper = v14;

    }
    objc_storeStrong((id *)&v13->_informationStore, a4);
    -[ATXInformationStore fetchDistinctScoreCountForWidgets](v13->_informationStore, "fetchDistinctScoreCountForWidgets");
    v16 = objc_claimAutoreleasedReturnValue();
    distinctScoreCounts = v13->_distinctScoreCounts;
    v13->_distinctScoreCounts = (NSDictionary *)v16;

  }
  return v13;
}

- (unint64_t)adoptionTypeForWidgetBundleId:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  unint64_t v14;

  v6 = a4;
  v7 = a3;
  v8 = -[ATXTimelineRelevanceAdoption _hasDiverseSchemaGlobally:kind:](self, "_hasDiverseSchemaGlobally:kind:", v7, v6);
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_distinctScoreCounts, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "integerValue"))
  {
    v12 = objc_msgSend(v11, "integerValue");
    v13 = v12 > 1 || v8;
    if (v12 <= 1)
      v14 = 2;
    else
      v14 = 3;
    if ((v13 & 1) == 0)
      v14 = objc_msgSend(v11, "integerValue") == 1;
  }
  else if (v8)
  {
    v14 = 2;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_hasDiverseSchemaGlobally:(id)a3 kind:(id)a4
{
  void *v4;
  BOOL v5;

  -[ATXTimelineRelevanceAdoption globalDiverseSchemaRawNumber:kind:](self, "globalDiverseSchemaRawNumber:kind:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue") == 1;

  return v5;
}

- (id)globalDiverseSchemaRawNumber:(id)a3 kind:(id)a4
{
  void *v4;
  NSDictionary *globalAdoptionPlist;
  id v7;
  void *v8;
  void *v9;

  v4 = 0;
  if (a3 && a4)
  {
    globalAdoptionPlist = self->_globalAdoptionPlist;
    v7 = a4;
    -[NSDictionary objectForKeyedSubscript:](globalAdoptionPlist, "objectForKeyedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("diverseScores"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)_updateQuotasForWidgetBundleId:(id)a3 widgetKind:(id)a4 quotasDictionary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  int64_t v12;
  int64_t v13;
  double v14;
  double v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  -[ATXTimelineAbuseControlConfig widgetsExcludedFromPersonalizedQuotaUpdate](self->_abuseControlConfig, "widgetsExcludedFromPersonalizedQuotaUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v22);

  if ((v11 & 1) == 0)
  {
    v12 = -[ATXTimelineAbuseControlConfig softRotationQuotaForWidgetWithIdentifier:kind:](self->_abuseControlConfig, "softRotationQuotaForWidgetWithIdentifier:kind:", v22, v8);
    v13 = -[ATXTimelineAbuseControlConfig hardRotationQuotaForWidgetWithIdentifier:kind:](self->_abuseControlConfig, "hardRotationQuotaForWidgetWithIdentifier:kind:", v22, v8);
    -[ATXTimelineAbuseControlConfig durationLimitForWidgetWithIdentifier:kind:](self->_abuseControlConfig, "durationLimitForWidgetWithIdentifier:kind:", v22, v8);
    v15 = v14;
    v16 = -[ATXTimelineRelevanceAdoption adoptionTypeForWidgetBundleId:kind:](self, "adoptionTypeForWidgetBundleId:kind:", v22, v8);
    v17 = -[ATXAdoptionTypeToBudgetMapper softQuotaForAdoptionType:](self->_budgetMapper, "softQuotaForAdoptionType:", v16);
    v18 = -[ATXAdoptionTypeToBudgetMapper hardQuotaForAdoptionType:](self->_budgetMapper, "hardQuotaForAdoptionType:", v16);
    v19 = -[ATXAdoptionTypeToBudgetMapper durationLimitForAdoptionType:](self->_budgetMapper, "durationLimitForAdoptionType:", v16);
    if (v12 != -1 && v12 < v17)
      -[ATXTimelineRelevanceAdoption _updateQuotasDictionary:forWidgetBundleId:widgetKind:parameterName:withValue:](self, "_updateQuotasDictionary:forWidgetBundleId:widgetKind:parameterName:withValue:", v9, v22, v8, CFSTR("SoftRotationQuota"), v17);
    v20 = (uint64_t)v15;
    if (v13 != -1 && v13 < v18)
      -[ATXTimelineRelevanceAdoption _updateQuotasDictionary:forWidgetBundleId:widgetKind:parameterName:withValue:](self, "_updateQuotasDictionary:forWidgetBundleId:widgetKind:parameterName:withValue:", v9, v22, v8, CFSTR("HardRotationQuota"), v18);
    if (v20 != -1 && v19 > v20)
      -[ATXTimelineRelevanceAdoption _updateQuotasDictionary:forWidgetBundleId:widgetKind:parameterName:withValue:](self, "_updateQuotasDictionary:forWidgetBundleId:widgetKind:parameterName:withValue:", v9, v22, v8, CFSTR("Duration"), v19);
  }

}

- (void)_updateQuotasDictionary:(id)a3 forWidgetBundleId:(id)a4 widgetKind:(id)a5 parameterName:(id)a6 withValue:(int64_t)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v11 && v12)
  {
    v14 = a6;
    objc_msgSend(v24, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v16, v11);

    }
    objc_msgSend(v24, "objectForKeyedSubscript:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend(v24, "objectForKeyedSubscript:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v13);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, v14);

  }
}

- (void)persistQuotasWithActivity:(id)a3
{
  id v5;
  NSObject *v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  _QWORD block[4];
  id v27;
  NSObject *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_distinctScoreCounts)
  {
    v6 = objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = self->_distinctScoreCounts;
    v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v12, "first");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "second");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXTimelineRelevanceAdoption _updateQuotasForWidgetBundleId:widgetKind:quotasDictionary:](self, "_updateQuotasForWidgetBundleId:widgetKind:quotasDictionary:", v13, v14, v6);

        }
        v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v5, "didDefer"))
    {
      __atxlog_handle_timeline();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevanceAdoption: Deferring persisting personalized quotas", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXTimelineRelevancePersonalizedConfig"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_timeline();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v16;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceAdoption: persisting updated quotas at path: %{public}@", buf, 0xCu);
      }

      v18 = (void *)MEMORY[0x1CAA48B6C]();
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v29;
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXTimelineRelevanceAdoption.m"), 163, CFSTR("Archiver error while attempting to persist updated quotas at path %@: %@"), v16, v20);

      }
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_BACKGROUND, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = dispatch_queue_create("timeline-relevance-budget-update", v22);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__ATXTimelineRelevanceAdoption_persistQuotasWithActivity___block_invoke;
      block[3] = &unk_1E82DACB0;
      v27 = v19;
      v15 = v16;
      v28 = v15;
      v24 = v19;
      dispatch_async(v23, block);

      objc_autoreleasePoolPop(v18);
    }

  }
  else
  {
    __atxlog_handle_timeline();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXTimelineRelevanceAdoption persistQuotasWithActivity:].cold.1(v6);
  }

}

void __58__ATXTimelineRelevanceAdoption_persistQuotasWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v8 = 0;
  v4 = objc_msgSend(v3, "writeToFile:options:error:", v1, 1073741825, &v8);
  v5 = v8;
  if ((v4 & 1) != 0)
  {
    __atxlog_handle_timeline();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *v2;
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Successfully updated budgets at path %{public}@", buf, 0xCu);
    }
  }
  else
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__ATXTimelineRelevanceAdoption_persistQuotasWithActivity___block_invoke_cold_1(v2, (uint64_t)v5, v6);
  }

}

- (void)trainWidgetPredictionModelWithActivity:(id)a3
{
  id v4;
  ATXWidgetPredictionTrainer *v5;

  v4 = a3;
  v5 = -[ATXWidgetPredictionTrainer initWithInformationStore:distinctScoreCounts:]([ATXWidgetPredictionTrainer alloc], "initWithInformationStore:distinctScoreCounts:", self->_informationStore, self->_distinctScoreCounts);
  -[ATXWidgetPredictionTrainer trainWidgetPredictionModelWithActivity:](v5, "trainWidgetPredictionModelWithActivity:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetMapper, 0);
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_distinctScoreCounts, 0);
  objc_storeStrong((id *)&self->_informationStore, 0);
  objc_storeStrong((id *)&self->_globalAdoptionPlist, 0);
}

- (void)persistQuotasWithActivity:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXTimelineRelevanceAdoption: Unable to calculate updated quotas since there was a problem fetching distinct count of timeline relevance scores", v1, 2u);
}

void __58__ATXTimelineRelevanceAdoption_persistQuotasWithActivity___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Could not write updated budgets to path: %{public}@. Error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
