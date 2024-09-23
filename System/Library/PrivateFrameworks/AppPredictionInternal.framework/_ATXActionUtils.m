@implementation _ATXActionUtils

+ (id)getBundleIdAndActionTypeFromActionKey:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR(":"), 2);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    || (v5 = v4,
        v6 = v4 + 1,
        objc_msgSend(v3, "rangeOfString:options:range:", CFSTR(":"), 2, v4 + 1, objc_msgSend(v3, "length") + ~v4) != 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0D81638]);
    objc_msgSend(v3, "substringToIndex:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFirst:second:", v8, v9);

  }
  return v10;
}

+ (id)getActivityTypeFromNSUAType:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("NSUA_"), 2);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("NSUA_"), "length") + v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (BOOL)isNSUAType:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("NSUA_"));
}

+ (id)getBundleIdFromActionKey:(id)a3
{
  void *v3;
  void *v4;

  +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:](_ATXActionUtils, "getBundleIdAndActionTypeFromActionKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)getActionTypeFromActionKey:(id)a3
{
  void *v3;
  void *v4;

  +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:](_ATXActionUtils, "getBundleIdAndActionTypeFromActionKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)getActionTypesFromActionKeys:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(a1, "getActionTypeFromActionKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(*(id *)(v11 + 1160), "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXActionUtils.m"), 74, CFSTR("No action type in action key: '%@'"), v13);

          v11 = 0x1E0CB3000;
        }
        objc_msgSend(v6, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v6;
}

+ (BOOL)isActionKey:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR(":"));
}

+ (id)getBundleIdsFromActionKeys:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(a1, "getBundleIdFromActionKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(*(id *)(v11 + 1160), "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXActionUtils.m"), 90, CFSTR("No bundleId in action key: '%@'"), v13);

          v11 = 0x1E0CB3000;
        }
        objc_msgSend(v6, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)limitParameterCombinations:(id)a3 limit:(int)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;

  v7 = a3;
  if (a4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXActionUtils.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit >= 0"));

  }
  if (objc_msgSend(v7, "count") > (unint64_t)a4)
  {
    objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_254);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subarrayWithRange:", 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");

    v7 = (id)v10;
  }
  return v7;
}

