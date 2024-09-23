@implementation NTTodayConfigOperation

- (NTTodayConfigOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTTodayConfigOperation;
  return -[FCOperation init](&v3, sel_init);
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[NTTodayConfigOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigOperation validateOperation].cold.5();
  -[NTTodayConfigOperation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigOperation validateOperation].cold.4();
  -[NTTodayConfigOperation widgetConfigID](self, "widgetConfigID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigOperation validateOperation].cold.3();
  -[NTTodayConfigOperation defaultConfigCompletionHandler](self, "defaultConfigCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigOperation validateOperation].cold.2();
  -[NTTodayConfigOperation singleTagConfigCompletionHandler](self, "singleTagConfigCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigOperation validateOperation].cold.1();
  if (v3)
    v8 = v4 == 0;
  else
    v8 = 1;
  return !v8 && v5 != 0 && v6 != 0 && v7 != 0;
}

- (void)performOperation
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  NTTodayConfigOperation *v23;
  id v24;
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[2];
  _QWORD v28[5];
  _QWORD v29[5];
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTTodayConfigOperation widgetConfigID](self, "widgetConfigID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_2197E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will request config with ID %@", buf, 0x16u);

  }
  v7 = objc_alloc_init(MEMORY[0x24BE6CD00]);
  -[NTTodayConfigOperation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContext:", v8);

  objc_msgSend(MEMORY[0x24BE6CB50], "edgeCacheHintForToday");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEdgeCacheHint:", v9);

  -[NTTodayConfigOperation widgetConfigID](self, "widgetConfigID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTopLevelRecordIDs:", v11);

  objc_msgSend(v7, "setShouldReturnErrorWhenSomeRecordsMissing:", 1);
  objc_msgSend(v7, "setShouldBypassRecordSourcePersistence:", 1);
  v28[0] = *MEMORY[0x24BE6C7E8];
  v12 = *MEMORY[0x24BE6C718];
  v27[0] = *MEMORY[0x24BE6C720];
  v27[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v13;
  v28[1] = *MEMORY[0x24BE6C6A0];
  v26 = *MEMORY[0x24BE6C698];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v14;
  v28[2] = *MEMORY[0x24BE6C6B8];
  v15 = *MEMORY[0x24BE6C6A8];
  v25[0] = *MEMORY[0x24BE6C6D0];
  v25[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v16;
  v17 = *MEMORY[0x24BE6C6D8];
  v28[3] = *MEMORY[0x24BE6C6F0];
  v28[4] = v17;
  v29[3] = MEMORY[0x24BDBD1A8];
  v29[4] = MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLinkKeysByRecordType:", v18);

  objc_msgSend(v7, "setDynamicCachePolicyBlock:", &__block_literal_global_13);
  objc_initWeak((id *)buf, v7);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __42__NTTodayConfigOperation_performOperation__block_invoke_2;
  v22 = &unk_24DB5F950;
  v23 = self;
  objc_copyWeak(&v24, (id *)buf);
  objc_msgSend(v7, "setRecordChainCompletionHandler:", &v19);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v7, v19, v20, v21, v22, v23);
  objc_msgSend(v7, "start");
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

uint64_t __42__NTTodayConfigOperation_performOperation__block_invoke()
{
  return objc_msgSend(MEMORY[0x24BE6CB08], "ignoreCacheCachePolicy");
}

void __42__NTTodayConfigOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id WeakRetained;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a3);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24DB6EC10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "onlyRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration2");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "articleListIDs2s");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "articleIDs2s");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v24 = (void *)v8;
    objc_msgSend(v9, "_todayConfigWithConfigJSON:articleListIDs:articleIDs:error:", v8, v10, v11, &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;

    objc_msgSend(*(id *)(a1 + 32), "setDefaultConfigError:", v13);
    objc_msgSend(v7, "singleTagConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      FCBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLForResource:withExtension:", CFSTR("SingleTagConfiguration"), CFSTR("json"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithContentsOfURL:encoding:error:", v16, 4, 0);
    }
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v7, "articleListIDs2s");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "articleIDs2s");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v17, "_todayConfigWithConfigJSON:articleListIDs:articleIDs:error:", v14, v18, v19, &v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v26;

    objc_msgSend(*(id *)(a1 + 32), "setSingleTagConfigError:", v21);
    objc_msgSend(*(id *)(a1 + 32), "setResultDefaultConfig:", v12);
    objc_msgSend(*(id *)(a1 + 32), "setResultSingleTagConfig:", v20);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "networkEvents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setNetworkEvents:", v23);

    objc_msgSend(*(id *)(a1 + 32), "setResultHeldRecordsByType:", v6);
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);

  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (**v16)(id, void *, void *, _QWORD);

  v4 = a3;
  -[NTTodayConfigOperation defaultConfigCompletionHandler](self, "defaultConfigCompletionHandler");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigOperation resultDefaultConfig](self, "resultDefaultConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigOperation resultHeldRecordsByType](self, "resultHeldRecordsByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigOperation defaultConfigError](self, "defaultConfigError");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = (uint64_t)v4;
  ((void (**)(_QWORD, void *, void *, uint64_t))v5)[2](v5, v6, v7, v10);

  -[NTTodayConfigOperation singleTagConfigCompletionHandler](self, "singleTagConfigCompletionHandler");
  v16 = (void (**)(id, void *, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigOperation resultSingleTagConfig](self, "resultSingleTagConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigOperation resultHeldRecordsByType](self, "resultHeldRecordsByType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigOperation singleTagConfigError](self, "singleTagConfigError");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = v13;
  else
    v15 = (uint64_t)v4;
  v16[2](v16, v11, v12, v15);

}

