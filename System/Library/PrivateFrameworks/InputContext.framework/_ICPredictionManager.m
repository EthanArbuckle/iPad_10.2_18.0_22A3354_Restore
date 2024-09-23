@implementation _ICPredictionManager

- (void)reset
{
  id v2;

  -[_ICPredictionManager cache](self, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

}

- (_ICResultCache)cache
{
  return (_ICResultCache *)objc_getProperty(self, a2, 32, 1);
}

- (void)hibernate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "DEBUG:IC:Predictions: hibernate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)warmUp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "DEBUG:IC:Predictions: warmUp start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (_ICPredictionManager)initWithPredictionSources:(id)a3
{
  id v5;
  _ICPredictionManager *v6;
  _ICResultCache *v7;
  _ICResultCache *cache;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *serialQueue;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_ICPredictionManager;
  v6 = -[_ICPredictionManager init](&v18, sel_init);
  if (v6)
  {
    v7 = -[_ICResultCache initWithTTL:]([_ICResultCache alloc], "initWithTTL:", 180.0);
    cache = v6->_cache;
    v6->_cache = v7;

    if (v5)
      objc_storeStrong((id *)&v6->_predictionSources, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.inputcontext.predictionmanager."), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutorelease(v13);
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), v10);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v15;

  }
  return v6;
}

- (id)searchWithTrigger:(id)a3 searchContext:(id)a4 timeoutInMilliseconds:(int)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  _QWORD block[4];
  void (**v24)(_QWORD, _QWORD);
  _QWORD v25[5];
  id v26;
  id v27;
  int v28;

  v10 = a3;
  v11 = a4;
  v12 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __84___ICPredictionManager_searchWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke;
  v25[3] = &unk_24EF715B0;
  v25[4] = self;
  v13 = v10;
  v26 = v13;
  v14 = v11;
  v27 = v14;
  v28 = a5;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x2276AC454](v25);
  if (objc_msgSend(v13, "triggerSourceType") == 3)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE5EE00]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "isEqual:", v18);

  if (!v19)
  {
LABEL_4:
    ((void (**)(_QWORD, id *))v15)[2](v15, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_get_global_queue(-32768, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __84___ICPredictionManager_searchWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke_2;
    block[3] = &unk_24EF715D8;
    v24 = v15;
    dispatch_async(v20, block);

    v21 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v21;
}

- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 timeoutInMilliseconds:(int)a7 resultLimit:(int)a8 error:(id *)a9
{
  return -[_ICPredictionManager searchWithTriggers:application:recipient:localeIdentifier:isResponseDenyListed:shouldDisableAutoCaps:timeoutInMilliseconds:resultLimit:error:](self, "searchWithTriggers:application:recipient:localeIdentifier:isResponseDenyListed:shouldDisableAutoCaps:timeoutInMilliseconds:resultLimit:error:", a3, a4, a5, a6, 0, 0, __PAIR64__(a8, a7), a9);
}

- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 isResponseDenyListed:(BOOL)a7 shouldDisableAutoCaps:(BOOL)a8 timeoutInMilliseconds:(int)a9 resultLimit:(int)a10 error:(id *)a11
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id *v39;
  uint64_t k;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t m;
  void *v46;
  double v47;
  id v48;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  _ICSearchContext *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v11 = a8;
  v12 = a7;
  v68 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  if (objc_msgSend(v18, "length") || objc_msgSend(v19, "length") || objc_msgSend(v20, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
      objc_msgSend(v21, "addObject:", v19);
    v56 = -[_ICSearchContext initWithLocale:recipients:applicationBundleIdentifier:isResponseContextDenylisted:shouldDisableAutoCaps:]([_ICSearchContext alloc], "initWithLocale:recipients:applicationBundleIdentifier:isResponseContextDenylisted:shouldDisableAutoCaps:", v20, v21, v18, v12, v11);

  }
  else
  {
    v56 = 0;
  }
  v51 = v20;
  v52 = v19;
  v53 = v18;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v22 = v17;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  v57 = v22;
  v50 = a10;
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v63 != v26)
          objc_enumerationMutation(v22);
        -[_ICResultCache searchWithTrigger:](self->_cache, "searchWithTrigger:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i), v50);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");
        if (v29 >= 1)
        {
          v30 = v29;
          if (!v25)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a10);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (v30 >= a10)
            v31 = a10;
          else
            v31 = v30;
          if (v31)
          {
            for (j = 0; j != v31; ++j)
            {
              objc_msgSend(v28, "objectAtIndex:", j);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v33);

            }
            v22 = v57;
          }
        }

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v24);
  }
  else
  {
    v25 = 0;
  }

  if (objc_msgSend(v25, "count"))
  {
    v34 = v53;
  }
  else
  {
    -[_ICResultCache clear](self->_cache, "clear");
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v35 = v22;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    v34 = v53;
    if (v36)
    {
      v37 = v36;
      v54 = *(_QWORD *)v59;
      v38 = (int)v50;
      v39 = a11;
      while (2)
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v59 != v54)
            objc_enumerationMutation(v35);
          -[_ICPredictionManager searchWithTrigger:searchContext:timeoutInMilliseconds:error:](self, "searchWithTrigger:searchContext:timeoutInMilliseconds:error:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k), v56, a9, v39, v50);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count");
          if (v42)
          {
            v43 = v42;
            if (!v25)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v38);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (v43 >= v38)
              v44 = v38;
            else
              v44 = v43;
            if (v44)
            {
              for (m = 0; m != v44; ++m)
              {
                objc_msgSend(v41, "objectAtIndex:", m);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "addObject:", v46);

              }
              v39 = a11;
            }
          }
          v22 = v57;
          if (objc_msgSend(v25, "count") == v38
            || (objc_msgSend(v55, "timeIntervalSinceNow"), v47 * -1000.0 > (double)a9))
          {

            v34 = v53;
            goto LABEL_49;
          }

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        v34 = v53;
        if (v37)
          continue;
        break;
      }
    }
