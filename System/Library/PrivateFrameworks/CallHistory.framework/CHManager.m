@implementation CHManager

- (id)coalescedCallsWithCalls:(id)a3 usingStrategy:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  id v45;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  CHManager *v51;
  id v52;
  id v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
    goto LABEL_54;
  v51 = self;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("kCHCoalescingStrategyRecents")))
  {
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Coalescing with kCHCoalescingStrategyRecents", buf, 2u);
    }

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v11)
    {
      v12 = v11;
      v49 = v6;
      v13 = 0;
      v14 = *(_QWORD *)v64;
      do
      {
        v15 = 0;
        v16 = v13;
        do
        {
          if (*(_QWORD *)v64 != v14)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v15);
          if (v16)
          {
            objc_msgSend(v16, "coalescedCallWithCall:usingStrategy:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v15), v7);
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = v17;
          }
          v19 = v18;
          v20 = v18;
          if (!v18)
          {
            objc_msgSend(v9, "addObject:", v16);
            v20 = v17;
          }
          v13 = v20;

          ++v15;
          v16 = v13;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      }
      while (v12);

      self = v51;
      v6 = v49;
      if (!v13)
        goto LABEL_57;
      objc_msgSend(v9, "addObject:", v13);
    }
    else
    {
      v13 = v10;
    }

LABEL_57:
    v45 = (id)objc_msgSend(v9, "copy");

    goto LABEL_58;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("kCHCoalescingStrategyCollapseIfEqual")))
  {
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v21, OS_LOG_TYPE_DEFAULT, "Coalescing with kCHCoalescingStrategyCollapseIfEqual", buf, 2u);
    }
    v53 = v7;

    v52 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = v6;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v6;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v60 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v27, "remoteParticipantHandles");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "count") == 1)
          {
            objc_msgSend(v28, "anyObject");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "normalizedValue");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30;
            if (v30)
            {
              v32 = v30;
            }
            else
            {
              objc_msgSend(v28, "anyObject");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "value");
              v32 = (id)objc_claimAutoreleasedReturnValue();

              self = v51;
            }

          }
          else
          {
            objc_msgSend(v27, "notificationThreadIdentifier");
            v32 = (id)objc_claimAutoreleasedReturnValue();
          }
          if (!objc_msgSend(v32, "length"))
          {
            objc_msgSend(v27, "uniqueId");
            v34 = objc_claimAutoreleasedReturnValue();

            v32 = (id)v34;
          }
          if (objc_msgSend(v32, "length"))
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v36 = v35;
              objc_msgSend(v35, "coalescedCallWithCall:usingStrategy:", v27, v53);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              if (v37)
              {
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v37, v32);

              }
            }
            else
            {
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, v32);
              objc_msgSend(v52, "addObject:", v32);
            }
          }
          else
          {
            -[CHSynchronizedLoggable logHandle](self, "logHandle");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              -[CHManager coalescedCallsWithCalls:usingStrategy:].cold.1(buf, v27, &v69, v38);

          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v24);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v39 = v52;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    v6 = v50;
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v56 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      }
      while (v41);
    }

    v45 = (id)objc_msgSend(v48, "copy");
    v7 = v53;
    goto LABEL_58;
  }
  if (v7)
  {
LABEL_54:
    v45 = 0;
    goto LABEL_58;
  }
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v69 = 0;
    _os_log_impl(&dword_1B3FA4000, v47, OS_LOG_TYPE_DEFAULT, "Returning calls with no coalescing since none or invalid (%{public}@) strategy was provided", buf, 0xCu);
  }

  v45 = v6;
LABEL_58:
  -[CHManager setReCoalesce:](self, "setReCoalesce:", 0);

  return v45;
}

- (void)setReCoalesce:(BOOL)a3
{
  self->_reCoalesce = a3;
}

- (BOOL)canLoadOlderRecentCalls
{
  void *v3;
  BOOL v4;

  -[CHManager featureFlags](self, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "increaseCallHistoryEnabled"))
  {
    if (-[CHManager finishedLoadingAllCalls](self, "finishedLoadingAllCalls"))
      v4 = -[CHManager cacheIsDirty](self, "cacheIsDirty");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)finishedLoadingAllCalls
{
  return self->_finishedLoadingAllCalls;
}

uint64_t __35__CHManager_setCoalescingStrategy___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@", (uint8_t *)&v6, 0x16u);

  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isEqualToString:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "setReCoalesce:", 1);
  }
  return result;
}

id __24__CHManager_recentCalls__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "fetchRecentCallsSyncWithCoalescing:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "count");
    v9 = 138543618;
    v10 = v6;
    v11 = 2048;
    v12 = v7;
    _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "<== %{public}@ => %lu calls", (uint8_t *)&v9, 0x16u);

  }
  return v4;
}

void __54__CHManager_setRead_forCallsWithPredicate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Updating read status for calls matching predicate %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  v7 = objc_msgSend(v4, "setRead:forCallsWithPredicate:error:", v5, v6, &v12);
  v8 = v12;

  if (v7 == 0x7FFFFFFFFFFFFFFFLL && v8 != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __43__CHManager_setRead_forCallsWithPredicate___block_invoke_cold_1();

  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v7);

}

- (id)loadOlderRecentCallsSyncWithCoalescing:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  NSArray **p_recentCalls;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSArray *uncoalescedRecentCalls;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  NSArray *uncoalescedUnFilteredRecentCalls;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  NSArray *v33;
  uint64_t v34;
  NSArray *v35;
  NSArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSUInteger v45;
  NSArray *v46;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  void *v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  NSUInteger v58;
  uint64_t v59;

  v3 = a3;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1B5E33064]();
  if (!-[CHManager shouldLoadOlderCalls](self, "shouldLoadOlderCalls"))
  {
LABEL_42:
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[NSArray count](self->_recentCalls, "count");
      *(_DWORD *)buf = 138543618;
      v56 = (uint64_t)v44;
      v57 = 2048;
      v58 = v45;
      _os_log_impl(&dword_1B3FA4000, v43, OS_LOG_TYPE_DEFAULT, "<== %{public}@ returns %lu calls", buf, 0x16u);

    }
    p_recentCalls = &self->_recentCalls;
    goto LABEL_45;
  }
  p_recentCalls = &self->_recentCalls;
  if (!self->_recentCalls || -[CHManager cacheIsDirty](self, "cacheIsDirty"))
    v8 = -[CHManager fetchRecentCallsSyncWithCoalescing:](self, "fetchRecentCallsSyncWithCoalescing:", v3);
  if (-[NSArray count](*p_recentCalls, "count"))
  {
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v10 = CFSTR("Yes");
      else
        v10 = CFSTR("No");
      +[CHRecentCall callTypeAsString:](CHRecentCall, "callTypeAsString:", self->_limitingCallTypes);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = (uint64_t)v10;
      v57 = 2114;
      v58 = (NSUInteger)v11;
      _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "loadOlderRecentCallsSyncWithCoalescing: Fetching from DB and updating cache. And coalescing: %{public}@, With callType limit: %{public}@", buf, 0x16u);

    }
    -[CHManager getLimitsDictionary](self, "getLimitsDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHManager callsWithLimits:limit:offset:batchSize:](self, "callsWithLimits:limit:offset:batchSize:", v12, 100, -[NSArray count](self->_uncoalescedUnFilteredRecentCalls, "count"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134217984;
      v56 = v15;
      _os_log_impl(&dword_1B3FA4000, v14, OS_LOG_TYPE_DEFAULT, "SyncManager returned %lu calls", buf, 0xCu);
    }

    if (objc_msgSend(v13, "count"))
    {
      uncoalescedRecentCalls = self->_uncoalescedRecentCalls;
      v48 = v12;
      if (uncoalescedRecentCalls)
      {
        -[NSArray arrayByAddingObjectsFromArray:](uncoalescedRecentCalls, "arrayByAddingObjectsFromArray:", v13);
        v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = (NSArray *)objc_msgSend(v13, "copy");
      }
      v18 = self->_uncoalescedRecentCalls;
      self->_uncoalescedRecentCalls = v17;

      -[CHManager applyPredicate:toCalls:](self, "applyPredicate:toCalls:", self->_postFetchingPredicate, self->_uncoalescedRecentCalls);
      v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v20 = self->_uncoalescedRecentCalls;
      self->_uncoalescedRecentCalls = v19;

      uncoalescedUnFilteredRecentCalls = self->_uncoalescedUnFilteredRecentCalls;
      if (uncoalescedUnFilteredRecentCalls)
      {
        -[NSArray arrayByAddingObjectsFromArray:](uncoalescedUnFilteredRecentCalls, "arrayByAddingObjectsFromArray:", v13);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = objc_msgSend(v13, "copy");
      }
      v23 = (void *)v22;
      -[CHManager setUncoalescedUnFilteredRecentCalls:](self, "setUncoalescedUnFilteredRecentCalls:", v22);

      -[CHManager uncoalescedUnFilteredRecentCalls](self, "uncoalescedUnFilteredRecentCalls");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v25 >= 0x7D0)
        -[CHManager setFinishedLoadingAllCalls:](self, "setFinishedLoadingAllCalls:", 1);
      if (v3)
      {
        -[NSArray lastObject](*p_recentCalls, "lastObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          -[NSArray lastObject](*p_recentCalls, "lastObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v28 = (void *)MEMORY[0x1E0C9AA60];
        }

        objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v13);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        -[CHManager coalescedCallsWithCalls:usingStrategy:](self, "coalescedCallsWithCalls:usingStrategy:", v30, self->_coalescingStrategy);
        v29 = objc_claimAutoreleasedReturnValue();

        -[NSArray subarrayWithRange:](*p_recentCalls, "subarrayWithRange:", 0, -[NSArray count](*p_recentCalls, "count") - 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
        {
          objc_msgSend(v31, "arrayByAddingObjectsFromArray:", v29);
          v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32 = v29;
        }
        v33 = *p_recentCalls;
        *p_recentCalls = v32;

        -[CHManager applyPredicate:toCalls:](self, "applyPredicate:toCalls:", self->_postFetchingPredicate, *p_recentCalls);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = *p_recentCalls;
        *p_recentCalls = (NSArray *)v34;

      }
      else
      {
        -[CHSynchronizedLoggable logHandle](self, "logHandle");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3FA4000, v29, OS_LOG_TYPE_DEFAULT, "User fetching without coalescing!", buf, 2u);
        }
      }

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v36 = *p_recentCalls;
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v50 != v39)
              objc_enumerationMutation(v36);
            v41 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            -[CHManager phoneBookManager](self, "phoneBookManager");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setPhoneBookManager:", v42);

          }
          v38 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        }
        while (v38);
      }

      v12 = v48;
    }
    else
    {
      -[CHManager setFinishedLoadingAllCalls:](self, "setFinishedLoadingAllCalls:", 1);
    }
    -[CHManager setCacheIsDirty:](self, "setCacheIsDirty:", 0);
    -[CHManager setShouldLoadOlderCalls:](self, "setShouldLoadOlderCalls:", 0);

    goto LABEL_42;
  }
