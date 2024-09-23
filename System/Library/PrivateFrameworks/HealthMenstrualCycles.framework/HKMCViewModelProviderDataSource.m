@implementation HKMCViewModelProviderDataSource

- (HKMCViewModelProviderDataSource)initWithHealthStore:(id)a3 calendarCache:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKMCViewModelProviderDataSource *v12;
  HKMCViewModelProviderDataSource *v13;
  uint64_t v14;
  NSMutableSet *summaryQueries;
  uint64_t v16;
  NSMutableIndexSet *canceledDayIndexes;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  HKMCViewModelProviderDataSource *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HKMCViewModelProviderDataSource;
  v12 = -[HKMCViewModelProviderDataSource init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    summaryQueries = v13->_summaryQueries;
    v13->_summaryQueries = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v16 = objc_claimAutoreleasedReturnValue();
    canceledDayIndexes = v13->_canceledDayIndexes;
    v13->_canceledDayIndexes = (NSMutableIndexSet *)v16;

    objc_storeStrong((id *)&v13->_calendarCache, a4);
    -[HKMCViewModelProviderDataSource _startObservingDaySummaryUpdates](v13, "_startObservingDaySummaryUpdates");
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    v20 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v25 = v20;
    v26 = 2048;
    v27 = v13;
    v21 = v20;
    _os_log_impl(&dword_218A9C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Initializing", buf, 0x16u);

  }
  return v13;
}

- (void)fetchDaySummariesInDayIndexRange:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  HKMCDaySummaryQuery *v11;
  HKMCDaySummaryQuery *v12;
  void *v13;
  NSMutableIndexSet *canceledDayIndexes;
  void *v15;
  void *v16;
  _QWORD v17[7];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  HKMCViewModelProviderDataSource *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  var1 = a3.var1;
  var0 = a3.var0;
  v24 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    NSStringFromHKDayIndexRange();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v8;
    v20 = 2048;
    v21 = self;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_218A9C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Fetching summaries in range %{public}@", buf, 0x20u);

  }
  v11 = [HKMCDaySummaryQuery alloc];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke;
  v17[3] = &unk_24D99D9B0;
  v17[4] = self;
  v17[5] = var0;
  v17[6] = var1;
  v12 = -[HKMCDaySummaryQuery initWithDayIndexRange:ascending:limit:resultsHandler:](v11, "initWithDayIndexRange:ascending:limit:resultsHandler:", var0, var1, 1, 0, v17);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuery setDebugIdentifier:](v12, "setDebugIdentifier:", v13);

  canceledDayIndexes = self->_canceledDayIndexes;
  if (var0 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("HKDayIndexRange.h"), 46, CFSTR("Cannot convert day index ranges less than 0 to NSRange"));

  }
  -[NSMutableIndexSet removeIndexesInRange:](canceledDayIndexes, "removeIndexesInRange:", var0, var1);
  -[NSMutableSet addObject:](self->_summaryQueries, "addObject:", v12);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);

}

void __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(NSObject **)(v13 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke_2;
  block[3] = &unk_24D99D988;
  v20 = v10;
  v21 = v13;
  v25 = *(_OWORD *)(a1 + 40);
  v22 = v11;
  v23 = v12;
  v24 = v9;
  v15 = v9;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  void *v3;

  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 16));
    objc_msgSend(WeakRetained, "viewModelProviderDataSource:didFetchDaySummaries:forDayIndexRange:daySummaryAnchor:", a1[5], a1[4], a1[9], a1[10], a1[6]);

  }
  else
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke_2_cold_1((uint64_t)a1, v3);
  }
  return objc_msgSend(*(id *)(a1[5] + 32), "removeObject:", a1[8]);
}

