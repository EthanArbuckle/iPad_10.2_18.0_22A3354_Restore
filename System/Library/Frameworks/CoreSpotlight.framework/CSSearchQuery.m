@implementation CSSearchQuery

- (CSSearchQuery)initWithQueryString:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  CSSearchQuery *v10;
  CSSearchQuery *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  logForCSLogCategoryQuery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CSSearchQuery initWithQueryString:queryContext:].cold.1();

  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v7, "userQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v7, "setUserQueryOptions:", objc_msgSend(v7, "userQueryOptions") | 0x1000);
      self->_requireQueryParse = 1;
    }

  }
  v13.receiver = self;
  v13.super_class = (Class)CSSearchQuery;
  v10 = -[CSSearchQuery init](&v13, sel_init);
  v11 = v10;
  if (v10)
    -[CSSearchQuery commonInitWithQueryString:queryContext:](v10, "commonInitWithQueryString:queryContext:", v6, v7);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateBundleID, 0);
  objc_storeStrong(&self->_restartGatherEndedHandler, 0);
  objc_storeStrong(&self->_restartedHandler, 0);
  objc_storeStrong(&self->_interruptedHandler, 0);
  objc_storeStrong(&self->_foundItemHandler, 0);
  objc_storeStrong(&self->_completionScoresHandler, 0);
  objc_storeStrong(&self->_completionsHandler, 0);
  objc_storeStrong(&self->_resolvedAttributeNamesHandler, 0);
  objc_storeStrong(&self->_countChangedHandler, 0);
  objc_storeStrong(&self->_photosComputedAttributesHandler, 0);
  objc_storeStrong(&self->_changedAttributesHandler, 0);
  objc_storeStrong(&self->_foundAttributesHandler, 0);
  objc_storeStrong(&self->_removedItemsHandler, 0);
  objc_storeStrong(&self->_changedItemsHandler, 0);
  objc_storeStrong(&self->_priorityGatherEndedHandler, 0);
  objc_storeStrong(&self->_gatherEndedHandler, 0);
  objc_storeStrong((id *)&self->_liveIndexUserFSOIDTOIdentifierMap, 0);
  objc_storeStrong((id *)&self->_liveIndexBundleIDToBundleString, 0);
  objc_storeStrong((id *)&self->_liveIndexBundleIDToIndexItemIDMap, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_foundItemsHandler, 0);
  objc_storeStrong((id *)&self->_megadomeCountingQuerySearchTo, 0);
  objc_storeStrong((id *)&self->_megadomeCountingQuerySearchFrom, 0);
  objc_storeStrong((id *)&self->_suggestionCountDispatchGroup, 0);
  objc_storeStrong((id *)&self->_suggestionCountQueries, 0);
  objc_storeStrong((id *)&self->_mappingStrategy, 0);
  objc_storeStrong((id *)&self->_originalAttributes, 0);
}

- (void)setupFetchAttributesForSearch
{
  __assert_rtn("-[CSSearchQuery setupFetchAttributesForSearch]", "CSSearchQuery.m", 3052, "[_queryContext.fetchAttributes objectAtIndex:(NSUInteger)bvi] == s");
}

- (BOOL)live
{
  return -[CSSearchQueryContext live](self->_queryContext, "live");
}

- (BOOL)isTopHitQuery
{
  return 0;
}

void __109__CSSearchQuery_processResultFromPlist_atIndex_protectionClass_oids_oidCount_addItems_updateItems_moveItems___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void **v23;
  __int16 *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void **v28;
  void *v29;
  void (**v30)(id, uint64_t, uint64_t, uint64_t, _BYTE *);
  id v31;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
  {
    *a3 = 1;
    return;
  }
  v6 = *(_QWORD *)(a1 + 64);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (!v6)
    goto LABEL_14;
  v7 = *(_QWORD *)(v6 + 8 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  if (!v7)
    goto LABEL_15;
  if ((*(__int16 *)(a1 + 104) & 0x80000000) == 0
    && (v8 = *(id *)(a2 + 8 * *(unsigned __int16 *)(a1 + 104))) != 0)
  {
    v9 = v8;
    if (*(__int16 *)(a1 + 106) < 0 || (v10 = *(id *)(a2 + 8 * *(unsigned __int16 *)(a1 + 106))) == 0)
    {
      LODWORD(v7) = 0;
    }
    else
    {
      v11 = v10;
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
      {
        objc_msgSend(v12, "addOrUpdateUserFSLiveOID:userFSDomain:identifier:", v7, v13, v11);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v14 = **(void ***)(a1 + 72);
          if (v14)
          {
            objc_msgSend(v14, "addObject:", v7);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = *(void ***)(a1 + 72);
            v29 = *v28;
            *v28 = (void *)v27;

          }
        }

        LODWORD(v7) = 0;
      }
      else
      {
        LODWORD(v7) = objc_msgSend(v12, "addOrUpdateLiveOID:bundleID:identifier:", v7, v9, v11);
      }

    }
  }
  else
  {
LABEL_14:
    LODWORD(v7) = 0;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "foundItemHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = (void *)objc_msgSend((id)v18, "copyCSSearchableItemWithValues:valueCount:attrKeys:protectionClass:mappingStrategy:attrInfo:requestedAttributeCount:unpackInfo:userFSDomain:", a2, *(_QWORD *)(a1 + 80), *(_QWORD *)(v18 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(v18 + 64), v18 + 26, *(__int16 *)(v18 + 24), *(_QWORD *)(a1 + 108), *(unsigned __int16 *)(a1 + 116), *(_QWORD *)(a1 + 40));
    v31 = v19;
    if (v19)
    {
      v20 = v19;
      if ((_DWORD)v7)
      {
        v21 = **(void ***)(a1 + 88);
        if (!v21)
        {
          v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v31, 1);
          v23 = *(void ***)(a1 + 88);
LABEL_33:
          v26 = *v23;
          *v23 = (void *)v22;

          goto LABEL_34;
        }
      }
      else
      {
        v21 = **(void ***)(a1 + 96);
        if (!v21)
        {
          v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v31, 1);
          v23 = *(void ***)(a1 + 96);
          goto LABEL_33;
        }
      }
      objc_msgSend(v21, "addObject:", v20);
    }
LABEL_34:

    return;
  }
  if ((v7 & 1) != 0 || (v16 = *(_QWORD **)(a1 + 64)) != 0 && *v16 == 3213)
  {
    v17 = 1;
  }
  else
  {
    v17 = 0;
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  v24 = *(__int16 **)(a1 + 32);
  if (*(_QWORD *)(a1 + 80) >= (unint64_t)v24[12])
    v25 = v24[12];
  else
    v25 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v24, "foundItemHandler");
  v30 = (void (**)(id, uint64_t, uint64_t, uint64_t, _BYTE *))objc_claimAutoreleasedReturnValue();
  v30[2](v30, v17, v25, a2, a3);

}

- (id)copyCSSearchableItemWithValues:(id *)a3 valueCount:(unint64_t)a4 attrKeys:(unint64_t *)a5 protectionClass:(id)a6 mappingStrategy:(id)a7 attrInfo:(signed __int16 *)a8 requestedAttributeCount:(unint64_t)a9 unpackInfo:(CSUnpackInfo)a10 userFSDomain:(id)a11
{
  unint64_t v14;
  char *v16;
  size_t v17;
  id v18;
  id v19;
  CSSearchableItem *v21;
  uint64_t v23;
  id *v24;
  unint64_t *v25;
  uint64_t v26;
  id v27;
  BOOL v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  CSSearchableItemAttributeSet *v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  unint64_t v45;
  id v46;
  uint64_t v47;

  v14 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v16 = (char *)&v38 - ((8 * a4 + 23) & 0xFFFFFFFFFFFFFFF0);
  v17 = 8 * a4 + 8;
  bzero(v16, v17);
  bzero(v16, v17);
  if (a10.var0 < 0 || a10.var0 >= v14)
    return 0;
  v18 = a3[a10.var0];
  v19 = (id)*MEMORY[0x1E0C9B0D0];
  if (!v18 || v18 == v19)
    return 0;
  v39 = a6;
  v44 = a11;
  if ((uint64_t)(v14 - 1) >= 0)
  {
    v23 = *(_QWORD *)&a10.var0 >> 16;
    v41 = 0;
    v42 = a10.var4 + 1;
    v45 = a9;
    v46 = 0;
    v40 = a10.var0 + 1;
    v24 = a3 - 1;
    v25 = a5 - 1;
    v43 = (*(uint64_t *)&a10.var0 >> 48) + 1;
    while (1)
    {
      v26 = v14 - 1;
      v27 = v24[v14];
      if (v27)
        v28 = v27 == v19;
      else
        v28 = 1;
      if (v28)
        goto LABEL_29;
      if (v26 == (__int16)v23)
      {
        v46 = v27;
        if (v26 >= v45)
        {
          LOWORD(v23) = -1;
          goto LABEL_29;
        }
        v24[v14] = 0;
        LOWORD(v23) = -1;
      }
      else if (((uint64_t)(*(_QWORD *)&a10.var0 << 16) >> 48) + 1 == v14 || v43 == v14 || v42 == v14)
      {
        v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v27);
      }
      else
      {
        if (v44 && v40 == v14)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB3940]);
          v30 = objc_msgSend(v29, "initWithFormat:", CFSTR("%@/%@"), v44, v27);
          v41 = v27;
          v27 = (id)v30;
        }
        v24[v14] = 0;
      }
      *(_QWORD *)&v16[8 * v25[v14]] = v27;
LABEL_29:
      --v14;
      if (v26 <= 0)
        goto LABEL_32;
    }
  }
  v46 = 0;
  v41 = 0;
LABEL_32:
  v31 = v39;
  if (v39)
  {
    if (!v44)
    {
      v32 = objc_msgSend(a7, "indexForKey:", CFSTR("_kMDItemProtectionClass"));
      if (v32 != 0x7FFFFFFFFFFFFFFFLL && !*(_QWORD *)&v16[8 * v32])
        *(_QWORD *)&v16[8 * v32] = v31;
    }
  }
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B70]), "initWithSearchStrategy:", a7);
  objc_msgSend(v33, "_setValues:retain:", v16, 0);
  v34 = v41;
  if (v41)
  {
    if (objc_msgSend(a7, "indexForKey:", CFSTR("kMDItemFileItemID")) != 0x7FFFFFFFFFFFFFFFLL
      && !objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("kMDItemFileItemID")))
    {
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("kMDItemFileItemID"));
    }

    if (objc_msgSend(a7, "indexForKey:", CFSTR("FPDomainIdentifier")) != 0x7FFFFFFFFFFFFFFFLL
      && !objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("FPDomainIdentifier")))
    {
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v31, CFSTR("FPDomainIdentifier"));
    }
    if (objc_msgSend(a7, "indexForKey:", CFSTR("FPCapabilities")) != 0x7FFFFFFFFFFFFFFFLL
      && !objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("FPCapabilities")))
    {
      objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E2430150, CFSTR("FPCapabilities"));
    }
    if (objc_msgSend(a7, "indexForKey:", CFSTR("FPParentFileItemID")) != 0x7FFFFFFFFFFFFFFFLL
      && !objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("FPParentFileItemID")))
    {
      objc_msgSend(v33, "setObject:forKeyedSubscript:", CFSTR("NSFileProviderRootContainerItemIdentifier"), CFSTR("FPParentFileItemID"));
    }
  }
  v35 = -[CSSearchableItemAttributeSet initWithKnownKeysDictionary:]([CSSearchableItemAttributeSet alloc], "initWithKnownKeysDictionary:", v33);

  v21 = -[CSSearchableItem initWithAttributeSet:]([CSSearchableItem alloc], "initWithAttributeSet:", v35);
  v36 = v46;
  if (v46)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "length") == 16)
    {
      v37 = (_QWORD *)objc_msgSend(v36, "bytes");
      -[CSSearchableItem setScore:](v21, "setScore:", *v37, v37[1]);
    }
  }

  return v21;
}

- (id)foundItemHandler
{
  return objc_getProperty(self, a2, 272, 1);
}

- (BOOL)addOrUpdateLiveOID:(int64_t)a3 bundleID:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  NSMapTable *liveIndexBundleIDToIndexItemIDMap;
  NSMapTable *v11;
  NSMapTable *v12;
  NSMapTable *v13;
  NSMapTable *liveIndexBundleIDToBundleString;
  void *v15;

  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_liveItemLock);
  liveIndexBundleIDToIndexItemIDMap = self->_liveIndexBundleIDToIndexItemIDMap;
  if (!liveIndexBundleIDToIndexItemIDMap)
  {
    v11 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 0);
    v12 = self->_liveIndexBundleIDToIndexItemIDMap;
    self->_liveIndexBundleIDToIndexItemIDMap = v11;

    v13 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 0);
    liveIndexBundleIDToBundleString = self->_liveIndexBundleIDToBundleString;
    self->_liveIndexBundleIDToBundleString = v13;

    liveIndexBundleIDToIndexItemIDMap = self->_liveIndexBundleIDToIndexItemIDMap;
  }
  -[NSMapTable objectForKey:](liveIndexBundleIDToIndexItemIDMap, "objectForKey:", a3 >> 32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 0);
    -[NSMapTable setObject:forKey:](self->_liveIndexBundleIDToIndexItemIDMap, "setObject:forKey:", v15, a3 >> 32);
    -[NSMapTable setObject:forKey:](self->_liveIndexBundleIDToBundleString, "setObject:forKey:", v8, a3 >> 32);
  }
  objc_msgSend(v15, "setObject:forKey:", v9, a3);
  os_unfair_lock_unlock(&self->_liveItemLock);

  return 0;
}

- (void)setBundleIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchQueryContext setBundleIDs:](self->_queryContext, "setBundleIDs:", v6);

  }
  else
  {
    -[CSSearchQueryContext setBundleIDs:](self->_queryContext, "setBundleIDs:", 0);
  }

}

- (void)setProtectionClasses:(NSArray *)protectionClasses
{
  void *v4;
  id v5;

  if (protectionClasses)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchQueryContext setProtectionClasses:](self->_queryContext, "setProtectionClasses:", v4);

  }
  else
  {
    -[CSSearchQueryContext setProtectionClasses:](self->_queryContext, "setProtectionClasses:");
  }
}

uint64_t __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _BYTE *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  void *v30;
  os_signpost_id_t v31;
  int v32;
  NSObject *v33;
  void *v34;
  os_signpost_id_t v35;
  const char *v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  logForCSLogCategoryQuery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_4();

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  logForCSLogCategoryQuery();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 72);
      v8 = *(_QWORD *)(a1 + 80);
      v38 = 134218240;
      v39 = v7;
      v40 = 1024;
      v41 = v8;
      _os_log_impl(&dword_18C42F000, v5, OS_LOG_TYPE_INFO, "qid=%ld - Results type: %d ", (uint8_t *)&v38, 0x12u);
    }

    v9 = 0;
    switch(*(_QWORD *)(a1 + 80))
    {
      case 0:
        goto LABEL_39;
      case 1:
        if (_os_feature_enabled_impl() && objc_msgSend(*(id *)(a1 + 32), "isTopHitQuery"))
        {
          logForCSLogCategoryQuery();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = v10;
          v12 = *(_QWORD *)(a1 + 72);
          if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            LOWORD(v38) = 0;
            _os_signpost_emit_with_name_impl(&dword_18C42F000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "finishTopHitRanking", (const char *)&unk_18C505DC6, (uint8_t *)&v38, 2u);
          }

          objc_msgSend(*(id *)(a1 + 32), "finishTopHitRanking");
          logForCSLogCategoryQuery();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v13;
          v15 = *(_QWORD *)(a1 + 72);
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
          {
            LOWORD(v38) = 0;
            _os_signpost_emit_with_name_impl(&dword_18C42F000, v14, OS_SIGNPOST_INTERVAL_END, v15, "finishTopHitRanking", (const char *)&unk_18C505DC6, (uint8_t *)&v38, 2u);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
        goto LABEL_7;
      case 2:
        if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("Priority"), 0))
        {
          logForCSLogCategoryQuery();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = *(_QWORD *)(a1 + 72);
            v38 = 134217984;
            v39 = v17;
            _os_log_impl(&dword_18C42F000, v16, OS_LOG_TYPE_DEFAULT, "qid=%ld - Priority Gather ended", (uint8_t *)&v38, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "priorityGatherEndedHandler");
          v18 = objc_claimAutoreleasedReturnValue();
          v5 = v18;
          if (v18)
            (*(void (**)(uint64_t))(v18 + 16))(v18);
          goto LABEL_6;
        }
        v23 = *(_BYTE **)(a1 + 32);
        if (!v23[57])
        {
          v23[57] = 1;
          logForCSLogCategoryQuery();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = *(_QWORD *)(a1 + 72);
            v38 = 134217984;
            v39 = v25;
            _os_log_impl(&dword_18C42F000, v24, OS_LOG_TYPE_DEFAULT, "qid=%ld - Gather ended", (uint8_t *)&v38, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "handleGatherEnded");
          v23 = *(_BYTE **)(a1 + 32);
        }
        objc_msgSend(v23, "queryContext");
        v5 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject generateSuggestions](v5, "generateSuggestions"))
        {
          logForCSLogCategoryQuery();
          v26 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "queryContext");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "queryID");

          if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
          {
            LOWORD(v38) = 0;
            _os_signpost_emit_with_name_impl(&dword_18C42F000, v26, OS_SIGNPOST_INTERVAL_END, v28, "CSUserQuerySuggestions", " enableTelemetry=YES ", (uint8_t *)&v38, 2u);
          }
          goto LABEL_76;
        }
        objc_msgSend(*(id *)(a1 + 32), "queryContext");
        v26 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject rankingType](v26, "rankingType") == 1)
        {
          logForCSLogCategoryQuery();
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "queryContext");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "queryID");

          if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            LOWORD(v38) = 0;
            _os_signpost_emit_with_name_impl(&dword_18C42F000, v29, OS_SIGNPOST_INTERVAL_END, v31, "CSUserQueryTopHits", " enableTelemetry=YES ", (uint8_t *)&v38, 2u);
          }
          goto LABEL_75;
        }
        objc_msgSend(*(id *)(a1 + 32), "queryContext");
        v29 = objc_claimAutoreleasedReturnValue();
        v32 = -[NSObject counting](v29, "counting");
        logForCSLogCategoryQuery();
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "queryContext");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "queryID");

        if (v32)
        {
          if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v33))
            goto LABEL_74;
          LOWORD(v38) = 0;
          v36 = "CSUserQueryCounting";
        }
        else
        {
          if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v33))
            goto LABEL_74;
          LOWORD(v38) = 0;
          v36 = "CSUserQuery";
        }
        _os_signpost_emit_with_name_impl(&dword_18C42F000, v33, OS_SIGNPOST_INTERVAL_END, v35, v36, " enableTelemetry=YES ", (uint8_t *)&v38, 2u);
LABEL_74:

LABEL_75:
LABEL_76:

        goto LABEL_6;
      case 5:
        if (!*(_BYTE *)(a1 + 89))
          goto LABEL_7;
        if (objc_msgSend(*(id *)(a1 + 40), "length") != 8)
          goto LABEL_7;
        v20 = *(_QWORD *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
        if (!v20)
          goto LABEL_7;
        v21 = *(id *)(a1 + 32);
        objc_sync_enter(v21);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) += v20;
        objc_sync_exit(v21);

        objc_msgSend(*(id *)(a1 + 32), "countChangedHandler");
        v22 = objc_claimAutoreleasedReturnValue();
        v19 = v22;
        if (v22)
          (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v22, v20);
