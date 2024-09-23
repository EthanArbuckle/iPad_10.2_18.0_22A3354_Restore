@implementation AMSMetricsMemoryDataSource

+ (id)batchesFromEvents:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v37;
  uint64_t v38;
  id v39;
  __CFString *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v3;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v38)
  {
    v4 = CFSTR("0");
    v37 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v42 != v37)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v6, "topic");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
          v9 = (__CFString *)v7;
        else
          v9 = &stru_1E2548760;
        v10 = v9;

        v11 = objc_msgSend(v6, "isAnonymous");
        v12 = CFSTR("1");
        if (!v11)
          v12 = CFSTR("0");
        v40 = v12;
        objc_msgSend(v6, "account");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ams_DSID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "integerValue") >= 1)
        {
          objc_msgSend(v6, "account");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "ams_DSID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringValue");
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v6, "canaryIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
          v19 = (__CFString *)v17;
        else
          v19 = &stru_1E2548760;
        v20 = v19;

        v21 = &stru_1E2548760;
        if (objc_msgSend(v6, "isAnonymous"))
        {
          objc_msgSend(v6, "clientIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v6, "clientIdentifier");
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v21 = &stru_1E2548760;
          }

        }
        objc_msgSend(v6, "underlyingDictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("userId"));
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
          v26 = (__CFString *)v24;
        else
          v26 = &stru_1E2548760;
        v27 = v26;

        v28 = v10;
        v45[0] = v10;
        v45[1] = v40;
        v45[2] = v4;
        v45[3] = v20;
        v45[4] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "topic");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("xp_ase_appstore_ue"));

        if (v31)
        {
          objc_msgSend(v29, "arrayByAddingObject:", v27);
          v32 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v32;
        }
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("."));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v33);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v34, v33);
        }
        objc_msgSend(v34, "addObject:", v6);

        v4 = CFSTR("0");
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v38);
  }

  return v39;
}

- (AMSMetricsMemoryDataSource)initWithEvents:(id)a3
{
  id v4;
  AMSMetricsMemoryDataSource *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *batches;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSMetricsMemoryDataSource;
  v5 = -[AMSMetricsMemoryDataSource init](&v10, sel_init);
  if (v5)
  {
    +[AMSMetricsMemoryDataSource batchesFromEvents:](AMSMetricsMemoryDataSource, "batchesFromEvents:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    batches = v5->_batches;
    v5->_batches = (NSMutableDictionary *)v7;

  }
  return v5;
}

- (void)enumerateSortedEventsForTopic:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AMSMetricsMemoryDataSource batches](self, "batches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__AMSMetricsMemoryDataSource_enumerateSortedEventsForTopic_block___block_invoke;
  v11[3] = &unk_1E2543FF0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __66__AMSMetricsMemoryDataSource_enumerateSortedEventsForTopic_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 32);
        if (v11)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "topic");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (!v13)
            continue;
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (BOOL)removeEvents:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[AMSMetricsMemoryDataSource batches](self, "batches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(obj);
        v27 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v7);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v9 = v25;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              -[AMSMetricsMemoryDataSource batches](self, "batches");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "indexOfObject:", v8);

              if (v17 != 0x7FFFFFFFFFFFFFFFLL)
              {
                -[AMSMetricsMemoryDataSource batches](self, "batches");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "objectForKeyedSubscript:", v14);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = (void *)objc_msgSend(v19, "mutableCopy");

                objc_msgSend(v20, "removeObjectAtIndex:", v17);
                -[AMSMetricsMemoryDataSource batches](self, "batches");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v14);

                goto LABEL_16;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_16:

        v7 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }

  return 1;
}

- (BOOL)willStartBatchingWithLogKey:(id)a3 error:(id *)a4
{
  return 1;
}

- (NSMutableDictionary)batches
{
  return self->_batches;
}

- (void)setBatches:(id)a3
{
  objc_storeStrong((id *)&self->_batches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batches, 0);
}

@end
