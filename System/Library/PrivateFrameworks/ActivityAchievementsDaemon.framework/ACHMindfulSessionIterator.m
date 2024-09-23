@implementation ACHMindfulSessionIterator

- (ACHMindfulSessionIterator)initWithHealthStore:(id)a3
{
  id v5;
  ACHMindfulSessionIterator *v6;
  ACHMindfulSessionIterator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACHMindfulSessionIterator;
  v6 = -[ACHMindfulSessionIterator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v7->_batchSize = 128;
  }

  return v7;
}

- (ACHMindfulSessionIterator)initWithHealthStore:(id)a3 batchSize:(unint64_t)a4
{
  id v7;
  ACHMindfulSessionIterator *v8;
  ACHMindfulSessionIterator *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHMindfulSessionIterator;
  v8 = -[ACHMindfulSessionIterator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (void)enumerateMindfulSessionsForDateInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  dispatch_semaphore_t v14;
  uint64_t v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(void);
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
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
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a4;
  v24 = (void (**)(void))a5;
  -[ACHMindfulSessionIterator query](self, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ACHMindfulSessionIterator healthStore](self, "healthStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHMindfulSessionIterator query](self, "query");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopQuery:", v12);

  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__24;
  v50 = __Block_byref_object_dispose__24;
  v51 = (id)MEMORY[0x24BDBD1A8];
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__24;
  v44 = __Block_byref_object_dispose__24;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__24;
  v38 = __Block_byref_object_dispose__24;
  v39 = 0;
  v13 = MEMORY[0x24BDAC760];
  while (1)
  {
    v14 = dispatch_semaphore_create(0);
    v15 = v35[5];
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __90__ACHMindfulSessionIterator_enumerateMindfulSessionsForDateInterval_handler_errorHandler___block_invoke;
    v29[3] = &unk_24D13BFB0;
    v31 = &v46;
    v32 = &v40;
    v33 = &v34;
    v16 = v14;
    v30 = v16;
    -[ACHMindfulSessionIterator _runQueryForDateInterval:lastCursor:completion:](self, "_runQueryForDateInterval:lastCursor:completion:", v8, v15, v29);
    v17 = dispatch_time(0, 10000000000);
    v18 = dispatch_semaphore_wait(v16, v17);
    if (v41[5] || v18 != 0)
      break;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = (id)v47[5];
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v52, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v26;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v20);
          v9[2](v9, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v23++));
        }
        while (v21 != v23);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v52, 16);
      }
      while (v21);
    }

    if (!v35[5])
      goto LABEL_17;
  }
  v24[2]();

LABEL_17:
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

}

void __90__ACHMindfulSessionIterator_enumerateMindfulSessionsForDateInterval_handler_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (a2)
    v9 = a2;
  else
    v9 = (void *)MEMORY[0x24BDBD1A8];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9);
  v16 = a2;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;
  v12 = v8;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v7;
  v15 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_runQueryForDateInterval:(id)a3 lastCursor:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDD3E88];
  objc_msgSend(v8, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForSamplesWithStartDate:endDate:options:", v12, v13, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __76__ACHMindfulSessionIterator__runQueryForDateInterval_lastCursor_completion___block_invoke;
  v26[3] = &unk_24D13BFD8;
  objc_copyWeak(&v28, &location);
  v14 = v10;
  v27 = v14;
  v15 = (void *)MEMORY[0x2199C9184](v26);
  if (v9)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3EE8]), "initWithQueryCursor:limit:resultsHandler:", v9, -[ACHMindfulSessionIterator batchSize](self, "batchSize"), v15);
    -[ACHMindfulSessionIterator setQuery:](self, "setQuery:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD3F08], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29A0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3E98]), "initWithSampleType:predicate:", v16, v25);
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BDD3EE8]);
    v31[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:limit:resultsHandler:", v19, v20, 0, 0, 0, -[ACHMindfulSessionIterator batchSize](self, "batchSize"), v15);
    -[ACHMindfulSessionIterator setQuery:](self, "setQuery:", v21);

  }
  -[ACHMindfulSessionIterator healthStore](self, "healthStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMindfulSessionIterator query](self, "query");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "executeQuery:", v23);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __76__ACHMindfulSessionIterator__runQueryForDateInterval_lastCursor_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;

  v9 = (id *)(a1 + 40);
  v10 = a5;
  v11 = a4;
  v15 = a3;
  v12 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "healthStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stopQuery:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKSampleIteratorQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