LABEL_45:
  v46 = *p_recentCalls;
  objc_autoreleasePoolPop(v6);
  return v46;
}

- (id)fetchRecentCallsSyncWithCoalescing:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  id *p_recentCalls;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSArray *uncoalescedUnFilteredRecentCalls;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSArray *v30;
  NSArray *uncoalescedRecentCalls;
  NSArray *v32;
  NSArray *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v3 = a3;
  v69 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1B5E33064]();
  p_recentCalls = (id *)&self->_recentCalls;
  if (!self->_recentCalls || -[CHManager cacheIsDirty](self, "cacheIsDirty"))
  {
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v9 = CFSTR("Yes");
      else
        v9 = CFSTR("No");
      +[CHRecentCall callTypeAsString:](CHRecentCall, "callTypeAsString:", self->_limitingCallTypes);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = (uint64_t)v9;
      v67 = 2114;
      v68 = (uint64_t)v10;
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Fetching from DB and updating cache. And coalescing: %{public}@, With callType limit: %{public}@", buf, 0x16u);

    }
    -[CHManager getLimitsDictionary](self, "getLimitsDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHManager featureFlags](self, "featureFlags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "increaseCallHistoryEnabled");

    if (v13)
    {
      uncoalescedUnFilteredRecentCalls = self->_uncoalescedUnFilteredRecentCalls;
      if (uncoalescedUnFilteredRecentCalls)
      {
        v15 = -[NSArray count](uncoalescedUnFilteredRecentCalls, "count");
        if (v15 <= 0x64)
          v16 = 100;
        else
          v16 = v15;
      }
      else
      {
        v16 = 100;
      }
      -[CHManager callsWithLimits:limit:offset:batchSize:](self, "callsWithLimits:limit:offset:batchSize:", v11, v16, 0, 0);
      v27 = objc_claimAutoreleasedReturnValue();
      v17 = *p_recentCalls;
      *p_recentCalls = (id)v27;
    }
    else
    {
      -[CHManager syncManager](self, "syncManager");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fetchObjectsWithLimits:", v11);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *p_recentCalls;
      *p_recentCalls = (id)v18;

    }
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(*p_recentCalls, "count");
      *(_DWORD *)buf = 134217984;
      v66 = v29;
      _os_log_impl(&dword_1B3FA4000, v28, OS_LOG_TYPE_DEFAULT, "SyncManager returned %lu calls", buf, 0xCu);
    }

    if (!*p_recentCalls)
      goto LABEL_44;
    v59 = v6;
    v30 = (NSArray *)objc_msgSend(*p_recentCalls, "copy");
    uncoalescedRecentCalls = self->_uncoalescedRecentCalls;
    self->_uncoalescedRecentCalls = v30;

    -[CHManager applyPredicate:toCalls:](self, "applyPredicate:toCalls:", self->_postFetchingPredicate, self->_uncoalescedRecentCalls);
    v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v33 = self->_uncoalescedRecentCalls;
    self->_uncoalescedRecentCalls = v32;

    v34 = (void *)objc_msgSend(*p_recentCalls, "copy");
    -[CHManager setUncoalescedUnFilteredRecentCalls:](self, "setUncoalescedUnFilteredRecentCalls:", v34);

    -[CHManager featureFlags](self, "featureFlags");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = a2;
    if ((objc_msgSend(v35, "increaseCallHistoryEnabled") & 1) != 0)
    {
      -[CHManager uncoalescedUnFilteredRecentCalls](self, "uncoalescedUnFilteredRecentCalls");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

      if (v38 >= 0x7D0)
        -[CHManager setFinishedLoadingAllCalls:](self, "setFinishedLoadingAllCalls:", 1);
      if (v3)
        goto LABEL_30;
    }
    else
    {

      if (v3)
      {
LABEL_30:
        -[CHManager coalescedCallsWithCalls:usingStrategy:](self, "coalescedCallsWithCalls:usingStrategy:", *p_recentCalls, self->_coalescingStrategy);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = *p_recentCalls;
        *p_recentCalls = (id)v39;

        -[CHSynchronizedLoggable logHandle](self, "logHandle");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = objc_msgSend(*p_recentCalls, "count");
          *(_DWORD *)buf = 134217984;
          v66 = v42;
          _os_log_impl(&dword_1B3FA4000, v41, OS_LOG_TYPE_DEFAULT, "After coalescing we have %lu calls", buf, 0xCu);
        }

        -[CHManager applyPredicate:toCalls:](self, "applyPredicate:toCalls:", self->_postFetchingPredicate, *p_recentCalls);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = *p_recentCalls;
        *p_recentCalls = (id)v43;
LABEL_36:

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v45 = *p_recentCalls;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v47; ++i)
            {
              if (*(_QWORD *)v61 != v48)
                objc_enumerationMutation(v45);
              v50 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
              -[CHManager phoneBookManager](self, "phoneBookManager");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setPhoneBookManager:", v51);

            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
          }
          while (v47);
        }

        a2 = v36;
        v6 = v59;
LABEL_44:
        -[CHManager featureFlags](self, "featureFlags");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "increaseCallHistoryEnabled"))
        {
          v53 = objc_msgSend(*p_recentCalls, "count");

          if (!v53)
            -[CHManager setFinishedLoadingAllCalls:](self, "setFinishedLoadingAllCalls:", 1);
        }
        else
        {

        }
        -[CHManager setCacheIsDirty:](self, "setCacheIsDirty:", 0);
LABEL_49:

        goto LABEL_50;
      }
    }
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v44, OS_LOG_TYPE_DEFAULT, "User fetching without coalescing!", buf, 2u);
    }
    goto LABEL_36;
  }
  if (v3 && -[CHManager reCoalesce](self, "reCoalesce"))
  {
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v20, OS_LOG_TYPE_DEFAULT, "No fetching required. Recoalscing & applying global filter", buf, 2u);
    }

    -[CHManager uncoalescedUnFilteredRecentCalls](self, "uncoalescedUnFilteredRecentCalls");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v21, "copy");

    -[CHManager coalescedCallsWithCalls:usingStrategy:](self, "coalescedCallsWithCalls:usingStrategy:", v11, self->_coalescingStrategy);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *p_recentCalls;
    *p_recentCalls = (id)v22;

    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[CHManager fetchRecentCallsSyncWithCoalescing:].cold.1((id *)&self->_recentCalls, v24);

    -[CHManager applyPredicate:toCalls:](self, "applyPredicate:toCalls:", self->_postFetchingPredicate, *p_recentCalls);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *p_recentCalls;
    *p_recentCalls = (id)v25;

    goto LABEL_49;
  }
LABEL_50:
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(*p_recentCalls, "count");
    *(_DWORD *)buf = 138543618;
    v66 = (uint64_t)v55;
    v67 = 2048;
    v68 = v56;
    _os_log_impl(&dword_1B3FA4000, v54, OS_LOG_TYPE_DEFAULT, "<== %{public}@ returns %lu calls", buf, 0x16u);

  }
  v57 = *p_recentCalls;
  objc_autoreleasePoolPop(v6);
  return v57;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (id)applyPredicate:(id)a3 toCalls:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[16];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v7, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "multiCall"))
        {
          -[CHManager unCoalesceCall:](self, "unCoalesceCall:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
          objc_msgSend(v10, "filteredArrayUsingPredicate:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sortedArrayUsingDescriptors:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[CHManager coalescedCallsWithCalls:usingStrategy:](self, "coalescedCallsWithCalls:usingStrategy:", v14, self->_coalescingStrategy);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObjectsFromArray:", v15);

        }
        else if (objc_msgSend(v6, "evaluateWithObject:", v9))
        {
          objc_msgSend(v18, "addObject:", v9);
        }

        ++v8;
      }
      while (v8 < objc_msgSend(v7, "count"));
    }
  }
  else
  {
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_DEFAULT, "No predicate to apply, return all calls", buf, 2u);
    }

    v18 = v7;
  }

  return v18;
}

