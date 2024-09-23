@implementation NTTodayConfigConversionOperation

- (NTTodayConfigConversionOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTTodayConfigConversionOperation;
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

  -[NTTodayConfigConversionOperation widgetConfiguration](self, "widgetConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigConversionOperation validateOperation].cold.5();
  -[NTTodayConfigConversionOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigConversionOperation validateOperation].cold.4();
  -[NTTodayConfigConversionOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigConversionOperation validateOperation].cold.3();
  -[NTTodayConfigConversionOperation defaultConfigCompletionHandler](self, "defaultConfigCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigConversionOperation validateOperation].cold.2();
  -[NTTodayConfigConversionOperation singleTagConfigCompletionHandler](self, "singleTagConfigCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigConversionOperation validateOperation].cold.1();
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
  NTWidgetConfigDataOperation *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_2197E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will convert widget config data", buf, 0xCu);

  }
  v6 = objc_alloc_init(NTWidgetConfigDataOperation);
  -[NTTodayConfigConversionOperation context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTWidgetConfigDataOperation setContext:](v6, "setContext:", v7);

  -[NTTodayConfigConversionOperation widgetConfiguration](self, "widgetConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTWidgetConfigDataOperation setWidgetConfiguration:](v6, "setWidgetConfiguration:", v8);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__NTTodayConfigConversionOperation_performOperation__block_invoke;
  v9[3] = &unk_24DB5F8C0;
  v9[4] = self;
  -[NTWidgetConfigDataOperation setWidgetConfigDataCompletionHandler:](v6, "setWidgetConfigDataCompletionHandler:", v9);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v6);
  -[FCOperation start](v6, "start");

}

void __52__NTTodayConfigConversionOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  os_log_t *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  os_log_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *log;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (os_log_t *)MEMORY[0x24BE6C9D0];
  v20 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(void **)(a1 + 32);
    v22 = v20;
    objc_msgSend(v21, "shortOperationDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v43 = v23;
    v44 = 2112;
    v45 = v13;
    v46 = 2112;
    v47 = v14;
    v48 = 2112;
    v49 = v15;
    v50 = 2112;
    v51 = v16;
    v52 = 2112;
    v53 = v18;
    _os_log_impl(&dword_2197E6000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ received defaultConfigDictionary: %@, singleTagConfigDictionary: %@, articleIDs: %@, articleListIDs: %@, error: %@ ", buf, 0x3Eu);

  }
  v24 = *(void **)(a1 + 32);
  if (v18)
  {
    objc_msgSend(v24, "finishedPerformingOperationWithError:", v18);
  }
  else
  {
    v41 = 0;
    objc_msgSend(v24, "_todayConfigWithConfigJSON:articleListIDs:articleIDs:error:", v13, v16, v15, &v41);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v41;
    objc_msgSend(*(id *)(a1 + 32), "setDefaultConfigError:");
    v26 = *(void **)(a1 + 32);
    v40 = 0;
    objc_msgSend(v26, "_todayConfigWithConfigJSON:articleListIDs:articleIDs:error:", v14, v16, v15, &v40);
    v27 = objc_claimAutoreleasedReturnValue();
    v37 = v40;
    objc_msgSend(*(id *)(a1 + 32), "setSingleTagConfigError:");
    objc_msgSend(*(id *)(a1 + 32), "setResultDefaultConfig:", v25);
    v38 = (void *)v27;
    objc_msgSend(*(id *)(a1 + 32), "setResultSingleTagConfig:", v27);
    objc_msgSend(*(id *)(a1 + 32), "setResultHeldRecordsByType:", v17);
    v28 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(void **)(a1 + 32);
      log = v28;
      objc_msgSend(v29, "shortOperationDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "resultDefaultConfig");
      v35 = v17;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "resultSingleTagConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "resultHeldRecordsByType");
      v36 = v25;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v43 = v33;
      v44 = 2112;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      v48 = 2048;
      v49 = v32;
      _os_log_impl(&dword_2197E6000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ defaultConfig: %@, singleTagConfig: %@, resultHeldRecordsByType: %p", buf, 0x2Au);

      v25 = v36;
      v17 = v35;

    }
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
  -[NTTodayConfigConversionOperation defaultConfigCompletionHandler](self, "defaultConfigCompletionHandler");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigConversionOperation resultDefaultConfig](self, "resultDefaultConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigConversionOperation resultHeldRecordsByType](self, "resultHeldRecordsByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigConversionOperation defaultConfigError](self, "defaultConfigError");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = (uint64_t)v4;
  ((void (**)(_QWORD, void *, void *, uint64_t))v5)[2](v5, v6, v7, v10);

  -[NTTodayConfigConversionOperation singleTagConfigCompletionHandler](self, "singleTagConfigCompletionHandler");
  v16 = (void (**)(id, void *, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigConversionOperation resultSingleTagConfig](self, "resultSingleTagConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigConversionOperation resultHeldRecordsByType](self, "resultHeldRecordsByType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigConversionOperation singleTagConfigError](self, "singleTagConfigError");
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id *v39;
  void *v40;
  id v41;
  id obj;
  id obja;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE6C950]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6C9A8], 13, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    if (!a6)
      goto LABEL_23;
    goto LABEL_22;
  }
  v40 = v9;
  v41 = v11;
  v38 = v10;
  v39 = a6;
  v13 = (void *)objc_opt_new();
  v46 = (void *)objc_opt_new();
  v45 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v37 = v12;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v50 != v16)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BE6D2F0], "sectionConfigWithJSONDictionary:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[NTTodayConfigConversionOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:](self, "_collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:", v18, v46, v45);
          if (objc_msgSend(v18, "queueMembershipsCount"))
          {
            v19 = 0;
            do
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v18, "queueMembershipAtIndex:", v19));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v21)
              {
                v21 = (void *)objc_opt_new();
                objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, v20);
              }
              objc_msgSend(v21, "addObject:", v18);

              ++v19;
            }
            while (v19 < objc_msgSend(v18, "queueMembershipsCount"));
          }
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v15);
  }

  v10 = v38;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v38);
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v41);
  v23 = objc_claimAutoreleasedReturnValue();
  obja = (id)v22;
  if ((objc_msgSend(v46, "isSubsetOfSet:", v22) & 1) == 0
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayConfigConversionOperation _todayConfigWithConfigJSON:articleListIDs:articleIDs:error:].cold.2();
  }
  v36 = (void *)v23;
  v9 = v40;
  if ((objc_msgSend(v45, "isSubsetOfSet:", v23) & 1) == 0
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayConfigConversionOperation _todayConfigWithConfigJSON:articleListIDs:articleIDs:error:].cold.1();
  }
  objc_msgSend(v13, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sortedArrayUsingSelector:", sel_compare_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __95__NTTodayConfigConversionOperation__todayConfigWithConfigJSON_articleListIDs_articleIDs_error___block_invoke;
  v47[3] = &unk_24DB5F8E8;
  v48 = v13;
  v35 = v13;
  objc_msgSend(v25, "fc_arrayByTransformingWithBlock:", v47);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x24BE6C7B0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x24BE6C758]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x24BE6C750]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x24BE6C748]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayConfigConversionOperation configuration](self, "configuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "todayConfigWithIdentifier:queueConfigs:backgroundColorLight:backgroundColorDark:audioIndicatorColor:", v27, v26, v28, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  a6 = v39;
  v11 = v41;
  v12 = v37;
  if (v39)
LABEL_22:
    *a6 = objc_retainAutorelease(v33);
LABEL_23:

  return v32;
}

