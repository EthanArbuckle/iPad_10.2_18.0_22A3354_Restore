@implementation HKSleepDaySummaryQuery

- (HKSleepDaySummaryQuery)initWithMorningIndexRange:(id)a3 ascending:(BOOL)a4 limit:(int64_t)a5 options:(unint64_t)a6 resultsHandler:(id)a7
{
  int64_t var1;
  int64_t var0;
  id v13;
  HKSleepDaySummaryQuery *v14;
  HKSleepDaySummaryQuery *v15;
  void *v16;
  uint64_t v17;
  id resultsHandler;
  HKSleepDaySummaryCacheSettings *cacheSettings;
  NSCalendar *calendarOverrides;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;
  uint64_t v35;

  var1 = a3.var1;
  var0 = a3.var0;
  v35 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKSleepDaySummaryQuery;
  v14 = -[HKQuery _initWithObjectType:predicate:](&v26, sel__initWithObjectType_predicate_, 0, 0);
  v15 = v14;
  if (v14)
  {
    v14->_morningIndexRange.start = var0;
    v14->_morningIndexRange.duration = var1;
    if (var0 >= 1 && var1 <= 0)
    {
      _HKInitializeLogging();
      v16 = (void *)HKLogSleep;
      if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_FAULT))
      {
        v22 = v16;
        v23 = (void *)objc_opt_class();
        v25 = v23;
        -[HKQuery debugIdentifier](v15, "debugIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v28 = v23;
        v29 = 2114;
        v30 = v24;
        v31 = 2048;
        v32 = var0;
        v33 = 2048;
        v34 = var1;
        _os_log_fault_impl(&dword_19A0E6000, v22, OS_LOG_TYPE_FAULT, "[%{public}@:%{public}@] Morning index range (start %ld duration %ld) has an incorrect duration", buf, 0x2Au);

      }
    }
    v15->_ascending = a4;
    v15->_limit = a5;
    v15->_options = a6;
    v17 = objc_msgSend(v13, "copy");
    resultsHandler = v15->_resultsHandler;
    v15->_resultsHandler = (id)v17;

    cacheSettings = v15->_cacheSettings;
    v15->_cacheSettings = 0;

    calendarOverrides = v15->_calendarOverrides;
    v15->_calendarOverrides = 0;

  }
  return v15;
}

- (BOOL)skipDaysWithoutSleepAnalysis
{
  return self->_options & 1;
}

- (BOOL)onlySleepAnalysis
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)surfaceSleepStages
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (void)setCacheSettings:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HKSleepDaySummaryQuery_setCacheSettings___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __43__HKSleepDaySummaryQuery_setCacheSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 192);
  *(_QWORD *)(v3 + 192) = v2;

}

- (void)setCalendarOverrides:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HKSleepDaySummaryQuery_setCalendarOverrides___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __47__HKSleepDaySummaryQuery_setCalendarOverrides___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;

}

- (void)client_deliverDaySummaries:(id)a3 clearPending:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[HKQuery queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke;
  v15[3] = &unk_1E37EA5D0;
  v15[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

void __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  _HKInitializeLogging();
  v2 = (void *)HKLogSleep;
  if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEBUG))
    __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_cold_1(a1, v2);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  if (v3 && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = v4;

  }
  if (*(_BYTE *)(a1 + 57))
  {
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 160);
    *(_QWORD *)(v8 + 160) = 0;

    v10 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 48);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_17;
      v15[3] = &unk_1E37E67E8;
      v13 = v7;
      v14 = *(_QWORD *)(a1 + 32);
      v16 = v13;
      v17 = v14;
      v18 = v10;
      objc_msgSend(v11, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v12, 1, v15);

    }
  }
}

void __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_17(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "hk_addDayIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "morningIndex"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v5);
  }

  _HKInitializeLogging();
  v8 = (void *)HKLogSleep;
  if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_opt_class();
    v11 = *(void **)(a1 + 40);
    v12 = v10;
    objc_msgSend(v11, "debugIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v10;
    v36 = 2114;
    v37 = v13;
    v38 = 2114;
    v39 = v2;
    _os_log_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Delivering summaries for: %{public}@", buf, 0x20u);

  }
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "showSensitiveLogItems");

  if (v15 && os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEBUG))
  {
    _HKInitializeLogging();
    v16 = (void *)HKLogSleep;
    if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEBUG))
      __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_17_cold_1(a1, v16);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = a1;
    v17 = *(id *)(a1 + 32);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v21);
          _HKInitializeLogging();
          v23 = HKLogSleep;
          if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v22;
            _os_log_debug_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

    a1 = v24;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSleepDaySummaryQuery;
  -[HKQuery queue_populateConfiguration:](&v10, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setMorningIndexRange:", self->_morningIndexRange.start, self->_morningIndexRange.duration);
  objc_msgSend(v4, "setAscending:", self->_ascending);
  objc_msgSend(v4, "setLimit:", self->_limit);
  objc_msgSend(v4, "setOptions:", self->_options);
  objc_msgSend(v4, "setCacheSettings:", self->_cacheSettings);
  objc_msgSend(v4, "setCalendarOverrides:", self->_calendarOverrides);
  _HKInitializeLogging();
  v5 = (void *)HKLogSleep;
  if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[HKQuery debugIdentifier](self, "debugIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Configuration populated: %{public}@", buf, 0x20u);

  }
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3B8700;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKSleepDaySummaryQuery;
  v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0, v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID_, 0, 0);

}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = _Block_copy(self->_resultsHandler);
  -[HKQuery clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HKSleepDaySummaryQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E37E6710;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __45__HKSleepDaySummaryQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (void *)objc_opt_class();
  v5 = v4;
  objc_msgSend(a2, "debugIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "cacheSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v4;
  v11 = 2114;
  v12 = v6;
  v13 = 2112;
  v14 = v8;
  _os_log_fault_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_FAULT, "[%{public}@:%{public}@] Not using cached results for query with caching identifier %@ due to unbounded morning index range", (uint8_t *)&v9, 0x20u);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSleepDaySummaryQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  $BB81632A5F90EABF970498852D8C14B8 *p_morningIndexRange;
  int64_t start;
  int64_t duration;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_morningIndexRange = &self->_morningIndexRange;
  start = self->_morningIndexRange.start;
  duration = p_morningIndexRange->duration;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (int64_t)limit
{
  return self->_limit;
}

- (unint64_t)options
{
  return self->_options;
}

- (HKSleepDaySummaryCacheSettings)cacheSettings
{
  return self->_cacheSettings;
}

- (NSCalendar)calendarOverrides
{
  return self->_calendarOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarOverrides, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_summariesPendingDelivery, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

void __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *log;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  log = a2;
  v3 = (void *)objc_opt_class();
  v4 = *(void **)(a1 + 32);
  v16 = v3;
  objc_msgSend(v4, "debugIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "morningIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "morningIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138544898;
  v18 = v3;
  v19 = 2114;
  v20 = v5;
  v21 = 2112;
  v22 = v6;
  v23 = 2112;
  v24 = v9;
  v25 = 2112;
  v26 = v12;
  v27 = 2112;
  v28 = v13;
  v29 = 2112;
  v30 = v14;
  _os_log_debug_impl(&dword_19A0E6000, log, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Received batch of %@ summaries (%@ - %@), clear pending: %@, is final: %@", buf, 0x48u);

}

void __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_17_cold_1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(void **)(a1 + 40);
  v6 = v4;
  objc_msgSend(v5, "debugIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v4;
  v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Summaries:", (uint8_t *)&v8, 0x16u);

}

@end