- (void)setLimitingCallTypesSync:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    +[CHRecentCall callTypeAsString:](CHRecentCall, "callTypeAsString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Setting limiting call type to %{public}@ (0x%x). Cache is drity.", (uint8_t *)&v8, 0x12u);

  }
  self->_limitingCallTypes = v3;
  -[CHManager setCacheIsDirty:](self, "setCacheIsDirty:", 1);
  -[CHManager setFinishedLoadingAllCalls:](self, "setFinishedLoadingAllCalls:", 0);
  +[CHManager limitingCallKindsForCallType:](CHManager, "limitingCallKindsForCallType:", self->_limitingCallTypes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHManager setLimitingCallKindsSync:](self, "setLimitingCallKindsSync:", v7);

}

- (void)setLimitingCallKindsSync:(id)a3
{
  NSArray *v4;
  NSObject *v5;
  NSArray *limitingCallKinds;
  int v7;
  NSArray *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Setting limiting call kinds: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  limitingCallKinds = self->_limitingCallKinds;
  self->_limitingCallKinds = v4;

  -[CHManager setCacheIsDirty:](self, "setCacheIsDirty:", 1);
  -[CHManager setFinishedLoadingAllCalls:](self, "setFinishedLoadingAllCalls:", 0);
}

- (void)setCacheIsDirty:(BOOL)a3
{
  self->_cacheIsDirty = a3;
}

- (void)setFinishedLoadingAllCalls:(BOOL)a3
{
  self->_finishedLoadingAllCalls = a3;
}

- (NSArray)uncoalescedUnFilteredRecentCalls
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUncoalescedUnFilteredRecentCalls:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (id)getLimitsDictionary
{
  id v3;
  void *v4;
  NSArray *limitingCallKinds;
  void *v6;
  NSDate *limitingStartDate;
  NSDate *limitingEndDate;
  void *v9;
  int v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  limitingCallKinds = self->_limitingCallKinds;
  if (limitingCallKinds)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", limitingCallKinds, CFSTR("kCHLimitCallKindsKey"));
  }
  else
  {
    +[CHManager limitingCallKindsForCallType:](CHManager, "limitingCallKindsForCallType:", self->_limitingCallTypes);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("kCHLimitCallKindsKey"));

  }
  limitingStartDate = self->_limitingStartDate;
  if (limitingStartDate)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", limitingStartDate, CFSTR("kCHLimitStartDateKey"));
  limitingEndDate = self->_limitingEndDate;
  if (limitingEndDate)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", limitingEndDate, CFSTR("kCHLimitEndDateKey"));
  -[CHManager featureFlags](self, "featureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "protectedAppsEnabled");

  if (v10)
  {
    -[CHManager protectedBundleIDsExcludingCurrentProcess](self, "protectedBundleIDsExcludingCurrentProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("kCHLimitProtectedBundleIDsKey"));

  }
  return v4;
}

- (id)callsWithLimits:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v28[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHManager syncManager](self, "syncManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchCallsWithPredicate:sortDescriptors:limitsDictionary:limit:offset:batchSize:", self->_preFetchingPredicate, v12, v10, a4, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v19);
        -[CHManager phoneBookManager](self, "phoneBookManager", (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPhoneBookManager:", v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  return v15;
}

- (CHPhoneBookIOSManager)phoneBookManager
{
  return self->_phoneBookManager;
}

- (SyncManagerProtocol)syncManager
{
  SyncManagerProtocol *syncManager;
  SyncManager *v4;
  SyncManagerProtocol *v5;

  syncManager = self->_syncManager;
  if (!syncManager)
  {
    v4 = objc_alloc_init(SyncManager);
    v5 = self->_syncManager;
    self->_syncManager = (SyncManagerProtocol *)v4;

    syncManager = self->_syncManager;
  }
  return syncManager;
}

- (unint64_t)callCountWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__CHManager_callCountWithPredicate___block_invoke;
  v11[3] = &unk_1E6746B78;
  v11[4] = self;
  v7 = v4;
  v12 = v7;
  v14 = &v15;
  v8 = v6;
  v13 = v8;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __36__CHManager_callCountWithPredicate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving count of calls matching predicate %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "getLimitsDictionaryForPrivateHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "fetchCallCountWithPredicate:sortDescriptors:limitsDictionary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);

}

+ (id)limitingCallKindsForCallType:(unsigned int)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 != -1)
  {
    if ((a3 & 1) != 0)
    {
      v13[0] = CFSTR("kCHServiceProviderKey");
      v13[1] = CFSTR("kCHMediaTypeKey");
      v14[0] = CFSTR("com.apple.Telephony");
      v14[1] = &unk_1E6756148;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

    }
    if ((a3 & 0x10) != 0)
    {
      v11[0] = CFSTR("kCHServiceProviderKey");
      v11[1] = CFSTR("kCHMediaTypeKey");
      v12[0] = CFSTR("com.apple.FaceTime");
      v12[1] = &unk_1E6756148;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
    if ((a3 & 8) != 0)
    {
      v9[0] = CFSTR("kCHServiceProviderKey");
      v9[1] = CFSTR("kCHMediaTypeKey");
      v10[0] = CFSTR("com.apple.FaceTime");
      v10[1] = &unk_1E6756160;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

    }
  }
  return v4;
}

id __47__CHManager_loadOlderRecentCallsWithPredicate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setShouldLoadOlderCalls:", 1);
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "loadOlderRecentCallsSyncWithCoalescing:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "applyPredicate:toCalls:", *(_QWORD *)(a1 + 40), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "count");
    v10 = 138543618;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "<== %{public}@ => %lu calls", (uint8_t *)&v10, 0x16u);

  }
  return v5;
}

- (void)setShouldLoadOlderCalls:(BOOL)a3
{
  self->_shouldLoadOlderCalls = a3;
}

- (BOOL)shouldLoadOlderCalls
{
  return self->_shouldLoadOlderCalls;
}

- (BOOL)cacheIsDirty
{
  return self->_cacheIsDirty;
}

uint64_t __34__CHManager_setLimitingCallKinds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLimitingCallKindsSync:", *(_QWORD *)(a1 + 40));
}

- (CHManager)init
{
  id v3;
  CHManager *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v4 = -[CHManager initWithContactStore:](self, "initWithContactStore:", v3);

  return v4;
}

- (CHManager)initWithContactStore:(id)a3
{
  return -[CHManager initWithContactStore:featureFlags:protectedAppProvider:queue:](self, "initWithContactStore:featureFlags:protectedAppProvider:queue:", a3, 0, 0, 0);
}

- (id)loadOlderRecentCallsWithPredicate:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__CHManager_loadOlderRecentCallsWithPredicate___block_invoke;
  v9[3] = &unk_1E6746808;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)recentCalls
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __24__CHManager_recentCalls__block_invoke;
  v3[3] = &unk_1E67467E0;
  v3[4] = self;
  v3[5] = a2;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setRead:(BOOL)a3 forCallsWithPredicate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__CHManager_setRead_forCallsWithPredicate_completion___block_invoke;
  v12[3] = &unk_1E6746B00;
  v12[4] = self;
  v13 = v8;
  v15 = a3;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[CHSynchronizedLoggable execute:](self, "execute:", v12);

}

- (void)setCoalescingStrategy:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CHManager_setCoalescingStrategy___block_invoke;
  v7[3] = &unk_1E6746740;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable execute:](self, "execute:", v7);

}

- (void)setLimitingCallKinds:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__CHManager_setLimitingCallKinds___block_invoke;
  v6[3] = &unk_1E6746520;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable execute:](self, "execute:", v6);

}

- (void)setDefaultInitValues
{
  NSArray *uncoalescedUnFilteredRecentCalls;

  -[CHManager setLimitingCallTypesSync:](self, "setLimitingCallTypesSync:", 0xFFFFFFFFLL);
  self->_showsFaceTimeVideoCalls = 1;
  self->_showsFaceTimeAudioCalls = 1;
  self->_showsTelephonyCalls = 1;
  self->_generateSyncTransactions = 1;
  self->_numberOfUnseenMissedCalls = 0;
  self->_cacheIsDirty = 1;
  self->_reCoalesce = 1;
  uncoalescedUnFilteredRecentCalls = self->_uncoalescedUnFilteredRecentCalls;
  self->_uncoalescedUnFilteredRecentCalls = 0;

  self->_finishedLoadingAllCalls = 0;
  -[CHManager registerForNotifications](self, "registerForNotifications");
  maybeLogVersionInfo();
}

- (void)registerForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleCallHistoryContactStoreChangedInternalNotification_, CFSTR("kCallHistoryContactStoreChangedInternalNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleCallHistoryDatabaseChangedInternalNotification_, CFSTR("kCallHistoryDatabaseChangedInternalNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_currentLocaleChanged_, *MEMORY[0x1E0C99720], 0);

}

