@implementation NTWidgetConfigDataOperation

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[NTWidgetConfigDataOperation widgetConfiguration](self, "widgetConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTWidgetConfigDataOperation validateOperation].cold.3();
  -[NTWidgetConfigDataOperation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTWidgetConfigDataOperation validateOperation].cold.2();
  -[NTWidgetConfigDataOperation widgetConfigDataCompletionHandler](self, "widgetConfigDataCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTWidgetConfigDataOperation validateOperation].cold.1();
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  return !v6 && v5 != 0;
}

- (void)performOperation
{
  void *v3;

  -[NTWidgetConfigDataOperation widgetConfiguration](self, "widgetConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTWidgetConfigDataOperation _collectRecordsFromWidgetConfigDictionary:](self, "_collectRecordsFromWidgetConfigDictionary:", v3);

  -[NTWidgetConfigDataOperation _finalizeResultFromCachedRecords](self, "_finalizeResultFromCachedRecords");
  -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[NTWidgetConfigDataOperation widgetConfigDataCompletionHandler](self, "widgetConfigDataCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NTWidgetConfigDataOperation widgetConfigDataCompletionHandler](self, "widgetConfigDataCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NTWidgetConfigDataOperation resultDefaultConfigurationDictionary](self, "resultDefaultConfigurationDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTWidgetConfigDataOperation resultSingleTagConfigurationDictionary](self, "resultSingleTagConfigurationDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTWidgetConfigDataOperation resultArticleIDs](self, "resultArticleIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTWidgetConfigDataOperation resultArticleListIDs](self, "resultArticleListIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTWidgetConfigDataOperation resultHeldRecordsByType](self, "resultHeldRecordsByType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, void *, void *, id))v5)[2](v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)_collectRecordsFromWidgetConfigDictionary:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE6C9D0];
  v6 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEBUG))
    -[NTWidgetConfigDataOperation _collectRecordsFromWidgetConfigDictionary:].cold.3(v6, self);
  FCAppConfigurationDictionaryValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    -[NTWidgetConfigDataOperation _collectRecordsFromWidgetConfigDictionary:].cold.2(v8, self);
  FCAppConfigurationDictionaryValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    -[NTWidgetConfigDataOperation _collectRecordsFromWidgetConfigDictionary:].cold.1(v10, self);
  FCAppConfigurationDictionaryValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValue();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v15 = objc_claimAutoreleasedReturnValue();
  -[NTWidgetConfigDataOperation setResultDefaultConfigurationDictionary:](self, "setResultDefaultConfigurationDictionary:", v7);
  -[NTWidgetConfigDataOperation setResultSingleTagConfigurationDictionary:](self, "setResultSingleTagConfigurationDictionary:", v9);
  v28 = (void *)v15;
  -[NTWidgetConfigDataOperation setResultArticleListIDs:](self, "setResultArticleListIDs:", v15);
  v29 = (void *)v14;
  -[NTWidgetConfigDataOperation setResultArticleIDs:](self, "setResultArticleIDs:", v14);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke;
  v34[3] = &unk_24DB5E798;
  v34[4] = self;
  v18 = v16;
  v35 = v18;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v34);
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke_20;
  v32[3] = &unk_24DB5E798;
  v32[4] = self;
  v19 = v18;
  v33 = v19;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v32);
  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke_21;
  v30[3] = &unk_24DB5E798;
  v30[4] = self;
  v20 = v19;
  v31 = v20;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v30);
  -[NTWidgetConfigDataOperation context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "convertRecords:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTWidgetConfigDataOperation setCachedRecords:](self, "setCachedRecords:", v22);

  v23 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTWidgetConfigDataOperation cachedRecords](self, "cachedRecords");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");
    *(_DWORD *)buf = 138543618;
    v37 = v25;
    v38 = 2048;
    v39 = v27;
    _os_log_impl(&dword_2197E6000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ converted %lu records", buf, 0x16u);

  }
}