- (id)_todayConfigWithConfigJSON:(id)a3 articleListIDs:(id)a4 articleIDs:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id *v44;
  id v45;
  id v46;
  void *v47;
  id obj;
  id obja;
  void *v50;
  void *v51;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v62 = v14;
    v63 = 2114;
    v64 = v9;
    _os_log_impl(&dword_2197E6000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ received config JSON %{public}@", buf, 0x16u);

  }
  v59 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "fc_dictionaryFromJSON:error:", v9, &v59);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v59;
  v17 = v16;
  if (v16)
  {
    v18 = v16;
    v19 = 0;
    if (a6)
LABEL_5:
      *a6 = objc_retainAutorelease(v18);
  }
  else
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE6C950]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v46 = v9;
      v47 = v15;
      v44 = a6;
      v45 = v10;
      v22 = (void *)objc_opt_new();
      v51 = (void *)objc_opt_new();
      v50 = (void *)objc_opt_new();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v43 = v21;
      obj = v21;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v56 != v25)
              objc_enumerationMutation(obj);
            objc_msgSend(MEMORY[0x24BE6D2F0], "sectionConfigWithJSONDictionary:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              -[NTTodayConfigOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:](self, "_collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:", v27, v51, v50);
              if (objc_msgSend(v27, "queueMembershipsCount"))
              {
                v28 = 0;
                do
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v27, "queueMembershipAtIndex:", v28));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "objectForKeyedSubscript:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v30)
                  {
                    v30 = (void *)objc_opt_new();
                    objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, v29);
                  }
                  objc_msgSend(v30, "addObject:", v27);

                  ++v28;
                }
                while (v28 < objc_msgSend(v27, "queueMembershipsCount"));
              }
            }

          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        }
        while (v24);
      }

      v10 = v45;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v45);
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
      v32 = objc_claimAutoreleasedReturnValue();
      obja = (id)v31;
      if ((objc_msgSend(v51, "isSubsetOfSet:", v31) & 1) == 0
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[NTTodayConfigOperation _todayConfigWithConfigJSON:articleListIDs:articleIDs:error:].cold.2();
      }
      v42 = (void *)v32;
      if ((objc_msgSend(v50, "isSubsetOfSet:", v32) & 1) == 0
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[NTTodayConfigOperation _todayConfigWithConfigJSON:articleListIDs:articleIDs:error:].cold.1();
      }
      objc_msgSend(v22, "allKeys");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "sortedArrayUsingSelector:", sel_compare_);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __85__NTTodayConfigOperation__todayConfigWithConfigJSON_articleListIDs_articleIDs_error___block_invoke;
      v53[3] = &unk_24DB5F8E8;
      v54 = v22;
      v41 = v22;
      objc_msgSend(v34, "fc_arrayByTransformingWithBlock:", v53);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x24BE6C7B0]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x24BE6C758]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x24BE6C750]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x24BE6C748]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTTodayConfigOperation configuration](self, "configuration");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "todayConfigWithIdentifier:queueConfigs:backgroundColorLight:backgroundColorDark:audioIndicatorColor:", v36, v35, v37, v38, v39);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v47;
      v18 = 0;
      v9 = v46;
      a6 = v44;
      v21 = v43;
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6C9A8], 13, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = 0;
    }

    if (a6)
      goto LABEL_5;
  }

  return v19;
}