- (void)cancelFetchForDaySummariesInDayIndexRange:(id)a3
{
  int64_t var1;
  int64_t var0;
  void **v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableIndexSet *canceledDayIndexes;
  NSMutableSet *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSMutableSet *v29;
  void **v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  HKMCViewModelProviderDataSource *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  var1 = a3.var1;
  var0 = a3.var0;
  v54 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void **)MEMORY[0x24BDD3030];
  v7 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    v10 = v9;
    NSStringFromHKDayIndexRange();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v9;
    v50 = 2048;
    v51 = self;
    v52 = 2114;
    v53 = v11;
    _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Cancelling fetch for summaries in range %{public}@", buf, 0x20u);

  }
  canceledDayIndexes = self->_canceledDayIndexes;
  if (var0 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("HKDayIndexRange.h"), 46, CFSTR("Cannot convert day index ranges less than 0 to NSRange"));

  }
  -[NSMutableIndexSet addIndexesInRange:](canceledDayIndexes, "addIndexesInRange:", var0, var1);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = self->_summaryQueries;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v14)
  {
    v15 = 0;
    v16 = *(_QWORD *)v44;
    v17 = v14;
    do
    {
      v18 = 0;
      v40 = v17;
      do
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v18);
        v20 = objc_msgSend(v19, "dayIndexRange");
        v22 = v21;
        if (v20 < 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("HKDayIndexRange.h"), 46, CFSTR("Cannot convert day index ranges less than 0 to NSRange"));

        }
        v23 = -[NSMutableIndexSet containsIndexesInRange:](self->_canceledDayIndexes, "containsIndexesInRange:", v20, v22);
        _HKInitializeLogging();
        v24 = *v6;
        v25 = *v6;
        if (v23)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = v24;
            v27 = (void *)objc_opt_class();
            v41 = v15;
            v28 = v16;
            v29 = v13;
            v30 = v6;
            v31 = v27;
            objc_msgSend(v19, "dayIndexRange");
            NSStringFromHKDayIndexRange();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v49 = v27;
            v50 = 2048;
            v51 = self;
            v52 = 2114;
            v53 = v32;
            _os_log_impl(&dword_218A9C000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Cancelling query for summaries in range %{public}@", buf, 0x20u);

            v17 = v40;
            v6 = v30;
            v13 = v29;
            v16 = v28;
            v15 = v41;

          }
          -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", v19);
          if (!v15)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "addObject:", v19);
        }
        else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v33 = v24;
          v34 = (void *)objc_opt_class();
          v35 = v34;
          objc_msgSend(v19, "dayIndexRange");
          NSStringFromHKDayIndexRange();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v49 = v34;
          v50 = 2048;
          v51 = self;
          v52 = 2114;
          v53 = v36;
          _os_log_debug_impl(&dword_218A9C000, v33, OS_LOG_TYPE_DEBUG, "[%{public}@:%p] Not cancelling query for summaries in range %{public}@", buf, 0x20u);

          v17 = v40;
        }
        ++v18;
      }
      while (v17 != v18);
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v17);
  }
  else
  {
    v15 = 0;
  }

  -[NSMutableSet minusSet:](self->_summaryQueries, "minusSet:", v15);
}

- (void)_startObservingDaySummaryUpdates
{
  HKMCDaySummaryObserverQuery *v3;
  HKMCDaySummaryObserverQuery *v4;
  HKMCDaySummaryObserverQuery *summaryObserverQuery;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = [HKMCDaySummaryObserverQuery alloc];
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __67__HKMCViewModelProviderDataSource__startObservingDaySummaryUpdates__block_invoke;
  v10 = &unk_24D99D9D8;
  objc_copyWeak(&v11, &location);
  v4 = -[HKMCDaySummaryObserverQuery initWithUpdateHandler:](v3, "initWithUpdateHandler:", &v7);
  summaryObserverQuery = self->_summaryObserverQuery;
  self->_summaryObserverQuery = v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self, v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuery setDebugIdentifier:](self->_summaryObserverQuery, "setDebugIdentifier:", v6);

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_summaryObserverQuery);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __67__HKMCViewModelProviderDataSource__startObservingDaySummaryUpdates__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleDaySummaryObserverUpdateWithError:", v4);

}

- (void)_handleDaySummaryObserverUpdateWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HKMCViewModelProviderDataSource _handleDaySummaryObserverUpdateWithError:].cold.1(v5, (uint64_t)self, (uint64_t)v4);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__HKMCViewModelProviderDataSource__handleDaySummaryObserverUpdateWithError___block_invoke;
    block[3] = &unk_24D99DA00;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

void __76__HKMCViewModelProviderDataSource__handleDaySummaryObserverUpdateWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModelProviderDataSourceDidUpdateDaySummaries:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  id v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  HKMCViewModelProviderDataSource *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543618;
    v18 = (id)objc_opt_class();
    v19 = 2048;
    v20 = self;
    v5 = v18;
    _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Dealloc", buf, 0x16u);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_summaryQueries;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_summaryObserverQuery);
  v11.receiver = self;
  v11.super_class = (Class)HKMCViewModelProviderDataSource;
  -[HKMCViewModelProviderDataSource dealloc](&v11, sel_dealloc);
}

- (HKMCViewModelProviderDataSourceDelegate)delegate
{
  return (HKMCViewModelProviderDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_canceledDayIndexes, 0);
  objc_storeStrong((id *)&self->_summaryObserverQuery, 0);
  objc_storeStrong((id *)&self->_summaryQueries, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __68__HKMCViewModelProviderDataSource_fetchDaySummariesInDayIndexRange___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = v4;
  NSStringFromHKDayIndexRange();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  v8 = 138543874;
  v9 = v4;
  v10 = 2114;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_218A9C000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Error querying for summaries in range %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);

}

- (void)_handleDaySummaryObserverUpdateWithError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_218A9C000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error in day summary observer query: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
