@implementation ACHActivitySummaryIterator

- (ACHActivitySummaryIterator)initWithHealthStore:(id)a3 shouldIncludePrivateProperties:(BOOL)a4
{
  id v7;
  ACHActivitySummaryIterator *v8;
  ACHActivitySummaryIterator *v9;
  uint64_t v10;
  NSCalendar *calendar;
  id v12;
  HKHealthStore *healthStore;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ACHActivitySummaryIterator;
  v8 = -[ACHActivitySummaryIterator init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v10 = objc_claimAutoreleasedReturnValue();
    calendar = v9->_calendar;
    v9->_calendar = (NSCalendar *)v10;

    v12 = objc_alloc(MEMORY[0x24BDD4038]);
    healthStore = v9->_healthStore;
    v14 = *MEMORY[0x24BE01238];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", healthStore, v14, v9, v15);
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = (HKTaskServerProxyProvider *)v16;

    v9->_includePrivateProperties = a4;
  }

  return v9;
}

- (void)enumerateActivitySummariesForDateComponentInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5
{
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  id obj;
  void (**v24)(void);
  uint64_t v25;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  _QWORD v32[7];
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v24 = (void (**)(void))a5;
  -[ACHActivitySummaryIterator calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "chunked:calendar:", 100, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v26 = -[ACHActivitySummaryIterator includePrivateProperties](self, "includePrivateProperties");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v12)
  {
    v25 = *(_QWORD *)v47;
    v13 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        v40 = 0;
        v41 = &v40;
        v42 = 0x3032000000;
        v43 = __Block_byref_object_copy__4;
        v44 = __Block_byref_object_dispose__4;
        v45 = 0;
        v34 = 0;
        v35 = &v34;
        v36 = 0x3032000000;
        v37 = __Block_byref_object_copy__4;
        v38 = __Block_byref_object_dispose__4;
        v39 = (id)MEMORY[0x24BDBD1A8];
        v16 = (void *)MEMORY[0x2199C8FE0]();
        -[ACHActivitySummaryIterator proxyProvider](self, "proxyProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v13;
        v32[1] = 3221225472;
        v32[2] = __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke;
        v32[3] = &unk_24D13AE80;
        v33 = v26;
        v32[4] = v15;
        v32[5] = &v34;
        v32[6] = &v40;
        v31[0] = v13;
        v31[1] = 3221225472;
        v31[2] = __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke_3;
        v31[3] = &unk_24D13AEA8;
        v31[4] = &v40;
        objc_msgSend(v17, "getSynchronousProxyWithHandler:errorHandler:", v32, v31);

        objc_autoreleasePoolPop(v16);
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v18 = (id)v35[5];
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v50, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v28 != v20)
                objc_enumerationMutation(v18);
              v8[2](v8, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v50, 16);
          }
          while (v19);
        }

        if (v41[5])
          v24[2]();
        _Block_object_dispose(&v34, 8);

        _Block_object_dispose(&v40, 8);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v12);
  }

}

void __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "startDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke_2;
  v8[3] = &unk_24D13AE58;
  v9 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "remote_activitySummariesForStartDateComponents:endDateComponents:includePrivateProperties:completion:", v5, v6, v7, v8);

}

void __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)enumerateActivitySummariesForDateComponentInterval:(id)a3 includeNilSummaries:(BOOL)a4 handler:(id)a5 errorHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v7 = a4;
  v10 = a5;
  v11 = v10;
  if (v7)
  {
    v12 = a6;
    v13 = a3;
    -[ACHActivitySummaryIterator _enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval:handler:errorHandler:](self, "_enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval:handler:errorHandler:", v13, v11, v12);

  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __122__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_includeNilSummaries_handler_errorHandler___block_invoke;
    v17[3] = &unk_24D13AED0;
    v18 = v10;
    v14 = a6;
    v15 = a3;
    v16 = (void *)MEMORY[0x2199C9184](v17);
    -[ACHActivitySummaryIterator enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:](self, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v15, v16, v14);

    v13 = v18;
  }

}

