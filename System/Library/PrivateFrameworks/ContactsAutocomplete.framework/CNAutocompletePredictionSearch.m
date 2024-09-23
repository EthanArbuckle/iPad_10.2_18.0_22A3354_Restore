@implementation CNAutocompletePredictionSearch

- (CNAutocompletePredictionSearch)init
{
  id v3;
  CNAutocompletePredictionSearch *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v4 = -[CNAutocompletePredictionSearch initWithContactStore:](self, "initWithContactStore:", v3);

  return v4;
}

- (CNAutocompletePredictionSearch)initWithContactStore:(id)a3
{
  id v5;
  CNAutocompletePredictionSearch *v6;
  CNAutocompletePredictionSearch *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CNScheduler *scheduler;
  CNAutocompletePredictionSearch *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNAutocompletePredictionSearch;
  v6 = -[CNAutocompletePredictionSearch init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "schedulerProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundSchedulerWithQualityOfService:", 4);
    v10 = objc_claimAutoreleasedReturnValue();
    scheduler = v7->_scheduler;
    v7->_scheduler = (CNScheduler *)v10;

    v12 = v7;
  }

  return v7;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CNALoggingContextDebug();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v6;
    _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Executing request %p against predictions CoreDuet/PeopleSuggester", buf, 0xCu);
  }

  -[CNAutocompletePredictionSearch suggestionsForRequest:](self, "suggestionsForRequest:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke;
  v21[3] = &unk_1E70DF0F8;
  v11 = v7;
  v22 = v11;
  objc_msgSend(v9, "addSuccessBlock:", v21);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke_2;
  v19[3] = &unk_1E70DF120;
  v20 = v11;
  v12 = v11;
  objc_msgSend(v9, "addFailureBlock:", v19);
  v13 = (void *)MEMORY[0x1E0D139B8];
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke_3;
  v17[3] = &unk_1E70DEE90;
  v18 = v9;
  v14 = v9;
  objc_msgSend(v13, "tokenWithCancelationBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (id)suggestionsForRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  CNScheduler *scheduler;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNAutocompletePredictionSearch strategyForRequest:](self, "strategyForRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  CNALoggingContextTriage();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "triageIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptionForLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Predictions: Will search %{public}@", buf, 0x16u);

  }
  scheduler = self->_scheduler;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __56__CNAutocompletePredictionSearch_suggestionsForRequest___block_invoke;
  v22 = &unk_1E70DF148;
  v23 = v6;
  v24 = v4;
  v26 = v9;
  v25 = v5;
  v14 = v5;
  v15 = v4;
  v16 = v6;
  -[CNScheduler performBlock:](scheduler, "performBlock:", &v19);
  objc_msgSend(v14, "future", v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __56__CNAutocompletePredictionSearch_suggestionsForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "searchResultsForFetchRequest:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v5 - *(double *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextTriage();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "triageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v2, "count");
    v10 = objc_msgSend(v2, "count");
    v11 = "results";
    v18 = 138544130;
    v20 = 2048;
    v19 = (uint64_t)v8;
    if (v10 == 1)
      v11 = "result";
    v21 = v9;
    v22 = 2080;
    v23 = v11;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1B9950000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Predictions: Search complete (%lu %s, %{public}@)", (uint8_t *)&v18, 0x2Au);

  }
  CNALoggingContextPerformance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(v2, "count");
    objc_msgSend(*(id *)(a1 + 32), "descriptionForLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218498;
    v19 = v13;
    v20 = 2112;
    v21 = (uint64_t)v14;
    v22 = 2114;
    v23 = (const char *)v6;
    _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_INFO, "Time to fetch %lu predictions results from %@: %{public}@", (uint8_t *)&v18, 0x20u);

  }
  CNALoggingContextDebug();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_cn_take:", 200);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = (uint64_t)v16;
    v20 = 2112;
    v21 = (uint64_t)v17;
    _os_log_impl(&dword_1B9950000, v15, OS_LOG_TYPE_DEFAULT, "Predicted results (first 200 out of %@): %@", (uint8_t *)&v18, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v2);

}

- (id)strategyForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  CNContactStore *contactStore;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "predictionStrategyForRequest:", v4);

  contactStore = self->_contactStore;
  if (v5 == 1)
    +[CNAutocompletePredictionSearchStrategy peopleSuggesterStrategyWithContactStore:](CNAutocompletePredictionSearchStrategy, "peopleSuggesterStrategyWithContactStore:", contactStore);
  else
    +[CNAutocompletePredictionSearchStrategy coreDuetStrategyWithContactStore:](CNAutocompletePredictionSearchStrategy, "coreDuetStrategyWithContactStore:", contactStore);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)predictionStrategyForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userHasOptedInToPreference:", CFSTR("CNAlwaysUsePeopleSuggesterForPredictions"));

  v7 = (v6 & 1) != 0 || objc_msgSend(v3, "searchType") == 2 || objc_msgSend(v3, "searchType") == 1;
  return v7;
}

+ (unint64_t)predictedResultLimit
{
  void *v2;
  unint64_t v3;
  char v5;

  v5 = 0;
  objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:keyExists:", CFSTR("CNAutocompleteDefaultsPredictedResultLimit"), &v5);

  if (v5)
    return v3;
  else
    return 8;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