LABEL_30:

        goto LABEL_7;
      case 6:
        if (*(_BYTE *)(a1 + 88) || *(_BYTE *)(a1 + 90))
        {
          v9 = 1;
LABEL_39:
          if (!*(_BYTE *)(a1 + 89))
          {
            if (*(_BYTE *)(a1 + 88))
            {
              objc_msgSend(*(id *)(a1 + 32), "processAttributesData:update:protectionClass:", *(_QWORD *)(a1 + 40), v9, *(_QWORD *)(a1 + 48));
            }
            else if (*(_BYTE *)(a1 + 90))
            {
              objc_msgSend(*(id *)(a1 + 32), "processLiveResultsData:oidData:protectionClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
            }
            else
            {
              logForCSLogCategoryQuery();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_2();

              objc_msgSend(*(id *)(a1 + 32), "processResultsData:protectionClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
            }
          }
        }
        goto LABEL_7;
      case 7:
        if (*(_BYTE *)(a1 + 90) && !*(_BYTE *)(a1 + 88) && !*(_BYTE *)(a1 + 89))
          objc_msgSend(*(id *)(a1 + 32), "processRemoveResultsData:protectionClass:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
        goto LABEL_7;
      case 8:
        objc_msgSend(*(id *)(a1 + 32), "processCompletionsResultsData:protectionClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        goto LABEL_7;
      case 0xALL:
        objc_msgSend(*(id *)(a1 + 32), "handleQueryRewritten");
        goto LABEL_7;
      case 0xBLL:
        objc_msgSend(*(id *)(a1 + 32), "processPhotosComputedData:protectionClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        goto LABEL_7;
      default:
        logForCSLogCategoryQuery();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_1();
        goto LABEL_30;
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_3();
LABEL_6:

LABEL_7:
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)willStartQuery
{
  id v2;
  void *v4;
  NSObject *v5;
  id v6;
  os_signpost_id_t v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  os_signpost_id_t v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  int v24;
  NSObject *v25;
  id v26;
  os_signpost_id_t v27;
  objc_class *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  objc_class *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[CSSearchQuery queryContext](self, "queryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "generateSuggestions"))
  {
    -[CSSearchQuery queryContext](self, "queryContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject rankingType](v5, "rankingType") == 1)
    {
      logForCSLogCategoryQuery();
      v15 = objc_claimAutoreleasedReturnValue();
      -[CSSearchQuery queryContext](self, "queryContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "queryID");

      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v48 = objc_msgSend(v51, "UTF8String");
        -[CSSearchQuery queryContext](self, "queryContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "queryID");
        -[CSSearchQuery queryContext](self, "queryContext");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "clientBundleID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[CSSearchQuery queryContext](self, "queryContext");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "clientBundleID");
          v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = (const char *)objc_msgSend(v2, "UTF8String");
        }
        else
        {
          v23 = "Unknown";
        }
        *(_DWORD *)buf = 136315650;
        v54 = v48;
        v55 = 2048;
        v56 = v20;
        v57 = 2080;
        v58 = v23;
        _os_signpost_emit_with_name_impl(&dword_18C42F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CSUserQueryTopHits", "QueryClass=%{signpost.description:attribute}s, qid=%{signpost.description:attribute}lu, BundleID=%{signpost.description:attribute}s", buf, 0x20u);
        if (v22)
        {

        }
      }
      goto LABEL_36;
    }
    -[CSSearchQuery queryContext](self, "queryContext");
    v15 = objc_claimAutoreleasedReturnValue();
    v24 = -[NSObject counting](v15, "counting");
    logForCSLogCategoryQuery();
    v25 = objc_claimAutoreleasedReturnValue();
    -[CSSearchQuery queryContext](self, "queryContext");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "queryID");

    if (v24)
    {
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v45 = objc_msgSend(v52, "UTF8String");
        -[CSSearchQuery queryContext](self, "queryContext");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v49, "queryID");
        -[CSSearchQuery queryContext](self, "queryContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "clientBundleID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          -[CSSearchQuery queryContext](self, "queryContext");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "clientBundleID");
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v32 = (const char *)objc_msgSend(v26, "UTF8String");
        }
        else
        {
          v32 = "Unknown";
        }
        *(_DWORD *)buf = 136315650;
        v54 = v45;
        v55 = 2048;
        v56 = v29;
        v57 = 2080;
        v58 = v32;
        v36 = "CSUserQueryCounting";
LABEL_32:
        _os_signpost_emit_with_name_impl(&dword_18C42F000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, v36, "QueryClass=%{signpost.description:attribute}s, qid=%{signpost.description:attribute}lu, BundleID=%{signpost.description:attribute}s", buf, 0x20u);
        if (v31)
        {

        }
      }
    }
    else if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v46 = objc_msgSend(v52, "UTF8String");
      -[CSSearchQuery queryContext](self, "queryContext");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v49, "queryID");
      -[CSSearchQuery queryContext](self, "queryContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "clientBundleID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        -[CSSearchQuery queryContext](self, "queryContext");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "clientBundleID");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = (const char *)objc_msgSend(v26, "UTF8String");
      }
      else
      {
        v35 = "Unknown";
      }
      *(_DWORD *)buf = 136315650;
      v54 = v46;
      v55 = 2048;
      v56 = v34;
      v57 = 2080;
      v58 = v35;
      v36 = "CSUserQuery";
      goto LABEL_32;
    }

LABEL_36:
    goto LABEL_37;
  }
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  -[CSSearchQuery queryContext](self, "queryContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "queryID");

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v50, "UTF8String");
    -[CSSearchQuery queryContext](self, "queryContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "queryID");
    -[CSSearchQuery queryContext](self, "queryContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[CSSearchQuery queryContext](self, "queryContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "clientBundleID");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (const char *)objc_msgSend(v6, "UTF8String");
    }
    else
    {
      v14 = "Unknown";
    }
    *(_DWORD *)buf = 136315650;
    v54 = v9;
    v55 = 2048;
    v56 = v11;
    v57 = 2080;
    v58 = v14;
    _os_signpost_emit_with_name_impl(&dword_18C42F000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CSUserQuerySuggestions", "QueryClass=%{signpost.description:attribute}s, qid=%{signpost.description:attribute}lu, BundleID=%{signpost.description:attribute}s", buf, 0x20u);
    if (v13)
    {

    }
  }
LABEL_37:

  if (self->_requireQueryParse)
  {
    -[CSSearchQuery queryContext](self, "queryContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "userQuery");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    GetCSUserQueryParser();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchQuery queryContext](self, "queryContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_CSQueryCreateQueryDictionaryWithOptionsDict:attribute:input:options:", &unk_1E24302B0, 0, v38, objc_msgSend(v40, "userQueryOptions"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryDefaultStringKey"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      -[CSSearchQuery updateQueryString:](self, "updateQueryString:", v42);

  }
}

- (CSSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (void)commonInitWithQueryString:(id)a3 queryContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  CSSearchQueryContext **p_queryContext;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  NSObject *v18;
  int v19;
  void *v20;
  id v21;
  const char *v22;
  NSObject *v23;
  OS_dispatch_queue *v24;
  OS_dispatch_queue *queue;
  uint8_t buf[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_storeStrong((id *)&self->_queryString, a3);
  v8 = a4;
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "setClientBundleID:", sMainBundleId);
  objc_msgSend(v8, "instantAnswersOverrideDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setInstantAnswersOverrideDate:", v10);
  do
    v11 = __ldaxr((unsigned int *)&sCSSearchQueryID);
  while (__stlxr(v11 + 1, (unsigned int *)&sCSSearchQueryID));
  objc_msgSend(v9, "setQueryID:", v11);
  p_queryContext = &self->_queryContext;
  objc_storeStrong((id *)&self->_queryContext, v9);
  -[CSSearchQueryContext mountPoints](self->_queryContext, "mountPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
    self->_userFSIndex = 1;
  v15 = -[CSSearchQueryContext live](*p_queryContext, "live");
  if (v15
    && (-[CSSearchQueryContext clientBundleID](*p_queryContext, "clientBundleID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobilemail"))))
  {

  }
  else
  {
    -[CSSearchQueryContext clientBundleID](*p_queryContext, "clientBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

    if (v15)
    {

      if ((v17 & 1) == 0)
        goto LABEL_15;
    }
    else if (!v17)
    {
      goto LABEL_15;
    }
  }
  logForCSLogCategoryQuery();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = -[CSSearchQueryContext queryID](*p_queryContext, "queryID");
    *(_DWORD *)buf = 67109120;
    v27 = v19;
    _os_log_impl(&dword_18C42F000, v18, OS_LOG_TYPE_DEFAULT, "qid=%d is a live query; also disabling blocking on index.",
      buf,
      8u);
  }

  -[CSSearchQueryContext setDisableBlockingOnIndex:](*p_queryContext, "setDisableBlockingOnIndex:", 1);
LABEL_15:
  self->_liveItemLock._os_unfair_lock_opaque = 0;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.corespotlight.searchQuery.%ld.%p"), -[CSSearchQueryContext queryID](self->_queryContext, "queryID"), self);
  if (sQueryPoolQueueOnce != -1)
    dispatch_once(&sQueryPoolQueueOnce, &__block_literal_global_826);
  v21 = objc_retainAutorelease(v20);
  v22 = (const char *)objc_msgSend(v21, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v22, v23, (dispatch_queue_t)sQueryPoolQueue);
  queue = self->_queue;
  self->_queue = v24;

}

- (id)debugDescriptionWithQueryString:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  CSSearchQueryContext *queryContext;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CSSearchQueryContext *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  v5 = (void *)MEMORY[0x18D782104](self, a2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@:%p"), objc_opt_class(), self);
  queryContext = self->_queryContext;
  if (queryContext)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR(" qid=%ld flag=0x%4.4x"), -[CSSearchQueryContext queryID](queryContext, "queryID"), -[CSSearchQueryContext flags](self->_queryContext, "flags"));
    -[CSSearchQueryContext scopes](self->_queryContext, "scopes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" scopes=(%@)"), v9);

    }
    -[CSSearchQueryContext mountPoints](self->_queryContext, "mountPoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" mount=(%@)"), v11);

    }
  }
  if (self->_started)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR(" count=%ld"), -[CSSearchQuery foundItemCount](self, "foundItemCount"));
    objc_msgSend(v6, "appendString:", CFSTR(" started=true"));
  }
  if (self->_cancelled)
    objc_msgSend(v6, "appendString:", CFSTR(" cancelled=true"));
  if (self->_suspended)
    objc_msgSend(v6, "appendString:", CFSTR(" suspended=true"));
  if (self->_finished)
    objc_msgSend(v6, "appendString:", CFSTR(" finished=true"));
  if (-[CSSearchQuery privateQuery](self, "privateQuery")
    || -[CSSearchQueryContext privateQuery](self->_queryContext, "privateQuery"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" private=true"));
  }
  else
  {
    v13 = self->_queryContext;
    if (v13)
    {
      -[CSSearchQueryContext userQuery](v13, "userQuery");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15)
      {
        -[CSSearchQueryContext userQuery](self->_queryContext, "userQuery");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        CSRedactString(v16, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR(" userQuery=%@"), v17);

      }
    }
    if (-[NSString length](self->_queryString, "length"))
    {
      if (v3)
      {
        objc_msgSend(v6, "appendFormat:", CFSTR(" queryString=%@"), self->_queryString);
      }
      else
      {
        CSRedactString(self->_queryString, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR(" queryString=%@"), v18);

      }
    }
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  objc_autoreleasePoolPop(v5);
  return v6;
}

- (BOOL)privateQuery
{
  return self->_privateQuery;
}

- (NSUInteger)foundItemCount
{
  CSSearchQuery *v2;
  NSUInteger foundItemCount;

  v2 = self;
  objc_sync_enter(v2);
  foundItemCount = v2->_foundItemCount;
  objc_sync_exit(v2);

  return foundItemCount;
}

- (void)didReturnResults:(int64_t)a3 resultsData:(id)a4 oidData:(id)a5 protectionClass:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  qos_class_t v18;
  int64_t v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  dispatch_block_t v25;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  int64_t v33;
  BOOL v34;
  BOOL v35;
  BOOL v36;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = -[CSSearchQueryContext attribute](self->_queryContext, "attribute");
  v16 = -[CSSearchQueryContext counting](self->_queryContext, "counting");
  v17 = -[CSSearchQueryContext live](self->_queryContext, "live");
  v18 = qos_class_self();
  if (-[CSSearchQueryContext qos](self->_queryContext, "qos"))
    v18 = -[CSSearchQueryContext qos](self->_queryContext, "qos");
  v19 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke;
  block[3] = &unk_1E2404B28;
  v34 = v15;
  v35 = v16;
  v36 = v17;
  v31 = v14;
  v32 = v19;
  v33 = a3;
  block[4] = self;
  v28 = v11;
  v29 = v13;
  v30 = v12;
  v21 = v12;
  v22 = v13;
  v23 = v11;
  v24 = v14;
  v25 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v18, 0, block);
  dispatch_async(queue, v25);

}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)_finishWithError:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 cancelled;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  unint64_t foundItemCount;
  void *v20;
  objc_class *v21;
  void *v22;
  NSObject *v23;
  NSObject *suggestionCountDispatchGroup;
  NSObject *queue;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_finished)
    goto LABEL_24;
  v5 = -[CSSearchQueryContext live](self->_queryContext, "live");
  cancelled = self->_cancelled;
  v7 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
  self->_finished = 1;
  if (cancelled || v5)
  {
    +[CSSearchConnection sharedSearchConnection](CSSearchConnection, "sharedSearchConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "removeQueryForID:", v9);

  }
  v11 = v4;
  v12 = v11;
  if (!v11)
  {
    v15 = 0;
LABEL_13:
    logForCSLogCategoryQuery();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = v7;
      _os_log_impl(&dword_18C42F000, v16, OS_LOG_TYPE_DEFAULT, "qid=%ld - Finished", buf, 0xCu);
    }
    goto LABEL_15;
  }
  objc_msgSend(v11, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("CSSearchQueryErrorDomain"));

  v15 = v12;
  if ((v14 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_makeQueryErrorWithErrorCode:description:underlyingError:", -2000, 0, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (cancelled || !v15)
    goto LABEL_13;
  logForCSLogCategoryQuery();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[CSSearchQuery _finishWithError:].cold.1();
LABEL_15:

  +[CSPowerLog sharedInstance](CSPowerLog, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = sMainBundleId;
  foundItemCount = self->_foundItemCount;
  -[CSSearchQueryContext reason](self->_queryContext, "reason");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v17, "logWithBundleID:indexOperation:itemCount:reason:", v18, 5, foundItemCount, v20);
  }
  else
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logWithBundleID:indexOperation:itemCount:reason:", v18, 5, foundItemCount, v22);

  }
  if (self->_suggestionCountDispatchGroup)
  {
    logForCSLogCategoryQuery();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = v7;
      _os_log_impl(&dword_18C42F000, v23, OS_LOG_TYPE_DEFAULT, "qid=%ld - wait for suggestion count", buf, 0xCu);
    }

    suggestionCountDispatchGroup = self->_suggestionCountDispatchGroup;
    queue = self->_queue;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __34__CSSearchQuery__finishWithError___block_invoke;
    v26[3] = &unk_1E24013B8;
    v26[4] = self;
    v27 = v12;
    dispatch_group_notify(suggestionCountDispatchGroup, queue, v26);

  }
  else
  {
    -[CSSearchQuery handleCompletion:](self, "handleCompletion:", v12);
  }

LABEL_24:
}

- (void)handleCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  void *v13;
  os_signpost_id_t v14;
  int v15;
  NSObject *v16;
  void *v17;
  os_signpost_id_t v18;
  const char *v19;
  uint8_t *v20;
  __int16 v21;
  __int16 v22;
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = a3;
  -[CSSearchQuery completionHandler](self, "completionHandler");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
    -[CSSearchQuery completionHandler](self, "completionHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v6)
      -[CSSearchQuery setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  -[CSSearchQuery setFoundItemsHandler:](self, "setFoundItemsHandler:", 0);
  if (!self->_gatherEnded)
  {
    -[CSSearchQuery queryContext](self, "queryContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "generateSuggestions"))
    {
      logForCSLogCategoryQuery();
      v9 = objc_claimAutoreleasedReturnValue();
      -[CSSearchQuery queryContext](self, "queryContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "queryID");

      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18C42F000, v9, OS_SIGNPOST_INTERVAL_END, v11, "CSUserQuerySuggestions", " enableTelemetry=YES ", buf, 2u);
      }
      goto LABEL_23;
    }
    -[CSSearchQuery queryContext](self, "queryContext");
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject rankingType](v9, "rankingType") == 1)
    {
      logForCSLogCategoryQuery();
      v12 = objc_claimAutoreleasedReturnValue();
      -[CSSearchQuery queryContext](self, "queryContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "queryID");

      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)v23 = 0;
        _os_signpost_emit_with_name_impl(&dword_18C42F000, v12, OS_SIGNPOST_INTERVAL_END, v14, "CSUserQueryTopHits", " enableTelemetry=YES ", v23, 2u);
      }
      goto LABEL_22;
    }
    -[CSSearchQuery queryContext](self, "queryContext");
    v12 = objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject counting](v12, "counting");
    logForCSLogCategoryQuery();
    v16 = objc_claimAutoreleasedReturnValue();
    -[CSSearchQuery queryContext](self, "queryContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "queryID");

    if (v15)
    {
      if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
        goto LABEL_21;
      v22 = 0;
      v19 = "CSUserQueryCounting";
      v20 = (uint8_t *)&v22;
    }
    else
    {
      if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
        goto LABEL_21;
      v21 = 0;
      v19 = "CSUserQuery";
      v20 = (uint8_t *)&v21;
    }
    _os_signpost_emit_with_name_impl(&dword_18C42F000, v16, OS_SIGNPOST_INTERVAL_END, v18, v19, " enableTelemetry=YES ", v20, 2u);
LABEL_21:

LABEL_22:
LABEL_23:

  }
}

- (void)completionHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setFoundItemsHandler:(void *)foundItemsHandler
{
  objc_setProperty_atomic_copy(self, a2, foundItemsHandler, 120);
}

- (void)setCompletionHandler:(void *)completionHandler
{
  objc_setProperty_atomic_copy(self, a2, completionHandler, 128);
}

- (void)start
{
  CSSearchQuery *v2;
  void *v3;
  qos_class_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  dispatch_block_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  CSSearchQuery *v23;
  id v24;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_started)
  {
    objc_sync_exit(v2);

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("The query was already started"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise");
  }
  else
  {
    v2->_started = 1;
    objc_sync_exit(v2);
    v3 = v2;
  }

  -[CSSearchQuery prepareSearch](v2, "prepareSearch");
  v4 = qos_class_self();
  if (-[CSSearchQueryContext qos](v2->_queryContext, "qos"))
    v4 = -[CSSearchQueryContext qos](v2->_queryContext, "qos");
  -[CSSearchQuery queryContext](v2, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "internal");

  -[CSSearchQuery queryContext](v2, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "bundleIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "clientBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
  }

  queue = v2->_queue;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __22__CSSearchQuery_start__block_invoke;
  v22 = &unk_1E24013B8;
  v23 = v2;
  v12 = v10;
  v24 = v12;
  v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, &v19);
  dispatch_async(queue, v13);

  +[CSPowerLog sharedInstance](CSPowerLog, "sharedInstance", v19, v20, v21, v22, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = sMainBundleId;
  -[CSSearchQueryContext reason](v2->_queryContext, "reason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v14, "logWithBundleID:indexOperation:itemCount:reason:", v15, 3, 1, v16);
  }
  else
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logWithBundleID:indexOperation:itemCount:reason:", v15, 3, 1, v18);

  }
}

- (id)gatherEndedHandler
{
  return objc_getProperty(self, a2, 184, 1);
}

void __22__CSSearchQuery_start__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  void *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  void *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[56])
  {
    objc_msgSend((id)objc_opt_class(), "_makeQueryErrorWithErrorCode:description:underlyingError:", -2003, 0, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:");

  }
  else
  {
    objc_msgSend(v2, "willStartQuery");
    if (_os_feature_enabled_impl() && objc_msgSend(*(id *)(a1 + 32), "isTopHitQuery"))
    {
      logForCSLogCategoryQuery();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "queryContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "queryID");

      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18C42F000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "setupTopHitQueryContext", (const char *)&unk_18C505DC6, buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setupTopHitQueryContextForClientBundleId:", *(_QWORD *)(a1 + 40));
      logForCSLogCategoryQuery();
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "queryContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "queryID");

      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18C42F000, v6, OS_SIGNPOST_INTERVAL_END, v8, "setupTopHitQueryContext", (const char *)&unk_18C505DC6, buf, 2u);
      }

    }
    if (isClientPhotosOrPhotosCtl(*(void **)(a1 + 40)))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "queryContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userQuery");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("(**=\"%@*\"cwdt)"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "queryContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRankingQueries:", v13);

    }
    objc_msgSend(*(id *)(a1 + 32), "setupFetchAttributesForSearch");
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startQuery:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));

  }
}

- (id)connection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __objc2_class *v9;
  void *v10;
  void *v11;

  if (-[CSSearchQuery privateIndex](self, "privateIndex"))
  {
    -[CSSearchQuery privateBundleID](self, "privateBundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = CSPrivateSearchConnection;
LABEL_15:
    -[__objc2_class connectionWithToken:](v9, "connectionWithToken:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CSSearchQuery privateBundleID](self, "privateBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = CSManagedSearchConnection;
    goto LABEL_15;
  }
  if (-[CSSearchQuery userFSIndex](self, "userFSIndex"))
    +[CSSearchConnection sharedCSUserFSConnection](CSSearchConnection, "sharedCSUserFSConnection");
  else
    +[CSSearchConnection sharedSearchConnection](CSSearchConnection, "sharedSearchConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (BOOL)userFSIndex
{
  return self->_userFSIndex;
}

- (BOOL)privateIndex
{
  return self->_privateIndex;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_attrKeys);
  v3.receiver = self;
  v3.super_class = (Class)CSSearchQuery;
  -[CSSearchQuery dealloc](&v3, sel_dealloc);
}

- (void)setRemovedItemsHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (void)setPrivateQuery:(BOOL)a3
{
  self->_privateQuery = a3;
}

- (void)setGatherEndedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (void)setChangedItemsHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

void __64__CSSearchQuery_processLiveResultsData_oidData_protectionClass___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  id *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id obj[7];

  if (a5 >= 2)
  {
    obj[5] = v5;
    obj[6] = v6;
    if (a3 == 3213 || a3 == 2781)
    {
      v10 = _MDPlistBytesCopyChildPlistBytesAtIndex();
      if (v10)
      {
        v11 = (const void *)v10;
        v26 = 0;
        obj[0] = 0;
        v25 = 0;
        objc_msgSend(*(id *)(a1 + 40), "processResultFromPlist:atIndex:protectionClass:oids:oidCount:addItems:updateItems:moveItems:", v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 48), a4, a5, obj, &v26, &v25);
        if (objc_msgSend(obj[0], "count"))
        {
          os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 96));
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v15 = *(void **)(v12 + 40);
          v13 = (id *)(v12 + 40);
          v14 = v15;
          if (v15)
            objc_msgSend(v14, "addObjectsFromArray:", obj[0]);
          else
            objc_storeStrong(v13, obj[0]);
          os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 96));
        }
        if (objc_msgSend(v26, "count"))
        {
          os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 96));
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v20 = *(void **)(v17 + 40);
          v18 = (id *)(v17 + 40);
          v19 = v20;
          if (v20)
            objc_msgSend(v19, "addObjectsFromArray:", v26);
          else
            objc_storeStrong(v18, v26);
          os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 96));
        }
        if (objc_msgSend(v25, "count"))
        {
          os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 96));
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v24 = *(void **)(v21 + 40);
          v22 = (id *)(v21 + 40);
          v23 = v24;
          if (v24)
            objc_msgSend(v23, "addObjectsFromArray:", v25);
          else
            objc_storeStrong(v22, v25);
          os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 96));
        }
        CFRelease(v11);

      }
    }
    else
    {
      logForCSLogCategoryQuery();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __64__CSSearchQuery_processLiveResultsData_oidData_protectionClass___block_invoke_cold_1();

    }
  }
}

- (void)processResultFromPlist:(id)a3 atIndex:(unint64_t)a4 protectionClass:(id)a5 oids:(int64_t *)a6 oidCount:(unsigned int)a7 addItems:(id *)a8 updateItems:(id *)a9 moveItems:(id *)a10
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  id v25;
  id v26;
  void *v27;
  void *context;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD *v34;
  int64_t *v35;
  id *v36;
  uint64_t v37;
  id *v38;
  id *v39;
  __int16 v40;
  __int16 v41;
  __int16 v42;
  __int16 v43;
  __int16 v44;
  __int16 v45;
  __int16 v46;
  _QWORD v47[5];

  v13 = a3;
  v14 = a5;
  context = (void *)MEMORY[0x18D782104]();
  -[CSSearchQuery fetchAttributes](self, "fetchAttributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v27, "count");
  v30 = v13;
  if (self->_userFSIndex)
  {
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("__fp"), "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  v19 = self->_attrInfo[1] - 1;
  v20 = self->_attrInfo[6] - 1;
  v21 = self->_attrInfo[10] - 1;
  v22 = self->_attrInfo[11] - 1;
  v23 = self->_attrInfo[12] - 1;
  v24 = self->_attrInfo[0] - 1;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __109__CSSearchQuery_processResultFromPlist_atIndex_protectionClass_oids_oidCount_addItems_updateItems_moveItems___block_invoke;
  v31[3] = &unk_1E24049C0;
  v31[4] = self;
  v34 = v47;
  v35 = a6;
  v40 = v24;
  v41 = v19;
  v25 = v18;
  v32 = v25;
  v36 = a10;
  v37 = v15;
  v26 = v14;
  v42 = v19;
  v43 = v20;
  v44 = v21;
  v45 = v22;
  v46 = v23;
  v33 = v26;
  v38 = a9;
  v39 = a8;
  objc_msgSend(v30, "enumerateQueryResults:stringCache:usingBlock:", v15, 0, v31);

  _Block_object_dispose(v47, 8);
  objc_autoreleasePoolPop(context);

}

- (NSArray)fetchAttributes
{
  return -[CSSearchQueryContext fetchAttributes](self->_queryContext, "fetchAttributes");
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

void __56__CSSearchQuery_commonInitWithQueryString_queryContext___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;

  dispatch_queue_attr_make_initially_inactive(MEMORY[0x1E0C80D50]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.corespotlight.searchQuery.shared", v0);
  v2 = (void *)sQueryPoolQueue;
  sQueryPoolQueue = (uint64_t)v1;

  dispatch_queue_set_width();
  dispatch_activate((dispatch_object_t)sQueryPoolQueue);
}

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if ((id)objc_opt_class() == a1)
  {
    objc_storeStrong((id *)&sConnectionName_0, CFSTR("com.apple.spotlight.SearchAgent"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sMainBundleId;
    sMainBundleId = v3;

    if (!sMainBundleId)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "processName");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)sMainBundleId;
      sMainBundleId = v5;

    }
  }
}