+ (id)slotSetsForAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  +[ATXIntentMetadataCache sharedInstance](ATXIntentMetadataCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "slotSetsForAction:intentCache:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)slotSetsForAction:(id)a3 intentCache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  id v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "actionType") || objc_msgSend(v5, "actionType") == 2)
  {
    objc_msgSend(v6, "validParameterCombinationsWithSchemaForIntent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predictableParameterCombinations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v64 = v6;
    v65 = v5;
    if (v10)
    {
      v61 = v8;
      v8 = (void *)objc_opt_new();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      objc_msgSend(v5, "predictableParameterCombinations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v73 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_msgSend(v16, "parameterKeys");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v18 = objc_alloc_init(MEMORY[0x1E0CBDA30]);
              objc_msgSend(v16, "parameterKeys");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v19);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
        }
        while (v13);
      }

    }
    else if (!v6 || !v8)
    {
      v23 = (void *)MEMORY[0x1E0CF8CE8];
      objc_msgSend(v5, "bundleId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "schemaWithoutFallbackForBundle:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x1E0CF8CE8];
      objc_msgSend(v5, "bundleId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isSystemAppForBundleId:", v27);

      if (v25)
      {
        objc_msgSend(v7, "_validParameterCombinationsWithSchema:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setValidParameterCombinationsWithSchema:intent:", v29, v7);
      }
      else
      {
        v29 = v8;
      }
      if (objc_msgSend(v29, "count"))
        v30 = 0;
      else
        v30 = v28;
      if (v30 != 1)
      {
        v59 = (void *)MEMORY[0x1E0C99E60];
        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E8]), "initWithOpaqueParameters");
        objc_msgSend(v59, "setWithObject:", v60);
        v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_52:
        goto LABEL_53;
      }
      objc_msgSend(v7, "_validParameterCombinations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "buckets");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
        {
          v62 = v25;
          v32 = (void *)objc_opt_new();
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __49___ATXActionUtils_slotSetsForAction_intentCache___block_invoke;
          v70[3] = &unk_1E82EBDB8;
          v33 = v32;
          v71 = v33;
          objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v70);
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("buckets"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            v36 = objc_msgSend(v31, "count");
            v37 = 4;
            if (v36 < 4)
              v37 = v36;
            if (v37)
            {
              v38 = 0;
              do
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", v34);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = (void *)MEMORY[0x1E0C99E60];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bucket_%i"), ++v38);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "setWithObject:", v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, v42);

                v43 = objc_msgSend(v31, "count");
                v44 = 4;
                if (v43 < 4)
                  v44 = v43;
              }
              while (v44 > v38);
            }
          }
          v45 = v33;

          v8 = v45;
          v25 = v62;
        }

      }
    }
    v46 = v8;
    __atxlog_handle_action_prediction();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      +[_ATXActionUtils slotSetsForAction:intentCache:].cold.1(v8, v47);

    v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v63 = v46;
    objc_msgSend(v46, "allKeys");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXActionUtils limitParameterCombinations:limit:](_ATXActionUtils, "limitParameterCombinations:limit:", v48, objc_msgSend(v49, "maximumParameterCombinations"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v51 = v50;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v53; ++j)
        {
          if (*(_QWORD *)v67 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_48;
          v57 = v7;
          if (!objc_msgSend(v56, "containsObject:", CFSTR("content"))
            || +[_ATXActionUtils shouldAcceptMessageContent:](_ATXActionUtils, "shouldAcceptMessageContent:", v57))
          {

LABEL_48:
            v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E8]), "initWithParameters:", v56);
            objc_msgSend(v22, "addObject:", v57);
          }

        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      }
      while (v53);
    }

    v6 = v64;
    v5 = v65;
    v29 = v63;
    goto LABEL_52;
  }
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E8]), "initWithOpaqueParameters");
  objc_msgSend(v20, "setWithObject:", v21);
  v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_53:
  return v22;
}

+ (id)filterContainersWithNilAction:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_47_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)fetchDataAndUpdateContentAttributeSetForAction:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  dispatch_semaphore_t v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "itemIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0CA6150];
      v23[0] = CFSTR("_kMDItemThumbnailDataPath");
      v23[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x1E0CB2AB0];
      objc_msgSend(v3, "bundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "itemIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __66___ATXActionUtils_fetchDataAndUpdateContentAttributeSetForAction___block_invoke;
      v19 = &unk_1E82E8F28;
      v20 = v3;
      v21 = v7;
      v15 = v7;
      objc_msgSend(v8, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v10, v11, v12, v14, &v16);

      objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v15, 5.0, v16, v17, v18, v19);
    }
  }

}

+ (id)actionKeyFilterForCandidateBundleIds:(id)a3 candidateActionTypes:(id)a4 blacklist:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87___ATXActionUtils_actionKeyFilterForCandidateBundleIds_candidateActionTypes_blacklist___block_invoke;
  aBlock[3] = &unk_1E82E8E50;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  v13 = _Block_copy(aBlock);

  return v13;
}

