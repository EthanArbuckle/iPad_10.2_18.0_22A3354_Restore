@implementation IQFMapsPersonalizationRanker

- (IQFMapsPersonalizationRanker)init
{
  IQFMapsPersonalizationRanker *v3;

  v3 = -[IQFMapsPersonalizationRanker initWithVisitCountThreshold:lastVisitDaysThreshold:visitCountGivenLocationThreshold:entityRelevanceThreshold:enableEntityRelevance:]([IQFMapsPersonalizationRanker alloc], "initWithVisitCountThreshold:lastVisitDaysThreshold:visitCountGivenLocationThreshold:entityRelevanceThreshold:enableEntityRelevance:", 1, 3.0, 60.0, 0.0, 0.0);

  return v3;
}

- (IQFMapsPersonalizationRanker)initWithVisitCountThreshold:(double)a3 lastVisitDaysThreshold:(double)a4 visitCountGivenLocationThreshold:(double)a5 entityRelevanceThreshold:(double)a6
{
  IQFMapsPersonalizationRanker *v7;

  v7 = -[IQFMapsPersonalizationRanker initWithVisitCountThreshold:lastVisitDaysThreshold:visitCountGivenLocationThreshold:entityRelevanceThreshold:enableEntityRelevance:]([IQFMapsPersonalizationRanker alloc], "initWithVisitCountThreshold:lastVisitDaysThreshold:visitCountGivenLocationThreshold:entityRelevanceThreshold:enableEntityRelevance:", 1, a3, a4, a5, a6);

  return v7;
}

- (IQFMapsPersonalizationRanker)initWithVisitCountThreshold:(double)a3 lastVisitDaysThreshold:(double)a4 visitCountGivenLocationThreshold:(double)a5 entityRelevanceThreshold:(double)a6 enableEntityRelevance:(BOOL)a7
{
  IQFMapsPersonalizationRanker *v12;
  uint64_t v13;
  NSSet *cachedMUIDs;
  uint64_t v15;
  NSArray *cachedRankedResults;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *caLoggingQueue;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)IQFMapsPersonalizationRanker;
  v12 = -[IQFMapsPersonalizationRanker init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_opt_new();
    cachedMUIDs = v12->_cachedMUIDs;
    v12->_cachedMUIDs = (NSSet *)v13;

    v15 = objc_opt_new();
    cachedRankedResults = v12->_cachedRankedResults;
    v12->_cachedRankedResults = (NSArray *)v15;

    v12->_visitCountThreshold = a3;
    v12->_lastVisitDaysThreshold = a4;
    v12->_visitCountGivenLocationThreshold = a5;
    v12->_entityRelevanceThreshold = a6;
    v12->_enableEntityRelevance = a7;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.infoQueryPersonalizationFeatures.geo", v17);
    caLoggingQueue = v12->_caLoggingQueue;
    v12->_caLoggingQueue = (OS_dispatch_queue *)v18;

  }
  return v12;
}

- (id)rankedEventsForLocations:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = (id)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__IQFMapsPersonalizationRanker_rankedEventsForLocations___block_invoke;
  v9[3] = &unk_250F8D400;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:](self, "rankedEventsForLocations:completionHandler:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__IQFMapsPersonalizationRanker_rankedEventsForLocations___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)rankedEventsForLocations:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, NSArray *, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSArray *v23;
  NSObject *v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  id v28;
  void (**v29)(id, NSArray *, _QWORD);
  id v30[2];
  id buf[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, NSArray *, _QWORD))a4;
  v8 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "muid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v10);
  }

  v14 = -[NSSet isEqualToSet:](self->_cachedMUIDs, "isEqualToSet:", v8);
  IQFLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    if (v16)
      -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:].cold.1();

    v7[2](v7, self->_cachedRankedResults, 0);
  }
  else
  {
    if (v16)
      -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:].cold.4();

    IQFLogCategoryDefault();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (char *)os_signpost_id_generate(v17);
    v19 = v17;
    v20 = v19;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_23F081000, v20, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "rankedEventsForLocations", " enableTelemetry=YES ", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    +[IQFMapsPersonalizationLookup sharedMapsPersonalizationLookup](IQFMapsPersonalizationLookup, "sharedMapsPersonalizationLookup");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      IQFLogCategoryDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:].cold.3();

      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke;
      v25[3] = &unk_250F8D4C8;
      v26 = v20;
      v30[1] = v18;
      objc_copyWeak(v30, buf);
      v29 = v7;
      v27 = v8;
      v28 = v9;
      objc_msgSend(v21, "eventsAtLocations:completionHandler:", v28, v25);

      objc_destroyWeak(v30);
      v23 = (NSArray *)v26;
    }
    else
    {
      IQFLogCategoryDefault();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:].cold.2();

      v23 = (NSArray *)objc_opt_new();
      v7[2](v7, v23, 0);
    }

    objc_destroyWeak(buf);
  }

}

