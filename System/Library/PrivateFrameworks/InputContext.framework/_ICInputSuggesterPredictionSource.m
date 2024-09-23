@implementation _ICInputSuggesterPredictionSource

- (void)hibernate
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICProactiveQuickTypeOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = CFSTR("_ICPeopleSuggestorPredictionSource");
    _os_log_impl(&dword_22716D000, v3, OS_LOG_TYPE_INFO, "%@: hibernating", (uint8_t *)&v5, 0xCu);
  }

  -[_ICInputSuggesterPredictionSource getPeopleSuggester](self, "getPeopleSuggester");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hibernate");

}

- (void)warmUp
{
  void *v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[_ICInputSuggesterPredictionSource getPeopleSuggester](self, "getPeopleSuggester");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ICProactiveQuickTypeOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412546;
    v5 = CFSTR("_ICPeopleSuggestorPredictionSource");
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_22716D000, v3, OS_LOG_TYPE_INFO, "%@:  warming up %@", (uint8_t *)&v4, 0x16u);
  }

  objc_msgSend(v2, "warmUp");
}

- (id)getPeopleSuggester
{
  void *v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[4];
  _DWORD v15[7];

  *(_QWORD *)&v15[5] = *MEMORY[0x24BDAC8D0];
  -[_ICInputSuggesterPredictionSource inputSuggester](self, "inputSuggester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
LABEL_2:
    -[_ICInputSuggesterPredictionSource inputSuggester](self, "inputSuggester");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[NSCondition lock](self->_peopleSuggestorLoadedCondition, "lock");
    -[_ICInputSuggesterPredictionSource inputSuggester](self, "inputSuggester");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSCondition unlock](self->_peopleSuggestorLoadedCondition, "unlock");
    }
    else
    {
      do
      {
        _ICProactiveQuickTypeOSLogFacility();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[_ICInputSuggesterPredictionSource getPeopleSuggester].cold.3(v14, v15, v9);

        -[NSCondition wait](self->_peopleSuggestorLoadedCondition, "wait");
        -[_ICInputSuggesterPredictionSource inputSuggester](self, "inputSuggester");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (!v10);
      -[NSCondition unlock](self->_peopleSuggestorLoadedCondition, "unlock");
      _ICProactiveQuickTypeOSLogFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_ICInputSuggesterPredictionSource getPeopleSuggester].cold.2(v11, v12, v13);

    }
    goto LABEL_2;
  }
  _ICProactiveQuickTypeOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_ICInputSuggesterPredictionSource getPeopleSuggester].cold.1(v5, v6, v7);

  return 0;
}

- (PSGInputSuggester)inputSuggester
{
  return (PSGInputSuggester *)objc_getProperty(self, a2, 40, 1);
}

