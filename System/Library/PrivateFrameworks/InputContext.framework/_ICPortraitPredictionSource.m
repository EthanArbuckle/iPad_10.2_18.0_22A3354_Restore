@implementation _ICPortraitPredictionSource

- (void)hibernate
{
  NSObject *v2;
  uint8_t v3[16];

  _ICProactiveQuickTypeOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22716D000, v2, OS_LOG_TYPE_INFO, "_ICPPSource hibernating", v3, 2u);
  }

}

- (void)warmUp
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[_ICPortraitPredictionSource getPPBroker](self, "getPPBroker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ICProactiveQuickTypeOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v2;
    _os_log_impl(&dword_22716D000, v3, OS_LOG_TYPE_INFO, "_ICPPSource warming up %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37___ICPortraitPredictionSource_warmUp__block_invoke;
  v5[3] = &unk_24EF71548;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v4, "warmUpWithCompletion:", v5);

}

- (id)getPPBroker
{
  void *v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10;
  _BYTE v11[15];

  -[_ICPortraitPredictionSource ppBroker](self, "ppBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
LABEL_2:
    -[_ICPortraitPredictionSource ppBroker](self, "ppBroker");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[NSCondition lock](self->_ppBrokerLoadedCondition, "lock");
    -[_ICPortraitPredictionSource ppBroker](self, "ppBroker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSCondition unlock](self->_ppBrokerLoadedCondition, "unlock");
    }
    else
    {
      do
      {
        _ICProactiveQuickTypeOSLogFacility();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[_ICPortraitPredictionSource getPPBroker].cold.3(&v10, v11, v7);

        -[NSCondition wait](self->_ppBrokerLoadedCondition, "wait");
        -[_ICPortraitPredictionSource ppBroker](self, "ppBroker");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (!v8);
      -[NSCondition unlock](self->_ppBrokerLoadedCondition, "unlock");
      _ICProactiveQuickTypeOSLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[_ICPortraitPredictionSource getPPBroker].cold.2();

    }
    goto LABEL_2;
  }
  _ICProactiveQuickTypeOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_ICPortraitPredictionSource getPPBroker].cold.1();

  return 0;
}

- (PPQuickTypeBroker)ppBroker
{
  return (PPQuickTypeBroker *)objc_getProperty(self, a2, 24, 1);
}