- (id)loadOlderRecentCalls
{
  return -[CHManager loadOlderRecentCallsWithPredicate:](self, "loadOlderRecentCallsWithPredicate:", 0);
}

- (CHManager)initWithQueue:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  CHManager *v7;

  v4 = (objc_class *)MEMORY[0x1E0C97298];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[CHManager initWithContactStore:featureFlags:protectedAppProvider:queue:](self, "initWithContactStore:featureFlags:protectedAppProvider:queue:", v6, 0, 0, v5);

  return v7;
}

- (CHManager)initWithContactStore:(id)a3 featureFlags:(id)a4 protectedAppProvider:(id)a5 queue:(id)a6
{
  id v9;
  CHFeatureFlags *v10;
  CHProtectedAppProvider *v11;
  CHManager *v12;
  CHManager *v13;
  NSObject *v14;
  CHPhoneBookIOSManager *v15;
  CHPhoneBookIOSManager *phoneBookManager;
  CHFeatureFlags *v17;
  CHProtectedAppProvider *v18;
  uint8_t v20[16];
  objc_super v21;

  v9 = a3;
  v10 = (CHFeatureFlags *)a4;
  v11 = (CHProtectedAppProvider *)a5;
  v21.receiver = self;
  v21.super_class = (Class)CHManager;
  v12 = -[CHSynchronizedLoggable initWithName:](&v21, sel_initWithName_, "CHManager");
  v13 = v12;
  if (v12)
  {
    -[CHSynchronizedLoggable logHandle](v12, "logHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1B3FA4000, v14, OS_LOG_TYPE_DEFAULT, "Creating CHManager with default values!", v20, 2u);
    }

    -[CHManager setDefaultInitValues](v13, "setDefaultInitValues");
    v15 = -[CHPhoneBookIOSManager initWithContactStore:]([CHPhoneBookIOSManager alloc], "initWithContactStore:", v9);
    phoneBookManager = v13->_phoneBookManager;
    v13->_phoneBookManager = v15;

    v17 = v10;
    if (!v10)
      v17 = objc_alloc_init(CHFeatureFlags);
    objc_storeStrong((id *)&v13->_featureFlags, v17);
    if (!v10)

    v18 = v11;
    if (!v11)
      v18 = objc_alloc_init(CHProtectedAppProvider);
    objc_storeStrong((id *)&v13->_protectedAppProvider, v18);
    if (!v11)

    -[CHProtectedAppProvider setDelegate:](v13->_protectedAppProvider, "setDelegate:", v13);
  }

  return v13;
}

- (CHManager)initWithFetchingLimitsDictionary:(id)a3 andCoalescingStrategy:(id)a4 andPostFetchingPredicate:(id)a5 withQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  CHManager *v13;
  CHManager *v14;
  NSObject *v15;
  uint8_t v17[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[CHManager initWithQueue:](self, "initWithQueue:", a6);
  v14 = v13;
  if (v13)
  {
    -[CHSynchronizedLoggable logHandle](v13, "logHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B3FA4000, v15, OS_LOG_TYPE_DEFAULT, "Creating CHManager with user values!", v17, 2u);
    }

    -[CHManager setInitialLimitingCallKinds:](v14, "setInitialLimitingCallKinds:", v10);
    objc_storeStrong((id *)&v14->_coalescingStrategy, a4);
    objc_storeStrong((id *)&v14->_postFetchingPredicate, a5);
  }

  return v14;
}

- (void)setInitialLimitingCallKinds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL *p_showsFaceTimeVideoCalls;
  void *v17;
  void *v18;
  BOOL *p_showsFaceTimeAudioCalls;
  void *v20;
  void *v21;
  BOOL *p_showsTelephonyCalls;
  int v23;
  int v24;
  int v25;
  int v26;
  id v27;

  v4 = a3;
  if (v4)
  {
    v27 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCHLimitCallKindsKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kCHLimitCallKindsKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHManager setLimitingCallKindsSync:](self, "setLimitingCallKindsSync:", v6);

    }
    else
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kCHLimitCallTypeKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kCHLimitCallTypeKey"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (int)v8;

      }
      else
      {
        v9 = -1;
      }

      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kCHLimitStartDateKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kCHLimitStartDateKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      objc_storeStrong((id *)&self->_limitingStartDate, v11);
      if (v10)

      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kCHLimitEndDateKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kCHLimitEndDateKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_storeStrong((id *)&self->_limitingEndDate, v13);
      if (v12)

      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kShowsFaceTimeVideoCallsKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kShowsFaceTimeVideoCallsKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        p_showsFaceTimeVideoCalls = &self->_showsFaceTimeVideoCalls;
        self->_showsFaceTimeVideoCalls = objc_msgSend(v15, "BOOLValue");

      }
      else
      {
        p_showsFaceTimeVideoCalls = &self->_showsFaceTimeVideoCalls;
        self->_showsFaceTimeVideoCalls = 1;
      }

      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kShowsFaceTimeAudioCallsKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kShowsFaceTimeAudioCallsKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        p_showsFaceTimeAudioCalls = &self->_showsFaceTimeAudioCalls;
        self->_showsFaceTimeAudioCalls = objc_msgSend(v18, "BOOLValue");

      }
      else
      {
        p_showsFaceTimeAudioCalls = &self->_showsFaceTimeAudioCalls;
        self->_showsFaceTimeAudioCalls = 1;
      }

      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kShowsTelephonyCallsKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kShowsTelephonyCallsKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        p_showsTelephonyCalls = &self->_showsTelephonyCalls;
        self->_showsTelephonyCalls = objc_msgSend(v21, "BOOLValue");

      }
      else
      {
        p_showsTelephonyCalls = &self->_showsTelephonyCalls;
        self->_showsTelephonyCalls = 1;
      }

      if (*p_showsFaceTimeVideoCalls)
        v23 = 0;
      else
        v23 = 8;
      v24 = ~v23;
      if (*p_showsFaceTimeAudioCalls)
        v25 = 0;
      else
        v25 = 16;
      if (*p_showsTelephonyCalls)
        v26 = 0;
      else
        v26 = 7;
      -[CHManager setLimitingCallTypesSync:](self, "setLimitingCallTypesSync:", (v24 ^ v25 ^ v26) & v9);
    }
    v4 = v27;
  }

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v3, OS_LOG_TYPE_DEFAULT, "CHManager is getting destroyed...", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CHManager;
  -[CHManager dealloc](&v4, sel_dealloc);
}

- (void)handleCallHistoryContactStoreChangedInternalNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__CHManager_handleCallHistoryContactStoreChangedInternalNotification___block_invoke;
  v6[3] = &unk_1E6746520;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable execute:](self, "execute:", v6);

}

void __70__CHManager_handleCallHistoryContactStoreChangedInternalNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "--- Contact Store changed! Invalidating call's AB info.", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setCacheIsDirty:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setFinishedLoadingAllCalls:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setReCoalesce:", 1);
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[12])
    v4 = (id)objc_msgSend(v3, "fetchRecentCallsSyncWithCoalescing:", 1);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  notifyClientsOfEvent(CFSTR("kCallHistoryDatabaseChangedNotification"), v5);

}

- (void)setPreFetchingPredicate:(id)a3
{
  NSPredicate *v5;
  NSArray *uncoalescedUnFilteredRecentCalls;
  NSPredicate *v7;

  v5 = (NSPredicate *)a3;
  if (self->_preFetchingPredicate != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_preFetchingPredicate, a3);
    uncoalescedUnFilteredRecentCalls = self->_uncoalescedUnFilteredRecentCalls;
    self->_uncoalescedUnFilteredRecentCalls = 0;

    -[CHManager resetCalls](self, "resetCalls");
    v5 = v7;
  }

}

- (void)resetCalls
{
  id v3;

  -[CHManager setCacheIsDirty:](self, "setCacheIsDirty:", 1);
  -[CHManager setFinishedLoadingAllCalls:](self, "setFinishedLoadingAllCalls:", 0);
  -[CHManager setReCoalesce:](self, "setReCoalesce:", 1);
  if (self->_recentCalls)
    v3 = -[CHManager fetchRecentCallsSyncWithCoalescing:](self, "fetchRecentCallsSyncWithCoalescing:", 1);
}

- (void)handleCallHistoryDatabaseChangedInternalNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__CHManager_handleCallHistoryDatabaseChangedInternalNotification___block_invoke;
  v6[3] = &unk_1E6746520;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CHSynchronizedLoggable execute:](self, "execute:", v6);

}

void __66__CHManager_handleCallHistoryDatabaseChangedInternalNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 138543362;
      v9 = v2;
      v5 = "--- Got Database changed notification: %{public}@. Make cache dirty and send client DB Changed Notification";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "--- Got Database changed notification due to an external change! Make cache dirty and send client DB Changed Notification";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 40), "resetCalls");
}

- (void)currentLocaleChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__CHManager_currentLocaleChanged___block_invoke;
  v6[3] = &unk_1E6746520;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable execute:](self, "execute:", v6);

}