- (_ICInputSuggesterPredictionSource)init
{
  _ICInputSuggesterPredictionSource *v2;
  _ICInputSuggesterPredictionSource *v3;
  NSString *name;
  NSCondition *v5;
  NSCondition *peopleSuggestorLoadedCondition;
  uint64_t v7;
  NSMutableArray *offered;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_ICInputSuggesterPredictionSource;
  v2 = -[_ICInputSuggesterPredictionSource init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)CFSTR("_ICInputSuggesterPredictionSource");

    v5 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    peopleSuggestorLoadedCondition = v3->_peopleSuggestorLoadedCondition;
    v3->_peopleSuggestorLoadedCondition = v5;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    offered = v3->_offered;
    v3->_offered = (NSMutableArray *)v7;

    _ICProactiveQuickTypeOSLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_ICInputSuggesterPredictionSource init].cold.1(v9, v10, v11);

    objc_initWeak(&location, v3);
    dispatch_get_global_queue(17, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __41___ICInputSuggesterPredictionSource_init__block_invoke;
    v14[3] = &unk_24EF717F8;
    objc_copyWeak(&v15, &location);
    dispatch_async(v12, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)name
{
  return self->_name;
}

- (BOOL)_populateError:(id *)a3 withExplanations:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *a3;
  if (!*a3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    v21 = (id)objc_opt_new();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __69___ICInputSuggesterPredictionSource__populateError_withExplanations___block_invoke;
    v15[3] = &unk_24EF71990;
    v15[4] = &v16;
    objc_msgSend(v5, "enumerateExplanationCodeWithBlock:", v15);
    if (objc_msgSend((id)v17[5], "count"))
    {
      objc_msgSend((id)v17[5], "componentsJoinedByString:", CFSTR(" "));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      v23[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.inputcontext.errors"), 5, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      _ICProactiveQuickTypeOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_ICInputSuggesterPredictionSource _populateError:withExplanations:].cold.2((uint64_t)v7, v10, v11);

    }
    else
    {
      _ICProactiveQuickTypeOSLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[_ICInputSuggesterPredictionSource _populateError:withExplanations:].cold.1(v7, v12, v13);
    }

    _Block_object_dispose(&v16, 8);
  }

  return v6 == 0;
}

- (id)_quickTypeQueryWithTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 errorWithExplanations:(id *)a7
{
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  PSGInputSuggester *inputSuggester;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v29[6];
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t v36[4];
  const __CFString *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v35 = 0;
  v33 = CFSTR("_ICPeopleSuggestorPredictionSource_quickTypeQueryWithQuery");
  v12 = mach_absolute_time();
  v34 = v12;
  _ICProactiveQuickTypeOSLogFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = CFSTR("_ICPeopleSuggestorPredictionSource");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_22716D000, v13, OS_LOG_TYPE_INFO, "%@: _quickTypeQueryWithQuery: %@", buf, 0x16u);
  }

  -[_ICInputSuggesterPredictionSource getPeopleSuggester](self, "getPeopleSuggester");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[_ICInputSuggesterPredictionSource requestFromTrigger:searchContext:](self, "requestFromTrigger:searchContext:", v10, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v41 = __Block_byref_object_copy__2;
    v42 = __Block_byref_object_dispose__2;
    v43 = 0;
    v30 = 0;
    v31[0] = &v30;
    v31[1] = 0x3032000000;
    v31[2] = __Block_byref_object_copy__2;
    v31[3] = __Block_byref_object_dispose__2;
    v32 = 0;
    inputSuggester = self->_inputSuggester;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __128___ICInputSuggesterPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke;
    v29[3] = &unk_24EF719B8;
    v29[4] = buf;
    v29[5] = &v30;
    -[PSGInputSuggester inputSuggestionsWithRequest:completion:](inputSuggester, "inputSuggestionsWithRequest:completion:", v15, v29);
    if (*(_QWORD *)(v31[0] + 40))
    {
      _ICProactiveQuickTypeOSLogFacility();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_ICInputSuggesterPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:].cold.3((uint64_t)v31, v17);

      *a7 = objc_retainAutorelease(*(id *)(v31[0] + 40));
      v18 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "explanationSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "responseItems");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count") == 0;

        if (v21)
        {
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "explanationSet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ICInputSuggesterPredictionSource _populateError:withExplanations:](self, "_populateError:withExplanations:", a7, v22);

        }
      }
      _ICProactiveQuickTypeOSLogFacility();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "responseItems");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");
        *(_DWORD *)v36 = 138412546;
        v37 = CFSTR("_ICPeopleSuggestorPredictionSource");
        v38 = 2048;
        v39 = v25;
        _os_log_impl(&dword_22716D000, v23, OS_LOG_TYPE_INFO, "%@: _quickTypeQueryWithTrigger got %lu items", v36, 0x16u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "responseItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _ICProactiveQuickTypeOSLogFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_ICInputSuggesterPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:].cold.2(v15);
    v18 = (void *)MEMORY[0x24BDBD1A8];
  }

  v26 = mach_absolute_time();
  _ICMachTimeToNanoseconds(v26 - v12);
  _ICProactiveQuickTypeOSLogFacility();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[_ICInputSuggesterPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:].cold.1();

  return v18;
}

- (void)predictedItemsWithProactiveTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 handler:(id)a7
{
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _ICProactiveTrigger *v20;
  void *v21;
  _ICProactiveTrigger *v22;
  void *v23;
  _ICPredictedItem *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _ICPredictedItem *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void (**v37)(id, void *, id);
  id v38;
  id v39;
  id obj;
  id v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49[4];
  const __CFString *v50;
  const __CFString *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v42 = a4;
  v37 = (void (**)(id, void *, id))a7;
  v49[3] = 0;
  v49[1] = CFSTR("_ICPeopleSuggestorPredictionSource_predictedItemsWithProactiveTrigger");
  v36 = (void *)mach_absolute_time();
  v49[2] = v36;
  _ICProactiveQuickTypeOSLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_ICInputSuggesterPredictionSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:].cold.2(v11, v12, v13);

  v49[0] = 0;
  -[_ICInputSuggesterPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:](self, "_quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:", v39, v42, a5, a6, v49);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v49[0];
  v15 = objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  v43 = (void *)v15;
  if (v16)
  {
    v44 = *(_QWORD *)v46;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v46 != v44)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
        objc_msgSend(v18, "textualResponseSuggestion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = [_ICProactiveTrigger alloc];
          v50 = CFSTR("type");
          v51 = CFSTR("SmartReply");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[_ICProactiveTrigger initWithSource:attributes:](v20, "initWithSource:attributes:", 0, v21);

          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = [_ICPredictedItem alloc];
          objc_msgSend(v18, "textualResponseSuggestion");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "responseText");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "textualResponseSuggestion");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "responseCategory");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "applicationBundleIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LOWORD(v35) = 0;
          v30 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:](v24, "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", CFSTR("SmartReply"), 0, v26, v28, 0, v23, 1.0, v29, 0, 30, v35, 0, 0, v22);

          objc_msgSend(v43, "addObject:", v30);
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(v18, "structuredInfoSuggestion");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v18, "structuredInfoSuggestion");
          v22 = (_ICProactiveTrigger *)objc_claimAutoreleasedReturnValue();
          -[_ICInputSuggesterPredictionSource _getPredictedItemFromStructuredInfo:](self, "_getPredictedItemFromStructuredInfo:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v43, "addObject:", v23);
          goto LABEL_10;
        }