+ (void)prefillActionHistograms
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histogramForLaunchType:", 14);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histogramForLaunchType:", 17);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histogramForLaunchType:", 20);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histogramForLaunchType:", 16);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histogramForLaunchType:", 19);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v2;
  objc_msgSend(v2, "histogramForLaunchType:", 22);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -1209600.0);
  v4 = objc_claimAutoreleasedReturnValue();
  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "getAppLaunchesBetweenStartDate:endDate:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CF8EE0]);
  objc_msgSend(v6, "getIntentEventsBetweenStartDate:endDate:forSource:", v4, v3, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0CF9198]);
  v56 = (void *)v4;
  v57 = v3;
  objc_msgSend(v7, "getActivityIntentEventsBetweenStartDate:endDate:", v4, v3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_action_prediction();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v75 = objc_msgSend(v5, "count");
    v76 = 2048;
    v77 = objc_msgSend(v66, "count");
    v78 = 2048;
    v79 = objc_msgSend(v59, "count");
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Prefilling histograms with %lu app sessions, %lu intent events, %lu activity events", buf, 0x20u);
  }

  objc_msgSend(v65, "resetData");
  objc_msgSend(v64, "resetData");
  objc_msgSend(v63, "resetData");
  objc_msgSend(v62, "resetData");
  objc_msgSend(v61, "resetData");
  objc_msgSend(v60, "resetData");
  +[ATXActionFeedback sharedInstance](ATXActionFeedback, "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "resetData");
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v70 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v14, "bundleId");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v14, "startDate");
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
            goto LABEL_16;
          v19 = (void *)v18;
          objc_msgSend(v14, "endDate");
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
            goto LABEL_15;
          v21 = (void *)v20;
          objc_msgSend(v14, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "endDate");
          v68 = v19;
          v23 = v15;
          v24 = v11;
          v25 = v12;
          v26 = v9;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "timeIntervalSinceDate:", v27);
          v29 = v28;

          v9 = v26;
          v12 = v25;
          v11 = v24;
          v15 = v23;

          if (v29 < 0.0)
          {
            objc_msgSend(a1, "firstIntent:inAppLaunchSession:", v66, v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17
              || (objc_msgSend(a1, "firstIntent:inAppLaunchSession:", v59, v14),
                  (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              v30 = (void *)MEMORY[0x1E0CF8C20];
              objc_msgSend(v17, "bundleId");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "intentType");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "getActionKeyForBundleId:actionType:", v31, v32);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "dateInterval");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "startDate");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v35) = 1.0;
              objc_msgSend(v65, "addLaunchWithBundleId:date:timeZone:weight:", v19, v34, 0, v35);

              objc_msgSend(v17, "dateInterval");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "startDate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v38) = 1.0;
              objc_msgSend(v64, "addLaunchWithBundleId:date:timeZone:weight:", v19, v37, 0, v38);

              objc_msgSend(v17, "dateInterval");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "startDate");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v41) = 1.0;
              objc_msgSend(v63, "addLaunchWithBundleId:date:timeZone:weight:", v19, v40, 0, v41);

              objc_msgSend(v17, "bundleId");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "dateInterval");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "startDate");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v45) = 1.0;
              objc_msgSend(v62, "addLaunchWithBundleId:date:timeZone:weight:", v42, v44, 0, v45);

              objc_msgSend(v17, "bundleId");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "dateInterval");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "startDate");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v49) = 1.0;
              objc_msgSend(v61, "addLaunchWithBundleId:date:timeZone:weight:", v46, v48, 0, v49);

              objc_msgSend(v17, "bundleId");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "dateInterval");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "startDate");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v53) = 1.0;
              objc_msgSend(v60, "addLaunchWithBundleId:date:timeZone:weight:", v50, v52, 0, v53);

LABEL_15:
LABEL_16:

            }
          }
        }
        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v58, "persistentStore"))
  {
    flushHistogram(v65);
    flushHistogram(v64);
    flushHistogram(v63);
    flushHistogram(v62);
    flushHistogram(v61);
    flushHistogram(v60);
  }

}

+ (void)prefillActionSlotDatabase
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -1209600.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CF8EE0]);
  objc_msgSend(v4, "getIntentEventsBetweenStartDate:endDate:forSource:", v3, v2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0CF9198]);
  objc_msgSend(v6, "getActivityIntentEventsBetweenStartDate:endDate:", v3, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_action_prediction();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v35 = objc_msgSend(v5, "count");
    v36 = 2048;
    v37 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Prefilling slot database with %lu intent events, %lu activity events", buf, 0x16u);
  }

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllSlotsFromActionLog");
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appIntentMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v12);
        LODWORD(v14) = 1.0;
        objc_msgSend(v11, "updateActionPredictionSlotResolutionForIntentEvent:weight:prevLocationUUID:locationUUID:currentMotionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v17++), 0, 0, 4, 0, 0, v14, -1, -1);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v15);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v18);
        LODWORD(v20) = 1.0;
        objc_msgSend(v11, "updateActionPredictionSlotResolutionForIntentEvent:weight:prevLocationUUID:locationUUID:currentMotionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23++), 0, 0, 4, 0, 0, v20, -1, -1, (_QWORD)v24);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v21);
  }

}