void __34__CHManager_currentLocaleChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "--- Received current locale changed notification: %{public}@. Invalidating all calls' caller ID formatted values.", buf, 0xCu);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setCallerIdFormatted:", 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSArray)uncoalescedRecentCallsSync
{
  id v3;

  v3 = -[CHManager fetchRecentCallsSyncWithCoalescing:](self, "fetchRecentCallsSyncWithCoalescing:", 0);
  return self->_uncoalescedRecentCalls;
}

- (id)unCoalesceCall:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_msgSend(v3, "numberOfOccurrences");
  objc_msgSend(v3, "callOccurrences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v3, "copy");
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceUniqueIdKey"));
      v10 = v3;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUniqueId:", v11);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceCallTypeKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCallType:", objc_msgSend(v12, "unsignedIntegerValue"));

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceCallStatusKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCallStatus:", objc_msgSend(v13, "unsignedIntegerValue"));

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceDurationKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v9, "setDuration:");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceDateKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDate:", v15);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceDataUsageKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBytesOfDataUsed:", v16);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceMediaTypeKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMediaType:", objc_msgSend(v17, "unsignedIntegerValue"));

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceTTYTypeKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTtyType:", objc_msgSend(v18, "unsignedIntegerValue"));

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceServiceProviderKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setServiceProvider:", v19);

      v3 = v10;
      objc_msgSend(v9, "setCallOccurrences:", 0);
      objc_msgSend(v9, "setMultiCall:", 0);
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v9, i);

    }
  }

  return v4;
}

- (id)recentCallsWithPredicate:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__CHManager_recentCallsWithPredicate___block_invoke;
  v9[3] = &unk_1E6746808;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __38__CHManager_recentCallsWithPredicate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v4;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1B3FA4000, v3, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v15, 0x16u);

  }
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "fetchRecentCallsSyncWithCoalescing:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyPredicate:toCalls:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = objc_msgSend(v9, "count");
    v15 = 138543874;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2048;
    v20 = v13;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "<== %{public}@(%@) => %lu calls", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return v9;
}

- (unint64_t)countCallsWithPredicateSync:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v7;
    v20 = 2112;
    v21 = (unint64_t)v8;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v18, 0x16u);

  }
  if (v5)
  {
    -[CHManager uncoalescedRecentCallsSync](self, "uncoalescedRecentCallsSync");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CHManager fetchRecentCallsSyncWithCoalescing:](self, "fetchRecentCallsSyncWithCoalescing:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_msgSend(v10, "count");
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "predicateFormat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v13;
    v20 = 2048;
    v21 = v11;
    _os_log_impl(&dword_1B3FA4000, v12, OS_LOG_TYPE_DEFAULT, "User requested to count calls with predicate, %@. Returning %lu.", (uint8_t *)&v18, 0x16u);

  }
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v15;
    v20 = 2112;
    v21 = (unint64_t)v16;
    v22 = 2048;
    v23 = v11;
    _os_log_impl(&dword_1B3FA4000, v14, OS_LOG_TYPE_DEFAULT, "<== %{public}@(%@) %lu calls", (uint8_t *)&v18, 0x20u);

  }
  return v11;
}

- (unint64_t)countCallsWithPredicate:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__CHManager_countCallsWithPredicate___block_invoke;
  v8[3] = &unk_1E6746830;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __37__CHManager_countCallsWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "countCallsWithPredicateSync:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)addToCallHistory:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__CHManager_addToCallHistory___block_invoke;
  v7[3] = &unk_1E6746740;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable execute:](self, "execute:", v7);

}

void __30__CHManager_addToCallHistory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insert:withTransaction:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "generateSyncTransactions"));

}

- (void)addArrayToCallHistory:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CHManager_addArrayToCallHistory___block_invoke;
  v7[3] = &unk_1E6746740;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable execute:](self, "execute:", v7);

}

void __35__CHManager_addArrayToCallHistory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v10, 0x16u);

  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "generateSyncTransactions");
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "syncManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertRecords:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 40);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "User requested to insert new calls without sync transactions: \n %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "syncManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertRecordsWithoutTransactions:", *(_QWORD *)(a1 + 40));
  }

}

- (void)addArrayToCallHistory:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__CHManager_addArrayToCallHistory_withCompletion___block_invoke;
  v11[3] = &unk_1E6746858;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  -[CHSynchronizedLoggable execute:](self, "execute:", v11);

}

uint64_t __50__CHManager_addArrayToCallHistory_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t result;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v11, 0x16u);

  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "generateSyncTransactions");
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "syncManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertRecords:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 40);
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "User requested to insert new calls without sync transactions: \n %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "syncManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertRecordsWithoutTransactions:", *(_QWORD *)(a1 + 40));
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setOutgoingLocalParticipantUUID:(id)a3 forRecentCallsMatchingPredicate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__CHManager_setOutgoingLocalParticipantUUID_forRecentCallsMatchingPredicate___block_invoke;
  v10[3] = &unk_1E6746880;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CHSynchronizedLoggable execute:](self, "execute:", v10);

}

void __77__CHManager_setOutgoingLocalParticipantUUID_forRecentCallsMatchingPredicate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __CFString *v24;
  uint64_t v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v28 = v3;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Updating outgoing local participant UUID to %{public}@ for recent calls matching predicate %@.", buf, 0x16u);
  }

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "uncoalescedRecentCallsSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "uniqueId", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15)
        {
          v16 = *(_QWORD *)(a1 + 40);
          v24 = kCallUpdatePropertyOutgoingLocalParticipantUUID;
          v25 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uniqueId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v18);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "syncManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateObjects:", v5);

  }
}

- (void)markAllCallsAsReadWithPredicate:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CHManager_markAllCallsAsReadWithPredicate___block_invoke;
  v7[3] = &unk_1E6746740;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable execute:](self, "execute:", v7);

}

void __45__CHManager_markAllCallsAsReadWithPredicate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v19 = 138543618;
    v20 = v3;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v19, 0x16u);

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, kCallUpdatePropertyRead);

  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = *(void **)(a1 + 40);
      v19 = 138412290;
      v20 = v10;
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "User requested to mark some calls with this predicate, %@, as read", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "uncoalescedRecentCallsSync");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v12, "count"))
    {
      v14 = 0;
      do
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uniqueId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "uniqueId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v5, v17);

        }
        ++v14;
      }
      while (v14 < objc_msgSend(v12, "count"));
    }
    objc_msgSend(*(id *)(a1 + 32), "syncManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateObjects:", v13);

  }
  else
  {
    if (v9)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "User requested to mark ALL calls as read", (uint8_t *)&v19, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "syncManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateAllObjects:", v5);
  }

}

- (void)updateBytesOfDataUsedFor:(id)a3 with:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__CHManager_updateBytesOfDataUsedFor_with___block_invoke;
  v11[3] = &unk_1E67468A8;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  -[CHSynchronizedLoggable execute:](self, "execute:", v11);

}

void __43__CHManager_updateBytesOfDataUsedFor_with___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, %{public}@)", (uint8_t *)&v9, 0x20u);

  }
  if (*(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), kCallUpdatePropertyBytesUsed);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "syncManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateObjects:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __43__CHManager_updateBytesOfDataUsedFor_with___block_invoke_cold_1();
  }

}

- (void)updateMessageStatusFor:(id)a3 with:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__CHManager_updateMessageStatusFor_with___block_invoke;
  v11[3] = &unk_1E67468A8;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  -[CHSynchronizedLoggable execute:](self, "execute:", v11);

}

void __41__CHManager_updateMessageStatusFor_with___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, hasMessage=%{public}@)", (uint8_t *)&v9, 0x20u);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), kCallUpdatePropertyHasMessage);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "syncManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateObjects:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__CHManager_updateMessageStatusFor_with___block_invoke_cold_1();
  }

}

- (void)updateAutoAnsweredReasonFor:(id)a3 with:(int64_t)a4
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  int64_t v12;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__CHManager_updateAutoAnsweredReasonFor_with___block_invoke;
  v9[3] = &unk_1E67468D0;
  v9[4] = self;
  v10 = v7;
  v11 = a2;
  v12 = a4;
  v8 = v7;
  -[CHSynchronizedLoggable execute:](self, "execute:", v9);

}

void __46__CHManager_updateAutoAnsweredReasonFor_with___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 56);
    v13 = 138543874;
    v14 = v3;
    v15 = 2114;
    v16 = v4;
    v17 = 2048;
    v18 = v5;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, autoAnsweredReason=%ld)", (uint8_t *)&v13, 0x20u);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v13 = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, autoAnsweredReason=%{public}@)", (uint8_t *)&v13, 0x20u);

    }
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, kCallUpdatePropertyAutoAnsweredReason);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "syncManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateObjects:", v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__CHManager_updateMessageStatusFor_with___block_invoke_cold_1();
  }

}

- (void)updateEmergencyMediaItemFor:(id)a3 with:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__CHManager_updateEmergencyMediaItemFor_with___block_invoke;
  v11[3] = &unk_1E67468A8;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  -[CHSynchronizedLoggable execute:](self, "execute:", v11);

}

void __46__CHManager_updateEmergencyMediaItemFor_with___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v10 = 138543874;
    v11 = v3;
    v12 = 2114;
    v13 = v4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, mediaItem=%{public}@)", (uint8_t *)&v10, 0x20u);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 48), "getDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, kCallUpdatePropertyEmergencyMediaItem);

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "syncManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateObjects:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__CHManager_updateMessageStatusFor_with___block_invoke_cold_1();
  }

}