- (void)processLiveResultsData:(id)a3 oidData:(id)a4 protectionClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  const void *v13;
  int64_t v14;
  id v15;
  void *Trusted;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  NSObject *v27;
  CSSearchQuery *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  NSObject *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t buf[4];
  int64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "length");
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "bytes");
  v12 = _MDStoreOIDArrayCreate();
  if (v12)
  {
    v13 = (const void *)v12;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__9;
    v52 = __Block_byref_object_dispose__9;
    v53 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__9;
    v46 = __Block_byref_object_dispose__9;
    v47 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__9;
    v40 = __Block_byref_object_dispose__9;
    v41 = 0;
    v14 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
    v15 = objc_retainAutorelease(v8);
    objc_msgSend(v15, "bytes");
    objc_msgSend(v15, "length");
    Trusted = (void *)_MDPlistBytesCreateTrusted();
    _MDChildPlistBytesContextCreate();
    v35 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v17 = Trusted;
    v33 = v10;
    _MDStoreOIDArrayApplyBlockParallel();
    _MDChildPlistBytesContextDestroy();
    CFRelease(v13);
    v18 = objc_msgSend((id)v49[5], "count");
    v19 = objc_msgSend((id)v43[5], "count");
    v20 = objc_msgSend((id)v37[5], "count");
    if (v18 | v19)
    {
      if (self->_cancelled)
      {
        logForCSLogCategoryQuery();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
          -[CSSearchQuery processResultItems:].cold.1();
      }
      else
      {
        v22 = v20;
        if (v20)
        {
          logForCSLogCategoryQuery();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v55 = v14;
            v56 = 2048;
            v57 = v22;
            _os_log_impl(&dword_18C42F000, v23, OS_LOG_TYPE_DEFAULT, "qid=%ld - moved: %ld items", buf, 0x16u);
          }

          if (self->_userFSIndex)
          {
            -[CSSearchQuery removedItemsHandler](self, "removedItemsHandler");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24 == 0;

            if (!v25)
            {
              -[CSSearchQuery removedItemsHandler](self, "removedItemsHandler");
              v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v26[2](v26, UserFSBundleID, v37[5]);

            }
          }
        }
        if (v18)
        {
          logForCSLogCategoryQuery();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v55 = v14;
            v56 = 2048;
            v57 = v18;
            _os_log_impl(&dword_18C42F000, v27, OS_LOG_TYPE_DEFAULT, "qid=%ld - Found: %ld items", buf, 0x16u);
          }

          v28 = self;
          objc_sync_enter(v28);
          v28->_foundItemCount += v18;
          objc_sync_exit(v28);

          -[CSSearchQuery foundItemsHandler](v28, "foundItemsHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            -[CSSearchQuery foundItemsHandler](v28, "foundItemsHandler");
            v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v30[2](v30, v49[5]);

          }
        }
        if (!v19)
          goto LABEL_23;
        logForCSLogCategoryQuery();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v55 = v14;
          v56 = 2048;
          v57 = v19;
          _os_log_impl(&dword_18C42F000, v31, OS_LOG_TYPE_DEFAULT, "qid=%ld - Updated: %ld items", buf, 0x16u);
        }

        -[CSSearchQuery changedItemsHandler](self, "changedItemsHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
          goto LABEL_23;
        -[CSSearchQuery changedItemsHandler](self, "changedItemsHandler");
        v21 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, v43[5]);
      }

    }
LABEL_23:

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);

  }
}

- (void)foundItemsHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (NSIndexSet)indexSet
{
  return (NSIndexSet *)objc_getAssociatedObject(self, sel_indexSet);
}

- (void)setIndexSet:(id)a3
{
  objc_setAssociatedObject(self, sel_indexSet, a3, (void *)1);
}

- (PRSRankingItemRanker)ranker
{
  return (PRSRankingItemRanker *)objc_getAssociatedObject(self, sel_ranker);
}

- (void)setRanker:(id)a3
{
  objc_setAssociatedObject(self, sel_ranker, a3, (void *)1);
}

- (PRSQueryRankingConfiguration)rankConfig
{
  return (PRSQueryRankingConfiguration *)objc_getAssociatedObject(self, sel_rankConfig);
}

- (void)setRankConfig:(id)a3
{
  objc_setAssociatedObject(self, sel_rankConfig, a3, (void *)1);
}

- (BOOL)isCJK
{
  void *v2;
  char v3;

  objc_getAssociatedObject(self, sel_isCJK);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setIsCJK:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, sel_isCJK, v4, (void *)1);

}

- (BOOL)isKeyboardCJK
{
  void *v2;
  char v3;

  objc_getAssociatedObject(self, sel_isKeyboardCJK);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setIsKeyboardCJK:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, sel_isKeyboardCJK, v4, (void *)1);

}

- (unint64_t)hitCount
{
  void *v2;
  unint64_t v3;

  objc_getAssociatedObject(self, sel_hitCount);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setHitCount:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, sel_hitCount, v4, (void *)1);

}

- (unint64_t)originalHitCount
{
  void *v2;
  unint64_t v3;

  objc_getAssociatedObject(self, sel_originalHitCount);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setOriginalHitCount:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, sel_originalHitCount, v4, (void *)1);

}

- (unint64_t)originalMaxRankedResultCount
{
  void *v2;
  unint64_t v3;

  objc_getAssociatedObject(self, sel_originalMaxRankedResultCount);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setOriginalMaxRankedResultCount:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, sel_originalMaxRankedResultCount, v4, (void *)1);

}

- (NSMutableDictionary)currentTopHitCandidates
{
  return (NSMutableDictionary *)objc_getAssociatedObject(self, sel_currentTopHitCandidates);
}

- (void)setCurrentTopHitCandidates:(id)a3
{
  objc_setAssociatedObject(self, sel_currentTopHitCandidates, a3, (void *)1);
}

- (void)setupTopHitQueryContextForClientBundleId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  __CFString *v56;
  __CFString *v57;
  int v58;
  __CFString *v59;
  uint64_t v60;
  __CFString *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  objc_class *v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  double Current;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  _BOOL4 v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  NSSet *originalAttributes;
  id v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t j;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  id v146;
  uint64_t k;
  void *v148;
  int v149;
  id v150;
  void *v151;
  void *v152;
  char v153;
  uint64_t v154;
  uint64_t v155;
  unsigned __int16 v156;
  uint64_t v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  id v165;
  char v166;
  void *v167;
  int v168;
  void *v169;
  unint64_t v170;
  id v171;
  id v172;
  void *v173;
  id v174;
  unsigned int v175;
  unint64_t v176;
  void *v177;
  void *v178;
  unint64_t v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  CSSearchQuery *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  id v189;
  uint64_t v190;
  void *v191;
  id v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  unsigned __int8 v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  void *v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  _BYTE v207[128];
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  __int128 *v212;
  uint64_t v213;

  v213 = *MEMORY[0x1E0C80C00];
  v180 = a3;
  v184 = self;
  -[CSSearchQuery queryContext](self, "queryContext");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "userQuery");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQuery queryString](self, "queryString");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v185, "maxCount");
  v5 = 0x7FFFFFFFLL;
  if (v4)
    v5 = v4;
  v176 = v5;
  if (objc_msgSend(v185, "maxRankedResultCount") < 1)
  {
    v7 = 100;
  }
  else
  {
    v6 = objc_msgSend(v185, "maxRankedResultCount");
    v7 = 100;
    if (v6 < 0x64)
      v7 = v6;
  }
  v179 = v7;
  if (objc_msgSend(v180, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {
    v8 = objc_msgSend(v181, "length");
    if (v8 < 5)
    {
      v9 = 20;
    }
    else if (v8 <= 8)
    {
      if (v8 == 8)
      {
        v9 = 50;
      }
      else
      {
        v9 = 25;
        if (v8 > 6)
          v9 = 40;
      }
    }
    else
    {
      v9 = 65;
    }
    v179 = v9;
    if (objc_msgSend(v185, "generateSuggestions"))
    {
      v10 = objc_msgSend(v181, "length");
      v11 = v179;
      if (!v10)
        v11 = 100;
      v179 = v11;
    }
  }
  objc_msgSend(v185, "keyboardLanguage");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = 0;
  v12 = CSGetCurrentLocale(0, (uint64_t)&v197);
  objc_msgSend(v178, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hasPrefix:", CFSTR("ja")) & 1) != 0
    || (objc_msgSend(v13, "hasPrefix:", CFSTR("zh")) & 1) != 0
    || (objc_msgSend(v13, "hasPrefix:", CFSTR("ko")) & 1) != 0)
  {
    v175 = 1;
  }
  else
  {
    v175 = objc_msgSend(v13, "hasPrefix:", CFSTR("yue"));
  }

  if (!v181 || !objc_msgSend(v185, "parseUserQuery"))
  {
    if (v176 <= v179)
      v28 = v179;
    else
      v28 = v176;
    objc_msgSend(v185, "setMaxCount:", v28);
    v29 = 0;
    goto LABEL_137;
  }
  objc_msgSend(v185, "setMaxCount:", v179);
  objc_msgSend(v185, "setGrouped:", v179 != 0);
  v168 = v197;
  v166 = objc_msgSend(v185, "disableNLP");
  v163 = objc_msgSend(v185, "queryID");
  v14 = v181;
  v172 = v180;
  v171 = v178;
  logForCSLogCategoryQuery();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[CSSearchQuery(TopHitRanking) setupTopHitQueryContextForClientBundleId:].cold.6(v15);

  v182 = (void *)objc_opt_new();
  objc_msgSend(v182, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("isNLQuery"));
  objc_msgSend(v182, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("isAdvancedSyntax"));
  objc_msgSend(v182, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("isMath"));
  objc_msgSend(v182, "setObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("suggestions"));
  objc_msgSend(v182, "setObject:forKey:", MEMORY[0x1E0C9AA70], CFSTR("rankCategories"));
  objc_msgSend(v182, "setObject:forKey:", MEMORY[0x1E0C9AA70], CFSTR("rankTerms"));
  objc_msgSend(v182, "setObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("queryTerms"));
  objc_msgSend(v182, "setObject:forKey:", &stru_1E2406B38, CFSTR("query"));
  objc_msgSend(v182, "setObject:forKey:", &stru_1E2406B38, CFSTR("completionString"));
  objc_msgSend(v182, "setObject:forKey:", &unk_1E2430138, CFSTR("completionCount"));
  objc_msgSend(v182, "setObject:forKey:", &unk_1E2430138, CFSTR("completionOptions"));
  objc_msgSend(v182, "setObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("completionAttributes"));
  v174 = v14;
  v170 = objc_msgSend(v174, "length");
  objc_msgSend(v174, "length");
  v191 = (void *)objc_opt_new();
  v188 = (void *)objc_opt_new();
  v173 = (void *)objc_opt_new();
  v187 = (void *)objc_opt_new();
  v186 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0C9AA60], "count") && objc_msgSend(MEMORY[0x1E0C9AA60], "count"))
  {
    v205 = 0u;
    v206 = 0u;
    v203 = 0u;
    v204 = 0u;
    v16 = objc_msgSend(MEMORY[0x1E0C9AA60], "countByEnumeratingWithState:objects:count:", &v203, &v208, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v204;
      v18 = v174;
      do
      {
        v19 = 0;
        v20 = v18;
        do
        {
          if (*(_QWORD *)v204 != v17)
            objc_enumerationMutation(MEMORY[0x1E0C9AA60]);
          v21 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * v19);
          objc_msgSend(v21, "queryString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "spotlightQueryString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v191, "addObject:", v22);
          objc_msgSend(v21, "spotlightFilterQueries");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v188, "addObjectsFromArray:", v23);
          objc_msgSend(v21, "spotlightRankCategories");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v186, "addEntriesFromDictionary:", v24);
          objc_msgSend(v21, "spotlightRankTerms");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v187, "addEntriesFromDictionary:", v25);
          v26 = objc_msgSend(v21, "isScopedSearch");
          v27 = objc_msgSend(v21, "isNLPEntitySearch");

          ++v19;
          v20 = v18;
        }
        while (v16 != v19);
        v16 = objc_msgSend(MEMORY[0x1E0C9AA60], "countByEnumeratingWithState:objects:count:", &v203, &v208, 16);
      }
      while (v16);
    }
    else
    {
      v26 = 0;
      v27 = 0;
      v18 = v174;
    }
    objc_msgSend(v187, "keysSortedByValueUsingSelector:", sel_compare_);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "addObjectsFromArray:", v30);

  }
  else
  {
    v26 = 0;
    v27 = 0;
    v18 = v174;
  }
  if (objc_msgSend(v18, "length"))
  {
    v31 = objc_msgSend(v191, "count") ? v26 : 1;
    if (v31 == 1)
    {
      if (v168)
        v32 = v170 > 1;
      else
        v32 = 0;
      v33 = v32;
      v165 = v18;
      v199 = 0;
      v200 = &v199;
      v201 = 0x2020000000;
      v34 = getSSDefaultQueryParseResultsForQueryStringSymbolLoc_ptr;
      v202 = getSSDefaultQueryParseResultsForQueryStringSymbolLoc_ptr;
      if (!getSSDefaultQueryParseResultsForQueryStringSymbolLoc_ptr)
      {
        v35 = (void *)SpotlightServicesLibrary();
        v34 = dlsym(v35, "SSDefaultQueryParseResultsForQueryString");
        v200[3] = (uint64_t)v34;
        getSSDefaultQueryParseResultsForQueryStringSymbolLoc_ptr = v34;
      }
      _Block_object_dispose(&v199, 8);
      if (!v34)
        goto LABEL_213;
      HIBYTE(v156) = v26;
      LOBYTE(v156) = 0;
      ((void (*)(id, BOOL, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _DWORD))v34)(v165, v168 != 0, 0, v33, 0, 0, 0, 0, v156);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("query"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("completionString"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v37 = 0;
        v38 = v174;
      }
      v39 = v166;
      if (v170 < 3)
        v39 = 1;
      if ((v39 & 1) != 0)
      {
        v40 = 0;
        v162 = 0;
        v164 = 0;
        v160 = 0;
        v161 = 0;
        v167 = 0;
        v169 = 0;
        v41 = 0;
        if (v37)
        {
LABEL_100:
          v56 = v37;
          v57 = v56;
          if (v169)
            v58 = v27;
          else
            v58 = 0;
          if (v58 == 1)
          {
            if (v164)
              objc_msgSend(v186, "addEntriesFromDictionary:", v164);
            if (v162)
              objc_msgSend(v187, "addEntriesFromDictionary:", v162);
            if (v161)
              objc_msgSend(v173, "addObjectsFromArray:", v161);
            v59 = v57;
            if (objc_msgSend(v169, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || %@)"), v169, v57);
              v59 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            if (v160)
              objc_msgSend(v182, "setObject:forKey:", v160, CFSTR("suggestions"));
            v27 = 1;
          }
          else
          {
            v59 = v56;
            if (v41)
            {
              if (v164)
                objc_msgSend(v186, "addEntriesFromDictionary:", v164);
              if (v162)
                objc_msgSend(v187, "addEntriesFromDictionary:");
              v27 = 1;
              v59 = v57;
            }
          }
          if (objc_msgSend(v167, "length"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || %@)"), v167, v59);
            v60 = objc_claimAutoreleasedReturnValue();

            v59 = (__CFString *)v60;
          }
          if (!v59)
            v59 = CFSTR("*=*");
          objc_msgSend(v191, "addObject:", v59);

          goto LABEL_126;
        }
      }
      else
      {
        v158 = v37;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v172)
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v172, CFSTR("kMDQueryOptionContextIdentifier"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v163);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKey:", v44, CFSTR("queryID"));

        v45 = v165;
        v159 = v43;
        v199 = 0;
        v200 = &v199;
        v201 = 0x2020000000;
        v46 = getSSQueryParseResultsForQueryStringSymbolLoc_ptr;
        v202 = getSSQueryParseResultsForQueryStringSymbolLoc_ptr;
        if (!getSSQueryParseResultsForQueryStringSymbolLoc_ptr)
        {
          v47 = (void *)SpotlightServicesLibrary();
          v46 = dlsym(v47, "SSQueryParseResultsForQueryString");
          v200[3] = (uint64_t)v46;
          getSSQueryParseResultsForQueryStringSymbolLoc_ptr = v46;
        }
        _Block_object_dispose(&v199, 8);
        if (!v46)
          goto LABEL_213;
        ((void (*)(id, id, uint64_t, _QWORD, _QWORD))v46)(v45, v159, v33, 0, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("nlQuery"));
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("annQuery"));
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("isNLQuery"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v48, "BOOLValue");

          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("rankCategories"));
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("rankTerms"));
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("queryTerms"));
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("suggestions"));
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("filterQueries"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v49, "count"))
            objc_msgSend(v182, "setObject:forKey:", v49, CFSTR("filterQueries"));
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("queryUnderstandingOutput"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "setObject:forKey:", v50, CFSTR("queryUnderstandingOutput"));
          v41 = v50 != 0;

        }
        else
        {
          v162 = 0;
          v164 = 0;
          v160 = 0;
          v161 = 0;
          v167 = 0;
          v169 = 0;
          v41 = 0;
        }

        v37 = v158;
        if (v158)
          goto LABEL_100;
      }
      v198 = 0;
      v51 = v165;
      v199 = 0;
      v200 = &v199;
      v201 = 0x2020000000;
      v52 = getSSPhraseQueryEscapeStringSymbolLoc_ptr;
      v202 = getSSPhraseQueryEscapeStringSymbolLoc_ptr;
      if (!getSSPhraseQueryEscapeStringSymbolLoc_ptr)
      {
        v53 = (void *)SpotlightServicesLibrary();
        v52 = dlsym(v53, "SSPhraseQueryEscapeString");
        v200[3] = (uint64_t)v52;
        getSSPhraseQueryEscapeStringSymbolLoc_ptr = v52;
      }
      _Block_object_dispose(&v199, 8);
      if (v52)
      {
        ((void (*)(id, uint64_t *))v52)(v51, &v198);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v170 > 2)
          v55 = 1;
        else
          v55 = v26;
        if (v55 == 1)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(**=\"%@*\"cwdt)"), v54);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((*=\"%@*\"cwdt) || (kMDItemTextContent=\"%@\"cwdt))"), v54, v54);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_100;
      }
LABEL_213:
      CSSectionIsSyndicatedPhotos_cold_1();
LABEL_214:
      __break(1u);
    }
  }
  v38 = v174;