+ (id)firstIntent:(id)a3 inAppLaunchSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  objc_msgSend(v6, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v29;
    v18 = -INFINITY;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v20, "startDate", (_QWORD)v28);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          if (v9 <= v23 && v23 <= v12)
          {
            v25 = v23;
            if (!v16 || v23 < v18)
            {
              v26 = v20;

              v16 = v26;
              v18 = v25;
            }
          }
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (void)resetActionPredictions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histogramForLaunchType:", 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetData");

  objc_msgSend(v2, "histogramForLaunchType:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetData");

  objc_msgSend(v2, "histogramForLaunchType:", 17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetData");

  objc_msgSend(v2, "histogramForLaunchType:", 19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetData");

  objc_msgSend(v2, "histogramForLaunchType:", 20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetData");

  objc_msgSend(v2, "histogramForLaunchType:", 22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetData");

  objc_msgSend(v2, "histogramForLaunchType:", 23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetData");

  objc_msgSend(v2, "histogramForLaunchType:", 25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetData");

  objc_msgSend(v2, "histogramForLaunchType:", 26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resetData");

  v36 = v2;
  objc_msgSend(v2, "histogramForLaunchType:", 28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resetData");

  +[_ATXAppLaunchHistogramManager resetDataForCategoricalHistograms](_ATXAppLaunchHistogramManager, "resetDataForCategoricalHistograms");
  +[ATXActionFeedback sharedInstance](ATXActionFeedback, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resetData");

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "resetAppIntentLocationData");

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allApps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v16;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v17)
  {
    v18 = v17;
    v38 = *(_QWORD *)v44;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v44 != v38)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1CAA48B6C]();
        +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:](_ATXActionUtils, "actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:", v23, 0, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "allKeysFilteredBy:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "deleteAllLaunchesForAppActions:", v27);

        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v28 = v25;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v40;
          do
          {
            v32 = 0;
            do
            {
              if (*(_QWORD *)v40 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v32);
              +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "remove:", v33);

              ++v32;
            }
            while (v30 != v32);
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v30);
        }

        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v19 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v18);
  }

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeAllSlotsFromActionLog");
  objc_msgSend(v35, "removeAllSlotsFromActionFeedback");
  objc_msgSend(v35, "removeAllSlotsFromSlotSetKey");

}

+ (id)_extractValueInKeyValueBlob:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = v5;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(",'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsString:", CFSTR("'=")))
        {
          objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("'="));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }
        if (objc_msgSend(v14, "count") == 2)
        {
          objc_msgSend(v14, "objectAtIndex:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if (v16)
          {
            objc_msgSend(v14, "objectAtIndex:", 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringByRemovingPercentEncoding");
            v18 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v18;
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)swapUserActivityString:(id)a3 withActionKey:(id)a4 withNewTitle:(id)a5 withNewDateString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("'"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("{}"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndex:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "substringFromIndex:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19 || !objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CF89E0]))
  {
    v21 = 0;
LABEL_7:
    v23 = v10;
    goto LABEL_8;
  }
  objc_msgSend(a1, "_extractValueInKeyValueBlob:withKey:", v19, *MEMORY[0x1E0CF89D8]);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (!v15 || !v20)
    goto LABEL_7;
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v15, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", v21, v13);
  v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v23;
}

+ (id)markTodayInTitleAndUserActivityString:(id)a3 withActionKey:(id)a4
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startOfDayForDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CF8C20];
  objc_msgSend(v5, "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userActivityString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v6;
  objc_msgSend(v12, "getDateFromUserActivityString:forActionKey:", v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startOfDayForDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || !v16)
    goto LABEL_12;
  v17 = v16;
  v18 = v10;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setDateFormat:", CFSTR("MMMM dd, yyyy"));
  objc_msgSend(v5, "action");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userActivity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByRemovingPercentEncoding");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateFromString:", v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v62 = (void *)v24;
  if (!v24)
  {
    v25 = v5;

    v10 = v18;
    v16 = v17;
    goto LABEL_13;
  }
  v61 = v19;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  v26 = v18;
  v16 = v17;
  objc_msgSend(v25, "components:fromDate:toDate:options:", 16, v26, v17, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "day");

  if (!v28)
  {
    v30 = CFSTR("$TODAY_FROM_REFERENCE_DATE$");
    v31 = CFSTR("$TODAY$");
    v29 = 0x1E0CF8000uLL;
    goto LABEL_9;
  }
  v29 = 0x1E0CF8000;
  if (v28 == 1)
  {
    v30 = CFSTR("$TOMORROW_FROM_REFERENCE_DATE$");
    v31 = CFSTR("$TOMORROW$");
LABEL_9:
    ATXLocalizationNotNeeded();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "userActivity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTitle:", v32);

    objc_msgSend(v5, "action");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "userActivityString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXActionUtils swapUserActivityString:withActionKey:withNewTitle:withNewDateString:](_ATXActionUtils, "swapUserActivityString:withActionKey:withNewTitle:withNewDateString:", v36, v63, v31, v30);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_alloc(*(Class *)(v29 + 3104));
    objc_msgSend(v5, "action");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "actionUUID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bundleId");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "itemIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "contentAttributeSet");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "heuristic");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "heuristicMetadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v51) = objc_msgSend(v43, "isFutureMedia");
    v55 = (void *)objc_msgSend(v37, "initWithNSUserActivityString:actionUUID:bundleId:itemIdentifier:contentAttributeSet:heuristic:heuristicMetadata:isFutureMedia:title:subtitle:", v60, v59, v53, v38, v39, v40, v42, v51, 0, 0);

    v44 = objc_alloc(MEMORY[0x1E0CF8ED8]);
    objc_msgSend(v5, "action");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bundleId");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intentType");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateInterval");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v44, "initWithBundleId:intentType:dateInterval:action:", v46, v47, v48, v55);

    v49 = 0;
    goto LABEL_11;
  }
  v49 = 1;