- (_ICPortraitPredictionSource)init
{
  _ICPortraitPredictionSource *v2;
  _ICPortraitPredictionSource *v3;
  NSString *name;
  NSCondition *v5;
  NSCondition *ppBrokerLoadedCondition;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  _ICPortraitPredictionSource *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_ICPortraitPredictionSource;
  v2 = -[_ICPortraitPredictionSource init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)CFSTR("_ICPortraitPredictionSource");

    v5 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    ppBrokerLoadedCondition = v3->_ppBrokerLoadedCondition;
    v3->_ppBrokerLoadedCondition = v5;

    _ICProactiveQuickTypeOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[_ICPortraitPredictionSource init].cold.1();

    objc_initWeak(&location, v3);
    dispatch_get_global_queue(17, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35___ICPortraitPredictionSource_init__block_invoke;
    block[3] = &unk_24EF71650;
    objc_copyWeak(&v12, &location);
    v11 = v3;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)_makePPQuickTypeBroker
{
  if (_makePPQuickTypeBroker_onceToken != -1)
    dispatch_once(&_makePPQuickTypeBroker_onceToken, &__block_literal_global_0);
  return (id)_makePPQuickTypeBroker_broker;
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
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *a3;
  if (!*a3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    v18 = (id)objc_opt_new();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63___ICPortraitPredictionSource__populateError_withExplanations___block_invoke;
    v12[3] = &unk_24EF71710;
    v12[4] = &v13;
    objc_msgSend(v5, "enumerateWithBlock:", v12);
    if (objc_msgSend((id)v14[5], "count"))
    {
      objc_msgSend((id)v14[5], "componentsJoinedByString:", CFSTR(" "));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0FC8];
      v20[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.inputcontext.errors"), 5, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      _ICProactiveQuickTypeOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_ICPortraitPredictionSource _populateError:withExplanations:].cold.2((uint64_t)v7, v10);

    }
    else
    {
      _ICProactiveQuickTypeOSLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[_ICPortraitPredictionSource _populateError:withExplanations:].cold.1();
    }

    _Block_object_dispose(&v13, 8);
  }

  return v6 == 0;
}

- (id)_quickTypeQueryWithQuery:(id)a3 limit:(unint64_t)a4 timeoutInMilliseconds:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  _QWORD v30[4];
  NSObject *v31;
  __int128 *p_buf;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t v36[4];
  uint64_t v37;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v35 = 0;
  v33 = CFSTR("_ICPPSource_quickTypeQueryWithQuery");
  v9 = mach_absolute_time();
  v34 = v9;
  _ICProactiveQuickTypeOSLogFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_22716D000, v10, OS_LOG_TYPE_INFO, "_ICPPSource _quickTypeQueryWithQuery: %@", (uint8_t *)&buf, 0xCu);
  }

  -[_ICPortraitPredictionSource getPPBroker](self, "getPPBroker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__0;
    v41 = __Block_byref_object_dispose__0;
    v42 = 0;
    v12 = dispatch_semaphore_create(0);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __84___ICPortraitPredictionSource__quickTypeQueryWithQuery_limit_timeoutInMilliseconds___block_invoke;
    v30[3] = &unk_24EF71738;
    p_buf = &buf;
    v13 = v12;
    v31 = v13;
    objc_msgSend(v11, "quickTypeItemsWithQuery:limit:completion:", v8, a4, v30);
    v14 = dispatch_time(0, 1000000 * a5);
    if (dispatch_semaphore_wait(v13, v14))
    {
      _ICProactiveQuickTypeOSLogFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:].cold.3(a5, v15, v16, v17, v18, v19, v20, v21);

      v22 = (id)MEMORY[0x24BDBD1A8];
    }
    else
    {
      _ICProactiveQuickTypeOSLogFacility();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
        *(_DWORD *)v36 = 134217984;
        v37 = v25;
        _os_log_impl(&dword_22716D000, v24, OS_LOG_TYPE_INFO, "_ICPPSource _quickTypeQueryWithQuery got %lu items", v36, 0xCu);
      }

      v22 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    _ICProactiveQuickTypeOSLogFacility();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:].cold.2();

    v22 = (id)MEMORY[0x24BDBD1A8];
  }

  v26 = mach_absolute_time();
  v27 = _ICMachTimeToNanoseconds(v26 - v9);
  _ICProactiveQuickTypeOSLogFacility();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:].cold.1(v27);

  return v22;
}

