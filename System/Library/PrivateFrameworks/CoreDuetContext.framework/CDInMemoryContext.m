@implementation CDInMemoryContext

uint64_t __94___CDInMemoryContext_unsafe_evalutateRegistrationPredicate_previousContextValue_date_keyPath___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  uint64_t v15;
  _BYTE v17[22];
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = _os_activity_create(&dword_18DD73000, "Duet: ContextStore Callback", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)v17 = 0;
  *(_QWORD *)&v17[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)v17);
  os_activity_scope_leave((os_activity_scope_state_t)v17);

  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v5)
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v17 = 138543874;
    *(_QWORD *)&v17[4] = v6;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = v7;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_18DD73000, v4, OS_LOG_TYPE_INFO, "Executing callback for client: %{public}@, registration: %@, based on keypath change: %{public}@", v17, 0x20u);

  }
  else
  {
    if (!v5)
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v17 = 138412546;
    *(_QWORD *)&v17[4] = v6;
    *(_WORD *)&v17[12] = 2114;
    *(_QWORD *)&v17[14] = v9;
    _os_log_impl(&dword_18DD73000, v4, OS_LOG_TYPE_INFO, "Executing callback for registration: %@, based on keypath change: %{public}@", v17, 0x16u);
  }

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _cdcontextstore_signpost_evaluateCallback_begin();

  objc_msgSend(*(id *)(a1 + 32), "informativeCallback");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "informativeCallback");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v14, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void (**)(_QWORD, _QWORD, _QWORD)))(v15 + 16))(v15, v13);
  }

  return _cdcontextstore_signpost_evaluateCallback_end();
}

void __70___CDInMemoryContext_setObject_returningMetadataForContextualKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "unsafe_setObject:returningMetadataForContextualKeyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53___CDInMemoryContext_propertiesForContextualKeyPath___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __41___CDInMemoryContext_deregisterCallback___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _cdcontextstore_signpost_deregister_begin();

  objc_msgSend(*(id *)(a1 + 40), "unsafe_deregisterCallback:", *(_QWORD *)(a1 + 32));
  return _cdcontextstore_signpost_deregister_end();
}

void __84___CDInMemoryContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_valueDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "unsafe_addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66___CDInMemoryContext_locationCoordinatorCircularRegionsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _CDContextValue *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _CDContextValue *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
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
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v1 = a1;
  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("previousRegistrationRegionInfos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("regionStateChangeDate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v3;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v38)
  {
    v36 = v1;
    v37 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v38; i = v28 + 1)
      {
        if (*(_QWORD *)v52 != v37)
          objc_enumerationMutation(obj);
        v41 = i;
        v42 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKeyedSubscript:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v48 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
              +[_CDContextQueries changeDateKey](_CDContextQueries, "changeDateKey");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15 && objc_msgSend(v7, "compare:", v15) == -1)
              {
                v16 = v15;

                v7 = v16;
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v10);
        }

        v17 = objc_alloc_init(_CDContextValue);
        -[_CDContextValue setValue:](v17, "setValue:", v8);
        -[_CDContextValue setLastModifiedDate:](v17, "setLastModifiedDate:", v7);
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v18 = *(void **)(*(_QWORD *)(v1 + 40) + 48);
        +[_CDContextQueries keyPathForCircularLocationRegions](_CDContextQueries, "keyPathForCircularLocationRegions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v21)
        {
          v22 = v21;
          v39 = v17;
          v23 = *(_QWORD *)v44;
LABEL_18:
          v24 = 0;
          while (1)
          {
            if (*(_QWORD *)v44 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v24);
            objc_msgSend(v25, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", v42);

            if ((v27 & 1) != 0)
              break;
            if (v22 == ++v24)
            {
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
              if (v22)
                goto LABEL_18;
              v1 = v36;
              v28 = v41;
              v17 = v39;
              goto LABEL_28;
            }
          }
          v29 = v25;

          v1 = v36;
          v28 = v41;
          v17 = v39;
          if (!v29)
            goto LABEL_29;
          objc_msgSend(v34, "addObject:", v29);
          v30 = *(void **)(v36 + 40);
          +[_CDContextQueries keyPathForCircularLocationRegions](_CDContextQueries, "keyPathForCircularLocationRegions");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:", v29, v39, v35, v31);

          v20 = v29;
        }
        else
        {
          v28 = v41;
        }
LABEL_28:

LABEL_29:
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v38);
  }

  v32 = *(void **)(v1 + 40);
  v33 = (void *)objc_msgSend(v34, "copy");
  objc_msgSend(v32, "unsafe_registerFutureSystemTimeBasedCallbacksForRegistrations:date:", v33, v35);

}