id __95__NTTodayConfigConversionOperation__todayConfigWithConfigJSON_articleListIDs_articleIDs_error___block_invoke(uint64_t a1, void *a2)
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
    -[NTTodayConfigConversionOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayConfigConversionOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:].cold.1();
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

- (NSDictionary)widgetConfiguration
{
  return self->_widgetConfiguration;
}

- (void)setWidgetConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_widgetConfiguration, a3);
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (id)defaultConfigCompletionHandler
{
  return self->_defaultConfigCompletionHandler;
}

- (void)setDefaultConfigCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)singleTagConfigCompletionHandler
{
  return self->_singleTagConfigCompletionHandler;
}

- (void)setSingleTagConfigCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NTPBTodayConfig)resultDefaultConfig
{
  return self->_resultDefaultConfig;
}

- (void)setResultDefaultConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSError)defaultConfigError
{
  return self->_defaultConfigError;
}

- (void)setDefaultConfigError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NTPBTodayConfig)resultSingleTagConfig
{
  return self->_resultSingleTagConfig;
}

- (void)setResultSingleTagConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSError)singleTagConfigError
{
  return self->_singleTagConfigError;
}

- (void)setSingleTagConfigError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void)setNetworkEvents:(id)a3
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
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_singleTagConfigError, 0);
  objc_storeStrong((id *)&self->_resultSingleTagConfig, 0);
  objc_storeStrong((id *)&self->_defaultConfigError, 0);
  objc_storeStrong((id *)&self->_resultDefaultConfig, 0);
  objc_storeStrong(&self->_singleTagConfigCompletionHandler, 0);
  objc_storeStrong(&self->_defaultConfigCompletionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_widgetConfiguration, 0);
}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Today config conversion operation requires widgetConfiguration."));
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

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("articleIDs referenced in the JSON have to be included in the full list of article records"));
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
  v3 = "-[NTTodayConfigConversionOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]";
  v4 = 2080;
  v5 = "NTTodayConfigConversionOperation.m";
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
  v3 = "-[NTTodayConfigConversionOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]";
  v4 = 2080;
  v5 = "NTTodayConfigConversionOperation.m";
  v6 = 1024;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_2();
}

@end