LABEL_11:

  if (v49)
LABEL_12:
    v25 = v5;
LABEL_13:

  return v25;
}

+ (int64_t)localHourOfDayFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int64_t v6;
  int64_t v8;

  v8 = 0;
  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getHour:minute:second:nanosecond:fromDate:", &v8, 0, 0, 0, v4);

  v6 = v8;
  return v6;
}

+ (id)timeOfDayAndDayOfWeekForDate:(id)a3 timeZone:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a3;
  objc_msgSend(v6, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "setTimeZone:", v5);
  v17 = 0;
  v18 = 0;
  v16 = 0;
  v10 = objc_msgSend(v9, "component:fromDate:", 512, v7) - 1;
  objc_msgSend(v9, "getHour:minute:second:nanosecond:fromDate:", &v18, &v17, &v16, 0, v7);

  v11 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3600 * v18 + 60 * v17 + v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tupleWithFirst:second:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)stringForTimeOfDayAndDayOfWeek:(id)a3 timeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setTimeZone:", v6);
  objc_msgSend(v8, "components:fromDate:", 544, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "weekday") - 1;
  v11 = objc_msgSend(v9, "hour");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%01d%01d"), (v11 / 4), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)stringForTwoHourTimeWindow:(id)a3 timeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setTimeZone:", v6);
  objc_msgSend(v8, "components:fromDate:", 32, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hour");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02d"), (v10 / 12));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)stringForDayOfWeek:(id)a3 timeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setTimeZone:", v6);
  objc_msgSend(v8, "components:fromDate:", 512, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "weekday");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%01d"), (v10 - 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (int)timeBucketFromZeroToTwentyFour:(unint64_t)a3
{
  return (int)a3 / 3456;
}