LABEL_126:
  _os_feature_enabled_impl();
  _os_feature_enabled_impl();
  if (objc_msgSend(v191, "count"))
  {
    objc_msgSend(v191, "componentsJoinedByString:", CFSTR(" && "));
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = CFSTR("(true))");
  }
  if (objc_msgSend(v188, "count"))
  {
    objc_msgSend(v188, "componentsJoinedByString:", CFSTR(" && "));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) && (%@))"), v61, v62);
      v63 = objc_claimAutoreleasedReturnValue();

      v61 = (__CFString *)v63;
    }
  }
  objc_msgSend(v182, "setObject:forKey:", v186, CFSTR("rankCategories"));
  objc_msgSend(v182, "setObject:forKey:", v187, CFSTR("rankTerms"));
  objc_msgSend(v182, "setObject:forKey:", v173, CFSTR("queryTerms"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setObject:forKey:", v64, CFSTR("isNLQuery"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setObject:forKey:", v65, CFSTR("isAdvancedSyntax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setObject:forKey:", v66, CFSTR("isMath"));

  objc_msgSend(v182, "setObject:forKey:", v61, CFSTR("query"));
  objc_msgSend(v182, "objectForKeyedSubscript:", CFSTR("query"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v67, "mutableCopy");

  if (objc_msgSend(v68, "length")
    && objc_msgSend(v177, "length")
    && (objc_msgSend(v68, "isEqualToString:", v177) & 1) == 0)
  {
    objc_msgSend(v68, "appendString:", CFSTR("&&("));
    objc_msgSend(v68, "appendString:", v177);
    objc_msgSend(v68, "appendString:", CFSTR(")"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v68);
    v69 = objc_claimAutoreleasedReturnValue();

    v177 = (void *)v69;
  }

  v29 = v182;
LABEL_137:
  *(_QWORD *)&v203 = 0;
  *((_QWORD *)&v203 + 1) = &v203;
  *(_QWORD *)&v204 = 0x2050000000;
  v70 = (void *)getPRSRankingItemRankerClass_softClass;
  *((_QWORD *)&v204 + 1) = getPRSRankingItemRankerClass_softClass;
  if (!getPRSRankingItemRankerClass_softClass)
  {
    v208 = MEMORY[0x1E0C809B0];
    v209 = 3221225472;
    v210 = (uint64_t)__getPRSRankingItemRankerClass_block_invoke;
    v211 = &unk_1E2401140;
    v212 = &v203;
    __getPRSRankingItemRankerClass_block_invoke((uint64_t)&v208);
    v70 = *(void **)(*((_QWORD *)&v203 + 1) + 24);
  }
  v183 = v29;
  v71 = objc_retainAutorelease(v70);
  _Block_object_dispose(&v203, 8);
  v192 = [v71 alloc];
  if (isClientPhotosOrPhotosCtl(v180))
  {
    objc_msgSend(getSSPommesPhotosRankerClass(), "PhotosRankingRequiredAttributes");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v72);
  }
  else
  {
    v74 = v192;
    v75 = objc_msgSend(v185, "queryID");
    objc_msgSend(v185, "currentTime");
    v76 = (void *)objc_msgSend(v74, "initWithSearchString:queryID:language:currentTime:", v181, v75, v178);

    objc_msgSend(v76, "activate");
    objc_msgSend(v185, "keyboardLanguage");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = v76;
    v78 = v180;
    v79 = v177;
    v80 = v181;
    v81 = v77;
    if ((objc_msgSend(v78, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
    {
      v189 = v192;
      v82 = v78;
      v83 = v79;
      v84 = v80;
      v85 = v81;
      if (getQueryRankingConfigurationForMail_onceToken != -1)
        dispatch_once(&getQueryRankingConfigurationForMail_onceToken, &__block_literal_global_364);
      if (getMailVIPList_onceToken != -1)
        dispatch_once(&getMailVIPList_onceToken, &__block_literal_global_377);
      Current = CFAbsoluteTimeGetCurrent();
      v87 = (id)getMailVIPList_vipListLock;
      objc_sync_enter(v87);
      if (*(double *)&getMailVIPList_lastUpdateTime == 0.0
        || Current - *(double *)&getMailVIPList_lastUpdateTime > 60.0)
      {
        getMailVIPList_lastUpdateTime = *(_QWORD *)&Current;
        fetchMailVIPList();
        v88 = objc_claimAutoreleasedReturnValue();
        v89 = (void *)getMailVIPList_vipList;
        getMailVIPList_vipList = v88;

      }
      objc_sync_exit(v87);

      LOBYTE(v157) = 0;
      objc_msgSend(v189, "rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:", getQueryRankingConfigurationForMail_meContactIdentifier, getQueryRankingConfigurationForMail_meEmailAddresses, getQueryRankingConfigurationForMail_phoneFavorites, getMailVIPList_vipList, v82, 0, v83, v84, 0, 11, v157, v85);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      LOBYTE(v157) = 0;
      objc_msgSend(v192, "rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:", 0, 0, 0, 0, v78, 0, v79, v80, 0, 11, v157, v81);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v185, "completionString");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (v91)
    {
      v92 = objc_msgSend(v90, "fuzzyMatchMask");
      objc_msgSend(v185, "setFuzzyMask:", v92, v93);
      v94 = objc_msgSend(v90, "fuzzyMatchCheck");
      objc_msgSend(v185, "setFuzzyMatch:", v94, v95);
    }
    objc_msgSend(v185, "bundleIDs");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "count");

    if (v97)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "appendFormat:", CFSTR("FieldMatch(%@,"), CFSTR("_kMDItemBundleID"));
      v195 = 0u;
      v196 = 0u;
      v193 = 0u;
      v194 = 0u;
      objc_msgSend(v185, "bundleIDs");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v193, v207, 16);
      if (v100)
      {
        v101 = *(_QWORD *)v194;
        do
        {
          for (i = 0; i != v100; ++i)
          {
            if (*(_QWORD *)v194 != v101)
              objc_enumerationMutation(v99);
            objc_msgSend(v98, "appendFormat:", CFSTR("%@,"), *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * i));
          }
          v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v193, v207, 16);
        }
        while (v100);
      }

      objc_msgSend(v98, "substringToIndex:", objc_msgSend(v98, "length") - 1);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = (void *)objc_msgSend(v103, "mutableCopy");

      objc_msgSend(v104, "appendString:", CFSTR(")"));
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("filterQueries"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v106, "count"))
        objc_msgSend(v105, "addObjectsFromArray:", v106);
      objc_msgSend(v185, "filterQueries");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v107 == 0;

      if (v108)
      {
        objc_msgSend(v185, "setFilterQueries:", v105);
      }
      else
      {
        objc_msgSend(v185, "filterQueries");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "arrayByAddingObjectsFromArray:", v105);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "setFilterQueries:", v110);

      }
    }
    objc_msgSend(v90, "rankingQueries");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (v183)
    {
      objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("queryTerms"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("rankCategories"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "count");
      objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("isNLQuery"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v114, "BOOLValue");

      if ((_DWORD)v115)
      {
        if (v112)
        {
          v116 = v112;
          v208 = 0;
          v209 = (uint64_t)&v208;
          v210 = 0x2020000000;
          v117 = getPRSRankingItemRankerAddJunkFilterSymbolLoc_ptr;
          v211 = getPRSRankingItemRankerAddJunkFilterSymbolLoc_ptr;
          if (!getPRSRankingItemRankerAddJunkFilterSymbolLoc_ptr)
          {
            v118 = (void *)SpotlightServicesLibrary();
            v117 = dlsym(v118, "PRSRankingItemRankerAddJunkFilter");
            *(_QWORD *)(v209 + 24) = v117;
            getPRSRankingItemRankerAddJunkFilterSymbolLoc_ptr = v117;
          }
          _Block_object_dispose(&v208, 8);
          if (!v117)
            goto LABEL_211;
          ((void (*)(id))v117)(v116);
          v119 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v119, "count"))
          {
            objc_msgSend(v119, "objectAtIndex:", objc_msgSend(v119, "count") - 1);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "arrayByAddingObject:", v120);
            v121 = objc_claimAutoreleasedReturnValue();

            v111 = (void *)v121;
          }

        }
        if (v113)
        {
          objc_msgSend(v113, "keysSortedByValueUsingSelector:", sel_compare_);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v192, "setRankCategories:", v122);

        }
        objc_msgSend(v192, "setIsNLSearch:", 1);
      }
      objc_msgSend(v111, "count");

    }
    else
    {
      v115 = 0;
    }
    objc_msgSend(v185, "setParseUserQuery:", v115);
    objc_msgSend(v185, "setRankingQueries:", v111);
    objc_msgSend(v185, "setStrongRankingQueryCount:", objc_msgSend(v90, "strongRankingQueryCount"));
    objc_msgSend(v185, "setDominantRankingQueryCount:", objc_msgSend(v90, "dominantRankingQueryCount"));
    objc_msgSend(v185, "setDominatedRankingQueryCount:", objc_msgSend(v90, "dominatedRankingQueryCount"));
    objc_msgSend(v185, "setShortcutBit:", objc_msgSend(v90, "shortcutBit"));
    objc_msgSend(v185, "setHighMatchBit:", objc_msgSend(v90, "highMatchBit"));
    objc_msgSend(v185, "setLowMatchBit:", objc_msgSend(v90, "lowMatchBit"));
    objc_msgSend(v185, "setHighRecencyBit:", objc_msgSend(v90, "highRecencyBit"));
    objc_msgSend(v185, "setLowRecencyBit:", objc_msgSend(v90, "lowRecencyBit"));
    objc_msgSend(v90, "requiredAttributes");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "requiredAttributes");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "array");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSSearchQuery setRankConfig:](v184, "setRankConfig:", v90);
  }
  objc_msgSend(v185, "fetchAttributes");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = objc_msgSend(v124, "count");

  v125 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v185, "fetchAttributes");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setWithArray:", v126);
  v127 = objc_claimAutoreleasedReturnValue();
  originalAttributes = v184->_originalAttributes;
  v184->_originalAttributes = (NSSet *)v127;

  objc_msgSend(v185, "fetchAttributes");
  v129 = (id)objc_claimAutoreleasedReturnValue();
  v130 = v72;
  v131 = objc_msgSend(v129, "count");
  v132 = objc_msgSend(v130, "count");
  v133 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v132 + v131);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v129);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = 0u;
  v206 = 0u;
  v203 = 0u;
  v204 = 0u;
  v208 = 0;
  v209 = (uint64_t)&v208;
  v210 = 0x2020000000;
  v135 = getrankingAttributeNameArraySymbolLoc_ptr;
  v211 = getrankingAttributeNameArraySymbolLoc_ptr;
  if (!getrankingAttributeNameArraySymbolLoc_ptr)
  {
    v136 = (void *)SpotlightServicesLibrary();
    v135 = dlsym(v136, "rankingAttributeNameArray");
    *(_QWORD *)(v209 + 24) = v135;
    getrankingAttributeNameArraySymbolLoc_ptr = v135;
  }
  _Block_object_dispose(&v208, 8);
  if (!v135)
  {
LABEL_211:
    CSSectionIsSyndicatedPhotos_cold_1();
    goto LABEL_214;
  }
  ((void (*)(void))v135)();
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v203, &v208, 16);
  if (v138)
  {
    v139 = *(_QWORD *)v204;
    do
    {
      for (j = 0; j != v138; ++j)
      {
        if (*(_QWORD *)v204 != v139)
          objc_enumerationMutation(v137);
        v141 = *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * j);
        if ((objc_msgSend(v129, "containsObject:", v141) & 1) != 0
          || objc_msgSend(v130, "containsObject:", v141))
        {
          objc_msgSend(v133, "addObject:", v141);
          objc_msgSend(v134, "removeObject:", v141);
        }
      }
      v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v203, &v208, 16);
    }
    while (v138);
  }

  if (objc_msgSend(v134, "count"))
  {
    objc_msgSend(v134, "allObjects");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "addObjectsFromArray:", v142);

  }
  objc_msgSend(v185, "setFetchAttributes:", v133);

  objc_msgSend(v185, "fetchAttributes");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "setTopHitExtraFetchAttributeCount:", objc_msgSend(v143, "count") - v190);

  objc_msgSend(v185, "fetchAttributes");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = objc_msgSend(v144, "count");
  v146 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (v145)
  {
    for (k = 0; k != v145; ++k)
    {
      objc_msgSend(v144, "objectAtIndexedSubscript:", k);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = objc_msgSend(v73, "containsObject:", v148);

      if (v149)
        objc_msgSend(v146, "addIndex:", k);
    }
  }
  -[CSSearchQuery setHitCount:](v184, "setHitCount:", v179);
  -[CSSearchQuery setOriginalHitCount:](v184, "setOriginalHitCount:", v176);
  -[CSSearchQuery setIsCJK:](v184, "setIsCJK:", v197);
  -[CSSearchQuery setIsKeyboardCJK:](v184, "setIsKeyboardCJK:", v175);
  -[CSSearchQuery setIndexSet:](v184, "setIndexSet:", v146);
  -[CSSearchQuery setRanker:](v184, "setRanker:", v192);
  v150 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CSSearchQuery setCurrentTopHitCandidates:](v184, "setCurrentTopHitCandidates:", v150);

  -[CSSearchQuery setOriginalMaxRankedResultCount:](v184, "setOriginalMaxRankedResultCount:", objc_msgSend(v185, "maxRankedResultCount"));
  objc_msgSend(v185, "clientBundleID");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v151, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {

  }
  else
  {
    objc_msgSend(v185, "clientBundleID");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v152, "isEqualToString:", CFSTR("com.apple.pommesctl"));

    if ((v153 & 1) == 0 && objc_msgSend(v185, "maxRankedResultCount") >= 1)
    {
      v154 = objc_msgSend(v185, "maxRankedResultCount");
      if (3 * v154 >= 100)
        v155 = 100;
      else
        v155 = 3 * v154;
      objc_msgSend(v185, "setMaxRankedResultCount:", v155);
    }
  }

}

- (void)processResultsForTopHitRanking:(id)a3 protectionClass:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  CSSearchQuery *v37;
  unint64_t v38;
  void *v39;
  CFIndex v40;
  NSObject *obj;
  void *v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  unint64_t v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  unint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CSSearchQuery queryContext](self, "queryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_opt_new();
  v34 = objc_msgSend(v6, "queryID");
  v7 = -[CSSearchQuery isCJK](self, "isCJK");
  v8 = -[CSSearchQuery isKeyboardCJK](self, "isKeyboardCJK");
  objc_msgSend(v6, "userQuery");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {

  }
  else
  {
    objc_msgSend(v6, "clientBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.pommesctl"));

    if (!v11 && objc_msgSend(v6, "maxRankedResultCount") >= 1)
    {
      v12 = objc_msgSend(v6, "maxRankedResultCount");
      goto LABEL_7;
    }
  }
  v12 = objc_msgSend(v6, "maxCount");
LABEL_7:
  v40 = v12;
  v35 = v6;
  v49 = 0;
  v33 = objc_msgSend(v5, "count");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v5;
  v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v13)
  {
    v15 = v13;
    v38 = 0;
    v44 = *(_QWORD *)v46;
    v16 = 2;
    if (!v7 && !v8)
      v16 = 3;
    v36 = v16;
    *(_QWORD *)&v14 = 134217984;
    v32 = v14;
    v37 = self;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v46 != v44)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (-[CSSearchQuery isCancelled](self, "isCancelled", v32))
        {
          v31 = obj;
          goto LABEL_37;
        }
        objc_msgSend(v18, "attributeSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = v42;
          v22 = v20;
          if (!objc_msgSend(v21, "length"))
            goto LABEL_25;
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v43 = v20;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "length");

          self = v37;
          v20 = v43;
          if (!v25
            || (objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) == 0
            && !objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.pommesctl")))
          {
            goto LABEL_25;
          }
          if (v25 < v36)
          {
            logForCSLogCategoryQuery();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              v30 = objc_msgSend(v21, "length");
              *(_DWORD *)buf = 134218752;
              v52 = v34;
              v53 = 2048;
              v54 = v30;
              v55 = 2048;
              v56 = v25;
              v57 = 2048;
              v58 = v36;
              _os_log_debug_impl(&dword_18C42F000, v26, OS_LOG_TYPE_DEBUG, "qid=%lu - query (length=%lu, trimmed length=%lu) is too short (threshold=%lu) for topHit results", buf, 0x2Au);
            }

            logForCSLogCategoryQuery();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v32;
              v52 = v34;
              _os_log_debug_impl(&dword_18C42F000, v27, OS_LOG_TYPE_DEBUG, "qid=%lu - returning empty tophits", buf, 0xCu);
            }
          }
          else
          {
LABEL_25:

            -[CSSearchQuery currentTopHitCandidates](self, "currentTopHitCandidates");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            updateTopHitCandidatesAndReturnItemToBeSentToClientNow((uint64_t)v28, v40, v18, v22, v19, v28, &v49);
            v27 = objc_claimAutoreleasedReturnValue();

            if (v27)
              objc_msgSend(v39, "addObject:", v27);
            else
              ++v38;
          }
        }
        else
        {
          logForCSLogCategoryQuery();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v18, "uniqueIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v52 = v34;
            v53 = 2112;
            v54 = (uint64_t)v29;
            _os_log_error_impl(&dword_18C42F000, v27, OS_LOG_TYPE_ERROR, "qid=%ld - Missing bundleID for item with ID: %@", buf, 0x16u);

          }
        }

      }
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v38 = 0;
  }

  -[NSObject removeAllObjects](obj, "removeAllObjects");
  -[NSObject addObjectsFromArray:](obj, "addObjectsFromArray:", v39);
  logForCSLogCategoryDefault();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v52 = v34;
    v53 = 2048;
    v54 = v33;
    v55 = 2048;
    v56 = v49;
    v57 = 2048;
    v58 = v38;
    _os_log_debug_impl(&dword_18C42F000, v31, OS_LOG_TYPE_DEBUG, "qid=%lu - current batch has %ld items (%ld items are L1 topHit candidates, %ld items are L2 topHit candidates)", buf, 0x2Au);
  }
LABEL_37:

}

- (void)finishTopHitRanking
{
  CSSearchQuery *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id obj;
  void *v50;
  void *v51;
  CSSearchQuery *v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  BOOL v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v2 = self;
  v84 = *MEMORY[0x1E0C80C00];
  -[CSSearchQuery queryContext](self, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[CSSearchQuery isCJK](v2, "isCJK");
  v57 = -[CSSearchQuery isKeyboardCJK](v2, "isKeyboardCJK");
  v4 = -[CSSearchQuery hitCount](v2, "hitCount");
  -[CSSearchQuery ranker](v2, "ranker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQuery rankConfig](v2, "rankConfig");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v4;
  objc_msgSend(v5, "setTopHitMaxCount:", v4);
  v55 = objc_msgSend(v3, "queryID");
  objc_msgSend(v3, "clientBundleID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userQuery");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v3, "privateQuery");
  objc_msgSend(v3, "fetchAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v6, "containsObject:", CFSTR("_kMDItemPhotosL2Signals"));

  v48 = v3;
  objc_msgSend(v3, "fetchAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[CSSearchQuery currentTopHitCandidates](v2, "currentTopHitCandidates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v64)
  {
    v62 = 0;
    v63 = *(_QWORD *)v74;
    v51 = v5;
    v52 = v2;
    v50 = v7;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v74 != v63)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        -[CSSearchQuery currentTopHitCandidates](v2, "currentTopHitCandidates");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "getAllItemsAndClearHeap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count"))
        {
          if (CSSectionIsSyndicatedPhotos(v9))
          {
            -[CSSearchQuery currentTopHitCandidates](v2, "currentTopHitCandidates");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v62 = objc_msgSend(v14, "onlyEmbeddingResults");
          }
          v67 = i;
          v15 = (void *)objc_opt_new();
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v66 = v12;
          v16 = v12;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v70;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v70 != v19)
                  objc_enumerationMutation(v16);
                -[CSSearchQuery getTopHitResult:fetchAttrs:](v2, "getTopHitResult:fetchAttrs:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j), v7);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addObject:", v21);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
            }
            while (v18);
          }

          BYTE3(v47) = v62 & 1;
          BYTE2(v47) = v53;
          BYTE1(v47) = v54;
          LOBYTE(v47) = v57;
          LOBYTE(v46) = v58;
          -[CSSearchQuery rankBatch:withRanker:withBundle:maxCount:userQuery:queryID:rankingConfiguration:isCJK:clientBundle:isKeyboardCJK:privateQuery:collectL2Signals:onlyEmbeddingResults:](v2, "rankBatch:withRanker:withBundle:maxCount:userQuery:queryID:rankingConfiguration:isCJK:clientBundle:isKeyboardCJK:privateQuery:collectL2Signals:onlyEmbeddingResults:", v15, v5, v9, v56, v59, v55, v61, v46, v60, v47);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:");
          v22 = v15;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v68 = v22;
          v24 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v78;
            do
            {
              for (k = 0; k != v25; ++k)
              {
                if (*(_QWORD *)v78 != v26)
                  objc_enumerationMutation(v68);
                v28 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
                objc_msgSend(v28, "resultItem");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "rankingItem");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "bundleID");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = CSPommesRankingForSectionBundle(v31);

                v33 = (void *)MEMORY[0x1E0CB37E8];
                if (v32)
                {
                  objc_msgSend(v30, "pommesL1Score");
                  objc_msgSend(v33, "numberWithFloat:");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributeSet");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setMailResultScoreL1:", v34);

                  v36 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v30, "l2Score");
                  objc_msgSend(v36, "numberWithFloat:");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributeSet");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "setMailResultScoreL2:", v37);
                }
                else
                {
                  objc_msgSend(v28, "scoreL1");
                  objc_msgSend(v33, "numberWithFloat:");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributeSet");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "setMailResultScoreL1:", v39);

                  v41 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v28, "rankingItem");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "score");
                  objc_msgSend(v41, "numberWithFloat:");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributeSet");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "setMailResultScoreL2:", v38);

                }
                objc_msgSend(v30, "l2Signals");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "attributeSet");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "setPhotosL2Signals:", v43);

                objc_msgSend(v23, "addObject:", v29);
              }
              v25 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
            }
            while (v25);
          }

          v45 = (void *)objc_msgSend(v23, "copy");
          v2 = v52;
          -[CSSearchQuery processResultItems:](v52, "processResultItems:", v45);

          v7 = v50;
          v5 = v51;
          v12 = v66;
          i = v67;
        }

      }
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v64);
  }

  if (v61)
    objc_msgSend(v5, "deactivate");
  objc_msgSend(v48, "setMaxCount:", -[CSSearchQuery originalHitCount](v2, "originalHitCount"));
  objc_msgSend(v48, "setMaxRankedResultCount:", -[CSSearchQuery originalMaxRankedResultCount](v2, "originalMaxRankedResultCount"));

}

- (id)getTopHitResult:(id)a3 fetchAttrs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  objc_class *v23;
  void *v24;
  CSTopHitResult *v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (getTopHitResult_fetchAttrs__urlIndexOnceToken != -1)
    dispatch_once(&getTopHitResult_fetchAttrs__urlIndexOnceToken, &__block_literal_global_6);
  objc_msgSend(v6, "attributeSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "attributeDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQuery indexSet](self, "indexSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v7, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          ++v11;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v12);
  }

  v36 = 0;
  v37 = (uint64_t)&v36;
  v38 = 0x2020000000;
  v16 = getSSCompactRankingAttrsAllocSymbolLoc_ptr;
  v39 = getSSCompactRankingAttrsAllocSymbolLoc_ptr;
  if (!getSSCompactRankingAttrsAllocSymbolLoc_ptr)
  {
    v17 = (void *)SpotlightServicesLibrary();
    v16 = dlsym(v17, "SSCompactRankingAttrsAlloc");
    *(_QWORD *)(v37 + 24) = v16;
    getSSCompactRankingAttrsAllocSymbolLoc_ptr = v16;
  }
  _Block_object_dispose(&v36, 8);
  if (!v16)
  {
    CSSectionIsSyndicatedPhotos_cold_1();
    __break(1u);
  }
  v18 = ((uint64_t (*)(uint64_t))v16)(v11);
  v19 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __59__CSSearchQuery_TopHitRanking__getTopHitResult_fetchAttrs___block_invoke_2;
  v28[3] = &unk_1E2401A08;
  v20 = v8;
  v29 = v20;
  v21 = v7;
  v30 = v21;
  v31 = v18;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v28);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v22 = (void *)getPRSRankingItemClass_softClass;
  v44 = getPRSRankingItemClass_softClass;
  if (!getPRSRankingItemClass_softClass)
  {
    v36 = v19;
    v37 = 3221225472;
    v38 = (uint64_t)__getPRSRankingItemClass_block_invoke;
    v39 = &unk_1E2401140;
    v40 = &v41;
    __getPRSRankingItemClass_block_invoke((uint64_t)&v36);
    v22 = (void *)v42[3];
  }
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(&v41, 8);
  v24 = (void *)objc_msgSend([v23 alloc], "initWithAttrs:", v18);
  v25 = -[CSTopHitResult initWithRankingItem:resultItem:]([CSTopHitResult alloc], "initWithRankingItem:resultItem:", v24, v6);

  return v25;
}

uint64_t __59__CSSearchQuery_TopHitRanking__getTopHitResult_fetchAttrs___block_invoke()
{
  uint64_t result;

  getTopHitResult_fetchAttrs__contentURLRankingIdx = CSRankingAttributeIndexForName(CFSTR("kMDItemContentURL"));
  result = CSRankingAttributeIndexForName(CFSTR("kMDItemURL"));
  getTopHitResult_fetchAttrs__itemURLRankingIdx = result;
  return result;
}

void __59__CSSearchQuery_TopHitRanking__getTopHitResult_fetchAttrs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v12;
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CSRankingAttributeIndexForName(v7);

    v9 = v8 == getTopHitResult_fetchAttrs__contentURLRankingIdx || v8 == getTopHitResult_fetchAttrs__itemURLRankingIdx;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v12, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CSCompactRankingAttrsInsertValue(v10, v8, v11);

    }
    else
    {
      CSCompactRankingAttrsInsertValue(*(_QWORD *)(a1 + 48), v8, v12);
    }
    v6 = v12;
  }

}