- (void)deleteTheseCallsSync:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "multiCall"))
        break;
      objc_msgSend(v7, "uniqueId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v7, "uniqueId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);
LABEL_12:

      }
      if (++v6 >= (unint64_t)objc_msgSend(v4, "count"))
        goto LABEL_14;
    }
    objc_msgSend(v7, "callOccurrences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceUniqueIdKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v9;
      }
      while (v9 < objc_msgSend(v8, "count"));
    }
    goto LABEL_12;
  }
LABEL_14:
  v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v14 = objc_msgSend(v5, "count");
  if (v14)
  {
    v15 = 0;
    v16 = v14 - 1;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendString:", v17);

      if (v16 == v15)
        break;
      objc_msgSend(v13, "appendString:", CFSTR(","));
      ++v15;
    }
  }
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v19;
    v24 = 2114;
    v25 = v13;
    _os_log_impl(&dword_1B3FA4000, v18, OS_LOG_TYPE_DEFAULT, "=> %{public}@(%{public}@)", buf, 0x16u);

  }
  -[CHManager syncManager](self, "syncManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deleteObjectsWithUniqueIds:withTransaction:", v5, 1);

  -[CHManager setCacheIsDirty:](self, "setCacheIsDirty:", 1);
  -[CHManager setFinishedLoadingAllCalls:](self, "setFinishedLoadingAllCalls:", 0);

}

- (void)deleteTheseCalls:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__CHManager_deleteTheseCalls___block_invoke;
  v7[3] = &unk_1E6746740;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable execute:](self, "execute:", v7);

}

uint64_t __30__CHManager_deleteTheseCalls___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "=> %{public}@", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "deleteTheseCallsSync:", *(_QWORD *)(a1 + 40));
}

- (void)deleteCall:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__CHManager_deleteCall___block_invoke;
  v6[3] = &unk_1E6746520;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable execute:](self, "execute:", v6);

}

void __24__CHManager_deleteCall___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "uniqueId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "=> deleteCall:%{public}@", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteTheseCallsSync:", v6);

  }
}

- (void)deleteCalls:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__CHManager_deleteCalls_withCompletion___block_invoke;
  v11[3] = &unk_1E6746858;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  -[CHSynchronizedLoggable execute:](self, "execute:", v11);

}

uint64_t __40__CHManager_deleteCalls_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "=> %{public}@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "deleteTheseCallsSync:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteCallAtIndex:(unint64_t)a3
{
  _QWORD v3[7];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__CHManager_deleteCallAtIndex___block_invoke;
  v3[3] = &unk_1E67468F8;
  v3[4] = self;
  v3[5] = a2;
  v3[6] = a3;
  -[CHSynchronizedLoggable execute:](self, "execute:", v3);
}

void __31__CHManager_deleteCallAtIndex___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v8 = 138543618;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User requested to delete call at index, %lu", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "fetchRecentCallsSyncWithCoalescing:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 && *(_QWORD *)(a1 + 48) < v6)
  {
    objc_msgSend(v5, "objectAtIndex:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deleteCall:", v7);

  }
}

- (void)deleteAllCallsSync
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User requested to delete ALL calls (with the global limits of course)", (uint8_t *)&v8, 0xCu);

  }
  -[CHManager syncManager](self, "syncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHManager getLimitsDictionary](self, "getLimitsDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteObjectsWithLimits:", v7);

  -[CHManager setCacheIsDirty:](self, "setCacheIsDirty:", 1);
  -[CHManager setFinishedLoadingAllCalls:](self, "setFinishedLoadingAllCalls:", 0);
}

- (id)getLimitsDictionaryForPrivateHeader
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CHManager featureFlags](self, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "protectedAppsEnabled");

  if (v5)
  {
    -[CHManager protectedBundleIDsExcludingCurrentProcess](self, "protectedBundleIDsExcludingCurrentProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("kCHLimitProtectedBundleIDsKey"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)protectedBundleIDsExcludingCurrentProcess
{
  __CFString *v3;
  void *v4;
  BOOL v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[CHManager featureFlags](self, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "protectedAppsEnabled"))
  {
    v5 = -[CHManager showsProtectedApps](self, "showsProtectedApps");

    if (!v5)
    {
      -[CHManager protectedAppProvider](self, "protectedAppProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "protectedApplicationBundleIDs");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[CHSynchronizedLoggable logHandle](self, "logHandle");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138543362;
        v13 = v7;
        _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Excluding protected apps from call history fetches %{public}@", (uint8_t *)&v12, 0xCu);
      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[CHManager showsProtectedApps](self, "showsProtectedApps");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Protected apps feature flag is off or we allow showing protectedApps %{public}@", (uint8_t *)&v12, 0xCu);
  }
  v7 = v3;
LABEL_11:

  return v7;
}

- (void)deleteAllCalls
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __27__CHManager_deleteAllCalls__block_invoke;
  v2[3] = &unk_1E6746460;
  v2[4] = self;
  -[CHSynchronizedLoggable execute:](self, "execute:", v2);
}

uint64_t __27__CHManager_deleteAllCalls__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteAllCallsSync");
}

- (void)clearDatabase
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __26__CHManager_clearDatabase__block_invoke;
  v2[3] = &unk_1E6746460;
  v2[4] = self;
  -[CHSynchronizedLoggable execute:](self, "execute:", v2);
}

void __26__CHManager_clearDatabase__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteAllObjects");

}

- (void)setLimitingCallTypes:(unsigned int)a3
{
  _QWORD v3[6];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__CHManager_setLimitingCallTypes___block_invoke;
  v3[3] = &unk_1E6746920;
  v3[4] = self;
  v3[5] = a2;
  v4 = a3;
  -[CHSynchronizedLoggable execute:](self, "execute:", v3);
}

uint64_t __34__CHManager_setLimitingCallTypes___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHRecentCall callTypeAsString:](CHRecentCall, "callTypeAsString:", *(unsigned int *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_DWORD *)(a1 + 48);
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@(0x%x)", (uint8_t *)&v7, 0x1Cu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setLimitingCallTypesSync:", *(unsigned int *)(a1 + 48));
}

- (void)setPostFetchingPredicate:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CHManager_setPostFetchingPredicate___block_invoke;
  v7[3] = &unk_1E6746740;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable execute:](self, "execute:", v7);

}

uint64_t __38__CHManager_setPostFetchingPredicate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@", (uint8_t *)&v6, 0x16u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setReCoalesce:", 1);
}

- (void)setLimitingStartDate:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CHManager_setLimitingStartDate___block_invoke;
  v7[3] = &unk_1E6746740;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable execute:](self, "execute:", v7);

}

uint64_t __34__CHManager_setLimitingStartDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@", (uint8_t *)&v6, 0x16u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCacheIsDirty:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setFinishedLoadingAllCalls:", 0);
}

- (void)setLimitingEndDate:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__CHManager_setLimitingEndDate___block_invoke;
  v7[3] = &unk_1E6746740;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable execute:](self, "execute:", v7);

}

uint64_t __32__CHManager_setLimitingEndDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@", (uint8_t *)&v6, 0x16u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCacheIsDirty:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setFinishedLoadingAllCalls:", 0);
}

- (void)setShowsFaceTimeVideoCalls:(BOOL)a3
{
  _QWORD v3[6];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CHManager_setShowsFaceTimeVideoCalls___block_invoke;
  v3[3] = &unk_1E6746948;
  v3[4] = self;
  v3[5] = a2;
  v4 = a3;
  -[CHSynchronizedLoggable execute:](self, "execute:", v3);
}

uint64_t __40__CHManager_setShowsFaceTimeVideoCalls___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  unsigned int v8;
  void *v9;
  int v10;
  const char *v11;
  unsigned int v12;
  unsigned int v13;
  _DWORD *v14;
  int v15;
  uint64_t v16;
  _BYTE v18[24];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)v18 = 138543618;
    *(_QWORD *)&v18[4] = v3;
    *(_WORD *)&v18[12] = 1024;
    *(_DWORD *)&v18[14] = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting showsFaceTimeVideoCalls to %d", v18, 0x12u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = *(_BYTE *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_9;
    v8 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    +[CHRecentCall callTypeAsString:](CHRecentCall, "callTypeAsString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) | 8;
    *(_DWORD *)v18 = 67109890;
    *(_DWORD *)&v18[4] = v8;
    *(_WORD *)&v18[8] = 2114;
    *(_QWORD *)&v18[10] = v9;
    *(_WORD *)&v18[18] = 1024;
    *(_DWORD *)&v18[20] = 8;
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = v10;
    v11 = "Old limitingCallType: 0x%x (%{public}@). OR Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    v12 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    +[CHRecentCall callTypeAsString:](CHRecentCall, "callTypeAsString:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) & 0xFFFFFFF7;
    *(_DWORD *)v18 = 67109890;
    *(_DWORD *)&v18[4] = v12;
    *(_WORD *)&v18[8] = 2112;
    *(_QWORD *)&v18[10] = v9;
    *(_WORD *)&v18[18] = 1024;
    *(_DWORD *)&v18[20] = -9;
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = v13;
    v11 = "Old limitingCallType: 0x%x (%@). AND Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, v11, v18, 0x1Eu);