void __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NTCKRecordFromArticleJSONDictionary(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "shortOperationDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_2197E6000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ convert article JSON: %@ into record: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NTCKRecordFromArticleListJSONDictionary(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "shortOperationDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_2197E6000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ convert articleList JSON: %@ into record: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NTCKRecordFromTagJSONDictionary(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "shortOperationDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_2197E6000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ convert tag JSON: %@ into record: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (void)_finalizeResultFromCachedRecords
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTWidgetConfigDataOperation cachedRecords](self, "cachedRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __63__NTWidgetConfigDataOperation__finalizeResultFromCachedRecords__block_invoke;
  v19[3] = &unk_24DB5E7C0;
  v7 = v3;
  v20 = v7;
  v8 = v4;
  v21 = v8;
  objc_msgSend(v5, "enumerateRecordsAndInterestTokensWithBlock:", v19);

  v9 = (void *)MEMORY[0x24BDBCE70];
  v13 = v6;
  v14 = 3221225472;
  v15 = __63__NTWidgetConfigDataOperation__finalizeResultFromCachedRecords__block_invoke_2;
  v16 = &unk_24DB5E7E8;
  v17 = v7;
  v18 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "fc_dictionary:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTWidgetConfigDataOperation setResultHeldRecordsByType:](self, "setResultHeldRecordsByType:", v12, v13, v14, v15, v16);

}

void __63__NTWidgetConfigDataOperation__finalizeResultFromCachedRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "base");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v14, "recordType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v7);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v8);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, v8);

}

void __63__NTWidgetConfigDataOperation__finalizeResultFromCachedRecords__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x24BE6CC08]);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v9, "initWithRecordsByID:interestTokensByID:", v10, v11);

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSDictionary)widgetConfiguration
{
  return self->_widgetConfiguration;
}

- (void)setWidgetConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (id)widgetConfigDataCompletionHandler
{
  return self->_widgetConfigDataCompletionHandler;
}

- (void)setWidgetConfigDataCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (FCHeldRecords)cachedRecords
{
  return self->_cachedRecords;
}

- (void)setCachedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRecords, a3);
}

- (NSDictionary)resultDefaultConfigurationDictionary
{
  return self->_resultDefaultConfigurationDictionary;
}

- (void)setResultDefaultConfigurationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_resultDefaultConfigurationDictionary, a3);
}

- (NSDictionary)resultSingleTagConfigurationDictionary
{
  return self->_resultSingleTagConfigurationDictionary;
}

- (void)setResultSingleTagConfigurationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_resultSingleTagConfigurationDictionary, a3);
}

- (NSArray)resultArticleIDs
{
  return self->_resultArticleIDs;
}

- (void)setResultArticleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_resultArticleIDs, a3);
}

- (NSArray)resultArticleListIDs
{
  return self->_resultArticleListIDs;
}

- (void)setResultArticleListIDs:(id)a3
{
  objc_storeStrong((id *)&self->_resultArticleListIDs, a3);
}

- (NSDictionary)resultHeldRecordsByType
{
  return self->_resultHeldRecordsByType;
}

- (void)setResultHeldRecordsByType:(id)a3
{
  objc_storeStrong((id *)&self->_resultHeldRecordsByType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeldRecordsByType, 0);
  objc_storeStrong((id *)&self->_resultArticleListIDs, 0);
  objc_storeStrong((id *)&self->_resultArticleIDs, 0);
  objc_storeStrong((id *)&self->_resultSingleTagConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->_resultDefaultConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->_cachedRecords, 0);
  objc_storeStrong(&self->_widgetConfigDataCompletionHandler, 0);
  objc_storeStrong((id *)&self->_widgetConfiguration, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Record chain conversion conversion operation requires widgetConfiguration."));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_5_1();
}

- (void)_collectRecordsFromWidgetConfigDictionary:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "shortOperationDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_2197E6000, v5, v6, "%{public}@ parsed single tag configuration %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

- (void)_collectRecordsFromWidgetConfigDictionary:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "shortOperationDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_2197E6000, v5, v6, "%{public}@ parsed default configuration %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

- (void)_collectRecordsFromWidgetConfigDictionary:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "shortOperationDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_2197E6000, v5, v6, "%{public}@ about to convert config JSON: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

@end