LABEL_49:

  }
  v48 = v25;

  return v48;
}

- (id)lastCachedResultWithInitialCharacters:(id)a3
{
  return -[_ICResultCache searchWithValue:](self->_cache, "searchWithValue:", a3);
}

- (id)_quickTypePredictionWithTrigger:(id)a3 searchContext:(id)a4 timeoutInMilliseconds:(unint64_t)a5 error:(id *)a6
{
  id v6;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  NSArray *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  int v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v30;
  uint64_t v31;
  id v34;
  uint8_t v36;
  _BYTE v37[7];
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t *v41;
  id v42;
  id location;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  const __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v34 = a4;
  objc_msgSend(v8, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  _ICProactiveQuickTypeOSLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
      -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:].cold.4(v8, v11);
  }
  else if (v12)
  {
    -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:].cold.5(v8, v11);
  }

  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  v62 = 0;
  if (a6)
    *a6 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  v56 = 0;
  v50 = 0;
  v48 = CFSTR("_ICPredictionManager_quickTypePredictionWithTrigger");
  v31 = mach_absolute_time();
  v49 = v31;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = self->_predictionSources;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
  if (v14)
  {
    v16 = *(_QWORD *)v45;
    *(_QWORD *)&v15 = 134217984;
    v30 = v15;
LABEL_10:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v17);
      if ((objc_msgSend(v18, "doesSupportTriggerSourceType:", objc_msgSend(v8, "triggerSourceType", v30)) & 1) != 0)
      {
        v19 = dispatch_semaphore_create(0);
        objc_initWeak(&location, self);
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __98___ICPredictionManager__quickTypePredictionWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke;
        v38[3] = &unk_24EF71600;
        v40 = &v51;
        v41 = &v57;
        objc_copyWeak(&v42, &location);
        v20 = v19;
        v39 = v20;
        objc_msgSend(v18, "predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:", v8, v34, 10, a5, v38);
        v21 = dispatch_time(0, (uint64_t)((double)a5 / 1000.0 * 1.1 * 1000000000.0));
        if (dispatch_semaphore_wait(v20, v21))
        {
          _ICProactiveQuickTypeOSLogFacility();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:].cold.3(&v36, v37, v22);

          v23 = 0;
          v6 = 0;
        }
        else if (objc_msgSend((id)v58[5], "count"))
        {
          objc_msgSend(v18, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ICPredictionManager setLastUsedSource:](self, "setLastUsedSource:", v24);

          _ICProactiveQuickTypeOSLogFacility();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v26 = objc_msgSend((id)v58[5], "count");
            *(_DWORD *)buf = v30;
            v64 = v26;
            _os_log_debug_impl(&dword_22716D000, v25, OS_LOG_TYPE_DEBUG, "DEBUG:IC:Predictions: received prediction source results, count = %lu", buf, 0xCu);
          }

          v6 = (id)v58[5];
          v23 = 0;
        }
        else
        {
          v23 = 1;
        }

        objc_destroyWeak(&v42);
        objc_destroyWeak(&location);

        if (!v23)
          break;
      }
      if (v14 == ++v17)
      {
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
        if (v14)
          goto LABEL_10;
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:

    if (a6)
      *a6 = objc_retainAutorelease((id)v52[5]);
    _ICProactiveQuickTypeOSLogFacility();
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEBUG))
      -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:].cold.2();
    v6 = 0;
  }

  v27 = mach_absolute_time();
  _ICMachTimeToNanoseconds(v27 - v31);
  _ICProactiveQuickTypeOSLogFacility();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:].cold.1();

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v6;
}