- (id)_quickTypeQueryWithTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 errorWithExplanations:(id *)a7
{
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  dispatch_time_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  NSObject *v53;
  id v57;
  _QWORD v58[5];
  NSObject *v59;
  __int128 *v60;
  uint64_t *v61;
  _QWORD v62[5];
  NSObject *v63;
  __int128 *p_buf;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  const __CFString *v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t v75[4];
  uint64_t v76;
  void *v77;
  __int128 buf;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v57 = a4;
  v74 = 0;
  v72 = CFSTR("_ICPPSource_quickTypeQueryWithTrigger");
  v11 = mach_absolute_time();
  v73 = v11;
  _ICProactiveQuickTypeOSLogFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_22716D000, v12, OS_LOG_TYPE_INFO, "_ICPPSource _quickTypeQueryWithTrigger: %@", (uint8_t *)&buf, 0xCu);
  }

  -[_ICPortraitPredictionSource getPPBroker](self, "getPPBroker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__0;
    v81 = __Block_byref_object_dispose__0;
    v82 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__0;
    v70 = __Block_byref_object_dispose__0;
    v71 = 0;
    v14 = dispatch_semaphore_create(0);
    objc_msgSend(v10, "attributedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("contextBeforeInput"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = isPqt1ForContactAutofillEnabled();
    if (v16)
      v18 = v17;
    else
      v18 = 0;
    if (v18 == 1)
    {
      objc_msgSend(v10, "contentType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v10, "attributedString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("contextBeforeInput"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21 == 0;

        if (!v22)
        {
          objc_msgSend(v10, "contentType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("email"));

          if ((v24 & 1) != 0)
          {
            v25 = 2;
          }
          else
          {
            objc_msgSend(v10, "contentType");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("tel"));

            if ((v33 & 1) != 0)
            {
              v25 = 1;
            }
            else
            {
              objc_msgSend(v10, "contentType");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("street-address"));

              if (v35)
                v25 = 4;
              else
                v25 = 0;
            }
          }
          v36 = (void *)MEMORY[0x24BE71B38];
          objc_msgSend(v10, "attributedString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKey:", CFSTR("contextBeforeInput"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v38;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "quickTypeQueryWithType:subtype:semanticTag:fields:time:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 1, 2, 0, v25, 0, 0, 0, v39, 0, 0, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v62[0] = MEMORY[0x24BDAC760];
          v62[1] = 3221225472;
          v62[2] = __122___ICPortraitPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke;
          v62[3] = &unk_24EF71760;
          p_buf = &buf;
          v62[4] = self;
          v65 = &v66;
          v63 = v14;
          objc_msgSend(v13, "quickTypeItemsWithQuery:limit:completion:", v40, 100, v62);

        }
      }
    }
    else
    {
      objc_msgSend(v10, "attributedString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "locale");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "recipients");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "applicationBundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = __122___ICPortraitPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke_2;
      v58[3] = &unk_24EF71760;
      v60 = &buf;
      v58[4] = self;
      v61 = &v66;
      v59 = v14;
      objc_msgSend(v13, "quickTypeItemsWithLanguageModelingTokens:localeIdentifier:recipients:bundleIdentifier:limit:completion:", v28, v29, v30, v31, a5, v58);

    }
    v41 = dispatch_time(0, 1000000 * a6);
    if (dispatch_semaphore_wait(v14, v41))
    {
      _ICProactiveQuickTypeOSLogFacility();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[_ICPortraitPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:].cold.3(a6, v42, v43, v44, v45, v46, v47, v48);

      v27 = (id)MEMORY[0x24BDBD1A8];
    }
    else
    {
      _ICProactiveQuickTypeOSLogFacility();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
        *(_DWORD *)v75 = 134217984;
        v76 = v50;
        _os_log_impl(&dword_22716D000, v49, OS_LOG_TYPE_INFO, "_ICPPSource _quickTypeQueryWithTrigger got %lu items", v75, 0xCu);
      }

      if (*a7)
        *a7 = objc_retainAutorelease((id)v67[5]);
      v27 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    }

    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    _ICProactiveQuickTypeOSLogFacility();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:].cold.2();

    v27 = (id)MEMORY[0x24BDBD1A8];
  }

  v51 = mach_absolute_time();
  v52 = _ICMachTimeToNanoseconds(v51 - v11);
  _ICProactiveQuickTypeOSLogFacility();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    -[_ICPortraitPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:].cold.1(v52);

  return v27;
}

- (void)predictedItemsWithProactiveTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 handler:(id)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  void (**v26)(id, void *, id);
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33[4];
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v28 = a4;
  v26 = (void (**)(id, void *, id))a7;
  v33[3] = 0;
  v33[1] = CFSTR("_ICPPPredictionSource_predictedItemsWithProactiveTrigger");
  v25 = (void *)mach_absolute_time();
  v33[2] = v25;
  _ICProactiveQuickTypeOSLogFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_ICPortraitPredictionSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:].cold.2();

  v33[0] = 0;
  -[_ICPortraitPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:](self, "_quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:", v12, v28, a5, a6, v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v33[0];
  v15 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v16);
        +[_ICPredictedItem predictedItemFromQuickTypeItem:trigger:](_ICPredictedItem, "predictedItemFromQuickTypeItem:trigger:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19), v12, v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          _ICProactiveQuickTypeOSLogFacility();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v20;
            _os_log_debug_impl(&dword_22716D000, v21, OS_LOG_TYPE_DEBUG, "DEBUG:IC:Predictions: PP result: %@", buf, 0xCu);
          }

          objc_msgSend(v15, "addObject:", v20);
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v17);
  }

  v26[2](v26, v15, v27);
  v22 = mach_absolute_time();
  v23 = _ICMachTimeToNanoseconds(v22 - (_QWORD)v25);
  _ICProactiveQuickTypeOSLogFacility();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[_ICPortraitPredictionSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:].cold.1(v23);

}

