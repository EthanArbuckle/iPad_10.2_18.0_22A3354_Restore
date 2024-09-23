@implementation CNAutocompleteObservableBuilder

+ (id)builderWithSearchType:(unint64_t)a3 scheduler:(id)a4 probeProvider:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  +[CNAutocompleteObservableBuilderBatchingHelperFactory batchingHelperForSearchType:](CNAutocompleteObservableBuilderBatchingHelperFactory, "batchingHelperForSearchType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBatchingHelper:probeProvider:scheduler:", v10, v8, v9);

  objc_msgSend(v11, "setSupplementalResultsUseNetwork:", objc_msgSend(a1, "supplementalResultsUseNetwork:", a3));
  return v11;
}

+ (BOOL)supplementalResultsUseNetwork:(unint64_t)a3
{
  return 0;
}

- (CNAutocompleteObservableBuilder)initWithBatchingHelper:(id)a3 probeProvider:(id)a4 scheduler:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNAutocompleteObservableBuilder *v12;
  CNAutocompleteObservableBuilder *v13;
  CNAutocompleteObservableBuilder *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNAutocompleteObservableBuilder;
  v12 = -[CNAutocompleteObservableBuilder init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_batchingHelper, a3);
    objc_storeStrong((id *)&v13->_probeProvider, a4);
    objc_storeStrong((id *)&v13->_scheduler, a5);
    v14 = v13;
  }

  return v13;
}

- (id)probeObservable:(id)a3 forPerformanceWithBlock:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13AE8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke;
  v9[3] = &unk_1E70DF768;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];

  v3 = a2;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13AF0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_2;
  v18[3] = &unk_1E70DF740;
  v20 = v21;
  v19 = v3;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_3;
  v16[3] = &unk_1E70DEE90;
  v17 = v19;
  v11 = v5;
  v12 = 3221225472;
  v13 = __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_4;
  v14 = &unk_1E70DF320;
  v7 = v17;
  v15 = v7;
  objc_msgSend(v6, "observerWithResultBlock:completionBlock:failureBlock:", v18, v16, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v21, 8);
  return v9;
}

void __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count");
  objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v3);

}

uint64_t __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

- (void)addContactsObservable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNAutocompleteObservableBuilder probeObservable:forPerformanceWithBlock:](self, "probeObservable:forPerformanceWithBlock:", a3, &__block_literal_global_18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localObservableWithScheduler:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addContactsObservable:", v7);

}

uint64_t __57__CNAutocompleteObservableBuilder_addContactsObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfContactResults:inTimeInterval:");
}

- (void)addCoreRecentsObservable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNAutocompleteObservableBuilder probeObservable:forPerformanceWithBlock:](self, "probeObservable:forPerformanceWithBlock:", a3, &__block_literal_global_7_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localObservableWithScheduler:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addCoreRecentsObservable:", v7);

}

uint64_t __60__CNAutocompleteObservableBuilder_addCoreRecentsObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfRecentResults:inTimeInterval:");
}

- (void)addStewieObservable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNAutocompleteObservableBuilder probeObservable:forPerformanceWithBlock:](self, "probeObservable:forPerformanceWithBlock:", a3, &__block_literal_global_8_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localObservableWithScheduler:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addStewieObservable:", v7);

}

uint64_t __55__CNAutocompleteObservableBuilder_addStewieObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfStewieResults:inTimeInterval:");
}

- (void)addSuggestionsObservable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNAutocompleteObservableBuilder probeObservable:forPerformanceWithBlock:](self, "probeObservable:forPerformanceWithBlock:", a3, &__block_literal_global_9_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localObservableWithScheduler:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSuggestionsObservable:", v7);

}

uint64_t __60__CNAutocompleteObservableBuilder_addSuggestionsObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfSuggestionResults:inTimeInterval:");
}

- (void)addLocalExtensionObservable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localObservableWithScheduler:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addLocalExtensionObservable:", v7);

}

- (void)addPredictionObservable:(id)a3 doOnTimeout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[CNAutocompleteObservableBuilder probeObservable:forPerformanceWithBlock:](self, "probeObservable:forPerformanceWithBlock:", a3, &__block_literal_global_10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localObservableWithScheduler:doOnTimeout:", v8, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addPredictionObservable:", v10);

}

uint64_t __71__CNAutocompleteObservableBuilder_addPredictionObservable_doOnTimeout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfPredictionResults:inTimeInterval:");
}