LABEL_11:
        ++v17;
      }
      while (v16 != v17);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      v16 = v32;
    }
    while (v32);
  }

  v37[2](v37, v43, v38);
  v33 = mach_absolute_time();
  _ICMachTimeToNanoseconds(v33 - (_QWORD)v36);
  _ICProactiveQuickTypeOSLogFacility();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    -[_ICInputSuggesterPredictionSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:].cold.1();

}

- (id)_getPredictedItemFromStructuredInfo:(id)a3
{
  id v3;
  void *v4;
  _ICProactiveTrigger *v5;
  void *v6;
  _ICProactiveTrigger *v7;
  void *v8;
  void *v9;
  _ICPredictedItem *v10;
  void *v11;
  _ICPredictedItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(v3, "proactiveTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [_ICProactiveTrigger alloc];
  objc_msgSend(v4, "triggerAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_ICProactiveTrigger initWithSource:attributes:](v5, "initWithSource:attributes:", 0, v6);

  objc_msgSend(v3, "portraitItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "portraitItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[_ICPredictedItem predictedItemFromQuickTypeItem:trigger:](_ICPredictedItem, "predictedItemFromQuickTypeItem:trigger:", v9, v7);
    v10 = (_ICPredictedItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "operationalItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [_ICPredictedItem alloc];
    objc_msgSend(v9, "itemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "operationData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v19) = 0;
    v10 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:](v12, "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", v13, 1, v14, 0, 0, v11, 1.0, v15, 0, 30, v19, 0, v16, v7);

    -[_ICPredictedItem identifier](v10, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v17, "isEqualToString:", CFSTR("surf"));

    if ((_DWORD)v14)
      -[_ICPredictedItem setLayoutHint:](v10, "setLayoutHint:", 1);

  }
  return v10;
}

- (id)requestFromTrigger:(id)a3 searchContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a3;
  v6 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputContextHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "inputContextHistory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "mostRecentTextEntryIsByMe") & 1) != 0)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend(v8, "mostRecentNonSenderTextEntry");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __70___ICInputSuggesterPredictionSource_requestFromTrigger_searchContext___block_invoke;
    v26[3] = &unk_24EF719E0;
    v26[4] = &v27;
    objc_msgSend(v8, "enumerateAllEntries:", v26);

  }
  else
  {
    v23 = 0;
  }
  v9 = objc_alloc(MEMORY[0x24BE79A40]);
  v21 = v28[5];
  v20 = objc_msgSend(v6, "shouldDisableAutoCaps");
  v19 = objc_msgSend(v6, "isResponseContextDenylisted");
  objc_msgSend(v5, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v25, "length");
  if (v24)
  {
    objc_msgSend(v5, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v6, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputContextHistory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recipientNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableApps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v9, "initWithResponseContext:conversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:", v23, v21, 0, v20, v19, v22, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v10, v11, v12,
                  v14,
                  v15,
                  v16,
                  3,
                  2,
                  3);

  if (v24)
  _Block_object_dispose(&v27, 8);

  return v17;
}

- (void)logImpressionForPredictedValues:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE79A30];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMetricForEventType:externalMetadata:predictedValues:", 0, 0, v4);

}

