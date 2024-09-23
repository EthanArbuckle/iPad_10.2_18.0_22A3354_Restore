@implementation CPAnalyticsKnowledgeStoreDestination

- (CPAnalyticsKnowledgeStoreDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5;
  CPAnalyticsKnowledgeStoreDestination *v6;
  uint64_t v7;
  _DKKnowledgeSaving *knowledgeStore;
  void *v9;
  id v10;
  uint64_t v11;
  NSMutableArray *matchers;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CPAnalyticsCoreDuetEventMatcher *v19;
  CPAnalyticsCoreDuetEventMatcher *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CPAnalyticsKnowledgeStoreDestination;
  v6 = -[CPAnalyticsKnowledgeStoreDestination init](&v26, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
    v7 = objc_claimAutoreleasedReturnValue();
    knowledgeStore = v6->_knowledgeStore;
    v6->_knowledgeStore = (_DKKnowledgeSaving *)v7;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("events"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
      matchers = v6->_matchers;
      v6->_matchers = (NSMutableArray *)v11;

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v23;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
            v19 = [CPAnalyticsCoreDuetEventMatcher alloc];
            v20 = -[CPAnalyticsCoreDuetEventMatcher initWithConfig:](v19, "initWithConfig:", v18, (_QWORD)v22);
            if (v20)
              -[NSMutableArray addObject:](v6->_matchers, "addObject:", v20);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v15);
      }

    }
  }

  return v6;
}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CPAnalyticsKnowledgeStoreDestination matchers](self, "matchers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      if (objc_msgSend(v10, "doesMatch:", v4))
      {
        -[CPAnalyticsKnowledgeStoreDestination _datasetSampleFromEvent:andMatcher:](self, "_datasetSampleFromEvent:andMatcher:", v4, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "datasetName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPAnalyticsKnowledgeStoreDestination _addCoreDuetDatasetSample:toDataset:](self, "_addCoreDuetDatasetSample:toDataset:", v11, v12);

        }
        v13 = objc_msgSend(v10, "matchNextEvent");

        if (!v13)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_datasetSampleFromEvent:(id)a3 andMatcher:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CPAnalyticsKnowledgeStoreDatasetSample *v12;
  void *v13;
  CPAnalyticsKnowledgeStoreDatasetSample *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "identifierPropertyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "subsetPropertyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subsetPropertyValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "propertyForKey:", v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    v12 = [CPAnalyticsKnowledgeStoreDatasetSample alloc];
    objc_msgSend(v5, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CPAnalyticsKnowledgeStoreDatasetSample initWithIdentifier:andDate:forSubset:](v12, "initWithIdentifier:andDate:forSubset:", v8, v13, v10);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_addCoreDuetDatasetSample:(id)a3 toDataset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE1B090];
  objc_msgSend(MEMORY[0x24BE1B060], "typeForName:", CFSTR("PFLDatasetSampleSchemaVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventStreamWithName:valueType:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BE1B098];
  objc_msgSend(MEMORY[0x24BE1B060], "typeForName:", CFSTR("PFLDatasetSampleSchemaVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierWithString:type:", CFSTR("PFLDatasetSample-v1.0"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(v6, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventWithStream:startDate:endDate:value:metadata:", v10, v15, v16, v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPAnalyticsKnowledgeStoreDestination knowledgeStore](self, "knowledgeStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(9, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __76__CPAnalyticsKnowledgeStoreDestination__addCoreDuetDatasetSample_toDataset___block_invoke;
  v24[3] = &unk_24C36E508;
  v25 = v7;
  v26 = v6;
  v22 = v6;
  v23 = v7;
  objc_msgSend(v19, "saveObjects:responseQueue:withCompletion:", v20, v21, v24);

}

- (NSMutableArray)matchers
{
  return self->_matchers;
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_matchers, 0);
}

void __76__CPAnalyticsKnowledgeStoreDestination__addCoreDuetDatasetSample_toDataset___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CPAnalyticsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(void **)(a1 + 32);
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_20AB22000, v7, OS_LOG_TYPE_INFO, "CPAnalytics KnowledgeStore saved in %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("cd_stream"));
    objc_msgSend(*(id *)(a1 + 40), "subset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, CFSTR("cd_subset"));

    +[CPAnalyticsCoreAnalyticsHelper sendCoreAnalyticsEvent:withPayload:shouldSanitize:](CPAnalyticsCoreAnalyticsHelper, "sendCoreAnalyticsEvent:withPayload:shouldSanitize:", CFSTR("com.apple.photos.coreduet.saved"), v7, 0);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_error_impl(&dword_20AB22000, v7, OS_LOG_TYPE_ERROR, "CPAnalytics KnowledgeStore failed to save Duet event: %@", (uint8_t *)&v10, 0xCu);
  }

}

@end