void __54___CDInMemoryContext_hasKnowledgeOfContextualKeyPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unsafe_evaluatedContextWithRegistration:date:", 0, v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 != 0;

}

void __49___CDInMemoryContext_objectForContextualKeyPath___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __59___CDInMemoryContext_setContextValue_forContextualKeyPath___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

void __53___CDInMemoryContext_setObject_forContextualKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "unsafe_setObject:returningMetadataForContextualKeyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __59___CDInMemoryContext_lastModifiedDateForContextualKeyPath___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastModifiedDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __87___CDInMemoryContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_removedObjects___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13);
  if (*(_QWORD *)(a1 + 48))
  {
    if (!v13)
      goto LABEL_5;
    objc_msgSend(v13, "value");
    v2 = objc_claimAutoreleasedReturnValue();
    if (!v2
      || (v3 = (void *)v2,
          objc_msgSend(v13, "value"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v4,
          v3,
          (isKindOfClass & 1) != 0))
    {
LABEL_5:
      objc_msgSend(v13, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 48));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      objc_msgSend(*(id *)(a1 + 32), "unsafe_addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40), 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }

}

void __45___CDInMemoryContext_addCallback_forKeyPath___block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _BYTE v18[22];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _os_activity_create(&dword_18DD73000, "Duet: ContextStore Register", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)v18 = 0;
  *(_QWORD *)&v18[8] = 0;
  os_activity_scope_enter(v3, (os_activity_scope_state_t)v18);
  os_activity_scope_leave((os_activity_scope_state_t)v18);

  objc_msgSend(a1[4], "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend(a1[4], "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v18 = 138543618;
    *(_QWORD *)&v18[4] = v7;
    *(_WORD *)&v18[12] = 2112;
    *(_QWORD *)&v18[14] = v8;
    _os_log_impl(&dword_18DD73000, v5, OS_LOG_TYPE_INFO, "Registering callback for client: %{public}@, registration: %@", v18, 0x16u);

  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend(a1[4], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v18 = 138412290;
    *(_QWORD *)&v18[4] = v7;
    _os_log_impl(&dword_18DD73000, v5, OS_LOG_TYPE_INFO, "Registering callback for registration: %@", v18, 0xCu);
  }

LABEL_7:
  objc_msgSend(a1[4], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _cdcontextstore_signpost_register_begin();

  objc_msgSend(*((id *)a1[6] + 6), "objectForKeyedSubscript:", a1[5]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    objc_msgSend(*((id *)a1[6] + 6), "setObject:forKeyedSubscript:", v11, a1[5]);
  }
  if (objc_msgSend(v11, "containsObject:", a1[4]))
    objc_msgSend(a1[6], "unsafe_deregisterCallback:", a1[4]);
  v12 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", a1[4], 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_19);
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v11, "insertObject:atIndex:", a1[4], v12);
  v13 = a1[5];
  +[_CDContextQueries keyPathForSystemTime](_CDContextQueries, "keyPathForSystemTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v13, "isEqual:", v14);

  if ((_DWORD)v13)
    objc_msgSend(a1[6], "unsafe_registerFutureSystemTimeBasedCallbacksForRegistration:date:", a1[4], v2);
  v15 = a1[5];
  +[_CDContextQueries keyPathForCircularLocationRegions](_CDContextQueries, "keyPathForCircularLocationRegions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "isEqual:", v16);

  if ((_DWORD)v15)
  {
    objc_msgSend(a1[6], "locationRegistrationMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addRegistration:", a1[4]);

  }
  _cdcontextstore_signpost_register_end();

}

uint64_t __45___CDInMemoryContext_addCallback_forKeyPath___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithUnsignedInt:", objc_msgSend(a3, "qualityOfService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "qualityOfService");

  objc_msgSend(v7, "numberWithUnsignedInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

void __45___CDInMemoryContext_evaluatePredicate_date___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "unsafe_evaluatedContextWithRegistration:date:", 0, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "evaluateWithState:previousValue:", v2, 0);

}

uint64_t __91___CDInMemoryContext_evalutateRegistrationPredicatesWithPreviousContextValue_date_keyPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unsafe_evalutateRegistrationPredicatesWithPreviousContextValue:date:keyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __38___CDInMemoryContext_allRegistrations__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {
          v8 = *(void **)(a1 + 40);
          objc_msgSend(v7, "array");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v9);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

@end
