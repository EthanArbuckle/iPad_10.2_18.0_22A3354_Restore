@implementation WDExertionDataFetcher

- (WDExertionDataFetcher)initWithHealthStore:(id)a3 predicate:(id)a4 exertionTypeCode:(int64_t)a5 limit:(int64_t)a6 sortDescriptors:(id)a7 resultsHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  WDExertionDataFetcher *v19;
  WDExertionDataFetcher *v20;
  uint64_t v21;
  id resultsHandler;
  WDExertionDataFetcher *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  if (v16)
  {
    v25.receiver = self;
    v25.super_class = (Class)WDExertionDataFetcher;
    v19 = -[WDExertionDataFetcher init](&v25, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_healthStore, a3);
      objc_storeStrong((id *)&v20->_predicate, a4);
      v20->_exertionTypeCode = a5;
      v20->_limit = a6;
      objc_storeStrong((id *)&v20->_sortDescriptors, a7);
      v21 = MEMORY[0x2199E6E80](v18);
      resultsHandler = v20->_resultsHandler;
      v20->_resultsHandler = (id)v21;

    }
    self = v20;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)start
{
  id v3;
  void *v4;
  NSPredicate *predicate;
  int64_t limit;
  NSArray *sortDescriptors;
  void *v8;
  _QWORD v9[5];

  v3 = objc_alloc(MEMORY[0x24BDD3F00]);
  objc_msgSend(MEMORY[0x24BDD4168], "workoutType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  limit = self->_limit;
  sortDescriptors = self->_sortDescriptors;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __30__WDExertionDataFetcher_start__block_invoke;
  v9[3] = &unk_24D38D270;
  v9[4] = self;
  v8 = (void *)objc_msgSend(v3, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v4, predicate, limit, sortDescriptors, v9);

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v8);
}

void __30__WDExertionDataFetcher_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "count"))
  {
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD3E88];
      objc_msgSend(v12, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateForObjectWithUUID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc(MEMORY[0x24BDD4148]);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __30__WDExertionDataFetcher_start__block_invoke_2;
      v18[3] = &unk_24D38D248;
      v18[4] = *(_QWORD *)(a1 + 32);
      v17 = (void *)objc_msgSend(v16, "initWithPredicate:anchor:options:resultsHandler:", v15, 0, 0, v18);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeQuery:", v17);

    }
    else
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD2BE8], 3, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
  }

}

void __30__WDExertionDataFetcher_start__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void (*v25)(void);
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    v25 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16);
LABEL_15:
    v25();
    goto LABEL_16;
  }
  if (!objc_msgSend(v10, "count"))
  {
    v25 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16);
    goto LABEL_15;
  }
  v26 = v11;
  v27 = v9;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v19, "samples", v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v19, "samples");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObjectsFromArray:", v21);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v16);
  }

  v9 = v27;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopQuery:", v27);
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(_QWORD *)(v22 + 48);
  objc_msgSend(MEMORY[0x24BE4A628], "filterSamplesOfExertionTypeCode:fromExertionSamples:", *(_QWORD *)(v22 + 24), v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v23 + 16))(v23, v24, 0);

  v11 = v26;
LABEL_16:

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