LABEL_9:
  v14 = *(_DWORD **)(a1 + 32);
  v15 = v14[9];
  if (*(_BYTE *)(a1 + 48))
    v16 = v15 | 8u;
  else
    v16 = v15 & 0xFFFFFFF7;
  return objc_msgSend(v14, "setLimitingCallTypesSync:", v16, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
}

- (void)setShowsFaceTimeAudioCalls:(BOOL)a3
{
  _QWORD v3[6];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CHManager_setShowsFaceTimeAudioCalls___block_invoke;
  v3[3] = &unk_1E6746948;
  v3[4] = self;
  v3[5] = a2;
  v4 = a3;
  -[CHSynchronizedLoggable execute:](self, "execute:", v3);
}

uint64_t __40__CHManager_setShowsFaceTimeAudioCalls___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  const char *v9;
  int v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)v15 = 138543618;
    *(_QWORD *)&v15[4] = v3;
    *(_WORD *)&v15[12] = 1024;
    *(_DWORD *)&v15[14] = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting showsFaceTimeAudioCalls to %d", v15, 0x12u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = *(_BYTE *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_9;
    v8 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    *(_DWORD *)v15 = 67109632;
    *(_DWORD *)&v15[4] = v8;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = 16;
    *(_WORD *)&v15[14] = 1024;
    *(_DWORD *)&v15[16] = v8 | 0x10;
    v9 = "Old limitingCallType: 0x%x. OR Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    *(_DWORD *)v15 = 67109632;
    *(_DWORD *)&v15[4] = v10;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = -17;
    *(_WORD *)&v15[14] = 1024;
    *(_DWORD *)&v15[16] = v10 & 0xFFFFFFEF;
    v9 = "Old limitingCallType: 0x%x. AND Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, v9, v15, 0x14u);
LABEL_9:

  v11 = *(_DWORD **)(a1 + 32);
  v12 = v11[9];
  if (*(_BYTE *)(a1 + 48))
    v13 = v12 | 0x10u;
  else
    v13 = v12 & 0xFFFFFFEF;
  return objc_msgSend(v11, "setLimitingCallTypesSync:", v13, *(_OWORD *)v15, *(_QWORD *)&v15[16]);
}

- (void)setShowsProtectedApps:(BOOL)a3
{
  _QWORD v3[6];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__CHManager_setShowsProtectedApps___block_invoke;
  v3[3] = &unk_1E6746948;
  v3[4] = self;
  v3[5] = a2;
  v4 = a3;
  -[CHSynchronizedLoggable execute:](self, "execute:", v3);
}

uint64_t __35__CHManager_setShowsProtectedApps___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(unsigned __int8 *)(a1 + 48);
    v6 = 138543618;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting showsProtectedAppsTo to %d", (uint8_t *)&v6, 0x12u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) = *(_BYTE *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "resetCalls");
}

- (NSSet)allowedProtectedAppBundleIDs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CHManager_allowedProtectedAppBundleIDs__block_invoke;
  v3[3] = &unk_1E6746970;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __41__CHManager_allowedProtectedAppBundleIDs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allowedProtectedAppBundleIDs");
}

- (void)setAllowedProtectedAppBundleIDs:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CHManager_setAllowedProtectedAppBundleIDs___block_invoke;
  v7[3] = &unk_1E6746740;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[CHSynchronizedLoggable execute:](self, "execute:", v7);

}

uint64_t __45__CHManager_setAllowedProtectedAppBundleIDs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting allowedProtectedAppBundleIDs to %{public}@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setAllowedProtectedAppBundleIDs:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "resetCalls");
}

- (BOOL)showsTelephonyCalls
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__CHManager_showsTelephonyCalls__block_invoke;
  v3[3] = &unk_1E6746998;
  v3[4] = self;
  return -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v3);
}

uint64_t __32__CHManager_showsTelephonyCalls__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24);
}

- (BOOL)showsFaceTimeVideoCalls
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__CHManager_showsFaceTimeVideoCalls__block_invoke;
  v3[3] = &unk_1E6746998;
  v3[4] = self;
  return -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v3);
}

uint64_t __36__CHManager_showsFaceTimeVideoCalls__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25);
}

- (BOOL)showsFaceTimeAudioCalls
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__CHManager_showsFaceTimeAudioCalls__block_invoke;
  v3[3] = &unk_1E6746998;
  v3[4] = self;
  return -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v3);
}

uint64_t __36__CHManager_showsFaceTimeAudioCalls__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25);
}

- (unsigned)limitingCallTypes
{
  unsigned int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0x80000000;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__CHManager_limitingCallTypes__block_invoke;
  v4[3] = &unk_1E67469C0;
  v4[4] = self;
  v4[5] = &v5;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__CHManager_limitingCallTypes__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 36);
  return result;
}

- (NSDate)limitingStartDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__CHManager_limitingStartDate__block_invoke;
  v3[3] = &unk_1E67469E8;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

id __30__CHManager_limitingStartDate__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

- (NSDate)limitingEndDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__CHManager_limitingEndDate__block_invoke;
  v3[3] = &unk_1E67469E8;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

id __28__CHManager_limitingEndDate__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 56);
}

- (NSArray)limitingCallKinds
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__CHManager_limitingCallKinds__block_invoke;
  v3[3] = &unk_1E6746A10;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __30__CHManager_limitingCallKinds__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

- (NSPredicate)postFetchingPredicate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__CHManager_postFetchingPredicate__block_invoke;
  v3[3] = &unk_1E6746A38;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (NSPredicate *)(id)objc_claimAutoreleasedReturnValue();
}

id __34__CHManager_postFetchingPredicate__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 80);
}

- (NSString)coalescingStrategy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__CHManager_coalescingStrategy__block_invoke;
  v3[3] = &unk_1E6746A60;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __31__CHManager_coalescingStrategy__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 88);
}

- (void)setShowsTelephonyCalls:(BOOL)a3
{
  _QWORD v3[6];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__CHManager_setShowsTelephonyCalls___block_invoke;
  v3[3] = &unk_1E6746948;
  v3[4] = self;
  v3[5] = a2;
  v4 = a3;
  -[CHSynchronizedLoggable execute:](self, "execute:", v3);
}

uint64_t __36__CHManager_setShowsTelephonyCalls___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  const char *v9;
  int v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)v15 = 138543618;
    *(_QWORD *)&v15[4] = v3;
    *(_WORD *)&v15[12] = 1024;
    *(_DWORD *)&v15[14] = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting showsTelephonyCalls to %d", v15, 0x12u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = *(_BYTE *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_9;
    v8 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    *(_DWORD *)v15 = 67109632;
    *(_DWORD *)&v15[4] = v8;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = 7;
    *(_WORD *)&v15[14] = 1024;
    *(_DWORD *)&v15[16] = v8 | 7;
    v9 = "Old limitingCallType: 0x%x. OR Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    *(_DWORD *)v15 = 67109632;
    *(_DWORD *)&v15[4] = v10;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = -8;
    *(_WORD *)&v15[14] = 1024;
    *(_DWORD *)&v15[16] = v10 & 0xFFFFFFF8;
    v9 = "Old limitingCallType: 0x%x. AND Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, v9, v15, 0x14u);
LABEL_9:

  v11 = *(_DWORD **)(a1 + 32);
  v12 = v11[9];
  if (*(_BYTE *)(a1 + 48))
    v13 = v12 | 7u;
  else
    v13 = v12 & 0xFFFFFFF8;
  return objc_msgSend(v11, "setLimitingCallTypesSync:", v13, *(_OWORD *)v15, *(_QWORD *)&v15[16]);
}

- (double)callTimersGetIncoming
{
  double v2;
  _QWORD v4[7];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__CHManager_callTimersGetIncoming__block_invoke;
  v4[3] = &unk_1E6746A88;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = a2;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__CHManager_callTimersGetIncoming__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerIncoming");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "==> %{public}@ => %f seconds", (uint8_t *)&v7, 0x16u);

  }
}

- (double)callTimersGetOutgoing
{
  double v2;
  _QWORD v4[7];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__CHManager_callTimersGetOutgoing__block_invoke;
  v4[3] = &unk_1E6746A88;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = a2;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__CHManager_callTimersGetOutgoing__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerOutgoing");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "==> %{public}@ => %f seconds", (uint8_t *)&v7, 0x16u);

  }
}

- (double)callTimersGetLifetime
{
  double v2;
  _QWORD v4[7];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__CHManager_callTimersGetLifetime__block_invoke;
  v4[3] = &unk_1E6746A88;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = a2;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__CHManager_callTimersGetLifetime__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerLifetime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "==> %{public}@ => %f seconds", (uint8_t *)&v7, 0x16u);

  }
}

- (void)callTimersReset
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __28__CHManager_callTimersReset__block_invoke;
  v2[3] = &unk_1E6746AB0;
  v2[4] = self;
  v2[5] = a2;
  -[CHSynchronizedLoggable execute:](self, "execute:", v2);
}

void __28__CHManager_callTimersReset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User requested to reset call timers", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetTimers");

}