void __122__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_includeNilSummaries_handler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "_gregorianDateComponents");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);

}

- (void)_enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5
{
  void (**v8)(id, void *, void *);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSCalendar *calendar;
  void *v18;
  void *v19;
  NSCalendar *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id obj;
  void (**v27)(void);
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD v32[8];
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v8 = (void (**)(id, void *, void *))a4;
  v27 = (void (**)(void))a5;
  -[ACHActivitySummaryIterator calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "chunked:calendar:", 100, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v29 = -[ACHActivitySummaryIterator includePrivateProperties](self, "includePrivateProperties");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v11;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v47;
    v12 = *MEMORY[0x24BE012A8];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v47 != v28)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x2199C8FE0]();
        v40 = 0;
        v41 = &v40;
        v42 = 0x3032000000;
        v43 = __Block_byref_object_copy__4;
        v44 = __Block_byref_object_dispose__4;
        v45 = 0;
        v34 = 0;
        v35 = &v34;
        v36 = 0x3032000000;
        v37 = __Block_byref_object_copy__4;
        v38 = __Block_byref_object_dispose__4;
        v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[ACHActivitySummaryIterator proxyProvider](self, "proxyProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke;
        v32[3] = &unk_24D13AF20;
        v33 = v29;
        v32[4] = v14;
        v32[5] = self;
        v32[6] = &v34;
        v32[7] = &v40;
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke_3;
        v31[3] = &unk_24D13AEA8;
        v31[4] = &v40;
        objc_msgSend(v16, "getSynchronousProxyWithHandler:errorHandler:", v32, v31);

        calendar = self->_calendar;
        objc_msgSend(v14, "startDateComponents");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCalendar dateFromComponents:](calendar, "dateFromComponents:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = self->_calendar;
        objc_msgSend(v14, "endDateComponents");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCalendar dateFromComponents:](v20, "dateFromComponents:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        while (1)
        {

          if (!objc_msgSend(v19, "hk_isBeforeOrEqualToDate:", v22))
            break;
          -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", v12, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v35[5], "objectForKeyedSubscript:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v23, v21);
          -[NSCalendar hk_startOfDateByAddingDays:toDate:](self->_calendar, "hk_startOfDateByAddingDays:toDate:", 1, v19);
          v24 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v24;
        }
        if (v41[5])
          v27[2]();

        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v40, 8);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v13 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v30);
  }

}

void __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "startDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 64);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke_2;
  v8[3] = &unk_24D13AEF8;
  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "remote_activitySummariesForStartDateComponents:endDateComponents:includePrivateProperties:completion:", v5, v6, v7, v8);

}

void __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = *MEMORY[0x24BE012A8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = *(void **)(a1[4] + 24);
        objc_msgSend(v12, "_startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "components:fromDate:", v10, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setObject:forKeyedSubscript:", v12, v15);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  v16 = *(_QWORD *)(a1[6] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v6;

}

void __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)newEmptyActivitySummaryFromSummary:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDD38E8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "_setActivitySummaryIndex:", objc_msgSend(v4, "_activitySummaryIndex"));
  objc_msgSend(v5, "setActivityMoveMode:", objc_msgSend(v4, "activityMoveMode"));
  objc_msgSend(v4, "activeEnergyBurnedGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveEnergyBurnedGoal:", v6);

  objc_msgSend(v4, "appleMoveTimeGoal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppleMoveTimeGoal:", v7);

  objc_msgSend(v4, "appleStandHoursGoal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppleStandHoursGoal:", v8);

  objc_msgSend(v4, "appleExerciseTimeGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAppleExerciseTimeGoal:", v9);
  return v5;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D82A38);
}

- (id)remoteInterface
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D77130);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDBCF20]);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_activitySummariesForStartDateComponents_endDateComponents_includePrivateProperties_completion_, 0, 1);

  return v2;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (BOOL)includePrivateProperties
{
  return self->_includePrivateProperties;
}

- (void)setIncludePrivateProperties:(BOOL)a3
{
  self->_includePrivateProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