- (void)addSupplementalObservable:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  -[CNAutocompleteObservableBuilder probeObservable:forPerformanceWithBlock:](self, "probeObservable:forPerformanceWithBlock:", a3, &__block_literal_global_11_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNAutocompleteObservableBuilder supplementalResultsUseNetwork](self, "supplementalResultsUseNetwork"))
  {
    -[CNAutocompleteObservableBuilder networkActivityDidStartHandler](self, "networkActivityDidStartHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteObservableBuilder networkActivityDidStopHandler](self, "networkActivityDidStopHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteObservableBuilder networkActivityStartDelay](self, "networkActivityStartDelay");
    v8 = v7;
    -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkObservableWithActivityDidStartHandler:activityDidStopHandler:timeoutDelay:subscriptionDelay:scheduler:", v5, v6, v9, 30.0, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  else
  {
    -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localObservableWithScheduler:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSupplementalObservable:", v11);

}

uint64_t __61__CNAutocompleteObservableBuilder_addSupplementalObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfSupplementalResults:inTimeInterval:");
}

- (void)addCachedDirectoryServerObservable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCachedDirectoryServerObservable:", v4);

}

- (void)addDirectoryServerObservable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  -[CNAutocompleteObservableBuilder probeObservable:forPerformanceWithBlock:](self, "probeObservable:forPerformanceWithBlock:", a3, &__block_literal_global_12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder networkActivityDidStartHandler](self, "networkActivityDidStartHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder networkActivityDidStopHandler](self, "networkActivityDidStopHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder networkActivityStartDelay](self, "networkActivityStartDelay");
  v8 = v7;
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkObservableWithActivityDidStartHandler:activityDidStopHandler:timeoutDelay:subscriptionDelay:scheduler:", v5, v6, v9, 30.0, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDirectoryServerObservable:", v11);

}

uint64_t __64__CNAutocompleteObservableBuilder_addDirectoryServerObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfDirectoryServerResults:inTimeInterval:");
}

- (void)addCachedCalendarServerObservable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CNAutocompleteObservableBuilder networkActivityDidStartHandler](self, "networkActivityDidStartHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder networkActivityDidStopHandler](self, "networkActivityDidStopHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder networkActivityStartDelay](self, "networkActivityStartDelay");
  v8 = v7;
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkObservableWithActivityDidStartHandler:activityDidStopHandler:timeoutDelay:subscriptionDelay:scheduler:", v5, v6, v9, 2.0, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addCachedCalendarServerObservable:", v11);

}

- (void)addCalendarServerObservable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  -[CNAutocompleteObservableBuilder probeObservable:forPerformanceWithBlock:](self, "probeObservable:forPerformanceWithBlock:", a3, &__block_literal_global_13_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder networkActivityDidStartHandler](self, "networkActivityDidStartHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder networkActivityDidStopHandler](self, "networkActivityDidStopHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteObservableBuilder networkActivityStartDelay](self, "networkActivityStartDelay");
  v8 = v7;
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkObservableWithActivityDidStartHandler:activityDidStopHandler:timeoutDelay:subscriptionDelay:scheduler:", v5, v6, v9, 30.0, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addCalendarServerObservable:", v11);

}

uint64_t __63__CNAutocompleteObservableBuilder_addCalendarServerObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfCalendarServerResults:inTimeInterval:");
}

- (id)combineObservablesInBatch:(id)a3 scheduler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "forkJoin:scheduler:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "map:", &__block_literal_global_15_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)makeObservable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[CNAutocompleteObservableBuilder batchingHelper](self, "batchingHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "batchedObservables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__CNAutocompleteObservableBuilder_makeObservable__block_invoke;
  v10[3] = &unk_1E70DF810;
  v10[4] = self;
  objc_msgSend(v4, "_cn_map:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D13AE8];
  -[CNAutocompleteObservableBuilder scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "progressiveForkJoin:scheduler:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __49__CNAutocompleteObservableBuilder_makeObservable__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "combineObservablesInBatch:scheduler:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNAutocompleteObservableBuilderBatchingHelper)batchingHelper
{
  return self->_batchingHelper;
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (double)networkActivityStartDelay
{
  return self->_networkActivityStartDelay;
}

- (void)setNetworkActivityStartDelay:(double)a3
{
  self->_networkActivityStartDelay = a3;
}

- (BOOL)supplementalResultsUseNetwork
{
  return self->_supplementalResultsUseNetwork;
}

- (void)setSupplementalResultsUseNetwork:(BOOL)a3
{
  self->_supplementalResultsUseNetwork = a3;
}

- (id)networkActivityDidStartHandler
{
  return self->_networkActivityDidStartHandler;
}

- (void)setNetworkActivityDidStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)networkActivityDidStopHandler
{
  return self->_networkActivityDidStopHandler;
}

- (void)setNetworkActivityDidStopHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_networkActivityDidStopHandler, 0);
  objc_storeStrong(&self->_networkActivityDidStartHandler, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
  objc_storeStrong((id *)&self->_batchingHelper, 0);
}

@end