- (void)filterRankedItems:(id)a3 maxCount:(unint64_t)a4 bundle:(id)a5 userQuery:(id)a6 queryID:(int64_t)a7 privateQuery:(BOOL)a8 rankingConfiguration:(id)a9 currentTime:(double)a10 clientBundle:(id)a11 ranker:(id)a12
{
  void *v12;
  _BOOL8 v14;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  float v40;
  _BOOL4 v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  int v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  unint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  void *v65;
  char v66;
  int v67;
  void *v68;
  CSSearchQuery *v69;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[6];
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v14 = a8;
  v19 = a12;
  v109 = *MEMORY[0x1E0C80C00];
  v74 = a3;
  v75 = a5;
  v73 = a6;
  v72 = a9;
  v71 = a11;
  v20 = a12;
  if (-[CSSearchQuery isCancelled](self, "isCancelled"))
    goto LABEL_70;
  v68 = v20;
  v69 = self;
  -[CSSearchQuery queryContext](self, "queryContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "filterTopHits"))
  {
    -[CSSearchQuery queryContext](self, "queryContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "generateSuggestions");
    if (v23
      && (-[CSSearchQuery queryContext](self, "queryContext"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "additionalBundleIDs"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v19, "containsObject:", v75) & 1) != 0))
    {
      v24 = v12;
      v25 = 0;
    }
    else
    {
      -[CSSearchQuery queryContext](self, "queryContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "enableInstantAnswers"))
      {
        -[CSSearchQuery queryContext](self, "queryContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "instantAnswersBundleIDs");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v27;
        v24 = v12;
        v25 = objc_msgSend(v28, "containsObject:", v75) ^ 1;

      }
      else
      {
        v24 = v12;
        v25 = 1;
      }

      if (!v23)
        goto LABEL_12;
    }

LABEL_12:
    goto LABEL_13;
  }
  v25 = 0;
LABEL_13:

  if (CSPommesRankingForSectionBundle(v75))
  {
    v101 = 0;
    v102 = &v101;
    v103 = 0x2050000000;
    v29 = (void *)getSSPommesRankerClass_softClass;
    v104 = getSSPommesRankerClass_softClass;
    if (!getSSPommesRankerClass_softClass)
    {
      v96 = MEMORY[0x1E0C809B0];
      v97 = 3221225472;
      v98 = __getSSPommesRankerClass_block_invoke;
      v99 = &unk_1E2401140;
      v100 = &v101;
      __getSSPommesRankerClass_block_invoke((uint64_t)&v96);
      v29 = (void *)v102[3];
    }
    v30 = objc_retainAutorelease(v29);
    _Block_object_dispose(&v101, 8);
    objc_msgSend(v30, "sharedPommesRanker");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sortAndFilterRankedItems:maxCount:bundleID:userQuery:queryID:privateQuery:currentTime:", v74, a4, v75, v73, a7, v14, a10);
LABEL_69:

    v20 = v68;
    goto LABEL_70;
  }
  v67 = v25;
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __150__CSSearchQuery_TopHitRanking__filterRankedItems_maxCount_bundle_userQuery_queryID_privateQuery_rankingConfiguration_currentTime_clientBundle_ranker___block_invoke;
  v95[3] = &__block_descriptor_48_e43_q24__0__CSTopHitResult_8__CSTopHitResult_16l;
  *(double *)&v95[4] = a10;
  *(double *)&v95[5] = a10;
  objc_msgSend(v74, "sortWithOptions:usingComparator:", 1, v95);
  if (v25)
  {
    v77 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v32 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v33 = v74;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
    if (v34)
    {
      v35 = 0;
      v36 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v92 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          objc_msgSend(v38, "rankingItem");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "withinBundleScore");
          v41 = v40 < -9500.0;

          if (v41)
          {
            objc_msgSend(v32, "addIndex:", v35 + i);
          }
          else
          {
            objc_msgSend(v38, "threadId");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v42)
            {
              if (objc_msgSend(v77, "containsObject:", v42))
                objc_msgSend(v32, "addIndex:", v35 + i);
              else
                objc_msgSend(v77, "addObject:", v42);
            }

          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
        v35 += i;
      }
      while (v34);
    }

    objc_msgSend(v33, "removeObjectsAtIndexes:", v32);
  }
  v20 = v68;
  if (!-[CSSearchQuery isCancelled](v69, "isCancelled"))
  {
    v31 = (void *)objc_opt_new();
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v43 = v74;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v88 != v45)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "rankingItem");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v47);

        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
      }
      while (v44);
    }

    v101 = 0;
    v102 = &v101;
    v103 = 0x2050000000;
    v48 = (void *)getPRSAnonymousPipelineManagerClass_softClass;
    v104 = getPRSAnonymousPipelineManagerClass_softClass;
    if (!getPRSAnonymousPipelineManagerClass_softClass)
    {
      v96 = MEMORY[0x1E0C809B0];
      v97 = 3221225472;
      v98 = __getPRSAnonymousPipelineManagerClass_block_invoke;
      v99 = &unk_1E2401140;
      v100 = &v101;
      __getPRSAnonymousPipelineManagerClass_block_invoke((uint64_t)&v96);
      v48 = (void *)v102[3];
    }
    v49 = objc_retainAutorelease(v48);
    _Block_object_dispose(&v101, 8);
    objc_msgSend(v49, "sharedManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "queryWillFinishWithItems:forClient:forQuery:anonymousDataCollectionAllowed:", v31, v75, v73, objc_msgSend(v72, "allowAnonymousDataCollection"));

    if (objc_msgSend(v43, "count") > a4)
      v51 = v67;
    else
      v51 = 0;
    if (v51 == 1)
      objc_msgSend(v43, "removeObjectsInRange:", a4, objc_msgSend(v43, "count") - a4);
    if ((objc_msgSend(v75, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0
      || objc_msgSend(v75, "isEqualToString:", CFSTR("com.apple.mobilemail")))
    {
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v53 = v43;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
      if (v54)
      {
        v55 = *(_QWORD *)v84;
        do
        {
          for (k = 0; k != v54; ++k)
          {
            if (*(_QWORD *)v84 != v55)
              objc_enumerationMutation(v53);
            objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * k), "rankingItem");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "addObject:", v57);

          }
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
        }
        while (v54);
      }

      objc_msgSend(v68, "filterRankedItems:bundle:userQuery:", v52, v75, v73);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "count");
      if (v59 < objc_msgSend(v52, "count"))
      {
        v78 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v60 = v53;
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v79, v105, 16);
        if (v61)
        {
          v62 = 0;
          v63 = *(_QWORD *)v80;
          do
          {
            for (m = 0; m != v61; ++m)
            {
              if (*(_QWORD *)v80 != v63)
                objc_enumerationMutation(v60);
              objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * m), "rankingItem");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v58, "containsObject:", v65);

              if ((v66 & 1) == 0)
                objc_msgSend(v78, "addIndex:", v62 + m);
            }
            v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v79, v105, 16);
            v62 += m;
          }
          while (v61);
        }

        objc_msgSend(v60, "removeObjectsAtIndexes:", v78);
      }

    }
    goto LABEL_69;
  }
LABEL_70:

}

uint64_t __150__CSSearchQuery_TopHitRanking__filterRankedItems_maxCount_bundle_userQuery_queryID_privateQuery_rankingConfiguration_currentTime_clientBundle_ranker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "rankingItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rankingItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:currentTime:", v8, *(double *)(a1 + 32));

  if (!v9)
  {
    v10 = objc_msgSend(v5, "score");
    v12 = v11;
    v13 = objc_msgSend(v6, "score");
    if (__PAIR128__(v14, v13) >= __PAIR128__(v12, v10))
    {
      if (__PAIR128__(v12, v10) >= __PAIR128__(v14, v13))
      {
        v15 = *(double *)(a1 + 40);
        objc_msgSend(v5, "interestingDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        v18 = vabdd_f64(v15, v17);

        v19 = *(double *)(a1 + 40);
        objc_msgSend(v6, "interestingDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceReferenceDate");
        v22 = vabdd_f64(v19, v21);

        if (v18 < v22)
          goto LABEL_5;
        if (v18 <= v22)
        {
          v9 = 0;
          goto LABEL_8;
        }
      }
      v9 = -1;
      goto LABEL_8;
    }
LABEL_5:
    v9 = 1;
  }
LABEL_8:

  return -v9;
}

- (id)rankBatch:(id)a3 withRanker:(id)a4 withBundle:(id)a5 maxCount:(unint64_t)a6 userQuery:(id)a7 queryID:(int64_t)a8 rankingConfiguration:(id)a9 isCJK:(BOOL)a10 clientBundle:(id)a11 isKeyboardCJK:(BOOL)a12 privateQuery:(BOOL)a13 collectL2Signals:(BOOL)a14 onlyEmbeddingResults:(BOOL)a15
{
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  id v36;
  unint64_t v37;
  void *v38;
  NSObject *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  double v45;
  void *v46;
  float v47;
  unint64_t v48;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  unint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v55 = a4;
  v56 = a5;
  v54 = a7;
  v53 = a9;
  v51 = v20;
  v52 = a11;
  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  v22 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v23 = v21;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v59 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "rankingItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v25);
  }

  v30 = v55;
  v29 = v56;
  objc_msgSend(v55, "prepareItemsForL1Ranking:inBundle:", v22, v56);
  if (CSSectionIsSyndicatedPhotos(v56))
  {
    objc_msgSend(getSSPommesPhotosRankerClass(), "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "currentTime");
    v33 = v32;
    objc_msgSend(v55, "keyboardLanguage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v50) = a15;
    v35 = v54;
    objc_msgSend(v31, "updateScoresForItems:withSectionBundle:userQuery:queryID:currentTime:collectL2Signals:keyboardLanguage:onlyEmbeddingResults:", v22, v56, v54, a8, a14, v34, v33, v50);

    v30 = v55;
    v29 = v56;
    v36 = v52;
  }
  else
  {
    objc_msgSend(v55, "prepareItems:inBundle:", v22, v56);
    v36 = v52;
    objc_msgSend(v55, "updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:", v22, a10, v52, 0, a14, -1.79769313e308);
    v35 = v54;
  }
  objc_msgSend(v30, "currentTime");
  -[CSSearchQuery filterRankedItems:maxCount:bundle:userQuery:queryID:privateQuery:rankingConfiguration:currentTime:clientBundle:ranker:](self, "filterRankedItems:maxCount:bundle:userQuery:queryID:privateQuery:rankingConfiguration:currentTime:clientBundle:ranker:", v23, a6, v29, v35, a8, a13, v53, v36, v30);
  if (CSSectionIsSyndicatedPhotos(v29) && objc_msgSend(v23, "count"))
  {
    v37 = 0;
    do
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      logForCSLogCategoryDefault();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v37 + 1;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v38, "rankingItem");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "rankingItem");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "pommesL1Score");
        v45 = v44;
        objc_msgSend(v38, "rankingItem");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "l2Score");
        *(_DWORD *)buf = 134218754;
        v63 = v37 + 1;
        v64 = 2112;
        v65 = v42;
        v66 = 2048;
        v67 = v45;
        v68 = 2048;
        v69 = v47;
        _os_log_impl(&dword_18C42F000, v39, OS_LOG_TYPE_INFO, "%lu. Final Photos item identifier (%@), L1Score=%f, L2Score=%f", buf, 0x2Au);

      }
      v48 = objc_msgSend(v23, "count");
      if (v37 > 0x12)
        break;
      ++v37;
    }
    while (v40 < v48);
  }
  objc_msgSend(v51, "removeObjectsInArray:", v23);

  return v23;
}

+ (void)setConnectionName:(id)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR(".search"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sConnectionName_0;
  sConnectionName_0 = v3;

}

+ (void)preheat:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CSSearchConnection sharedSearchConnection](CSSearchConnection, "sharedSearchConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preheat:", v3);

}

- (CSSearchQuery)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromSelector(sel_initWithQueryString_attributes_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Use %@ instead"), v4);

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise");

  return 0;
}

- (void)updateQueryString:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *queryString;

  v4 = (NSString *)a3;
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSSearchQuery updateQueryString:].cold.1();

  queryString = self->_queryString;
  self->_queryString = v4;

}

- (void)updateQueryContext:(id)a3
{
  id v4;
  NSObject *v5;
  CSSearchQueryContext *v6;
  CSSearchQueryContext *queryContext;
  uint64_t v8;
  void *v9;
  void *v10;
  CSSearchQueryContext *v11;

  v4 = a3;
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSSearchQuery updateQueryContext:].cold.1();

  v6 = (CSSearchQueryContext *)objc_msgSend(v4, "copy");
  queryContext = self->_queryContext;
  if (queryContext)
    v8 = -[CSSearchQueryContext queryID](queryContext, "queryID");
  else
    v8 = 0;
  -[CSSearchQueryContext setQueryID:](v6, "setQueryID:", v8);
  -[CSSearchQueryContext clientBundleID](self->_queryContext, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setClientBundleID:](v6, "setClientBundleID:", v9);

  objc_msgSend(v4, "attributedUserQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setAttributedUserQuery:](v6, "setAttributedUserQuery:", v10);

  v11 = self->_queryContext;
  self->_queryContext = v6;

}

- (CSSearchQuery)initWithQueryString:(NSString *)queryString queryContext:(CSSearchQueryContext *)queryContext
{
  NSString *v6;
  CSSearchQueryContext *v7;
  NSObject *v8;
  CSSearchQuery *v9;
  CSSearchQueryContext *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = queryString;
  v7 = queryContext;
  logForCSLogCategoryQuery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CSSearchQuery initWithQueryString:queryContext:].cold.1();

  v13.receiver = self;
  v13.super_class = (Class)CSSearchQuery;
  v9 = -[CSSearchQuery init](&v13, sel_init);
  if (v9)
  {
    v10 = v7;
    if (!v10)
    {
      v10 = objc_alloc_init(CSSearchQueryContext);
      v14[0] = CFSTR("kMDItemDisplayName");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSearchQueryContext setFetchAttributes:](v10, "setFetchAttributes:", v11);

    }
    -[CSSearchQuery commonInitWithQueryString:queryContext:](v9, "commonInitWithQueryString:queryContext:", v6, v10);

  }
  return v9;
}

- (CSSearchQuery)initWithQueryString:(NSString *)queryString attributes:(NSArray *)attributes
{
  NSArray *v6;
  NSString *v7;
  void *v8;
  CSSearchQuery *v9;

  v6 = attributes;
  v7 = queryString;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setFetchAttributes:", v6);

  v9 = -[CSSearchQuery initWithQueryString:context:](self, "initWithQueryString:context:", v7, v8);
  return v9;
}

- (CSSearchQuery)initWithQueryString:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CSSearchQuery *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setProtectionClasses:", 0);
  objc_msgSend(v8, "setOptions:", v6);

  v9 = -[CSSearchQuery initWithQueryString:context:](self, "initWithQueryString:context:", v7, v8);
  return v9;
}

- (NSArray)protectionClasses
{
  void *v2;
  void *v3;
  id v4;

  -[CSSearchQueryContext protectionClasses](self->_queryContext, "protectionClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    if (protectionClasses_onceToken != -1)
      dispatch_once(&protectionClasses_onceToken, &__block_literal_global_829);
    v3 = (void *)protectionClasses_sAllProtectionClasses;
  }
  v4 = v3;

  return (NSArray *)v4;
}

void __34__CSSearchQuery_protectionClasses__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB2AB8];
  v4[0] = *MEMORY[0x1E0CB2AB0];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0CB2AC0];
  v4[2] = *MEMORY[0x1E0CB2AD0];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)protectionClasses_sAllProtectionClasses;
  protectionClasses_sAllProtectionClasses = v2;

}

- (id)bundleIDs
{
  return -[CSSearchQueryContext bundleIDs](self->_queryContext, "bundleIDs");
}

- (id)keyboardLanguage
{
  return -[CSSearchQueryContext keyboardLanguage](self->_queryContext, "keyboardLanguage");
}

- (id)preferredLanguages
{
  return -[CSSearchQueryContext preferredLanguages](self->_queryContext, "preferredLanguages");
}

- (id)options
{
  return -[CSSearchQueryContext options](self->_queryContext, "options");
}

- (id)scopes
{
  return -[CSSearchQueryContext scopes](self->_queryContext, "scopes");
}

- (void)setScopes:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchQueryContext setScopes:](self->_queryContext, "setScopes:", v5);

  }
  else
  {
    -[CSSearchQueryContext setScopes:](self->_queryContext, "setScopes:", 0);
  }

}

- (BOOL)internal
{
  return -[CSSearchQueryContext internal](self->_queryContext, "internal");
}

- (BOOL)grouped
{
  return -[CSSearchQueryContext grouped](self->_queryContext, "grouped");
}

- (BOOL)counting
{
  return -[CSSearchQueryContext counting](self->_queryContext, "counting");
}

- (BOOL)attribute
{
  return -[CSSearchQueryContext attribute](self->_queryContext, "attribute");
}

- (double)currentTime
{
  double result;

  -[CSSearchQueryContext currentTime](self->_queryContext, "currentTime");
  return result;
}

- (id)description
{
  CSSearchQueryContext *queryContext;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  queryContext = self->_queryContext;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (queryContext)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p qid=%ld flag=0x%4.4x>"), v5, self, -[CSSearchQueryContext queryID](self->_queryContext, "queryID"), -[CSSearchQueryContext flags](self->_queryContext, "flags"));
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p"), v5, self, v7, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)debugDescription
{
  return -[CSSearchQuery debugDescriptionWithQueryString:](self, "debugDescriptionWithQueryString:", 0);
}

+ (id)_makeQueryErrorWithErrorCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (unint64_t)a4;
  v8 = (unint64_t)a5;
  if (v7 | v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v9;
    if (v7)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);
    if (v8)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("CSSearchQueryErrorDomain"), a3, v10);

  return v11;
}

- (void)handleGatherEnded
{
  void (**v2)(void);
  void (**v3)(void);

  -[CSSearchQuery gatherEndedHandler](self, "gatherEndedHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

uint64_t __34__CSSearchQuery__finishWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)handleError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__CSSearchQuery_handleError___block_invoke;
  v8[3] = &unk_1E24013B8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(queue, v7);

}

uint64_t __29__CSSearchQuery_handleError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 40));
}

- (void)poll
{
  qos_class_t v3;
  NSObject *queue;
  dispatch_block_t v5;
  _QWORD block[5];

  v3 = qos_class_self();
  if (-[CSSearchQueryContext qos](self->_queryContext, "qos"))
    v3 = -[CSSearchQueryContext qos](self->_queryContext, "qos");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__CSSearchQuery_poll__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v3, 0, block);
  dispatch_async(queue, v5);

}

void __21__CSSearchQuery_poll__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  xpc_object_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "queryID");
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = v2;
    _os_log_impl(&dword_18C42F000, v3, OS_LOG_TYPE_INFO, "qid=%ld - Polling", (uint8_t *)&v6, 0xCu);
  }

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "pollResults");
  xpc_dictionary_set_uint64(v4, "qid", v2);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessageAsync:completion:", v4, &__block_literal_global_871);

}

- (void)cancel
{
  _BOOL4 finished;
  uint64_t v4;
  NSObject *v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  CSSearchQuery *v13;
  NSMutableArray *suggestionCountQueries;
  OS_dispatch_group *suggestionCountDispatchGroup;
  _CSMultiQuery *megadomeCountingQuerySearchTo;
  _CSMultiQuery *megadomeCountingQuerySearchFrom;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_cancelled)
  {
    self->_cancelled = 1;
    finished = self->_finished;
    v4 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
    logForCSLogCategoryQuery();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v4;
      _os_log_impl(&dword_18C42F000, v5, OS_LOG_TYPE_INFO, "qid=%ld - Canceling", buf, 0xCu);
    }

    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "command-type", "search-type");
    xpc_dictionary_set_string(v6, "command", "cancelQuery");
    xpc_dictionary_set_uint64(v6, "qid", v4);
    -[CSSearchQuery connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __23__CSSearchQuery_cancel__block_invoke;
    v18[3] = &unk_1E24048E0;
    v18[4] = self;
    objc_msgSend(v7, "sendMessageAsync:completion:", v6, v18);

    if (!finished)
    {
      +[CSPowerLog sharedInstance](CSPowerLog, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = sMainBundleId;
      -[CSSearchQueryContext reason](self->_queryContext, "reason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v8, "logWithBundleID:indexOperation:itemCount:reason:", v9, 4, 1, v10);
      }
      else
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logWithBundleID:indexOperation:itemCount:reason:", v9, 4, 1, v12);

      }
    }
    v13 = self;
    objc_sync_enter(v13);
    -[NSMutableArray enumerateObjectsUsingBlock:](v13->_suggestionCountQueries, "enumerateObjectsUsingBlock:", &__block_literal_global_876);
    suggestionCountQueries = v13->_suggestionCountQueries;
    v13->_suggestionCountQueries = 0;

    suggestionCountDispatchGroup = v13->_suggestionCountDispatchGroup;
    v13->_suggestionCountDispatchGroup = 0;

    objc_sync_exit(v13);
  }
  megadomeCountingQuerySearchTo = self->_megadomeCountingQuerySearchTo;
  if (megadomeCountingQuerySearchTo)
    -[_CSMultiQuery cancel](megadomeCountingQuerySearchTo, "cancel");
  megadomeCountingQuerySearchFrom = self->_megadomeCountingQuerySearchFrom;
  if (megadomeCountingQuerySearchFrom)
    -[_CSMultiQuery cancel](megadomeCountingQuerySearchFrom, "cancel");
}

void __23__CSSearchQuery_cancel__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "_makeQueryErrorWithErrorCode:description:underlyingError:", -2003, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "didFinishWithError:", v2);

}

uint64_t __23__CSSearchQuery_cancel__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)userEngagedWithResult:(id)a3 interactionType:(int)a4
{
  uint64_t v6;
  xpc_object_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "command", "userEngaged");
  xpc_dictionary_set_uint64(v7, "qid", v6);
  xpc_dictionary_set_uint64(v7, "uintt", a4);
  xpc_dictionary_set_string(v7, "query", -[NSString UTF8String](self->_queryString, "UTF8String"));
  -[CSSearchQueryContext userQuery](self->_queryContext, "userQuery");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v7, "userquery", (const char *)objc_msgSend(v8, "UTF8String"));

  objc_msgSend(v18, "uniqueIdentifier");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v7, "qenr", (const char *)objc_msgSend(v9, "UTF8String"));

  objc_msgSend(v18, "bundleID");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v7, "qenb", (const char *)objc_msgSend(v10, "UTF8String"));

  objc_msgSend(v18, "protection");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "UTF8String");

  if (v12)
  {
    objc_msgSend(v18, "protection");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v7, "pc", (const char *)objc_msgSend(v13, "UTF8String"));
LABEL_5:

    -[CSSearchQuery connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendMessageAsync:", v7);

    goto LABEL_6;
  }
  -[CSSearchQueryContext protectionClasses](self->_queryContext, "protectionClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 == 1)
  {
    -[CSSearchQueryContext protectionClasses](self->_queryContext, "protectionClasses");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v7, "pc", (const char *)objc_msgSend(v16, "UTF8String"));

    goto LABEL_5;
  }
LABEL_6:

}

- (void)didResolveFriendlyAttributeNames:(id)a3 fromFetchAttributes:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__CSSearchQuery_didResolveFriendlyAttributeNames_fromFetchAttributes___block_invoke;
  v12[3] = &unk_1E2404948;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, v12);

}