- (void)searchForMeCardRegionsWithTimeout:(unint64_t)a3 handler:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  NSObject *v36;
  uint64_t v37;
  unint64_t v38;
  NSObject *v39;
  uint64_t v40;
  void (**v41)(id, void *);
  void *v42;
  id obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CFString *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v41 = (void (**)(id, void *))a4;
  v55 = 0;
  v53 = CFSTR("_ICPPPredictionSource_searchForMeCardRegionsWithTimeout");
  v40 = mach_absolute_time();
  v54 = v40;
  objc_msgSend(MEMORY[0x24BE71B38], "quickTypeQueryWithType:subtype:semanticTag:fields:time:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 1, 1, 0, 0x200000, 0, 0, 0, 0, 0, 0, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  _ICProactiveQuickTypeOSLogFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_ICPortraitPredictionSource searchForMeCardRegionsWithTimeout:handler:].cold.3();

  -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:](self, "_quickTypeQueryWithQuery:limit:timeoutInMilliseconds:", v42, 10, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v50;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
        objc_msgSend(v12, "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length") == 0;

        if (!v14)
        {
          objc_msgSend(v12, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("|"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "count") == 3)
          {
            objc_msgSend(v16, "objectAtIndex:", 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "length"))
              goto LABEL_13;
            objc_msgSend(v16, "objectAtIndex:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "length"))
            {

LABEL_13:
LABEL_14:
              objc_msgSend(v12, "label");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20)
              {
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "label");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKey:", v20, v21);

                objc_msgSend(v16, "objectAtIndex:", 0);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v22, "length"))
                  objc_msgSend(v20, "setValue:forKey:", v22, CFSTR("City"));
                objc_msgSend(v16, "objectAtIndex:", 1);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v23, "length"))
                  objc_msgSend(v20, "setValue:forKey:", v23, CFSTR("Province"));
                objc_msgSend(v16, "objectAtIndex:", 2);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v24, "length"))
                  objc_msgSend(v20, "setValue:forKey:", v24, CFSTR("Country"));

              }
            }
            else
            {
              objc_msgSend(v16, "objectAtIndex:", 2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "length") == 0;

              if (!v26)
                goto LABEL_14;
            }
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      v9 = v27;
    }
    while (v27);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v8, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v46 != v30)
          objc_enumerationMutation(v28);
        v32 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setValue:forKey:", v32, CFSTR("ContactLabel"));
        objc_msgSend(v44, "addObject:", v33);

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    }
    while (v29);
  }

  v41[2](v41, v44);
  v34 = mach_absolute_time();
  v35 = _ICMachTimeToNanoseconds(v34 - v40);
  _ICProactiveQuickTypeOSLogFacility();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    -[_ICPortraitPredictionSource searchForMeCardRegionsWithTimeout:handler:].cold.1(v35);

  if (!v35)
  {
    v37 = mach_absolute_time();
    v38 = _ICMachTimeToNanoseconds(v37 - v40);
    _ICProactiveQuickTypeOSLogFacility();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[_ICPortraitPredictionSource searchForMeCardRegionsWithTimeout:handler:].cold.1(v38);

  }
}

- (void)searchForMeCardEmailAddressesWithTimeout:(unint64_t)a3 handler:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  v26 = 0;
  v24 = CFSTR("_ICPPPredictionSource_searchForMeCardEmailAddressesWithTimeout");
  v7 = mach_absolute_time();
  v25 = v7;
  objc_msgSend(MEMORY[0x24BE71B38], "quickTypeQueryWithType:subtype:semanticTag:fields:time:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ICProactiveQuickTypeOSLogFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_ICPortraitPredictionSource searchForMeCardEmailAddressesWithTimeout:handler:].cold.2();

  -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:](self, "_quickTypeQueryWithQuery:limit:timeoutInMilliseconds:", v8, 10, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v13);
  }

  v6[2](v6, v11);
  v17 = mach_absolute_time();
  v18 = _ICMachTimeToNanoseconds(v17 - v7);
  _ICProactiveQuickTypeOSLogFacility();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[_ICPortraitPredictionSource searchForMeCardEmailAddressesWithTimeout:handler:].cold.1(v18);

}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  int v5;
  int v6;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v6 == 3)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithOfferedString:", v8);