+ (int)timeBucketFromZeroToTwentyFour:(id)a3 timeZone:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a3;
  objc_msgSend(v6, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "setTimeZone:", v5);
  v14 = 0;
  v15 = 0;
  v13 = 0;
  v10 = objc_msgSend(v9, "component:fromDate:", 512, v7);
  objc_msgSend(v9, "getHour:minute:second:nanosecond:fromDate:", &v15, &v14, &v13, 0, v7);

  v11 = (3600 * (int)v15 + 86400 * v10 + 60 * (int)v14 + (int)v13 - 86400) % 86400 / 3456;
  return v11;
}

+ (id)stringForSpecificTimeDOWLocation:(id)a3 timeZone:(id)a4 geohash:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "setTimeZone:", v8);
  objc_msgSend(v10, "components:fromDate:", 608, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "weekday") - 1;
  v13 = objc_msgSend(v11, "hour");
  v14 = objc_msgSend(v11, "minute");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d-%01d-%lld"), ((v14 + 60 * v13) / 30), v12, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)stringForCoarseTimePOWLocation:(id)a3 timeZone:(id)a4 coarseGeohash:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  int v14;
  void *v15;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99D48];
  v9 = a3;
  objc_msgSend(v8, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setTimeZone:", v7);
  objc_msgSend(v11, "components:fromDate:", 544, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isDateInWeekend:", v9);

  v14 = objc_msgSend(v12, "hour");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%01d-%01d-%lld"), (v14 / 4), v13, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)stringForSpecificGeohash:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
}

+ (id)stringForCoarseGeohash:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
}

+ (id)stringForZoom7Geohash:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
}

+ (BOOL)uniqueRecipientsMatchedBetweenIntent:(id)a3 andIntent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v5, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "recipients", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "displayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  v21 = objc_msgSend(v7, "isEqualToSet:", v14);
  return v21;
}

+ (BOOL)isTitleEquivalenceBetweenAction:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  char v17;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CF9098], "isActionEligibleForSettingsSuggestions:", v5) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CF9098], "isActionEligibleForSettingsSuggestions:", v6) & 1) != 0
    || (objc_msgSend(v5, "actionKey"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "actionKey"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        !v9))
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v5, "actionTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionSubtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionSubtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      v14 = 1;
    }
    else
    {
      v14 = 0;
      if (v10 && v11)
        v14 = objc_msgSend(v10, "isEqualToString:", v11);
    }
    if (v12 == v13)
    {
      v17 = 1;
    }
    else
    {
      v17 = 0;
      if (v12 && v13)
        v17 = objc_msgSend(v12, "isEqualToString:", v13);
    }
    v15 = v14 & v17;

  }
  return v15;
}

+ (BOOL)isCallIntentEquivalenceBetweenAction:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  char v17;
  int v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v5, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_className");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "intent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_className");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v11, "isEqualToString:", CFSTR("INStartAudioCallIntent"));
    v15 = v13;
    if ((v14 & 1) != 0
      || (v16 = objc_msgSend(v11, "isEqualToString:", CFSTR("INStartVideoCallIntent")), v15 = v13, (v16 & 1) != 0)
      || (v17 = objc_msgSend(v13, "isEqualToString:", CFSTR("INStartAudioCallIntent")), v15 = v11, (v17 & 1) != 0)
      || (v18 = objc_msgSend(v13, "isEqualToString:", CFSTR("INStartVideoCallIntent")), v15 = v11, v18))
    {
      LOBYTE(v9) = objc_msgSend(v15, "isEqualToString:", CFSTR("INStartCallIntent"));
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  return v9;
}