void __70__CSSearchQuery_didResolveFriendlyAttributeNames_fromFetchAttributes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 56))
  {
    if (*(_QWORD *)(v1 + 248))
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "count");
      v4 = objc_msgSend(*(id *)(a1 + 48), "count");
      if (v3 && v3 >= v4)
      {
        v6 = v4;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          for (i = 0; i != v6; ++i)
          {
            objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", i);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) == 0)
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v9);

          }
        }
        if (objc_msgSend(v7, "count"))
          (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) + 16))();

      }
    }
    logForCSLogCategoryQuery();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __70__CSSearchQuery_didResolveFriendlyAttributeNames_fromFetchAttributes___block_invoke_cold_1();

  }
}

- (void)handleFoundAttributes:(id)a3 values:(id)a4 attributesHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, id, id))a5 + 2))(a5, a3, a4);
}

- (void)processAttributesData:(id)a3 update:(BOOL)a4 protectionClass:(id)a5
{
  id v7;
  void *Trusted;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  uint64_t v20;

  v7 = objc_retainAutorelease(a3);
  objc_msgSend(v7, "bytes");
  objc_msgSend(v7, "length");

  Trusted = (void *)_MDPlistBytesCreateTrusted();
  if (a4)
    -[CSSearchQuery changedAttributesHandler](self, "changedAttributesHandler");
  else
    -[CSSearchQuery foundAttributesHandler](self, "foundAttributesHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _Block_copy(v9);

  -[CSSearchQuery fetchAttributes](self, "fetchAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__CSSearchQuery_processAttributesData_update_protectionClass___block_invoke;
  v16[3] = &unk_1E2404970;
  v16[4] = self;
  v19 = v13;
  v20 = v12;
  v14 = v11;
  v17 = v14;
  v15 = v10;
  v18 = v15;
  objc_msgSend(Trusted, "enumerateQueryResults:stringCache:usingBlock:", v12, 0, v16);
  if (-[CSSearchQueryContext disableResultStreaming](self->_queryContext, "disableResultStreaming"))
    -[CSSearchQuery handleFoundAttributes:values:attributesHandler:](self, "handleFoundAttributes:values:attributesHandler:", kCSEndOfBatchMarker, 0, v15);

}

void __62__CSSearchQuery_processAttributesData_update_protectionClass___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  NSObject *v5;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
  {
    logForCSLogCategoryQuery();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __62__CSSearchQuery_processAttributesData_update_protectionClass___block_invoke_cold_1();

    *a3 = 1;
  }
  else if (*(_QWORD *)(a1 + 64))
  {
    v7 = 0;
    do
    {
      v8 = *(id *)(a2 + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFoundAttributes:values:attributesHandler:", v10, v8, *(_QWORD *)(a1 + 48));

      }
      ++v7;
    }
    while (v7 < *(_QWORD *)(a1 + 64));
  }
}

- (void)processPhotosComputedData:(id)a3 protectionClass:(id)a4
{
  id v5;
  const void *Trusted;
  uint64_t v7;
  void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  _BOOL4 v11;
  void (**v12)(_QWORD, uint64_t, const __CFArray *);

  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");

  Trusted = (const void *)_MDPlistBytesCreateTrusted();
  -[CSSearchQuery photosComputedAttributesHandler](self, "photosComputedAttributesHandler");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v12 = (void (**)(_QWORD, uint64_t, const __CFArray *))v7;
    -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
    v9 = (const __CFArray *)_MDPlistBytesCopyPlistAtIndex();
    if (CFArrayGetCount(v9))
      v12[2](v12, CSPhotosSceneClassificationIdentifierAndType, v9);
    CFRelease(v9);
    v10 = (const __CFArray *)_MDPlistBytesCopyPlistAtIndex();
    if (CFArrayGetCount(v10))
      v12[2](v12, (uint64_t)CFSTR("kMDItemPhotosPeoplePersonIdentifiers"), v10);
    CFRelease(v10);
    CFRelease(Trusted);
    v11 = -[CSSearchQueryContext disableResultStreaming](self->_queryContext, "disableResultStreaming");
    v8 = v12;
    if (v11)
    {
      v12[2](v12, kCSEndOfBatchMarker, 0);
      v8 = v12;
    }
  }

}

- (void)_removeIdentifiers:(id)a3 withBundleID:(id)a4 andQueryID:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CSSearchQuery *v13;
  void (**removedItemsHandler)(id, id, id);
  int v15;
  int64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "count");
  if (v10)
  {
    v11 = v10;
    logForCSLogCategoryQuery();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218240;
      v16 = a5;
      v17 = 2048;
      v18 = v11;
      _os_log_impl(&dword_18C42F000, v12, OS_LOG_TYPE_DEFAULT, "qid=%ld - Removed: %ld items", (uint8_t *)&v15, 0x16u);
    }

    v13 = self;
    objc_sync_enter(v13);
    v13->_foundItemCount -= v11;
    objc_sync_exit(v13);

    removedItemsHandler = (void (**)(id, id, id))v13->_removedItemsHandler;
    if (removedItemsHandler)
      removedItemsHandler[2](removedItemsHandler, v9, v8);
  }

}

- (void)processRemoveResultsData:(id)a3 protectionClass:(id)a4
{
  id v6;
  id v7;
  id v8;
  const void *v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "length");
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  v9 = (const void *)_MDStoreOIDArrayCreate();
  v10 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
  if (v9)
  {
    v11 = v10;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__9;
    v22 = __Block_byref_object_dispose__9;
    v23 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__9;
    v16 = __Block_byref_object_dispose__9;
    v17 = 0;
    _MDStoreOIDArrayApplyBlock();
    -[CSSearchQuery _removeIdentifiers:withBundleID:andQueryID:](self, "_removeIdentifiers:withBundleID:andQueryID:", v19[5], v13[5], v11);
    CFRelease(v9);
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }

}

void __58__CSSearchQuery_processRemoveResultsData_protectionClass___block_invoke(uint64_t a1, int a2, int a3, uint64_t a4, unsigned int a5)
{
  NSObject *v10;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  logForCSLogCategoryQuery();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v26 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134218496;
    v32 = v26;
    v33 = 1024;
    v34 = a2;
    v35 = 1024;
    v36 = a3;
    _os_log_debug_impl(&dword_18C42F000, v10, OS_LOG_TYPE_DEBUG, "qid=%ld - RemoveResults tag:0x%x opcode :0x%x", buf, 0x18u);
  }

  if (a5 >= 2)
  {
    v11 = (uint64_t *)(a4 + 8);
    for (i = a5 - 1; i; --i)
    {
      v14 = *v11++;
      v13 = v14;
      v15 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 64))
      {
        v27 = 0;
        v28 = 0;
        v16 = objc_msgSend(v15, "removeUserFSLiveOID:outBundleID:outIdentifier:", v13, &v28, &v27);
        v17 = v28;
        v18 = v27;
        if (v16)
          goto LABEL_9;
      }
      else
      {
        v29 = 0;
        v30 = 0;
        v19 = objc_msgSend(v15, "removeLiveOID:outBundleID:outIdentifier:", v13, &v30, &v29);
        v17 = v30;
        v18 = v29;
        if ((v19 & 1) != 0)
        {
LABEL_9:
          if ((objc_msgSend(v17, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "_removeIdentifiers:withBundleID:andQueryID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 56));
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v21 = *(void **)(v20 + 40);
            *(_QWORD *)(v20 + 40) = 0;

          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v17);
          v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          if (!v22)
          {
            v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v25 = *(void **)(v24 + 40);
            *(_QWORD *)(v24 + 40) = v23;

            v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          }
          objc_msgSend(v22, "addObject:", v18);
        }
      }

    }
  }
}

- (BOOL)removeLiveOID:(int64_t)a3 outBundleID:(id *)a4 outIdentifier:(id *)a5
{
  unsigned int v7;
  int64_t v9;
  os_unfair_lock_s *p_liveItemLock;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;

  v7 = a3;
  v9 = a3 >> 32;
  p_liveItemLock = &self->_liveItemLock;
  os_unfair_lock_lock(&self->_liveItemLock);
  -[NSMapTable objectForKey:](self->_liveIndexBundleIDToIndexItemIDMap, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v7;
    -[NSMapTable objectForKey:](self->_liveIndexBundleIDToBundleString, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = v13 == 0;
    else
      v15 = 1;
    v16 = !v15;
    if (!v15)
    {
      objc_msgSend(v11, "removeObjectForKey:", v12);
      *a4 = objc_retainAutorelease(v13);
      *a5 = objc_retainAutorelease(v14);
    }

  }
  else
  {
    v16 = 0;
  }
  os_unfair_lock_unlock(p_liveItemLock);

  return v16;
}

- (id)addOrUpdateUserFSLiveOID:(int64_t)a3 userFSDomain:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSMapTable *v13;
  NSMapTable *liveIndexUserFSOIDTOIdentifierMap;

  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_liveItemLock);
  if (self->_liveIndexUserFSOIDTOIdentifierMap)
  {
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 0);
  liveIndexUserFSOIDTOIdentifierMap = self->_liveIndexUserFSOIDTOIdentifierMap;
  self->_liveIndexUserFSOIDTOIdentifierMap = v13;

  if (v8)
  {
LABEL_3:
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("/%@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v10;
  }
LABEL_4:
  -[NSMapTable objectForKey:](self->_liveIndexUserFSOIDTOIdentifierMap, "objectForKey:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", v9))
  {

    v11 = 0;
  }
  -[NSMapTable setObject:forKey:](self->_liveIndexUserFSOIDTOIdentifierMap, "setObject:forKey:", v9, a3);
  os_unfair_lock_unlock(&self->_liveItemLock);

  return v11;
}

- (BOOL)removeUserFSLiveOID:(int64_t)a3 outBundleID:(id *)a4 outIdentifier:(id *)a5
{
  os_unfair_lock_s *p_liveItemLock;
  void *v10;

  p_liveItemLock = &self->_liveItemLock;
  os_unfair_lock_lock(&self->_liveItemLock);
  -[NSMapTable objectForKey:](self->_liveIndexUserFSOIDTOIdentifierMap, "objectForKey:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMapTable removeObjectForKey:](self->_liveIndexUserFSOIDTOIdentifierMap, "removeObjectForKey:", a3);
    *a4 = objc_retainAutorelease((id)UserFSBundleID);
    *a5 = objc_retainAutorelease(v10);
  }
  os_unfair_lock_unlock(p_liveItemLock);

  return v10 != 0;
}

- (unint64_t)dispatchApplyWidth
{
  return 4;
}

- (id)copyResultsFromPlist:(id)a3 protectionClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFArray *Mutable;
  uint64_t v15;
  const void *v16;
  size_t v17;
  NSObject *v18;
  __int16 v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v32;
  signed __int16 v33;
  signed __int16 v34;
  signed __int16 v35;
  signed __int16 v36;
  signed __int16 v37;
  id v38;
  uint8_t buf[8];
  _QWORD block[5];
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  int *v46;
  __CFArray *v47;
  __int16 v48;
  __int16 v49;
  __int16 v50;
  __int16 v51;
  __int16 v52;
  int v53;
  _QWORD aBlock[7];

  v6 = a3;
  v7 = a4;
  -[CSSearchQuery fetchAttributes](self, "fetchAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
  -[CSSearchQuery foundItemHandler](self, "foundItemHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke;
    aBlock[3] = &unk_1E24049E8;
    aBlock[4] = self;
    aBlock[5] = v9;
    v12 = _Block_copy(aBlock);
    objc_msgSend(v6, "enumerateQueryResults:stringCache:usingBlock:", v9, 0, v12);

    v13 = 0;
  }
  else
  {
    v32 = v10;
    v36 = self->_attrInfo[6];
    v37 = self->_attrInfo[1];
    v34 = self->_attrInfo[11];
    v35 = self->_attrInfo[10];
    v33 = self->_attrInfo[12];
    v38 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v53 = 0;
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    _MDChildPlistBytesContextCreate();
    v15 = _MDPlistBytesCopyChildPlistBytesAtIndex();
    if (v15)
    {
      v16 = (const void *)v15;
      v17 = 0;
      do
      {
        CFArrayAppendValue(Mutable, v16);
        CFRelease(v16);
        ++v17;
        v16 = (const void *)_MDPlistBytesCopyChildPlistBytesAtIndex();
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }
    _MDChildPlistBytesContextDestroy();
    logForCSLogCategoryQuery();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[CSSearchQuery copyResultsFromPlist:protectionClass:].cold.1();
    v19 = v37 - 1;

    if (self->_userFSIndex)
    {
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("__fp"), "stringByAppendingPathComponent:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v37 - 1;
    }
    else
    {
      v22 = 0;
    }
    v23 = -[CSSearchQuery dispatchApplyWidth](self, "dispatchApplyWidth");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_893;
    block[3] = &unk_1E2404A10;
    v44 = v9;
    v45 = v23;
    block[4] = self;
    v24 = v7;
    v48 = v19;
    v49 = v36 - 1;
    v50 = v35 - 1;
    v51 = v34 - 1;
    v52 = v33 - 1;
    v41 = v24;
    v42 = v22;
    v46 = &v53;
    v25 = v38;
    v43 = v25;
    v47 = Mutable;
    v26 = v22;
    dispatch_apply(v17, 0, block);
    CFRelease(Mutable);
    if (_os_feature_enabled_impl() && -[CSSearchQuery isTopHitQuery](self, "isTopHitQuery"))
    {
      logForCSLogCategoryQuery();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18C42F000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v32, "processResultsForTopHitRanking", (const char *)&unk_18C505DC6, buf, 2u);
      }

      -[CSSearchQuery processResultsForTopHitRanking:protectionClass:](self, "processResultsForTopHitRanking:protectionClass:", v25, v24);
      logForCSLogCategoryQuery();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18C42F000, v30, OS_SIGNPOST_INTERVAL_END, v32, "processResultsForTopHitRanking", (const char *)&unk_18C505DC6, buf, 2u);
      }

    }
    if (self->_cancelled)
    {

      v25 = 0;
    }
    objc_msgSend(v25, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 56))
  {
    *a3 = 1;
    v6 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 >= *(__int16 *)(v6 + 24))
    v8 = *(__int16 *)(v6 + 24);
  else
    v8 = v7;
  objc_msgSend((id)v6, "foundItemHandler");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, unint64_t, uint64_t, _BYTE *))v9 + 2))(v9, 0, v8, a2, a3);

}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_893(uint64_t a1, CFIndex a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  size_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  size_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int16 v31;
  _QWORD aBlock[5];
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int16 v41;
  _QWORD v42[4];

  v4 = malloc_type_calloc(0x400uLL, 8 * *(_QWORD *)(a1 + 64), 0x80040B8603338uLL);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v42[3] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_2;
  aBlock[3] = &unk_1E2404A38;
  v36 = v42;
  v37 = v4;
  v6 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v38 = *(_OWORD *)(a1 + 64);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 96);
  v33 = v7;
  v40 = v8;
  v41 = *(_WORD *)(a1 + 104);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 80);
  v34 = v9;
  v39 = v10;
  v35 = *(id *)(a1 + 56);
  v11 = _Block_copy(aBlock);
  CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 88), a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enumerateQueryResults:stringCache:usingBlock:", *(_QWORD *)(a1 + 64), 0, v11);
  v21[0] = v5;
  v21[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_4;
  v21[3] = &unk_1E2404A60;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v25 = v42;
  v21[4] = v13;
  v15 = *(_QWORD *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 72);
  v27 = v4;
  v28 = v15;
  v21[1] = 3221225472;
  v26 = v16;
  v17 = v14;
  v18 = *(_QWORD *)(a1 + 96);
  v22 = v17;
  v30 = v18;
  v31 = *(_WORD *)(a1 + 104);
  v19 = *(id *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 80);
  v23 = v19;
  v29 = v20;
  v24 = *(id *)(a1 + 56);
  dispatch_apply(v16, 0, v21);
  free(v4);

  _Block_object_dispose(v42, 8);
}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_2(uint64_t a1, void *__src, _BYTE *a3)
{
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
    *a3 = 1;
  memcpy((void *)(*(_QWORD *)(a1 + 72)+ 8 * *(_QWORD *)(a1 + 80) * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)), __src, 8 * *(_QWORD *)(a1 + 80));
  bzero(__src, 8 * *(_QWORD *)(a1 + 80));
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 1024)
  {
    v5 = *(_QWORD *)(a1 + 88);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_3;
    v13[3] = &unk_1E2404A10;
    v6 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    v17 = v5;
    v18 = v7;
    v19 = v8;
    v13[1] = 3221225472;
    v9 = v6;
    v10 = *(_QWORD *)(a1 + 104);
    v14 = v9;
    v21 = v10;
    v22 = *(_WORD *)(a1 + 112);
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 96);
    v15 = v11;
    v20 = v12;
    v16 = *(id *)(a1 + 56);
    dispatch_apply(v5, 0, v13);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

  }
}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_3(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  void *v5;
  uint64_t v6;
  unint64_t i;
  const void *v8;
  id v9;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0x400uLL / *(_QWORD *)(a1 + 64));
  if (a2 <= 0x3FF)
  {
    do
    {
      v2 = v2 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(a1 + 104);
      v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyCSSearchableItemWithValues:valueCount:attrKeys:protectionClass:mappingStrategy:attrInfo:requestedAttributeCount:unpackInfo:userFSDomain:", *(_QWORD *)(a1 + 72) + 8 * *(_QWORD *)(a1 + 80) * a2, *(__int16 *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 96), v2, *(_QWORD *)(a1 + 48));
      v6 = *(_QWORD *)(a1 + 80);
      for (i = v6 * a2; i < v6 * (a2 + 1); ++i)
      {
        v8 = *(const void **)(*(_QWORD *)(a1 + 72) + 8 * i);
        if (v8)
        {
          CFRelease(v8);
          v6 = *(_QWORD *)(a1 + 80);
        }
      }
      if (v5)
        objc_msgSend(v9, "addObject:", v5);

      a2 += *(_QWORD *)(a1 + 64);
    }
    while (a2 < 0x400);
  }
  if (objc_msgSend(v9, "count"))
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v9);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 88));
  }

}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_4(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  void *v5;
  uint64_t v6;
  unint64_t j;
  const void *v8;
  id i;

  for (i = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (unint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)+ *(_QWORD *)(a1 + 72)- 1)/ *(_QWORD *)(a1 + 72));
        a2 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        a2 += *(_QWORD *)(a1 + 72))
  {
    v2 = v2 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(a1 + 112);
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyCSSearchableItemWithValues:valueCount:attrKeys:protectionClass:mappingStrategy:attrInfo:requestedAttributeCount:unpackInfo:userFSDomain:", *(_QWORD *)(a1 + 80) + 8 * *(_QWORD *)(a1 + 88) * a2, *(__int16 *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 104), v2, *(_QWORD *)(a1 + 48));
    v6 = *(_QWORD *)(a1 + 88);
    for (j = v6 * a2; j < v6 * (a2 + 1); ++j)
    {
      v8 = *(const void **)(*(_QWORD *)(a1 + 80) + 8 * j);
      if (v8)
      {
        CFRelease(v8);
        v6 = *(_QWORD *)(a1 + 88);
      }
    }
    if (v5)
      objc_msgSend(i, "addObject:", v5);

  }
  if (objc_msgSend(i, "count"))
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", i);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 96));
  }

}

- (void)handleFoundItems:(id)a3
{
  id v3;
  id v5;
  NSObject *v6;
  void *v7;
  os_signpost_id_t v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  logForCSLogCategoryQuery();
  v6 = objc_claimAutoreleasedReturnValue();
  -[CSSearchQuery queryContext](self, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "queryID");

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");
    -[CSSearchQuery queryContext](self, "queryContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[CSSearchQuery queryContext](self, "queryContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clientBundleID");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (const char *)objc_msgSend(v3, "UTF8String");
    }
    else
    {
      v14 = "Unknown";
    }
    *(_DWORD *)buf = 136315650;
    v19 = v11;
    v20 = 2080;
    v21 = v14;
    v22 = 2048;
    v23 = objc_msgSend(v5, "count");
    _os_signpost_emit_with_name_impl(&dword_18C42F000, v6, OS_SIGNPOST_EVENT, v8, "CSUserQuery_FoundItems", "QueryClass=%{signpost.description:attribute}s, BundleID=%{signpost.description:attribute}s, ItemsCount=%{signpost.description:attribute}lu", buf, 0x20u);
    if (v13)
    {

    }
  }

  -[CSSearchQuery foundItemsHandler](self, "foundItemsHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CSSearchQuery foundItemsHandler](self, "foundItemsHandler");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v16)[2](v16, v5);

  }
}

- (void)addSuggestionCountQuery:(id)a3
{
  CSSearchQuery *v4;
  id v5;
  NSMutableArray *suggestionCountQueries;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSObject *suggestionCountDispatchGroup;
  dispatch_group_t v10;
  OS_dispatch_group *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = v12;
  suggestionCountQueries = v4->_suggestionCountQueries;
  if (!suggestionCountQueries)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = v4->_suggestionCountQueries;
    v4->_suggestionCountQueries = v7;

    suggestionCountQueries = v4->_suggestionCountQueries;
    v5 = v12;
  }
  -[NSMutableArray addObject:](suggestionCountQueries, "addObject:", v5);
  suggestionCountDispatchGroup = v4->_suggestionCountDispatchGroup;
  if (!suggestionCountDispatchGroup)
  {
    v10 = dispatch_group_create();
    v11 = v4->_suggestionCountDispatchGroup;
    v4->_suggestionCountDispatchGroup = (OS_dispatch_group *)v10;

    suggestionCountDispatchGroup = v4->_suggestionCountDispatchGroup;
  }
  dispatch_group_enter(suggestionCountDispatchGroup);
  objc_sync_exit(v4);

}

- (void)removeSuggestionCountQuery:(id)a3
{
  CSSearchQuery *v4;
  NSObject *suggestionCountDispatchGroup;
  NSMutableArray *suggestionCountQueries;
  OS_dispatch_group *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  suggestionCountDispatchGroup = v4->_suggestionCountDispatchGroup;
  if (suggestionCountDispatchGroup)
  {
    dispatch_group_leave(suggestionCountDispatchGroup);
    -[NSMutableArray removeObject:](v4->_suggestionCountQueries, "removeObject:", v8);
    if (!-[NSMutableArray count](v4->_suggestionCountQueries, "count"))
    {
      suggestionCountQueries = v4->_suggestionCountQueries;
      v4->_suggestionCountQueries = 0;

      v7 = v4->_suggestionCountDispatchGroup;
      v4->_suggestionCountDispatchGroup = 0;

    }
  }
  objc_sync_exit(v4);

}

