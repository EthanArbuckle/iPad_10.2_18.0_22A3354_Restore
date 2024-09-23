@implementation ATXPOICategoryVisitDuetDataProvider

- (ATXPOICategoryVisitDuetDataProvider)init
{
  ATXPOICategoryVisitDuetDataProvider *v2;
  uint64_t v3;
  ATXPOICategoryEventAggregator *streamAggregator;
  uint64_t v5;
  ATXPOICategoryVisitDataProvider *dataProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXPOICategoryVisitDuetDataProvider;
  v2 = -[ATXPOICategoryVisitDuetDataProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    streamAggregator = v2->_streamAggregator;
    v2->_streamAggregator = (ATXPOICategoryEventAggregator *)v3;

    v5 = objc_opt_new();
    dataProvider = v2->_dataProvider;
    v2->_dataProvider = (ATXPOICategoryVisitDataProvider *)v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_13 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_13, &__block_literal_global_92);
  return (id)sharedInstance__pasExprOnceResult_17;
}

void __53__ATXPOICategoryVisitDuetDataProvider_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_17;
  sharedInstance__pasExprOnceResult_17 = v1;

  objc_autoreleasePoolPop(v0);
}

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 13;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  ATXPOICategoryVisitDuetEvent *v27;
  void *v28;
  void *v29;
  void *v30;
  ATXPOICategoryVisitDuetEvent *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v12 = v11;
  v35 = v10;
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v14 = v13;
  BiomeLibrary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "PointOfInterest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "Category");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v9;
  objc_msgSend(v18, "atx_publisherFromStartDate:", v9);
  v19 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v19;
  -[ATXPOICategoryEventAggregator groupVisitsFromPublisher:startTimestamp:endTimestamp:](self->_streamAggregator, "groupVisitsFromPublisher:startTimestamp:endTimestamp:", v19, v12, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v33 = v20;
  objc_msgSend(v20, "events");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v25);
        v27 = [ATXPOICategoryVisitDuetEvent alloc];
        objc_msgSend(v26, "possibleCategoryNames");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "startDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "endDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[ATXPOICategoryVisitDuetEvent initWithPossibleCategoryNames:startDate:endDate:hasExited:](v27, "initWithPossibleCategoryNames:startDate:endDate:hasExited:", v28, v29, v30, objc_msgSend(v26, "hasExited"));

        objc_msgSend(v21, "addObject:", v31);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v23);
  }

  return v21;
}

- (id)getCurrentVisit
{
  void *v2;
  ATXPOICategoryVisitDuetEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXPOICategoryVisitDuetEvent *v7;

  -[ATXPOICategoryVisitDataProvider getCurrentVisit](self->_dataProvider, "getCurrentVisit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [ATXPOICategoryVisitDuetEvent alloc];
  objc_msgSend(v2, "possibleCategoryNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXPOICategoryVisitDuetEvent initWithPossibleCategoryNames:startDate:endDate:](v3, "initWithPossibleCategoryNames:startDate:endDate:", v4, v5, v6);

  return v7;
}

- (void)subscribeToPOIChangesForCategory:(id)a3 observer:(id)a4 enterSelector:(SEL)a5 exitSelector:(SEL)a6
{
  -[ATXPOICategoryVisitDataProvider subscribeToPOIChangesForCategories:observer:enterSelector:exitSelector:sinkCompletion:](self->_dataProvider, "subscribeToPOIChangesForCategories:observer:enterSelector:exitSelector:sinkCompletion:", a3, a4, a5, a6, &__block_literal_global_13_1);
}

void __108__ATXPOICategoryVisitDuetDataProvider_subscribeToPOIChangesForCategory_observer_enterSelector_exitSelector___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_anchor();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __108__ATXPOICategoryVisitDuetDataProvider_subscribeToPOIChangesForCategory_observer_enterSelector_exitSelector___block_invoke_cold_1(v2, v4);

  }
}

- (void)unsubscribeToPOIChanges
{
  -[ATXPOICategoryVisitDataProvider unsubscribeToPOIChanges](self->_dataProvider, "unsubscribeToPOIChanges");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_streamAggregator, 0);
}

void __108__ATXPOICategoryVisitDuetDataProvider_subscribeToPOIChangesForCategory_observer_enterSelector_exitSelector___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXPOICategoryVisitDuetDataProvider: error subscribing to stream: %@", (uint8_t *)&v4, 0xCu);

}

@end
