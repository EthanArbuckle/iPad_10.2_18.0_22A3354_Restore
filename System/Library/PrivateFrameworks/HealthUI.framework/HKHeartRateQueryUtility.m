@implementation HKHeartRateQueryUtility

- (HKHeartRateQueryUtility)initWithQueryHandler:(id)a3 dateInterval:(id)a4 timeScope:(int64_t)a5 resultsHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKHeartRateQueryUtility *v13;
  HKHeartRateQueryUtility *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HKHeartRateQueryUtility;
  v13 = -[HKHeartRateQueryUtility init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    -[HKHeartRateQueryUtility setQueryHandler:](v13, "setQueryHandler:", v10);
    -[HKHeartRateQueryUtility setDateInterval:](v14, "setDateInterval:", v11);
    -[HKHeartRateQueryUtility setTimeScope:](v14, "setTimeScope:", a5);
    -[HKHeartRateQueryUtility setResultsHandler:](v14, "setResultsHandler:", v12);
    HKCreateSerialDispatchQueue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHeartRateQueryUtility setClientQueue:](v14, "setClientQueue:", v15);

    HKCreateSerialDispatchQueue();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHeartRateQueryUtility setResourceQueue:](v14, "setResourceQueue:", v16);

    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[HKHeartRateQueryUtility setSampleResults:](v14, "setSampleResults:", v17);

    -[HKHeartRateQueryUtility setupQueries](v14, "setupQueries");
  }

  return v14;
}

- (void)setupQueries
{
  dispatch_group_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *clientQueue;
  _QWORD block[6];
  _QWORD v8[4];
  NSObject *v9;
  HKHeartRateQueryUtility *v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id location;

  v3 = dispatch_group_create();
  objc_initWeak(&location, self);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  v14 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__HKHeartRateQueryUtility_setupQueries__block_invoke;
  v8[3] = &unk_1E9C3F148;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_copyWeak(&v12, &location);
  v11 = v13;
  +[HKHeartRateQueryUtility enumerateDisplayTypeContextsWithBlock:](HKHeartRateQueryUtility, "enumerateDisplayTypeContextsWithBlock:", v8);
  clientQueue = self->_clientQueue;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __39__HKHeartRateQueryUtility_setupQueries__block_invoke_4;
  block[3] = &unk_1E9C3F170;
  block[4] = self;
  block[5] = v13;
  dispatch_group_notify(v5, clientQueue, block);
  objc_destroyWeak(&v12);

  _Block_object_dispose(v13, 8);
  objc_destroyWeak(&location);

}

void __39__HKHeartRateQueryUtility_setupQueries__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12[2];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "queryHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 40), "timeScope");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__HKHeartRateQueryUtility_setupQueries__block_invoke_2;
  v9[3] = &unk_1E9C3F120;
  objc_copyWeak(v12, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v11 = v8;
  v12[1] = a2;
  objc_msgSend(v4, "dataForHeartRateContext:dateInterval:timeScope:resultsHandler:", a2, v5, v6, v9);

  objc_destroyWeak(v12);
}

void __39__HKHeartRateQueryUtility_setupQueries__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "resourceQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__HKHeartRateQueryUtility_setupQueries__block_invoke_3;
    v13[3] = &unk_1E9C3F0F8;
    v18 = *(_QWORD *)(a1 + 40);
    v14 = v7;
    v15 = v9;
    v11 = v6;
    v12 = *(_QWORD *)(a1 + 56);
    v16 = v11;
    v19 = v12;
    v17 = *(id *)(a1 + 32);
    dispatch_async(v10, v13);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __39__HKHeartRateQueryUtility_setupQueries__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HKHeartRateDisplayTypeContextResult *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (!v2)
    v2 = *(void **)(v3 + 40);
  objc_storeStrong((id *)(v3 + 40), v2);
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_minMaxStatisticsFromChartPoints:dateInterval:", v5, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[HKHeartRateDisplayTypeContextResult initWithContext:statistics:]([HKHeartRateDisplayTypeContextResult alloc], "initWithContext:statistics:", *(_QWORD *)(a1 + 72), v10);
  objc_msgSend(*(id *)(a1 + 40), "sampleResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __39__HKHeartRateQueryUtility_setupQueries__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "resultsHandler");
  v6 = (void (**)(id, uint64_t, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "sampleResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_orderedDisplayTypeContextResults:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v2, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

+ (void)enumerateDisplayTypeContextsWithBlock:(id)a3
{
  uint64_t i;

  for (i = 0; i != 7; ++i)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, i);
}

+ (id)_minMaxStatisticsFromChartPoints:(id)a3 dateInterval:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v33 = v6;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (!v8)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_20;
    }
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v35;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (!v11
          || (objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "minYValue"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "compare:", v11),
              v15,
              v16 == -1))
        {
          objc_msgSend(v14, "minYValue");
          v17 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v17;
          if (v10)
          {
LABEL_13:
            objc_msgSend(v14, "maxYValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "compare:", v10);

            if (v19 != 1)
              continue;
          }
        }
        else if (v10)
        {
          goto LABEL_13;
        }
        objc_msgSend(v14, "maxYValue");
        v20 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v20;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v9)
      {
LABEL_20:

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_alloc(MEMORY[0x1E0CB6C68]);
        v6 = v33;
        objc_msgSend(v33, "startDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v23, "initWithDataType:startDate:endDate:", v22, v24, v25);

        v26 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(v26, "quantityWithUnit:doubleValue:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setMinimumQuantity:", v28);

        v29 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(v29, "quantityWithUnit:doubleValue:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setMaximumQuantity:", v31);

        goto LABEL_21;
      }
    }
  }
  v21 = 0;
LABEL_21:

  return v21;
}

+ (id)_orderedDisplayTypeContextResults:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HKHeartRateQueryUtility__orderedDisplayTypeContextResults___block_invoke;
  v10[3] = &unk_1E9C3F198;
  v11 = v3;
  v5 = v4;
  v12 = v5;
  v6 = v3;
  +[HKHeartRateQueryUtility enumerateDisplayTypeContextsWithBlock:](HKHeartRateQueryUtility, "enumerateDisplayTypeContextsWithBlock:", v10);
  v7 = v12;
  v8 = v5;

  return v8;
}

void __61__HKHeartRateQueryUtility__orderedDisplayTypeContextResults___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    v5 = v6;
  }

}

- (HKHeartRateQueryHandler)queryHandler
{
  return (HKHeartRateQueryHandler *)objc_loadWeakRetained((id *)&self->_queryHandler);
}

- (void)setQueryHandler:(id)a3
{
  objc_storeWeak((id *)&self->_queryHandler, a3);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)setResourceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resourceQueue, a3);
}

- (NSMutableDictionary)sampleResults
{
  return self->_sampleResults;
}

- (void)setSampleResults:(id)a3
{
  objc_storeStrong((id *)&self->_sampleResults, a3);
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_sampleResults, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_destroyWeak((id *)&self->_queryHandler);
}

@end