- (id)processToMegadomePeopleSuggestions:(id)a3 resultsToMultiQuery:(id)a4 toSuggestions:(id)a5 processedSuggestions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  CSSearchQuery *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[CSSearchQuery isCancelled](self, "isCancelled"))
  {
    v14 = 0;
  }
  else
  {
    v15 = objc_msgSend(v12, "count");
    if (v15 == objc_msgSend(v11, "count"))
    {
      v36 = self;
      if (objc_msgSend(v12, "count"))
      {
        v16 = 0;
        v17 = 0;
        do
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "currentToken");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setSelectedScope:", 1);

            objc_msgSend(v12, "objectAtIndexedSubscript:", v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v22);

            ++v17;
          }
          ++v16;
        }
        while (v16 < objc_msgSend(v12, "count"));
      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v37 = v10;
      v24 = v10;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v39 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            if (objc_msgSend(v13, "containsObject:", v29))
              objc_msgSend(v14, "addObject:", v29);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        }
        while (v26);
      }

      logForCSLogCategoryDefault();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        -[CSSearchQuery queryContext](v36, "queryContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "queryID");
        v32 = objc_msgSend(v13, "count");
        v33 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 134218752;
        v43 = v31;
        v44 = 2048;
        v45 = v32;
        v46 = 2048;
        v47 = v17;
        v48 = 2048;
        v49 = v33;
        _os_log_impl(&dword_18C42F000, v23, OS_LOG_TYPE_INFO, "[MegadomeSearch]: qid: %lu, Processed suggestions: %lu, Recipient suggestions: %lu, Total trimmed suggestions: %lu", buf, 0x2Au);

      }
      v10 = v37;
    }
    else
    {
      logForCSLogCategoryQuery();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        -[CSSearchQuery queryContext](self, "queryContext");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218496;
        v43 = objc_msgSend(v35, "queryID");
        v44 = 2048;
        v45 = objc_msgSend(v12, "count");
        v46 = 2048;
        v47 = objc_msgSend(v11, "count");
        _os_log_fault_impl(&dword_18C42F000, v23, OS_LOG_TYPE_FAULT, "[MegadomeSearch]: qid: %lu, toSuggestions.count %lu != resultsToMultiQuery.count %lu", buf, 0x20u);

      }
      v14 = 0;
    }

  }
  return v14;
}

- (id)processFromMegadomePeopleSuggestions:(id)a3 resultsFromMultiQuery:(id)a4 fromSuggestions:(id)a5 processedSuggestions:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (-[CSSearchQuery isCancelled](self, "isCancelled"))
  {
    v12 = 0;
  }
  else
  {
    if (-[CSSearchQueryContext currentTokenScope](self->_queryContext, "currentTokenScope") == 1
      || (v13 = objc_msgSend(v10, "count"), v13 == objc_msgSend(v9, "count")))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v14 = objc_claimAutoreleasedReturnValue();
      if (-[CSSearchQueryContext currentTokenScope](self->_queryContext, "currentTokenScope") != 1)
      {
        v15 = 0;
        do
        {
          if (v15 >= objc_msgSend(v10, "count"))
            break;
          objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (v17)
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "currentToken");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setSelectedScope:", 0);

            objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v14, "addObject:", v20);

            objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v21);

          }
          ++v15;
        }
        while (-[CSSearchQueryContext currentTokenScope](self->_queryContext, "currentTokenScope") != 1);
      }
      v22 = objc_msgSend(v10, "count");
      v23 = -[NSObject count](v14, "count");
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v22 - v23);
      if (v22 != v23)
      {
        v38 = v11;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v10, "differenceFromArray:", v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "insertions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v40 != v28)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "object");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v30);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          }
          while (v27);
        }

        logForCSLogCategoryDefault();
        v31 = objc_claimAutoreleasedReturnValue();
        v11 = v38;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          -[CSSearchQuery queryContext](self, "queryContext");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "queryID");
          v34 = objc_msgSend(v38, "count");
          v35 = -[NSObject count](v14, "count");
          *(_DWORD *)buf = 134218496;
          v45 = v33;
          v46 = 2048;
          v47 = v34;
          v48 = 2048;
          v49 = v35;
          _os_log_impl(&dword_18C42F000, v31, OS_LOG_TYPE_INFO, "[MegadomeSearch]: qid: %lu, Processed suggestions: %lu, Author suggestions: %lu", buf, 0x20u);

        }
      }
    }
    else
    {
      logForCSLogCategoryQuery();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        -[CSSearchQuery queryContext](self, "queryContext");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218496;
        v45 = objc_msgSend(v37, "queryID");
        v46 = 2048;
        v47 = objc_msgSend(v10, "count");
        v48 = 2048;
        v49 = objc_msgSend(v9, "count");
        _os_log_fault_impl(&dword_18C42F000, v14, OS_LOG_TYPE_FAULT, "[MegadomeSearch]: qid: %lu, fromSuggestions.count %lu != resultsFromMultiQuery.count %lu", buf, 0x20u);

      }
      v12 = 0;
    }

  }
  return v12;
}

- (void)filterMegadomePeopleSuggestions:(id)a3 isShortQuery:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  _CSMultiQuery *megadomeCountingQuerySearchFrom;
  void *v51;
  void *v52;
  void *v53;
  CSSearchQuery *v54;
  void *v55;
  BOOL v56;
  id obj;
  _BOOL4 v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t *v66;
  _BYTE *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _BYTE buf[24];
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[128];
  uint64_t v83;

  v58 = a4;
  v83 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  v52 = v7;
  if (-[CSSearchQuery isCancelled](self, "isCancelled"))
  {
    v8[2](v8, 0);
    goto LABEL_33;
  }
  if (!objc_msgSend(v7, "count"))
  {
    ((void (**)(id, id))v8)[2](v8, v7);
    goto LABEL_33;
  }
  v54 = self;
  v51 = v8;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__9;
  v76 = __Block_byref_object_dispose__9;
  v77 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
  v77 = (id)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v71 = 0u;
  v69 = 0u;
  v70 = 0u;
  v68 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (!v9)
    goto LABEL_25;
  v59 = *(_QWORD *)v69;
  do
  {
    v60 = v9;
    for (i = 0; i != v60; ++i)
    {
      if (*(_QWORD *)v69 != v59)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
      objc_msgSend(v11, "currentToken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (!v13)
      {
        if (v58)
        {
          objc_msgSend(v11, "currentToken");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "isMailingList") & 1) != 0)
          {
            objc_msgSend(v11, "currentToken");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isMegadomeToken");

            if (v16)
            {
              v17 = (void *)v73[5];
LABEL_20:
              objc_msgSend(v17, "addObject:", v11);
              continue;
            }
          }
          else
          {

          }
        }
        objc_msgSend(v11, "currentToken");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "itemSummary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v11, "currentToken");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "itemSummary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "emailAddresses");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v11, "currentToken");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "itemSummary");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "emailAddresses");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v25, "count") == 0;

            if (v56)
              continue;
            v26 = -[CSSearchQueryContext currentTokenScope](v54->_queryContext, "currentTokenScope");
            v17 = v55;
            if (v26 != 1)
            {
              objc_msgSend(v11, "currentToken");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "itemSummary");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "emailAddresses");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "addObject:", v29);

              v17 = v55;
            }
            goto LABEL_20;
          }

        }
      }
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  }
  while (v9);
LABEL_25:

  -[CSSearchQuery queryContext](v54, "queryContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSUserQuery generateFilterQueriesBasedOnPreviousSuggestions:](CSUserQuery, "generateFilterQueriesBasedOnPreviousSuggestions:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryDefault();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    -[CSSearchQuery queryContext](v54, "queryContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "queryID");
    v35 = objc_msgSend(obj, "count");
    v36 = objc_msgSend((id)v73[5], "count");
    v37 = objc_msgSend(v53, "count");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2048;
    v79 = v36;
    v80 = 2048;
    v81 = v37;
    _os_log_impl(&dword_18C42F000, v32, OS_LOG_TYPE_INFO, "[MegadomeSearch]: qid: %lu, Total entries: %lu, Cached suggestions: %lu, Fresh entries: %lu", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v79) = 0;
  -[CSSearchQuery queryContext](v54, "queryContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "suggestion");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    -[CSSearchQuery queryContext](v54, "queryContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "suggestion");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "previousSuggestionTokens");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count") != 0;

  }
  else
  {
    v43 = 0;
  }

  LOBYTE(v79) = v43;
  v44 = (void *)objc_msgSend(v53, "copy");
  -[CSSearchQuery queryContext](v54, "queryContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke;
  v61[3] = &unk_1E2401408;
  v61[4] = v54;
  v62 = obj;
  v47 = v55;
  v63 = v47;
  v66 = &v72;
  v65 = v51;
  v48 = v31;
  v64 = v48;
  v67 = buf;
  +[_CSMultiQuery countingQueryForEmailsArrays:scope:context:contextualFilterQueries:includeSecondaryRecipients:completionHandler:](_CSMultiQuery, "countingQueryForEmailsArrays:scope:context:contextualFilterQueries:includeSecondaryRecipients:completionHandler:", v44, 1, v45, v48, v46, v61);
  v49 = objc_claimAutoreleasedReturnValue();
  megadomeCountingQuerySearchFrom = v54->_megadomeCountingQuerySearchFrom;
  v54->_megadomeCountingQuerySearchFrom = (_CSMultiQuery *)v49;

  -[_CSMultiQuery start](v54->_megadomeCountingQuerySearchFrom, "start");
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v72, 8);
  v8 = (void (**)(id, _QWORD))v51;
LABEL_33:

}

void __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v4, "processFromMegadomePeopleSuggestions:resultsFromMultiQuery:fromSuggestions:processedSuggestions:", v5, v3, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_18:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "count"))
  {
    v38 = v3;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v13), "currentToken");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "itemSummary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "emailAddresses");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(a1 + 32), "queryContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[2] = __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_897;
    v39[3] = &unk_1E24013E0;
    v19 = *(void **)(a1 + 40);
    v39[4] = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 56);
    v39[1] = 3221225472;
    v40 = v19;
    v41 = v9;
    v37 = *(_OWORD *)(a1 + 64);
    v21 = (id)v37;
    v42 = v37;
    +[_CSMultiQuery countingQueryForEmailsArrays:scope:context:contextualFilterQueries:includeSecondaryRecipients:completionHandler:](_CSMultiQuery, "countingQueryForEmailsArrays:scope:context:contextualFilterQueries:includeSecondaryRecipients:completionHandler:", v8, 2, v17, v20, v18, v39);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 104);
    *(_QWORD *)(v23 + 104) = v22;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "start");
    v3 = v38;
    goto LABEL_19;
  }
  v25 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count");
  logForCSLogCategoryDefault();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
  if (!v25)
  {
    if (v27)
      __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_cold_1(v26, v28, v29, v30, v31, v32, v33, v34);

    goto LABEL_18;
  }
  if (v27)
    __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_cold_2(v26, v28, v29, v30, v31, v32, v33, v34);

  v35 = *(_QWORD *)(a1 + 64);
  v36 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "copy");
  (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v36);

LABEL_19:
}

void __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_897(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = (void *)a1[6];
  v6 = a2;
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "processToMegadomePeopleSuggestions:resultsToMultiQuery:toSuggestions:processedSuggestions:", v4, v6, v7, *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v11, "count");
  v9 = a1[7];
  if (v8)
  {
    v10 = (void *)objc_msgSend(v11, "copy");
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  }

}

- (void)filterZKWPeopleSuggestions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *queryString;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id location;

  v6 = a3;
  v7 = a4;
  if (!self->_cancelled)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      location = 0;
      objc_initWeak(&location, self);
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__9;
      v27 = __Block_byref_object_dispose__9;
      v28 = 0;
      queryString = self->_queryString;
      -[CSSearchQuery queryContext](self, "queryContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke;
      v17 = &unk_1E2404A88;
      objc_copyWeak(&v22, &location);
      v18 = v6;
      v21 = &v23;
      v20 = v7;
      v11 = v8;
      v19 = v11;
      +[_CSMultiQuery countingQueryWithPeopleSuggestions:filterQuery:context:completionHandler:](_CSMultiQuery, "countingQueryWithPeopleSuggestions:filterQuery:context:completionHandler:", v18, queryString, v10, &v14);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v24[5];
      v24[5] = v12;

      -[CSSearchQuery addSuggestionCountQuery:](self, "addSuggestionCountQuery:", v24[5], v14, v15, v16, v17);
      objc_msgSend((id)v24[5], "start");
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      _Block_object_dispose(&v23, 8);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

    }
    else
    {
      (*((void (**)(id, id))v7 + 2))(v7, v6);
    }
  }

}

void __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = (id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v7 == objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(*v5, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          objc_msgSend(*v5, "objectAtIndexedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v11);

        }
        ++v8;
      }
      while (v8 < objc_msgSend(*v5, "count"));
    }
  }
  else
  {
    logForCSLogCategoryQuery();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke_cold_1((id *)(a1 + 32));

  }
  objc_msgSend(WeakRetained, "removeSuggestionCountQuery:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)populateSuggestionCount:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD);
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!self->_cancelled)
  {
    if (objc_msgSend(v6, "count")
      && _os_feature_enabled_impl()
      && (-[CSSearchQuery queryContext](self, "queryContext"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "enableResultCountsPerSuggestion"),
          v8,
          (v9 & 1) != 0))
    {
      location = 0;
      objc_initWeak(&location, self);
      v18 = 0;
      v19 = &v18;
      v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__9;
      v22 = __Block_byref_object_dispose__9;
      v23 = 0;
      -[CSSearchQuery queryContext](self, "queryContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__CSSearchQuery_populateSuggestionCount_completionHandler___block_invoke;
      v13[3] = &unk_1E2404AB0;
      objc_copyWeak(&v17, &location);
      v14 = v6;
      v15 = v7;
      v16 = &v18;
      +[_CSMultiQuery countingQueryWithSuggestions:context:completionHandler:](_CSMultiQuery, "countingQueryWithSuggestions:context:completionHandler:", v14, v10, v13);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v19[5];
      v19[5] = v11;

      -[CSSearchQuery addSuggestionCountQuery:](self, "addSuggestionCountQuery:", v19[5]);
      objc_msgSend((id)v19[5], "start");
      _Block_object_dispose(&v18, 8);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      v7[2](v7);
    }
  }

}

void __59__CSSearchQuery_populateSuggestionCount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (id *)(a1 + 32);
  v6 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v6 == objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(*v5, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");
        objc_msgSend(*v5, "objectAtIndexedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setResultCount:", v9);

        ++v7;
      }
      while (v7 < objc_msgSend(*v5, "count"));
    }
  }
  else
  {
    logForCSLogCategoryQuery();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke_cold_1((id *)(a1 + 32));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(WeakRetained, "removeSuggestionCountQuery:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)processInstantAnswer:(id)a3
{
  id v4;
  int64_t v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
    logForCSLogCategoryQuery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = v5;
      v9 = 2048;
      v10 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_DEFAULT, "qid=%ld - Found: %ld instant answers", (uint8_t *)&v7, 0x16u);
    }

    -[CSSearchQuery handleFoundInstantAnswers:](self, "handleFoundInstantAnswers:", v4);
  }

}

- (void)processSuggestions:(id)a3
{
  id v4;
  int64_t v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[CSSearchQueryContext queryID](self->_queryContext, "queryID");
    logForCSLogCategoryQuery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = v5;
      v9 = 2048;
      v10 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_DEFAULT, "qid=%ld - Found: %ld suggestions", (uint8_t *)&v7, 0x16u);
    }

    -[CSSearchQuery handleFoundSuggestions:](self, "handleFoundSuggestions:", v4);
  }

}

- (void)processResultItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *i;
  void *v29;
  void *v30;
  int v31;
  CSSuggestion *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  CSSuggestion *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void *v71;
  void *v72;
  int v73;
  NSObject *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _BOOL8 v101;
  NSObject *v102;
  dispatch_time_t v103;
  NSObject *v104;
  NSObject *v105;
  _CSMultiQuery *megadomeCountingQuerySearchFrom;
  _CSMultiQuery *megadomeCountingQuerySearchTo;
  void *v108;
  uint64_t v109;
  void *v110;
  int v111;
  uint64_t v112;
  void *v113;
  int v114;
  NSObject *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t j;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  NSObject *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  BOOL v139;
  NSObject *v140;
  NSObject *v141;
  CSSearchQuery *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  id v146;
  void *v147;
  void *v148;
  id v149;
  id v150;
  void *v151;
  id v152;
  unsigned int v153;
  id v154;
  void *v155;
  void *v156;
  id obj;
  void *v158;
  void *v159;
  uint64_t v160;
  id v161;
  id v162;
  CSSearchQuery *v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  _QWORD v168[5];
  _QWORD v169[5];
  NSObject *v170;
  _BYTE *v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  uint8_t v176[128];
  _BYTE buf[24];
  uint64_t (*v178)(uint64_t, uint64_t);
  void (*v179)(uint64_t);
  id v180;
  uint8_t v181[128];
  _BYTE v182[24];
  uint64_t (*v183)(uint64_t, uint64_t);
  void (*v184)(uint64_t);
  id v185;
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v163 = self;
  -[CSSearchQuery queryContext](self, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "generateSuggestions") & 1) != 0)
  {
    v6 = objc_msgSend(v4, "count");

    if (!v6)
      goto LABEL_118;
  }
  else
  {
    -[CSSearchQuery queryContext](v163, "queryContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "enableInstantAnswers") & 1) == 0)
    {

      goto LABEL_118;
    }
    v8 = objc_msgSend(v4, "count");

    if (!v8)
      goto LABEL_118;
  }
  v154 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v146 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v152 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v149 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CSSearchQuery queryContext](v163, "queryContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  -[CSSearchQuery queryContext](v163, "queryContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "additionalBundleIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v14, "count") + v12);

  -[CSSearchQuery queryContext](v163, "queryContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    -[CSSearchQuery queryContext](v163, "queryContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "addObjectsFromArray:", v19);

  }
  -[CSSearchQuery queryContext](v163, "queryContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "additionalBundleIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    -[CSSearchQuery queryContext](v163, "queryContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "additionalBundleIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "addObjectsFromArray:", v24);

  }
  -[CSSearchQuery queryContext](v163, "queryContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "clientBundleID");
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  v153 = 0;
  if (_os_feature_enabled_impl() && v158)
  {
    if ((objc_msgSend(v158, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
      || (objc_msgSend(v158, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0)
    {
      v153 = 1;
    }
    else if ((objc_msgSend(v158, "isEqualToString:", CFSTR("com.apple.corespotlight.InternalTestsHost")) & 1) != 0
           || objc_msgSend(v158, "hasPrefix:", CFSTR("com.apple.SpotlightUITests")))
    {
      v153 = objc_msgSend(v155, "containsObject:", CFSTR("com.apple.omniSearch"));
    }
    else
    {
      v153 = 0;
    }
  }
  *(_QWORD *)v182 = 0;
  *(_QWORD *)&v182[8] = v182;
  *(_QWORD *)&v182[16] = 0x3032000000;
  v183 = __Block_byref_object_copy__9;
  v184 = __Block_byref_object_dispose__9;
  v185 = 0;
  v185 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  v175 = 0u;
  obj = v4;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v181, 16);
  if (v26)
  {
    v27 = v154;
    if (!v153)
      v27 = v146;
    v151 = v27;
    v160 = *(_QWORD *)v173;
    do
    {
      v161 = (id)v26;
      for (i = 0; i != v161; i = (char *)i + 1)
      {
        if (*(_QWORD *)v173 != v160)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v29, "bundleID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.spotlight.contacts"));

        if (!v31)
        {
          objc_msgSend(v29, "bundleID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.spotlight.events"));

          if (!v34)
          {
            objc_msgSend(v154, "addObject:", v29);
            continue;
          }
          objc_msgSend(v29, "domainIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            objc_msgSend(v29, "domainIdentifier");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v155, "containsObject:", v156))
            {

LABEL_62:
              objc_msgSend(v29, "attributeSet");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "eventType");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("flight"));

              if (v54)
              {
                logForCSLogCategoryDefault();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v29, "attributeSet");
                  v148 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v148, "flightCarrierCode");
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  CSRedactString(v147, 1);
                  v150 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributeSet");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "flightNumber");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  CSRedactString(v57, 1);
                  v58 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributeSet");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "flightDepartureDateTime");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "description");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  CSRedactString(v61, 1);
                  v62 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v150;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v58;
                  *(_WORD *)&buf[22] = 2112;
                  v178 = v62;
                  _os_log_impl(&dword_18C42F000, v55, OS_LOG_TYPE_INFO, "[instant answers][retrival]: Found flight event with number: %@%@ and departureTime: %@", buf, 0x20u);

                }
                logForCSLogCategoryDefault();
                v63 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v29, "attributeSet");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "flightCarrierCode");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributeSet");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "flightNumber");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributeSet");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "flightDepartureDateTime");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "description");
                  v70 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v65;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v67;
                  *(_WORD *)&buf[22] = 2112;
                  v178 = v70;
                  _os_log_debug_impl(&dword_18C42F000, v63, OS_LOG_TYPE_DEBUG, "[debug][instant answers][retrival]: Found flight event with number: %@%@ and departureTime: %@", buf, 0x20u);

                }
              }
              else
              {
                objc_msgSend(v29, "attributeSet");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "eventType");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = objc_msgSend(v72, "isEqualToString:", CFSTR("hotel"));

                if (v73)
                {
                  logForCSLogCategoryDefault();
                  v74 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v29, "attributeSet");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "hotelReservationId");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    CSRedactString(v76, 1);
                    v77 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "attributeSet");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "startDate");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v77;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v79;
                    _os_log_impl(&dword_18C42F000, v74, OS_LOG_TYPE_INFO, "[instant answers][retrival]: Found hotel event with reservationId: %@, startDate: %@", buf, 0x16u);

                  }
                  logForCSLogCategoryDefault();
                  v63 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v29, "attributeSet");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "hotelReservationId");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "attributeSet");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "startDate");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v81;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v83;
                    _os_log_debug_impl(&dword_18C42F000, v63, OS_LOG_TYPE_DEBUG, "[debug][instant answers][retrival]: Found hotel event with reservationId: %@, startDate: %@", buf, 0x16u);

                  }
                }
                else
                {
                  objc_msgSend(v29, "attributeSet");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "eventType");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = objc_msgSend(v85, "isEqualToString:", CFSTR("restaurant"));

                  if (v86)
                  {
                    logForCSLogCategoryDefault();
                    v87 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v29, "attributeSet");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v88, "restaurantReservationId");
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      CSRedactString(v89, 1);
                      v90 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "attributeSet");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v91, "startDate");
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v90;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v92;
                      _os_log_impl(&dword_18C42F000, v87, OS_LOG_TYPE_INFO, "[instant answers][retrival]: Found restaurant event with reservationId: %@, startDate: %@", buf, 0x16u);

                    }
                    logForCSLogCategoryDefault();
                    v63 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v29, "attributeSet");
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v93, "restaurantReservationId");
                      v94 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "attributeSet");
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v95, "startDate");
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v94;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v96;
                      _os_log_debug_impl(&dword_18C42F000, v63, OS_LOG_TYPE_DEBUG, "[debug][instant answers][retrival]: Found restaurant event with reservationId: %@, startDate: %@", buf, 0x16u);

                    }
                  }
                  else
                  {
                    logForCSLogCategoryDefault();
                    v63 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v29, "attributeSet");
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v97, "eventType");
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v98;
                      _os_log_impl(&dword_18C42F000, v63, OS_LOG_TYPE_INFO, "[instant answers][retrival]: Found unknown event of type %@", buf, 0xCu);

                    }
                  }
                }
              }

              objc_msgSend(v151, "addObject:", v29);
              continue;
            }
            if (!v158)
            {

              if ((v153 & 1) == 0)
                continue;
              goto LABEL_62;
            }