+ (unsigned)CHCallStatusForCallWithDuration:(double)a3 isOriginated:(BOOL)a4 isAnswered:(BOOL)a5
{
  unsigned int *v5;
  int *v6;
  int *v7;

  v5 = (unsigned int *)&kCHCallStatusConnectedIncoming;
  v6 = &kCHCallStatusMissed;
  if (a5)
    v6 = &kCHCallStatusAnsweredElsewhere;
  if (a3 > 0.0)
  {
    v7 = &kCHCallStatusConnectedOutgoing;
  }
  else
  {
    v5 = (unsigned int *)v6;
    v7 = &kCHCallStatusCancelled;
  }
  if (a4)
    v5 = (unsigned int *)v7;
  return *v5;
}

- (void)flush
{
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", &__block_literal_global_7);
}

- (void)addMultipleCallsToCallHistoryWithTransactions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CHManager_addMultipleCallsToCallHistoryWithTransactions___block_invoke;
  v6[3] = &unk_1E6746520;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable execute:](self, "execute:", v6);

}

void __59__CHManager_addMultipleCallsToCallHistoryWithTransactions___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertRecords:", *(_QWORD *)(a1 + 40));

}

- (void)addMultipleCallsToCallHistory:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__CHManager_addMultipleCallsToCallHistory___block_invoke;
  v6[3] = &unk_1E6746520;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable execute:](self, "execute:", v6);

}

void __43__CHManager_addMultipleCallsToCallHistory___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertRecordsWithoutTransactions:", *(_QWORD *)(a1 + 40));

}

- (int64_t)setRead:(BOOL)a3 forCallsWithPredicate:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__CHManager_setRead_forCallsWithPredicate___block_invoke;
  v10[3] = &unk_1E6746AD8;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v12 = &v14;
  v13 = a3;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __43__CHManager_setRead_forCallsWithPredicate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Updating read status for calls matching predicate %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  v7 = objc_msgSend(v4, "setRead:forCallsWithPredicate:error:", v5, v6, &v11);
  v8 = v11;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && v8 != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __43__CHManager_setRead_forCallsWithPredicate___block_invoke_cold_1();

  }
}

- (int64_t)deleteCallsWithPredicate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__CHManager_deleteCallsWithPredicate___block_invoke;
  v8[3] = &unk_1E6746B28;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __38__CHManager_deleteCallsWithPredicate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Deleting calls matching predicate %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v6 = objc_msgSend(v4, "deleteCallsWithPredicate:error:", v5, &v10);
  v7 = v10;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && v7 != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __38__CHManager_deleteCallsWithPredicate___block_invoke_cold_1();

  }
}

- (void)deleteCallsWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__CHManager_deleteCallsWithPredicate_completion___block_invoke;
  v10[3] = &unk_1E6746B50;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CHSynchronizedLoggable execute:](self, "execute:", v10);

}

void __49__CHManager_deleteCallsWithPredicate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Deleting calls matching predicate %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  v6 = objc_msgSend(v4, "deleteCallsWithPredicate:error:", v5, &v11);
  v7 = v11;

  if (v6 == 0x7FFFFFFFFFFFFFFFLL && v7 != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __38__CHManager_deleteCallsWithPredicate___block_invoke_cold_1();

  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v6);

}

- (id)callsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__CHManager_callsWithPredicate_limit_offset_batchSize___block_invoke;
  v17[3] = &unk_1E6746BA0;
  v17[4] = self;
  v13 = v10;
  v18 = v13;
  v20 = &v24;
  v14 = v12;
  v19 = v14;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v17);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __55__CHManager_callsWithPredicate_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving calls matching predicate %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "getLimitsDictionaryForPrivateHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchCallsWithPredicate:sortDescriptors:limitsDictionary:limit:offset:batchSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        objc_msgSend(*(id *)(a1 + 32), "phoneBookManager", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPhoneBookManager:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (id)callIdentifiersWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__CHManager_callIdentifiersWithPredicate_limit_offset_batchSize___block_invoke;
  v17[3] = &unk_1E6746BA0;
  v17[4] = self;
  v13 = v10;
  v18 = v13;
  v20 = &v24;
  v14 = v12;
  v19 = v14;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v17);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __65__CHManager_callIdentifiersWithPredicate_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving identifiers for calls matching predicate %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "getLimitsDictionaryForPrivateHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchCallIdentifiersWithPredicate:sortDescriptors:limitsDictionary:limit:offset:batchSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (unint64_t)coalescedCallCountWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__CHManager_coalescedCallCountWithPredicate___block_invoke;
  v11[3] = &unk_1E6746B78;
  v11[4] = self;
  v7 = v4;
  v12 = v7;
  v14 = &v15;
  v8 = v6;
  v13 = v8;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __45__CHManager_coalescedCallCountWithPredicate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving count of coalesced calls matching predicate %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "getLimitsDictionaryForPrivateHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "fetchCoalescedCallCountWithPredicate:sortDescriptors:limitsDictionary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);

}

- (id)coalescedCallsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__CHManager_coalescedCallsWithPredicate_limit_offset_batchSize___block_invoke;
  v17[3] = &unk_1E6746BA0;
  v17[4] = self;
  v13 = v10;
  v18 = v13;
  v20 = &v24;
  v14 = v12;
  v19 = v14;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v17);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __64__CHManager_coalescedCallsWithPredicate_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving coalesced calls matching predicate %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "getLimitsDictionaryForPrivateHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchCoalescedCallsWithPredicate:sortDescriptors:limitsDictionary:limit:offset:batchSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        objc_msgSend(*(id *)(a1 + 32), "phoneBookManager", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPhoneBookManager:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (id)latestRecentCallMatchingPredicate:(id)a3
{
  void *v3;
  void *v4;

  -[CHManager callsWithPredicate:limit:offset:batchSize:](self, "callsWithPredicate:limit:offset:batchSize:", a3, 1, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)latestCallMatchingNormalizedRemoteParticipantHandleValues:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY remoteParticipantHandles.normalizedValue IN %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(service_provider = %@) OR (service_provider = %@)"), CFSTR("com.apple.FaceTime"), CFSTR("com.apple.Telephony"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v5;
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CHManager latestRecentCallMatchingPredicate:](self, "latestRecentCallMatchingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)protectedAppsChanged
{
  NSObject *v3;
  uint8_t v4[16];

  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B3FA4000, v3, OS_LOG_TYPE_DEFAULT, "CHManager reset calls because protected apps changed", v4, 2u);
  }

  -[CHManager resetCalls](self, "resetCalls");
  notifyClientsOfEvent(CFSTR("kCallHistoryDatabaseChangedNotification"), 0);
}

- (NSPredicate)preFetchingPredicate
{
  return self->_preFetchingPredicate;
}

- (CHProtectedAppProvider)protectedAppProvider
{
  return self->_protectedAppProvider;
}

- (BOOL)showsProtectedApps
{
  return self->_showsProtectedApps;
}

- (void)setRecentCalls:(id)a3
{
  objc_storeStrong((id *)&self->_recentCalls, a3);
}

- (BOOL)generateSyncTransactions
{
  return self->_generateSyncTransactions;
}

- (void)setGenerateSyncTransactions:(BOOL)a3
{
  self->_generateSyncTransactions = a3;
}

- (int64_t)numberOfUnseenMissedCalls
{
  return self->_numberOfUnseenMissedCalls;
}

- (void)setNumberOfUnseenMissedCalls:(int64_t)a3
{
  self->_numberOfUnseenMissedCalls = a3;
}

- (void)setSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncManager, a3);
}

- (BOOL)reCoalesce
{
  return self->_reCoalesce;
}

- (void)setUncoalescedRecentCalls:(id)a3
{
  objc_storeStrong((id *)&self->_uncoalescedRecentCalls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncoalescedUnFilteredRecentCalls, 0);
  objc_storeStrong((id *)&self->_uncoalescedRecentCalls, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_phoneBookManager, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
  objc_storeStrong((id *)&self->_coalescingStrategy, 0);
  objc_storeStrong((id *)&self->_postFetchingPredicate, 0);
  objc_storeStrong((id *)&self->_protectedAppProvider, 0);
  objc_storeStrong((id *)&self->_limitingCallKinds, 0);
  objc_storeStrong((id *)&self->_limitingEndDate, 0);
  objc_storeStrong((id *)&self->_limitingStartDate, 0);
  objc_storeStrong((id *)&self->_preFetchingPredicate, 0);
}

- (void)coalescedCallsWithCalls:(_QWORD *)a3 usingStrategy:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "uniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1B3FA4000, a4, OS_LOG_TYPE_ERROR, "Coalescing hash not found for call with uniqueID %{public}@", a1, 0xCu);

}

- (void)fetchRecentCallsSyncWithCoalescing:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "count");
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1B3FA4000, a2, OS_LOG_TYPE_DEBUG, "After coalescing we have %lu calls", v3, 0xCu);
}

void __43__CHManager_updateBytesOfDataUsedFor_with___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Cannot update. Nil unique id or bytes used!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__CHManager_updateMessageStatusFor_with___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Cannot update. Nil unique id used!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__CHManager_setRead_forCallsWithPredicate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Could not update calls; operation failed with error %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __38__CHManager_deleteCallsWithPredicate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Could not delete calls; operation failed with error %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

@end