- (id)searchForMeCardRegions
{
  NSObject *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[16];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  _ICProactiveQuickTypeOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[_ICPredictionManager searchForMeCardRegions].cold.4();

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = self->_predictionSources;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    v7 = MEMORY[0x24BDAC760];
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v10 = dispatch_semaphore_create(0);
        v19[0] = v7;
        v19[1] = 3221225472;
        v19[2] = __46___ICPredictionManager_searchForMeCardRegions__block_invoke;
        v19[3] = &unk_24EF71628;
        v21 = &v26;
        v11 = v10;
        v20 = v11;
        objc_msgSend(v9, "searchForMeCardRegionsWithTimeout:handler:", 5000, v19);
        v12 = dispatch_time(0, 5500000000);
        if (dispatch_semaphore_wait(v11, v12))
        {
          _ICProactiveQuickTypeOSLogFacility();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[_ICPredictionManager searchForMeCardRegions].cold.3();

          goto LABEL_22;
        }
        v13 = objc_msgSend((id)v27[5], "count") == 0;

        if (!v13)
          goto LABEL_12;
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  if (objc_msgSend((id)v27[5], "count"))
  {
    _ICProactiveQuickTypeOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[_ICPredictionManager searchForMeCardRegions].cold.2((uint64_t)v32, objc_msgSend((id)v27[5], "count"), v14);

    v15 = (id)v27[5];
  }
  else
  {
    _ICProactiveQuickTypeOSLogFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:].cold.2();

LABEL_22:
    v15 = (id)MEMORY[0x24BDBD1A8];
  }
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (id)searchForMeCardEmailAddresses
{
  NSObject *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[16];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  _ICProactiveQuickTypeOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[_ICPredictionManager searchForMeCardEmailAddresses].cold.4();

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = self->_predictionSources;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    v7 = MEMORY[0x24BDAC760];
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v10 = dispatch_semaphore_create(0);
        v19[0] = v7;
        v19[1] = 3221225472;
        v19[2] = __53___ICPredictionManager_searchForMeCardEmailAddresses__block_invoke;
        v19[3] = &unk_24EF71628;
        v21 = &v26;
        v11 = v10;
        v20 = v11;
        objc_msgSend(v9, "searchForMeCardEmailAddressesWithTimeout:handler:", 100, v19);
        v12 = dispatch_time(0, 110000000);
        if (dispatch_semaphore_wait(v11, v12))
        {
          _ICProactiveQuickTypeOSLogFacility();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[_ICPredictionManager searchForMeCardEmailAddresses].cold.3();

          goto LABEL_22;
        }
        v13 = objc_msgSend((id)v27[5], "count") == 0;

        if (!v13)
          goto LABEL_12;
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  if (objc_msgSend((id)v27[5], "count"))
  {
    _ICProactiveQuickTypeOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[_ICPredictionManager searchForMeCardEmailAddresses].cold.2((uint64_t)v32, objc_msgSend((id)v27[5], "count"), v14);

    v15 = (id)v27[5];
  }
  else
  {
    _ICProactiveQuickTypeOSLogFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[_ICPredictionManager searchForMeCardEmailAddresses].cold.1();

LABEL_22:
    v15 = (id)MEMORY[0x24BDBD1A8];
  }
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (id)workLocation
{
  return 0;
}

- (void)setLastUsedSource:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42___ICPredictionManager_setLastUsedSource___block_invoke;
  block[3] = &unk_24EF71650;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  id v8;
  NSObject *serialQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60___ICPredictionManager_provideFeedbackForString_type_style___block_invoke;
  v11[3] = &unk_24EF71678;
  objc_copyWeak(&v13, &location);
  v12 = v8;
  v14 = a4;
  v15 = a5;
  v10 = v8;
  dispatch_async(serialQueue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46___ICPredictionManager_propogateMetrics_data___block_invoke;
  v11[3] = &unk_24EF716A0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lastUsedSource, 0);
  objc_storeStrong((id *)&self->_predictionSources, 0);
}

- (void)_quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:.cold.1()
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

- (void)_quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "DEBUG:IC:Predictions: no prediction results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_quickTypePredictionWithTrigger:(NSObject *)a3 searchContext:timeoutInMilliseconds:error:.cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_4(&dword_22716D000, a3, (uint64_t)a3, "_ICPredictionManager quickTypePredictionWithTrigger timeout", a1);
}

- (void)_quickTypePredictionWithTrigger:(void *)a1 searchContext:(NSObject *)a2 timeoutInMilliseconds:error:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v3, "length");
  OUTLINED_FUNCTION_3(&dword_22716D000, a2, v4, "DEBUG:IC:Predictions: Searching for quicktype prediction with context len: %tu", (uint8_t *)&v5);

  OUTLINED_FUNCTION_7();
}

- (void)_quickTypePredictionWithTrigger:(void *)a1 searchContext:(NSObject *)a2 timeoutInMilliseconds:error:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_22716D000, a2, v4, "DEBUG:IC:Predictions: Searching for quicktype prediction with attributes: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_7();
}

- (void)searchForMeCardRegions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "DEBUG:IC:Predictions: searchForMeCardRegions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)searchForMeCardEmailAddresses
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "DEBUG:IC:Predictions: searchForMeCardEmailAddresses", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