void __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  _QWORD *WeakRetained;
  _QWORD *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 72);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23F081000, v8, OS_SIGNPOST_INTERVAL_END, v9, "rankedEventsForLocations", (const char *)&unk_23F089626, buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_sortedResults:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_updateCachedMUIDs:rankedResults:", *(_QWORD *)(a1 + 40), v12);
    IQFLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke_cold_1(v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v14 = v11[8];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke_23;
    v17[3] = &unk_250F8D4A0;
    v18 = v12;
    v19 = *(id *)(a1 + 48);
    v15 = v12;
    dispatch_async(v14, v17);

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 56);
    v15 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v15, v6);
  }

}

id __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke_23(uint64_t a1)
{
  return +[IQFMapsCoreAnalyticsLogger logCoreAnalyticsEventsWithResults:locations:](IQFMapsCoreAnalyticsLogger, "logCoreAnalyticsEventsWithResults:locations:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)_sortedResults:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__IQFMapsPersonalizationRanker__sortedResults___block_invoke;
  v4[3] = &unk_250F8D4F0;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayWithOptions:usingComparator:", 16, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __47__IQFMapsPersonalizationRanker__sortedResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compareResult:toOtherResult:", a2, a3);
}

- (void)_updateCachedMUIDs:(id)a3 rankedResults:(id)a4
{
  NSSet *v6;
  NSArray *v7;
  NSSet *cachedMUIDs;
  NSArray *cachedRankedResults;
  NSSet *v10;

  v6 = (NSSet *)a3;
  v7 = (NSArray *)a4;
  cachedMUIDs = self->_cachedMUIDs;
  self->_cachedMUIDs = v6;
  v10 = v6;

  cachedRankedResults = self->_cachedRankedResults;
  self->_cachedRankedResults = v7;

}

- (BOOL)isResultCandidateForPromotion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  double v13;
  double v14;
  double v15;
  double v17;
  void *v18;
  double v19;

  v4 = a3;
  objc_msgSend(v4, "_isCandidateForPromotion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "_isCandidateForPromotion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    switch(objc_msgSend(v4, "resultType"))
    {
      case 0:
        IQFLogCategoryDefault();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[IQFMapsPersonalizationRanker isResultCandidateForPromotion:].cold.3(v4);
        goto LABEL_24;
      case 1:
        if (self->_enableEntityRelevance)
        {
          IQFLogCategoryDefault();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            -[IQFMapsPersonalizationRanker isResultCandidateForPromotion:].cold.1();
          goto LABEL_24;
        }
        objc_msgSend(v4, "numberOfVisits");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        if (v15 < self->_visitCountThreshold)
          goto LABEL_20;
        objc_msgSend(v4, "dateOfLastVisit");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        v7 = v17 >= self->_lastVisitDaysThreshold * -86400.0;
        goto LABEL_9;
      case 2:
      case 3:
      case 5:
        objc_msgSend(v4, "startEventDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isDateInTodayOrFuture"))
          goto LABEL_20;
        objc_msgSend(v4, "startEventDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        v11 = 2592000.0;
        goto LABEL_8;
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
        objc_msgSend(v4, "startEventDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isDateInTodayOrFuture"))
          goto LABEL_20;
        objc_msgSend(v4, "startEventDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        v11 = 604800.0;
LABEL_8:
        v7 = v10 < v11;
        goto LABEL_9;
      case 10:
        if (self->_enableEntityRelevance)
        {
          objc_msgSend(v4, "entityRelevanceScore");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "doubleValue");
          if (v13 < self->_entityRelevanceThreshold)
          {
LABEL_20:
            v7 = 0;
          }
          else
          {
            objc_msgSend(v4, "numberOfVisits");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "doubleValue");
            if (v14 >= self->_visitCountThreshold)
            {
              objc_msgSend(v4, "dateOfLastVisit");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "timeIntervalSinceNow");
              v7 = v19 >= self->_lastVisitDaysThreshold * -86400.0;

            }
            else
            {
              v7 = 0;
            }
LABEL_9:

          }
        }
        else
        {
          IQFLogCategoryDefault();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            -[IQFMapsPersonalizationRanker isResultCandidateForPromotion:].cold.2();
LABEL_24:

LABEL_25:
          v7 = 0;
        }
        objc_msgSend(v4, "setIsCandidateForPromotion:", v7);
        break;
      default:
        goto LABEL_25;
    }
  }

  return v7;
}