- (void)logEngagementForPredictedValues:(id)a3 position:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE79A30];
  v6 = a3;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE79AA8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logMetricForEventType:externalMetadata:predictedValues:", 1, v9, v6);

}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  int v5;
  id v7;
  void *v8;
  NSObject *v9;
  NSUInteger v10;
  PSGInputSuggester *inputSuggester;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *offered;
  NSObject *v16;
  NSArray *v17;
  NSArray *prevOffered;
  uint64_t v19;
  _QWORD v20[2];

  v5 = a4;
  v20[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  if (v5 == 3)
  {
    v14 = objc_msgSend(v7, "length");
    offered = self->_offered;
    if (v14)
    {
      -[NSMutableArray addObject:](offered, "addObject:", v8);
    }
    else
    {
      if (-[NSMutableArray count](offered, "count"))
      {
        -[PSGInputSuggester logMetricForEventType:externalMetadata:predictedValues:](self->_inputSuggester, "logMetricForEventType:externalMetadata:predictedValues:", 0, 0, self->_offered);
        _ICProactiveQuickTypeOSLogFacility();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[_ICInputSuggesterPredictionSource provideFeedbackForString:type:style:].cold.2((id *)&self->_offered, v16);

      }
      v17 = (NSArray *)-[NSMutableArray copy](self->_offered, "copy");
      prevOffered = self->_prevOffered;
      self->_prevOffered = v17;

      -[NSMutableArray removeAllObjects](self->_offered, "removeAllObjects");
    }
  }
  else if (v5 == 1)
  {
    _ICProactiveQuickTypeOSLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_ICInputSuggesterPredictionSource provideFeedbackForString:type:style:].cold.1(v8, v9);

    v10 = -[NSArray indexOfObject:](self->_prevOffered, "indexOfObject:", v8);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      inputSuggester = self->_inputSuggester;
      v19 = *MEMORY[0x24BE79AA8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSGInputSuggester logMetricForEventType:externalMetadata:predictedValues:](inputSuggester, "logMetricForEventType:externalMetadata:predictedValues:", 1, v13, self->_prevOffered);

    }
  }

}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a3;
  objc_msgSend(v6, "stringWithUTF8String:", "SpeedMetric");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    -[PSGInputSuggester logMetricForEventType:externalMetadata:predictedValues:](self->_inputSuggester, "logMetricForEventType:externalMetadata:predictedValues:", 2, v10, 0);

}

- (BOOL)doesSupportTriggerSourceType:(unsigned __int8)a3
{
  return a3 == 3;
}

- (void)setInputSuggester:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSuggester, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_prevOffered, 0);
  objc_storeStrong((id *)&self->_offered, 0);
  objc_storeStrong((id *)&self->_peopleSuggestorLoadedCondition, 0);
}

- (void)init
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("_ICPeopleSuggestorPredictionSource");
  OUTLINED_FUNCTION_3(&dword_22716D000, a1, a3, "%@: Getting People Suggester shared instance (asynchronously)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)getPeopleSuggester
{
  *(_DWORD *)a1 = 138412290;
  *a2 = CFSTR("_ICPeopleSuggestorPredictionSource");
  OUTLINED_FUNCTION_3(&dword_22716D000, a3, (uint64_t)a3, "%@: Request for uninitialized People Suggester on a background thread, waiting", a1);
}

- (void)_populateError:(uint64_t)a3 withExplanations:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("_ICPeopleSuggestorPredictionSource");
  OUTLINED_FUNCTION_3(&dword_22716D000, a1, a3, "%@: ERROR:ProactiveQuickType:IC: No results but no explanation", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_populateError:(uint64_t)a3 withExplanations:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = CFSTR("_ICPeopleSuggestorPredictionSource");
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_8(&dword_22716D000, a2, a3, "%@: ERROR:ProactiveQuickType:IC: No results with the explantaion: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_22716D000, v0, v1, "_ICScales: %@ took %f seconds", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

- (void)_quickTypeQueryWithTrigger:(os_log_t)log searchContext:limit:timeoutInMilliseconds:errorWithExplanations:.cold.2(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = CFSTR("_ICPeopleSuggestorPredictionSource");
  _os_log_error_impl(&dword_22716D000, log, OS_LOG_TYPE_ERROR, "%@: failed to get People Suggestor!", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)_quickTypeQueryWithTrigger:(uint64_t)a1 searchContext:(NSObject *)a2 limit:timeoutInMilliseconds:errorWithExplanations:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412546;
  v4 = CFSTR("_ICPeopleSuggestorPredictionSource");
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_22716D000, a2, OS_LOG_TYPE_ERROR, "%@: inputSuggestionsForRequest error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_22716D000, v0, v1, "_ICScales: %@ took %f seconds", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

- (void)predictedItemsWithProactiveTrigger:(uint64_t)a3 searchContext:limit:timeoutInMilliseconds:handler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("_ICPeopleSuggestorPredictionSource");
  OUTLINED_FUNCTION_3(&dword_22716D000, a1, a3, "%@: sending quick type call to PeopleSuggestor", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)provideFeedbackForString:(void *)a1 type:(NSObject *)a2 style:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_3(&dword_22716D000, a2, v3, "Feedback Accepted by _ICInputSuggesterPredictionSource with string length = %lu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7();
}

- (void)provideFeedbackForString:(id *)a1 type:(NSObject *)a2 style:.cold.2(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*a1, "count");
  v5 = 134217984;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_22716D000, a2, v4, "Feedback Offered by _ICInputSuggesterPredictionSource with strings count = %lu", (uint8_t *)&v5);
  OUTLINED_FUNCTION_7();
}

@end