LABEL_53:
            objc_msgSend(v29, "uniqueIdentifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "hasSuffix:", v158);

            v49 = v51 | v153;
            if (v35)
            {

              if ((v49 & 1) == 0)
                continue;
              goto LABEL_62;
            }
          }
          else
          {
            v49 = v153;
            if (v158)
              goto LABEL_53;
          }

          if (!v49)
            continue;
          goto LABEL_62;
        }
        objc_msgSend(v29, "domainIdentifier");
        v32 = (CSSuggestion *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          objc_msgSend(v29, "domainIdentifier");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v155, "containsObject:", v159) & 1) != 0)
            goto LABEL_40;
          if (!v158)
          {

            goto LABEL_47;
          }
        }
        else if (!v158)
        {
          continue;
        }
        objc_msgSend(v29, "uniqueIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v36, "hasSuffix:", v158) & 1) != 0)
        {

          if (v32)
LABEL_40:

LABEL_42:
          v37 = [CSSuggestion alloc];
          -[CSSearchQuery queryContext](v163, "queryContext");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "userQuery");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSearchQuery queryContext](v163, "queryContext");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "suggestion");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[CSSuggestion initWithUserString:currentSuggestion:itemResult:](v37, "initWithUserString:currentSuggestion:itemResult:", v39, v41, v29);

          if (v32)
          {
            -[CSSearchQuery queryContext](v163, "queryContext");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSSuggestion setEnableFragments:](v32, "setEnableFragments:", objc_msgSend(v42, "enableSuggestionTokens"));

            objc_msgSend(v29, "domainIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v43
              || (objc_msgSend(v29, "domainIdentifier"),
                  v44 = (void *)objc_claimAutoreleasedReturnValue(),
                  v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("com.apple.mobilemail")),
                  v44,
                  v43,
                  v46 = v149,
                  (v45 & 1) == 0))
            {
              v46 = *(void **)(*(_QWORD *)&v182[8] + 40);
            }
            objc_msgSend(v46, "addObject:", v32);
          }
LABEL_47:

          continue;
        }
        objc_msgSend(v29, "uniqueIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "hasPrefix:", v158);

        if (v32)
        {

        }
        else
        {

        }
        if ((v48 & 1) != 0)
          goto LABEL_42;
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v181, 16);
    }
    while (v26);
  }

  if (_os_feature_enabled_impl() && objc_msgSend(v149, "count"))
  {
    -[CSSearchQuery queryContext](v163, "queryContext");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "userQuery");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = (unint64_t)objc_msgSend(v100, "length") < 5;

    v102 = dispatch_semaphore_create(0);
    v103 = dispatch_time(0, 400000000);
    v169[0] = MEMORY[0x1E0C809B0];
    v169[1] = 3221225472;
    v169[2] = __36__CSSearchQuery_processResultItems___block_invoke;
    v169[3] = &unk_1E2404AD8;
    v169[4] = v163;
    v171 = v182;
    v104 = v102;
    v170 = v104;
    -[CSSearchQuery filterMegadomePeopleSuggestions:isShortQuery:completionHandler:](v163, "filterMegadomePeopleSuggestions:isShortQuery:completionHandler:", v149, v101, v169);
    if (dispatch_semaphore_wait(v104, v103))
    {
      logForCSLogCategoryDefault();
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C42F000, v105, OS_LOG_TYPE_INFO, "[MegadomeSearch]: Timed out waiting for results at query completion", buf, 2u);
      }

    }
    megadomeCountingQuerySearchFrom = v163->_megadomeCountingQuerySearchFrom;
    if (megadomeCountingQuerySearchFrom)
      -[_CSMultiQuery cancel](megadomeCountingQuerySearchFrom, "cancel");
    megadomeCountingQuerySearchTo = v163->_megadomeCountingQuerySearchTo;
    if (megadomeCountingQuerySearchTo)
      -[_CSMultiQuery cancel](megadomeCountingQuerySearchTo, "cancel");

  }
  -[CSSearchQuery queryContext](v163, "queryContext");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v108, "generateSuggestions"))
  {
    v109 = objc_msgSend(v154, "count");
    LOBYTE(v109) = v109 == objc_msgSend(obj, "count");

    if ((v109 & 1) == 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v178 = __Block_byref_object_copy__9;
      v179 = __Block_byref_object_dispose__9;
      v180 = 0;
      v180 = *(id *)(*(_QWORD *)&v182[8] + 40);
      -[CSSearchQuery queryContext](v163, "queryContext");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v110, "pommesZKW");

      if (v111)
      {
        v112 = *(_QWORD *)(*(_QWORD *)&v182[8] + 40);
        v168[0] = MEMORY[0x1E0C809B0];
        v168[1] = 3221225472;
        v168[2] = __36__CSSearchQuery_processResultItems___block_invoke_915;
        v168[3] = &unk_1E2400648;
        v168[4] = buf;
        -[CSSearchQuery filterZKWPeopleSuggestions:completionHandler:](v163, "filterZKWPeopleSuggestions:completionHandler:", v112, v168);
      }
      -[CSSearchQuery processSuggestions:](v163, "processSuggestions:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {

  }
  -[CSSearchQuery queryContext](v163, "queryContext");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "enableInstantAnswers");

  if (v114)
  {
    logForCSLogCategoryDefault();
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
    {
      v116 = objc_msgSend(v146, "count");
      -[CSSearchQuery queryContext](v163, "queryContext");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "userQuery");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      CSRedactString(v118, 1);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v116;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v119;
      _os_log_impl(&dword_18C42F000, v115, OS_LOG_TYPE_INFO, "[instant answers][retrival]: foundEvents count = %lu for userQuery = %@", buf, 0x16u);

    }
    logForCSLogCategoryDefault();
    v120 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
    {
      v143 = objc_msgSend(v146, "count");
      -[CSSearchQuery queryContext](v163, "queryContext");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "userQuery");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v143;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v145;
      _os_log_debug_impl(&dword_18C42F000, v120, OS_LOG_TYPE_DEBUG, "[debug][instant answers][retrival]: foundEvents count = %lu for userQuery = %@", buf, 0x16u);

    }
    if (objc_msgSend(v146, "count"))
    {
      -[CSSearchQuery queryContext](v163, "queryContext");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "instantAnswersOverrideDate");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSInstantAnswers selectInstantAnswersEventsWithFoundEvents:forDate:isSearchToolQuery:](CSInstantAnswers, "selectInstantAnswersEventsWithFoundEvents:forDate:isSearchToolQuery:", v146, v122, v153);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      v166 = 0u;
      v167 = 0u;
      v164 = 0u;
      v165 = 0u;
      v162 = v123;
      v124 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v164, v176, 16);
      if (v124)
      {
        v125 = *(_QWORD *)v165;
        do
        {
          for (j = 0; j != v124; ++j)
          {
            if (*(_QWORD *)v165 != v125)
              objc_enumerationMutation(v162);
            v127 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * j);
            -[CSSearchQuery queryContext](v163, "queryContext");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "userQuery");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSSearchQuery queryContext](v163, "queryContext");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "suggestion");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSSearchQueryContext answerAttributes](v163->_queryContext, "answerAttributes");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            +[CSSuggestion instantAnswerWithUserString:currentSuggestion:itemResult:answerAttributes:](CSSuggestion, "instantAnswerWithUserString:currentSuggestion:itemResult:answerAttributes:", v129, v131, v127, v132);
            v133 = (void *)objc_claimAutoreleasedReturnValue();

            logForCSLogCategoryQuery();
            v134 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v127, "attributeSet");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "eventType");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v136;
              _os_log_impl(&dword_18C42F000, v134, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected instant answer type %@", buf, 0xCu);

            }
            if (v133)
              objc_msgSend(v152, "addObject:", v133);

          }
          v124 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v164, v176, 16);
        }
        while (v124);
      }

      -[CSSearchQuery processInstantAnswer:](v163, "processInstantAnswer:", v152);
    }
  }

  _Block_object_dispose(v182, 8);
  v4 = v154;
LABEL_118:
  v137 = objc_msgSend(v4, "count");
  if (v137)
  {
    v138 = -[CSSearchQueryContext queryID](v163->_queryContext, "queryID");
    v139 = !v163->_cancelled;
    logForCSLogCategoryQuery();
    v140 = objc_claimAutoreleasedReturnValue();
    v141 = v140;
    if (v139)
    {
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v182 = 134218240;
        *(_QWORD *)&v182[4] = v138;
        *(_WORD *)&v182[12] = 2048;
        *(_QWORD *)&v182[14] = v137;
        _os_log_impl(&dword_18C42F000, v141, OS_LOG_TYPE_DEFAULT, "qid=%ld - Found: %ld items", v182, 0x16u);
      }

      v142 = v163;
      objc_sync_enter(v142);
      v142->_foundItemCount += v137;
      objc_sync_exit(v142);

      -[CSSearchQuery handleFoundItems:](v142, "handleFoundItems:", v4);
    }
    else
    {
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
        -[CSSearchQuery processResultItems:].cold.1();

    }
  }

}

void __36__CSSearchQuery_processResultItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  objc_sync_exit(v3);

}

void __36__CSSearchQuery_processResultItems___block_invoke_915(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)processResultsData:(id)a3 protectionClass:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id Trusted;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");

  Trusted = (id)_MDPlistBytesCreateTrusted();
  v9 = -[CSSearchQuery copyResultsFromPlist:protectionClass:](self, "copyResultsFromPlist:protectionClass:", Trusted, v7);

  -[CSSearchQuery processResultItems:](self, "processResultItems:", v9);
}

- (void)processCompletionsResultsData:(id)a3 protectionClass:(id)a4
{
  id v6;
  id v7;
  void *Trusted;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  CSSuggestion *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  NSObject *v53;
  void *v54;
  BOOL v55;
  NSObject *v56;
  void (**v57)(_QWORD, _QWORD);
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id obj;
  void *v67;
  CSSearchQuery *v68;
  CSSuggestion *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  _QWORD v74[5];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v60 = a4;
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "bytes");
  v59 = v7;
  objc_msgSend(v7, "length");
  Trusted = (void *)_MDPlistBytesCreateTrusted();
  v68 = self;
  v61 = Trusted;
  if (Trusted)
  {
    v9 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    v10 = 0;
    v63 = 0;
    v64 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = v9;
      if (objc_msgSend(v9, "count"))
      {
        v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[CSSearchQuery queryContext](self, "queryContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "generateSuggestions"))
          v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        else
          v64 = 0;

        -[CSSearchQuery queryContext](self, "queryContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "generateSuggestions"))
          v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        else
          v62 = 0;

        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        obj = v9;
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
        if (v72)
        {
          v70 = *(_QWORD *)v86;
          do
          {
            for (i = 0; i != v72; ++i)
            {
              if (*(_QWORD *)v86 != v70)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v14, "firstObject");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v63, "addObject:", v15);
                  objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v14, "count") - 2);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v71)
                  {
                    -[CSSearchQuery completionScoresHandler](v68, "completionScoresHandler");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = v16 == 0;

                    if (!v17)
                    {
                      -[CSSearchQuery completionScoresHandler](v68, "completionScoresHandler");
                      v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                      ((void (**)(_QWORD, void *, void *, void *))v18)[2](v18, v15, v71, v67);

                    }
                  }
                  if (v64)
                  {
                    v19 = [CSSuggestion alloc];
                    -[CSSearchQuery queryContext](v68, "queryContext");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "userQuery");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    -[CSSearchQuery queryContext](v68, "queryContext");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "suggestion");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v69 = -[CSSuggestion initWithUserString:currentSuggestion:displayString:attributeValues:attributeStrings:options:](v19, "initWithUserString:currentSuggestion:displayString:attributeValues:attributeStrings:options:", v21, v23, v15, v71, v67, MEMORY[0x1E0C9AA70]);

                    if (v69)
                    {
                      -[CSSearchQuery queryContext](v68, "queryContext");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      -[CSSuggestion setEnableFragments:](v69, "setEnableFragments:", objc_msgSend(v24, "enableSuggestionTokens"));

                      -[CSSuggestion currentToken](v69, "currentToken");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v25, "tokenKind") == 16;

                      if (v26)
                      {
                        -[CSSearchQuery queryContext](v68, "queryContext");
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v65, "suggestion");
                        v73 = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v73, "previousSuggestionTokens");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!objc_msgSend(v27, "count"))
                        {
LABEL_44:

                          goto LABEL_45;
                        }
                        -[CSSuggestion currentToken](v69, "currentToken");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v28, "itemSummary");
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "allEmailAddresses");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        v31 = objc_msgSend(v30, "count") == 0;

                        if (!v31)
                        {
                          v32 = (void *)MEMORY[0x1E0C99E60];
                          -[CSSuggestion currentToken](v69, "currentToken");
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v33, "itemSummary");
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v34, "allEmailAddresses");
                          v35 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v32, "setWithArray:", v35);
                          v65 = (void *)objc_claimAutoreleasedReturnValue();

                          v84 = 0u;
                          v82 = 0u;
                          v83 = 0u;
                          v81 = 0u;
                          -[CSSearchQuery queryContext](v68, "queryContext");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v36, "suggestion");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v37, "previousSuggestionTokens");
                          v73 = (id)objc_claimAutoreleasedReturnValue();

                          v38 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
                          if (v38)
                          {
                            v39 = *(_QWORD *)v82;
                            while (2)
                            {
                              for (j = 0; j != v38; ++j)
                              {
                                if (*(_QWORD *)v82 != v39)
                                  objc_enumerationMutation(v73);
                                v41 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
                                if (objc_msgSend(v41, "tokenKind") == 16)
                                {
                                  objc_msgSend(v41, "itemSummary");
                                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v42)
                                  {
                                    objc_msgSend(v41, "itemSummary");
                                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v43, "allEmailAddresses");
                                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                                    v45 = objc_msgSend(v44, "count") == 0;

                                    if (!v45)
                                    {
                                      v46 = (void *)MEMORY[0x1E0C99E60];
                                      objc_msgSend(v41, "itemSummary");
                                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v47, "allEmailAddresses");
                                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v46, "setWithArray:", v48);
                                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                                      LODWORD(v46) = objc_msgSend(v65, "intersectsSet:", v49);

                                      if ((_DWORD)v46)
                                      {
                                        if (!objc_msgSend(v41, "selectedScope"))
                                        {
                                          -[CSSuggestion currentToken](v69, "currentToken");
                                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v27, "setSelectedScope:", 1);
                                          goto LABEL_44;
                                        }
                                        if (objc_msgSend(v41, "selectedScope") == 1)
                                        {
                                          -[CSSuggestion currentToken](v69, "currentToken");
                                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v27, "setSelectedScope:", 0);
                                          goto LABEL_44;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                              v38 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
                              if (v38)
                                continue;
                              break;
                            }
                          }
LABEL_45:

                        }
                        objc_msgSend(v62, "addObject:", v69);
                      }
                      else
                      {
                        objc_msgSend(v64, "addObject:", v69);
                      }
                    }

                  }
                }

                continue;
              }
            }
            v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
          }
          while (v72);
        }

        v75 = 0;
        v76 = &v75;
        v77 = 0x3032000000;
        v78 = __Block_byref_object_copy__9;
        v79 = __Block_byref_object_dispose__9;
        v80 = 0;
        v10 = v62;
        v80 = v10;
        -[CSSearchQuery queryContext](v68, "queryContext");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "pommesZKW");

        if (v51)
        {
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __63__CSSearchQuery_processCompletionsResultsData_protectionClass___block_invoke;
          v74[3] = &unk_1E2400648;
          v74[4] = &v75;
          -[CSSearchQuery filterZKWPeopleSuggestions:completionHandler:](v68, "filterZKWPeopleSuggestions:completionHandler:", v10, v74);
        }
        -[CSSearchQuery processSuggestions:](v68, "processSuggestions:", v76[5]);
        _Block_object_dispose(&v75, 8);

      }
      else
      {
        v10 = 0;
        v63 = 0;
        v64 = 0;
      }
      v9 = v58;
    }

    Trusted = v63;
  }
  else
  {
    v10 = 0;
    v64 = 0;
  }
  v52 = Trusted;
  if (objc_msgSend(Trusted, "count") || objc_msgSend(v64, "count"))
  {
    -[CSSearchQueryContext queryID](v68->_queryContext, "queryID");
    if (v68->_cancelled)
    {
      logForCSLogCategoryQuery();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        -[CSSearchQuery processResultItems:].cold.1();

    }
    else
    {
      -[CSSearchQuery completionsHandler](v68, "completionsHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        v55 = objc_msgSend(v52, "count") == 0;

        if (!v55)
        {
          logForCSLogCategoryQuery();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            -[CSSearchQuery processCompletionsResultsData:protectionClass:].cold.1();

          -[CSSearchQuery completionsHandler](v68, "completionsHandler");
          v57 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v57)[2](v57, v52);

        }
      }
      if (objc_msgSend(v64, "count"))
        -[CSSearchQuery handleFoundCompletions:](v68, "handleFoundCompletions:", v64);
    }
  }

}

void __63__CSSearchQuery_processCompletionsResultsData_protectionClass___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)didFinishWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CSSearchQuery_didFinishWithError___block_invoke;
  v7[3] = &unk_1E24013B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __36__CSSearchQuery_didFinishWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 40));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setQueryContext:(id)a3
{
  objc_storeStrong((id *)&self->_queryContext, a3);
}

- (NSMapTable)liveIndexBundleIDToIndexItemIDMap
{
  return self->_liveIndexBundleIDToIndexItemIDMap;
}

- (void)setLiveIndexBundleIDToIndexItemIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_liveIndexBundleIDToIndexItemIDMap, a3);
}

- (NSMapTable)liveIndexBundleIDToBundleString
{
  return self->_liveIndexBundleIDToBundleString;
}

- (void)setLiveIndexBundleIDToBundleString:(id)a3
{
  objc_storeStrong((id *)&self->_liveIndexBundleIDToBundleString, a3);
}

- (NSMapTable)liveIndexUserFSOIDTOIdentifierMap
{
  return self->_liveIndexUserFSOIDTOIdentifierMap;
}

- (void)setLiveIndexUserFSOIDTOIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_liveIndexUserFSOIDTOIdentifierMap, a3);
}

- (id)priorityGatherEndedHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setPriorityGatherEndedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (id)changedItemsHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (id)removedItemsHandler
{
  return objc_getProperty(self, a2, 208, 1);
}

- (id)foundAttributesHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setFoundAttributesHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (id)changedAttributesHandler
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setChangedAttributesHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (id)photosComputedAttributesHandler
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setPhotosComputedAttributesHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (id)countChangedHandler
{
  return objc_getProperty(self, a2, 240, 1);
}

- (void)setCountChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (id)resolvedAttributeNamesHandler
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setResolvedAttributeNamesHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (id)completionsHandler
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setCompletionsHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (id)completionScoresHandler
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void)setCompletionScoresHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (void)setFoundItemHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (id)interruptedHandler
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setInterruptedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (id)restartedHandler
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setRestartedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 288);
}

- (id)restartGatherEndedHandler
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setRestartGatherEndedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (void)setPrivateIndex:(BOOL)a3
{
  self->_privateIndex = a3;
}

- (void)setUserFSIndex:(BOOL)a3
{
  self->_userFSIndex = a3;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (NSString)privateBundleID
{
  return self->_privateBundleID;
}

- (void)setPrivateBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_privateBundleID, a3);
}

- (void)updateQueryString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "updateWithQueryString:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateQueryContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "updateQueryContext:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithQueryString:queryContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "initWithQueryString:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_finishWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_8_0(&dword_18C42F000, v0, v1, "qid=%ld - Finished with error error:%@");
  OUTLINED_FUNCTION_1();
}

void __70__CSSearchQuery_didResolveFriendlyAttributeNames_fromFetchAttributes___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_22();
  v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v1, v2, "qid=%ld - Resolved attribute names: %@", v3);
  OUTLINED_FUNCTION_1();
}

void __62__CSSearchQuery_processAttributesData_update_protectionClass___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "qid=%ld - Dropping results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copyResultsFromPlist:protectionClass:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v1, (uint64_t)v1, "qid=%ld - Plists count %ld ", v2);
  OUTLINED_FUNCTION_1();
}

void __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_18C42F000, a1, a3, "[MegadomeSearch]: Autoscoping couldn't be computed for any suggestion", a5, a6, a7, a8, 0);
}

void __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_18C42F000, a1, a3, "[MegadomeSearch]: All suggestions are already processed or have [FROM] scopes", a5, a6, a7, a8, 0);
}

void __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_19(a1);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_7_3(&dword_18C42F000, v1, v2, "suggestions.count %lu != results.count %lu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6();
}

- (void)processResultItems:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "qid=%ld - Dropping results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processCompletionsResultsData:protectionClass:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v0, (uint64_t)v0, "qid=%ld - Got completions %@", v1);
  OUTLINED_FUNCTION_1();
}

void __64__CSSearchQuery_processLiveResultsData_oidData_protectionClass___block_invoke_cold_1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_21();
  v3 = v0;
  OUTLINED_FUNCTION_6_1(&dword_18C42F000, v1, (uint64_t)v1, "qid=%ld - Opcode 0x%x not handled", v2);
  OUTLINED_FUNCTION_1();
}

void __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_21();
  v3 = v0;
  OUTLINED_FUNCTION_6_1(&dword_18C42F000, v1, (uint64_t)v1, "qid=%ld - Unknown type :%d", v2);
  OUTLINED_FUNCTION_1();
}

void __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_20();
  v4 = 2048;
  v5 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v1, v2, "qid=%ld - Result oidData: %p", v3);
  OUTLINED_FUNCTION_1();
}

void __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_0(&dword_18C42F000, v0, v1, "qid=%ld - Dropping results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  qos_class_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  OUTLINED_FUNCTION_10_1();
  v16 = *MEMORY[0x1E0C80C00];
  v2 = qos_class_self();
  v3 = *(_QWORD *)(v1 + 72);
  v4 = *(unsigned __int8 *)(v1 + 88);
  v5 = *(unsigned __int8 *)(v1 + 89);
  v6 = *(unsigned __int8 *)(v1 + 90);
  v7[0] = 67110144;
  v7[1] = v2;
  v8 = 2048;
  v9 = v3;
  v10 = 1024;
  v11 = v4;
  v12 = 1024;
  v13 = v5;
  v14 = 1024;
  v15 = v6;
  _os_log_debug_impl(&dword_18C42F000, v0, OS_LOG_TYPE_DEBUG, "[QoS] %u qid=%ld didReturnResults inside method async call. attribute:%b counting:%b live:%b", (uint8_t *)v7, 0x24u);
}

@end