LABEL_15:
    v10 = v9;
    _ICProactiveQuickTypeOSLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_ICPortraitPredictionSource provideFeedbackForString:type:style:].cold.1(v5, v6, v11);

    -[PPQuickTypeBroker registerFeedback:completion:](self->_ppBroker, "registerFeedback:completion:", v10, 0);
    goto LABEL_18;
  }
  if (v6 == 1 && v5 == 1)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithExplicitlyEngagedString:", v8);
    goto LABEL_15;
  }
  if (v6 == 1 && v5 == 2)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithImplicitlyEngagedString:", v8);
    goto LABEL_15;
  }
  if (v6 == 2 && v5 == 1)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithExplicitlyRejectedString:", v8);
    goto LABEL_15;
  }
  if (v6 == 2 && v5 == 2)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithImplicitlyRejectedString:", v8);
    goto LABEL_15;
  }
  _ICProactiveQuickTypeOSLogFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[_ICPortraitPredictionSource provideFeedbackForString:type:style:].cold.2(v6, v5, v10);
LABEL_18:

}

- (BOOL)doesSupportTriggerSourceType:(unsigned __int8)a3
{
  return a3 != 3;
}

- (void)setPpBroker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ppBroker, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ppBrokerLoadedCondition, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "Getting PP Broker shared instance (asynchrnously)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getPPBroker
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_22716D000, log, OS_LOG_TYPE_DEBUG, "Request for uninitialized PP Broker on a background thread, waiting", buf, 2u);
}

- (void)_populateError:withExplanations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "ERROR:ProactiveQuickType:IC: No results but no explanation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_populateError:(uint64_t)a1 withExplanations:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_22716D000, a2, OS_LOG_TYPE_DEBUG, "ERROR:ProactiveQuickType:IC: No results with the explantaion: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)_quickTypeQueryWithQuery:(unint64_t)a1 limit:timeoutInMilliseconds:.cold.1(unint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_6_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22716D000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_quickTypeQueryWithQuery:limit:timeoutInMilliseconds:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_22716D000, v0, v1, "_ICPPSource failed to get PP Broker!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_quickTypeQueryWithQuery:(uint64_t)a3 limit:(uint64_t)a4 timeoutInMilliseconds:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_22716D000, a2, a3, "_ICPPSource _quickTypeQueryWithQuery timed out after %lu ms", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_quickTypeQueryWithTrigger:(unint64_t)a1 searchContext:limit:timeoutInMilliseconds:errorWithExplanations:.cold.1(unint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_6_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22716D000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_quickTypeQueryWithTrigger:(uint64_t)a3 searchContext:(uint64_t)a4 limit:(uint64_t)a5 timeoutInMilliseconds:(uint64_t)a6 errorWithExplanations:(uint64_t)a7 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_22716D000, a2, a3, "_ICPPSource _quickTypeQueryWithTrigger timed out after %lu ms", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)predictedItemsWithProactiveTrigger:(unint64_t)a1 searchContext:limit:timeoutInMilliseconds:handler:.cold.1(unint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_6_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22716D000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "DEBUG:IC:predictedItemsWithProactiveTrigger: sending quick type call to PP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)searchForMeCardRegionsWithTimeout:(unint64_t)a1 handler:.cold.1(unint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_6_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22716D000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)searchForMeCardRegionsWithTimeout:handler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "DEBUG:IC:searchForMeCardRegionsWithTimeout: sending quick type call to PP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)searchForMeCardEmailAddressesWithTimeout:(unint64_t)a1 handler:.cold.1(unint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_6_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22716D000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)searchForMeCardEmailAddressesWithTimeout:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "DEBUG:IC:searchForMeCardEmailAddressesWithTimeout: sending quick type call to PP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)provideFeedbackForString:(unsigned __int8)a1 type:(int)a2 style:(os_log_t)log .cold.1(unsigned __int8 a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a2;
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl(&dword_22716D000, log, OS_LOG_TYPE_DEBUG, "Feedback received by _ICPortraitPredictionSource with known type and style: %d / %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_5();
}

- (void)provideFeedbackForString:(int)a1 type:(int)a2 style:(os_log_t)log .cold.2(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_22716D000, log, OS_LOG_TYPE_ERROR, "Error: feedback received by _ICPortraitPredictionSource with unknown type or style: %d / %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_5();
}

@end
