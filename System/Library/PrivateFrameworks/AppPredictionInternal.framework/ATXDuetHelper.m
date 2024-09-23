@implementation ATXDuetHelper

void __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = a2;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D15A08];
  v8 = *(_QWORD *)(a1 + 32);
  v37[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v36 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "eventStreams");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v17;
    v32 = 2080;
    v33 = "-[_ATXDuetHelper _queryDuetStreamUnbatched:startDate:endDate:ascending:otherPredicates:limit:offset:]_block_invoke";
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);

  }
  v29 = 0;
  objc_msgSend(v5, "executeQuery:error:", v13, &v29);
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = v29;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v18;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    __atxlog_handle_default();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke_cold_1((uint64_t)v19, v22, v23, v24, v25, v26, v27, v28);

  }
}

uint64_t __75___ATXDuetHelper__queryDuetStream_startDate_endDate_otherPredicates_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

void __32___ATXDuetHelper_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_32;
  sharedInstance__pasExprOnceResult_32 = v1;

  objc_autoreleasePoolPop(v0);
}

void __55___ATXDuetHelper__computeRootOfAppDataWithLockWitness___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "metadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D15998], "userActivityRequiredString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          v14 = v13 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
            || (objc_msgSend(v13, "isEqualToString:") & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "recordSessionWithBundleId:firstAction:", v13, v11);
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v13);
            objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
          }
          if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v11) & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
            objc_msgSend(*(id *)(a1 + 32), "recordDocFreqWithBundleId:hasAction:", v13, v11);
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

uint64_t __43___ATXDuetHelper_getDocFreqFor_contentKey___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = 1;
  return result;
}

void __72___ATXDuetHelper_getAppLaunchesFromUsageBetweenStartDate_endDate_limit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  _ATXAppLaunch *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _ATXAppLaunch *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v4)
  {
    v5 = v4;
    v23 = *(_QWORD *)v25;
    v22 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v7, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("unknown"));

          if ((v12 & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v7, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringValue");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            v14 = *(void **)(a1 + 32);
            v15 = [_ATXAppLaunch alloc];
            objc_msgSend(v7, "startDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "endDate");
            v17 = a1;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "timeZone");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[_ATXAppLaunch initWithBundleId:startDate:endDate:timeZone:reason:](v15, "initWithBundleId:startDate:endDate:timeZone:reason:", v9, v16, v18, v19, 0);
            objc_msgSend(v14, "addObject:", v20);

            a1 = v17;
            if ((unint64_t)objc_msgSend(*(id *)(v17 + 32), "count") > *(_QWORD *)(v17 + 40))
              objc_msgSend(*(id *)(v17 + 32), "removeObjectAtIndex:", 0);
            v3 = v22;
          }
          else
          {
            __atxlog_handle_default();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v7;
              _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "App launch with nil bundleId: %@", buf, 0xCu);
            }

          }
        }

LABEL_16:
        objc_autoreleasePoolPop(v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v5);
  }

}

void __88___ATXDuetHelper_getAppLaunchesBetweenStartDate_endDate_bundleIdFilter_limit_batchSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _ATXAppLaunch *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _ATXAppLaunch *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = a2;
  v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v27)
  {
    v4 = *(_QWORD *)v29;
    v24 = v3;
    v25 = a1;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v4)
          objc_enumerationMutation(v3);
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v6, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("unknown"));

          if ((v11 & 1) != 0)
            goto LABEL_18;
          objc_msgSend(v6, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringValue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            v13 = *(void **)(a1 + 32);
            if (!v13 || objc_msgSend(v13, "isEqualToString:", v8))
            {
              v26 = *(void **)(a1 + 40);
              v14 = [_ATXAppLaunch alloc];
              objc_msgSend(v6, "startDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "endDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "timeZone");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "metadata");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D159A0], "launchReason");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = -[_ATXAppLaunch initWithBundleId:startDate:endDate:timeZone:reason:](v14, "initWithBundleId:startDate:endDate:timeZone:reason:", v8, v15, v16, v17, v20);
              objc_msgSend(v26, "addObject:", v21);

              a1 = v25;
              if ((unint64_t)objc_msgSend(*(id *)(v25 + 40), "count") > *(_QWORD *)(v25 + 48))
                objc_msgSend(*(id *)(v25 + 40), "removeObjectAtIndex:", 0);
              v4 = v23;
              v3 = v24;
            }
          }
          else
          {
            __atxlog_handle_default();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v33 = v6;
              _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "App launch with nil bundleId: %@", buf, 0xCu);
            }

          }
        }

LABEL_18:
        objc_autoreleasePoolPop(v7);
      }
      v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v27);
  }

}

void __63___ATXDuetHelper_getScreenTransitionsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1CAA48B6C](v4);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v8, "endDate", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v5 = v4;
    }
    while (v4);
  }

}

void __102___ATXDuetHelper_enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate_endDate_batchSize_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_pas_mappedArrayWithTransform:", &__block_literal_global_57_2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __102___ATXDuetHelper_enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate_endDate_batchSize_block___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0D81638];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  objc_msgSend(v3, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v4, "initWithFirst:second:", v7, v8);
  return v9;
}

void __112___ATXDuetHelper_enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate_endDate_batchSize_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_pas_mappedArrayWithTransform:", &__block_literal_global_60_0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __112___ATXDuetHelper_enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate_endDate_batchSize_block___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0D81638];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  objc_msgSend(v3, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v4, "initWithFirst:second:", v7, v8);
  return v9;
}

uint64_t __59___ATXDuetHelper__handleTombstoneCreationWithNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_64_1);
}

void __59___ATXDuetHelper__handleTombstoneCreationWithNotification___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  NSObject *queue;

  v3 = a3;
  objc_msgSend(v3, "first");
  queue = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_async(queue, v4);
}

void __48___ATXDuetHelper_registerDeletionHandler_queue___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  objc_class *v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2[1];
  a2[1] = v3 + 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  v4 = (objc_class *)MEMORY[0x1E0D81638];
  v5 = a2;
  v6 = [v4 alloc];
  v7 = *(_QWORD *)(a1 + 32);
  v11 = _Block_copy(*(const void **)(a1 + 40));
  v8 = (void *)objc_msgSend(v6, "initWithFirst:second:", v7, v11);
  v9 = (void *)v5[2];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

}

void __53___ATXDuetHelper_deregisterDeletionHandlerWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v3);

}

void __48___ATXDuetHelper_getMicroLocationsFromLastMonth__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        microLocationEventFromDK(*(void **)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

uint64_t __75___ATXDuetHelper__countDuetStream_startDate_endDate_otherPredicates_limit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __117___ATXDuetHelper__queryDuetStreamUnbatched_creationDateStart_creationDateEnd_ascending_otherPredicates_limit_offset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = a2;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D15A08];
  v8 = *(_QWORD *)(a1 + 32);
  v37[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v36 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "eventStreams");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v17;
    v32 = 2080;
    v33 = "-[_ATXDuetHelper _queryDuetStreamUnbatched:creationDateStart:creationDateEnd:ascending:otherPredicates:limit:o"
          "ffset:]_block_invoke";
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);

  }
  v29 = 0;
  objc_msgSend(v5, "executeQuery:error:", v13, &v29);
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = v29;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v18;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    __atxlog_handle_default();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke_cold_1((uint64_t)v19, v22, v23, v24, v25, v26, v27, v28);

  }
}

void __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error querying Duet: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