- (double)_scoreForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "_score");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v9 = objc_msgSend(v4, "resultType");
    if ((unint64_t)(v9 - 2) >= 8)
    {
      if (v9 == 1)
      {
        -[IQFMapsPersonalizationRanker _routineFrecencyScoreForLifeEvent:](self, "_routineFrecencyScoreForLifeEvent:", v4);
      }
      else
      {
        v8 = 0.0;
        if (v9 != 10)
          goto LABEL_6;
        -[IQFMapsPersonalizationRanker _routineFrecencyScoreForEntityRelevanceResult:](self, "_routineFrecencyScoreForEntityRelevanceResult:", v4);
      }
    }
    else
    {
      -[IQFMapsPersonalizationRanker _calendarEventScoreForResult:](self, "_calendarEventScoreForResult:", v4);
    }
    v8 = v10;
LABEL_6:
    objc_msgSend(v4, "setScore:", v8);
    goto LABEL_7;
  }
  objc_msgSend(v5, "doubleValue");
  v8 = v7;
LABEL_7:

  return v8;
}

- (double)_routineFrecencyScoreForLifeEvent:(id)a3
{
  double v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = 0.0;
  if (!self->_enableEntityRelevance)
  {
    v4 = a3;
    objc_msgSend(v4, "dateOfLastVisit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;

    objc_msgSend(v4, "numberOfVisits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "doubleValue");
    v3 = exp2(v7 / 2592000.0) * v9;

  }
  return v3;
}

- (double)_routineFrecencyScoreForEntityRelevanceResult:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;

  v4 = a3;
  v5 = v4;
  if (self->_enableEntityRelevance)
  {
    if (self->_entityRelevanceThreshold <= 0.0)
      objc_msgSend(v4, "numberOfVisits");
    else
      objc_msgSend(v4, "entityRelevanceScore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v6 = v8;

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)_calendarEventScoreForResult:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  double v10;

  v3 = a3;
  objc_msgSend(v3, "startEventDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  if (v6 >= 0.0)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startEventDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isDateInToday:", v8);

  v10 = 0.0;
  if (v9)
LABEL_3:
    v10 = exp2(fabs(v6) / -2592000.0);

  return v10;
}

- (int64_t)_compareResult:(id)a3 toOtherResult:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  v8 = -[IQFMapsPersonalizationRanker isResultCandidateForPromotion:](self, "isResultCandidateForPromotion:", v6);
  if (v8 == -[IQFMapsPersonalizationRanker isResultCandidateForPromotion:](self, "isResultCandidateForPromotion:", v7))
  {
    if (isCalendarBasedPersonalizationResultType(objc_msgSend(v6, "resultType"))
      || !isCalendarBasedPersonalizationResultType(objc_msgSend(v7, "resultType")))
    {
      if (isCalendarBasedPersonalizationResultType(objc_msgSend(v6, "resultType"))
        && !isCalendarBasedPersonalizationResultType(objc_msgSend(v7, "resultType")))
      {
        v9 = -1;
      }
      else
      {
        -[IQFMapsPersonalizationRanker _scoreForResult:](self, "_scoreForResult:", v6);
        v11 = v10;
        -[IQFMapsPersonalizationRanker _scoreForResult:](self, "_scoreForResult:", v7);
        v13 = -1;
        if (v11 <= v12)
          v13 = 1;
        if (v11 == v12)
          v9 = 0;
        else
          v9 = v13;
      }
    }
    else
    {
      v9 = 1;
    }
  }
  else if (-[IQFMapsPersonalizationRanker isResultCandidateForPromotion:](self, "isResultCandidateForPromotion:", v6))
  {
    v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caLoggingQueue, 0);
  objc_storeStrong((id *)&self->_cachedRankedResults, 0);
  objc_storeStrong((id *)&self->_cachedMUIDs, 0);
}

- (void)rankedEventsForLocations:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_23F081000, v0, v1, "IQFMapsParsecRanker: using cached ranked events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)rankedEventsForLocations:completionHandler:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_23F081000, v0, OS_LOG_TYPE_ERROR, "IQFMapsParsecRanker: not attempting lookup because IQFMapsPersonalizationLookup is nil", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)rankedEventsForLocations:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_23F081000, v0, v1, "IQFMapsParsecRanker: looking up events at location", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)rankedEventsForLocations:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_23F081000, v0, v1, "IQFMapsParsecRanker: no cached result for these muids", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3_0(&dword_23F081000, v1, v2, "IQFMapsParsecRanker: fetched %ld new ranked events & updated cache", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)isResultCandidateForPromotion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_23F081000, v0, v1, "IQFMapsPersonalizationRanker: Life event is not eligible as candidate for promotion because _enableEntityRelevance = YES", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)isResultCandidateForPromotion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_23F081000, v0, v1, "IQFMapsPersonalizationRanker: Entity relevance event is not eligible as candidate for promotion because _enableEntityRelevance = NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)isResultCandidateForPromotion:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "resultType");
  OUTLINED_FUNCTION_3_0(&dword_23F081000, v1, v2, "IQFMapsPersonalizationRanker received unknown result type: %lu", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_4_0();
}

@end
