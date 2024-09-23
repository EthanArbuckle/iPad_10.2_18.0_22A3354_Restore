@implementation ACHWorkoutIterator

- (ACHWorkoutIterator)initWithHealthStore:(id)a3
{
  id v5;
  ACHWorkoutIterator *v6;
  ACHWorkoutIterator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACHWorkoutIterator;
  v6 = -[ACHWorkoutIterator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v7->_batchSize = 128;
  }

  return v7;
}

- (ACHWorkoutIterator)initWithHealthStore:(id)a3 batchSize:(unint64_t)a4
{
  id v7;
  ACHWorkoutIterator *v8;
  ACHWorkoutIterator *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHWorkoutIterator;
  v8 = -[ACHWorkoutIterator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (void)enumerateWorkoutsForDateInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  intptr_t v17;
  uint64_t v18;
  _BOOL4 v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void (**v31)(id, _QWORD);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[128];
  uint64_t v60;
  const __CFString *v61;
  uint8_t buf[4];
  _QWORD v63[3];

  *(_QWORD *)((char *)&v63[1] + 4) = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a4;
  v31 = (void (**)(id, _QWORD))a5;
  -[ACHWorkoutIterator query](self, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ACHWorkoutIterator healthStore](self, "healthStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHWorkoutIterator query](self, "query");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopQuery:", v12);

  }
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__16;
  v57 = __Block_byref_object_dispose__16;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__16;
  v51 = __Block_byref_object_dispose__16;
  v52 = 0;
  v30 = *MEMORY[0x24BDD0FC8];
  do
  {
    v13 = dispatch_semaphore_create(0);
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__16;
    v45 = __Block_byref_object_dispose__16;
    v46 = (id)MEMORY[0x24BDBD1A8];
    v14 = v48[5];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __76__ACHWorkoutIterator_enumerateWorkoutsForDateInterval_handler_errorHandler___block_invoke;
    v36[3] = &unk_24D13BFB0;
    v38 = &v41;
    v39 = &v53;
    v40 = &v47;
    v15 = v13;
    v37 = v15;
    -[ACHWorkoutIterator _runQueryForDateInterval:lastCursor:completion:](self, "_runQueryForDateInterval:lastCursor:completion:", v8, v14, v36);
    v16 = dispatch_time(0, 60000000000);
    v17 = dispatch_semaphore_wait(v15, v16);
    v18 = v54[5];
    v19 = (v18 | v17) == 0;
    if (v18 | v17)
    {
      if (v17)
      {
        ACHLogWorkouts();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[ACHWorkoutIterator enumerateWorkoutsForDateInterval:handler:errorHandler:].cold.1(buf, v63, v25);

        v26 = (void *)MEMORY[0x24BDD1540];
        v60 = v30;
        v61 = CFSTR("Semaphore wait timeout in workout iterator");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements.WorkoutIterator"), 10, v27);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v54[5];
        v54[5] = v28;

        v18 = v54[5];
      }
      v31[2](v31, v18);
    }
    else
    {
      v20 = v8;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v21 = (id)v42[5];
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v59, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v33 != v23)
              objc_enumerationMutation(v21);
            v9[2](v9, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v59, 16);
        }
        while (v22);
      }

      v8 = v20;
    }

    _Block_object_dispose(&v41, 8);
  }
  while (v19 && v48[5]);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
}

void __76__ACHWorkoutIterator_enumerateWorkoutsForDateInterval_handler_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v26 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD3E88];
  objc_msgSend(v8, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForSamplesWithStartDate:endDate:options:", v11, v12, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __69__ACHWorkoutIterator__runQueryForDateInterval_lastCursor_completion___block_invoke;
  v27[3] = &unk_24D13BFD8;
  objc_copyWeak(&v29, &location);
  v13 = v9;
  v28 = v13;
  v14 = (void *)MEMORY[0x2199C9184](v27);
  if (v26)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3EE8]), "initWithQueryCursor:limit:resultsHandler:", v26, -[ACHWorkoutIterator batchSize](self, "batchSize"), v14);
    -[ACHWorkoutIterator setQuery:](self, "setQuery:", v15);
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x24BDD3E98]);
    objc_msgSend(MEMORY[0x24BDD3F08], "workoutType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "initWithSampleType:predicate:", v17, v25);

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x24BDD3EE8]);
    v32[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:limit:resultsHandler:", v20, v21, 0, 0, 0, -[ACHWorkoutIterator batchSize](self, "batchSize"), v14);
    -[ACHWorkoutIterator setQuery:](self, "setQuery:", v22);

  }
  -[ACHWorkoutIterator healthStore](self, "healthStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutIterator query](self, "query");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "executeQuery:", v24);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __69__ACHWorkoutIterator__runQueryForDateInterval_lastCursor_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
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

- (void)enumerateWorkoutsForDateInterval:(uint8_t *)buf handler:(_QWORD *)a2 errorHandler:(os_log_t)log .cold.1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = CFSTR("Semaphore wait timeout in workout iterator");
  _os_log_error_impl(&dword_21407B000, log, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
}

@end