+ (BOOL)isContainmentBetweenAction:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    LOBYTE(v8) = 1;
    goto LABEL_17;
  }
  LOBYTE(v8) = 0;
  if (v5 && v6)
  {
    v9 = objc_msgSend(v5, "actionType");
    if (v9 == objc_msgSend(v7, "actionType"))
    {
      objc_msgSend(v5, "actionKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqualToString:", v11);

      if (!v8)
        goto LABEL_17;
      if (!objc_msgSend(v5, "actionType") || objc_msgSend(v5, "actionType") == 2)
      {
        objc_msgSend(v5, "slotSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "slotSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "parameters");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "parameters");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isSubsetOfSet:", v15);

        v17 = v12;
        if ((v16 & 1) != 0)
          goto LABEL_10;
        objc_msgSend(v13, "parameters");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "parameters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isSubsetOfSet:", v19);

        v17 = v13;
        if (v20)
        {
LABEL_10:
          v21 = v17;
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E0]), "initWithAction:slots:", v5, v21);
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E0]), "initWithAction:slots:", v7, v21);
          LOBYTE(v8) = objc_msgSend(v22, "isEqual:", v23);

        }
        else
        {
          LOBYTE(v8) = 0;
        }

        goto LABEL_17;
      }
      if (objc_msgSend(v5, "actionType") == 1)
      {
        LOBYTE(v8) = objc_msgSend(v5, "isEqual:", v7);
        goto LABEL_17;
      }
    }
    LOBYTE(v8) = 0;
  }
LABEL_17:

  return v8;
}

+ (id)sha256hex:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  uint8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  void *v13;
  unsigned __int8 v15[64];
  unsigned __int8 md[32];
  uint64_t v17;
  int8x16x2_t v18;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  v4 = 0;
  v5 = v15;
  v6.i64[0] = 0x9F9F9F9F9F9F9F9FLL;
  v6.i64[1] = 0x9F9F9F9F9F9F9F9FLL;
  v7.i64[0] = 0x3030303030303030;
  v7.i64[1] = 0x3030303030303030;
  v8.i64[0] = 0x3737373737373737;
  v8.i64[1] = 0x3737373737373737;
  v9.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v9.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v10.i64[0] = 0x909090909090909;
  v10.i64[1] = 0x909090909090909;
  do
  {
    v11 = *(int8x16_t *)&md[v4];
    v18.val[0] = (int8x16_t)vsraq_n_u8((uint8x16_t)vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v11, v6), v8, v7), (uint8x16_t)v11, 4uLL);
    v12 = vandq_s8(v11, v9);
    v18.val[1] = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v12, v10), v8, v7), v12);
    vst2q_s8((char *)v5, v18);
    v5 += 32;
    v4 += 16;
  }
  while (v4 != 32);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v15, 64, 1);

  return v13;
}

+ (double)calculateWeightWith:(unint64_t)a3 strength:(double)result termFreq:(unint64_t)a5 docFreq:(unint64_t)a6 docLength:(unint64_t)a7
{
  long double v10;
  double v11;
  double v12;
  long double v13;
  long double v14;
  long double v15;

  v10 = result;
  switch(a3)
  {
    case 0uLL:
      v11 = (double)a7;
      goto LABEL_7;
    case 1uLL:
      result = 1.0 / (result + 1.0);
      break;
    case 2uLL:
      v12 = log((double)a7 + 1.0);
      v13 = ((double)a5 + 1.0) * (log((double)a5 + 1.0) * v12);
      v14 = log((double)a6 + 1.0);
      result = 1.0 / pow(v14 * v13, v10);
      break;
    case 3uLL:
      v15 = pow((double)(a6 * a5), 2.0 - result);
      result = v15 / (double)(a6 * a5) * (1.0 / pow((double)(a7 * a5), v10 + -1.0));
      break;
    case 4uLL:
      v11 = (double)(a7 * a6);
LABEL_7:
      result = 1.0 / pow(v11, v10);
      break;
    default:
      __break(1u);
      break;
  }
  return result;
}

+ (BOOL)shouldPredictRecipient:(id)a3 withDate:(id)a4 andRecipientDate:(id)a5
{
  double v5;
  double v6;
  void *v7;
  BOOL v8;

  if (!a5)
    return 1;
  objc_msgSend(a4, "timeIntervalSinceDate:", a5);
  v6 = v5;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 > (double)(int)objc_msgSend(v7, "messageContentTimeElapsed");

  return v8;
}