id __85__NTTodayConfigOperation__todayConfigWithConfigJSON_articleListIDs_articleIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setWidgetVisibleSectionsLimit:", 1);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addTodaySectionConfigs:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_collectRecordIDsReferencedBySectionConfig:(id)a3 withArticleListIDs:(id)a4 articleIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayConfigOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:].cold.1();
LABEL_6:
  switch(objc_msgSend(v7, "sectionType"))
  {
    case 0u:
      objc_msgSend(v7, "articleListTodaySectionConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "articleListID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v11);
      goto LABEL_41;
    case 3u:
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v7, "articleIDsTodaySectionConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "articles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v50 != v15)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "articleID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v17);

          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
        }
        while (v14);
      }
      goto LABEL_41;
    case 4u:
      objc_msgSend(v7, "personalizedTodaySectionConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(v11, "mandatoryArticles");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v46 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "articleID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v20);
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v11, "personalizedArticles");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v42;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v42 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "articleID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v29);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
        }
        while (v26);
      }
      goto LABEL_40;
    case 5u:
      objc_msgSend(v7, "itemsTodaySectionConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      objc_msgSend(v11, "items", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v38;
        do
        {
          for (m = 0; m != v31; ++m)
          {
            if (*(_QWORD *)v38 != v32)
              objc_enumerationMutation(v24);
            v34 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * m);
            if (!objc_msgSend(v34, "itemType"))
            {
              objc_msgSend(v34, "article");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "articleID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v36);

            }
          }
          v31 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
        }
        while (v31);
      }
LABEL_40:

LABEL_41:
      break;
    default:
      break;
  }

}

- (FCCoreConfiguration)configuration
{
  return (FCCoreConfiguration *)objc_getProperty(self, a2, 368, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)widgetConfigID
{
  return self->_widgetConfigID;
}

- (void)setWidgetConfigID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void)setNetworkEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)defaultConfigCompletionHandler
{
  return self->_defaultConfigCompletionHandler;
}

- (void)setDefaultConfigCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (id)singleTagConfigCompletionHandler
{
  return self->_singleTagConfigCompletionHandler;
}

- (void)setSingleTagConfigCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NTPBTodayConfig)resultDefaultConfig
{
  return self->_resultDefaultConfig;
}

- (void)setResultDefaultConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSError)defaultConfigError
{
  return self->_defaultConfigError;
}

- (void)setDefaultConfigError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NTPBTodayConfig)resultSingleTagConfig
{
  return self->_resultSingleTagConfig;
}

- (void)setResultSingleTagConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSError)singleTagConfigError
{
  return self->_singleTagConfigError;
}

- (void)setSingleTagConfigError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
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
  objc_storeStrong((id *)&self->_singleTagConfigError, 0);
  objc_storeStrong((id *)&self->_resultSingleTagConfig, 0);
  objc_storeStrong((id *)&self->_defaultConfigError, 0);
  objc_storeStrong((id *)&self->_resultDefaultConfig, 0);
  objc_storeStrong(&self->_singleTagConfigCompletionHandler, 0);
  objc_storeStrong(&self->_defaultConfigCompletionHandler, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_widgetConfigID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Today config operation requires a configuration."));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)_todayConfigWithConfigJSON:articleListIDs:articleIDs:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("articleRecords must be in sync!"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)_todayConfigWithConfigJSON:articleListIDs:articleIDs:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("articleListRecords must be in sync!"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)_collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleIDs");
  v2 = 136315906;
  v3 = "-[NTTodayConfigOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]";
  v4 = 2080;
  v5 = "NTTodayConfigOperation.m";
  v6 = 1024;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_2();
}

- (void)_collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:.cold.2()
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleListIDs");
  v2 = 136315906;
  v3 = "-[NTTodayConfigOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]";
  v4 = 2080;
  v5 = "NTTodayConfigOperation.m";
  v6 = 1024;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_2();
}

@end