+ (BOOL)shouldAcceptMessageContent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;

  v3 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") <= 1)
  {

    goto LABEL_6;
  }
  objc_msgSend(v4, "messageContentBlacklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (v8)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v9 = 1;
LABEL_7:

  return v9;
}

+ (id)recipientFromMessageIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "conversationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v3, "speakableGroupName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "spokenPhrase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v3, "recipients");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v9 = objc_opt_new();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v38;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v15, "contactIdentifier", (_QWORD)v37);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v15, "contactIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v15, "displayName");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v18)
                {
                  __atxlog_handle_action_prediction();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                    +[_ATXActionUtils recipientFromMessageIntent:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);

                  goto LABEL_21;
                }
                objc_msgSend(v15, "displayName");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v19 = v17;
              objc_msgSend(v17, "lowercaseString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v9, "addObject:", v20);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            if (v12)
              continue;
            break;
          }
        }

        -[NSObject sortUsingSelector:](v9, "sortUsingSelector:", sel_caseInsensitiveCompare_);
        -[NSObject componentsJoinedByString:](v9, "componentsJoinedByString:", CFSTR(","));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __atxlog_handle_action_prediction();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          +[_ATXActionUtils recipientFromMessageIntent:].cold.1(v9, v21, v22, v23, v24, v25, v26, v27);
LABEL_21:
        v5 = 0;
      }

    }
  }

  return v5;
}

+ (id)partOfWeekStringForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDateInWeekend:", v4);

  if (v6)
    v7 = CFSTR("weekend");
  else
    v7 = CFSTR("weekday");
  v8 = v7;

  return v8;
}

+ (BOOL)isINStartCallIntentSupportedForAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = (void *)MEMORY[0x1E0CF8CE8];
  objc_msgSend(a3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appInfoForBundle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "supportedActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("INStartCallIntent"));

  return v7;
}

+ (BOOL)shouldAcceptAudioOrVideoCallIntent:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  if (objc_msgSend(v4, "actionType"))
    goto LABEL_2;
  objc_msgSend(v4, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_className");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", CFSTR("INStartAudioCallIntent")))
  {

  }
  else
  {
    objc_msgSend(v4, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_className");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", CFSTR("INStartVideoCallIntent"));

    if (!v11)
      goto LABEL_2;
  }
  if ((objc_msgSend(a1, "isINStartCallIntentSupportedForAction:", v4) & 1) != 0)
  {
    v5 = 0;
    goto LABEL_3;
  }
LABEL_2:
  v5 = 1;
LABEL_3:

  return v5;
}

+ (double)computeNormalizedBetaDistEngagementScoreWithPriorAlpha:(int)a3 priorBeta:(int)a4 confirms:(double)a5 rejects:(double)a6 totalConfirms:(double)a7 totalRejects:(double)a8
{
  int v8;
  double v9;
  double v10;

  v8 = a4 + a3;
  v9 = (double)a3 + a7;
  v10 = (double)a4 + a8;
  return (v9 / (v9 + v10) * (double)v8 + a5)
       / (v10 / (v9 + v10) * (double)v8 + v9 / (v9 + v10) * (double)v8 + a5 + a6)
       / (v9
        / (v9 + v10)
        * (double)v8
        / (v9 / (v9 + v10) * (double)v8 + v10 / (v9 + v10) * (double)v8));
}

+ (id)atxActionFromProactiveSuggestion:(id)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  objc_msgSend(a3, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "executableType") == 2
    && (objc_msgSend(v3, "executableObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v3, "executableObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)atxActionsFromProactiveSuggestions:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54___ATXActionUtils_atxActionsFromProactiveSuggestions___block_invoke;
  v4[3] = &__block_descriptor_40_e32__16__0__ATXProactiveSuggestion_8l;
  v4[4] = a1;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)slotSetsForAction:(void *)a1 intentCache:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, v3, "Donation Processing - # slots received: %lu", (uint8_t *)&v4);
}

+ (void)recipientFromMessageIntent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "No recipients found for INSendMessageIntent", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)recipientFromMessageIntent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "No contactIdentifier or display name found for the recipients in the INSendMessageIntent", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
