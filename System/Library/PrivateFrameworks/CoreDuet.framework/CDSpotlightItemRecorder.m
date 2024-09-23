@implementation CDSpotlightItemRecorder

BOOL __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = !v3 || (objc_msgSend(*(id *)(a1 + 32), "containsDomain:", v3) & 1) == 0;

  return v4;
}

void __66___CDSpotlightItemRecorder_deleteAllItemsWithBundleID_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
    WeakRetained = (_QWORD *)WeakRetained[17];
  v4 = objc_msgSend(WeakRetained, "deleteInteractionsWithBundleId:error:", *(_QWORD *)(a1 + 32), 0);

  +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 1, *(void **)(a1 + 32), v4);
}

void __84___CDSpotlightItemRecorder_addInteractions_bundleID_protectionClass_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _UNKNOWN **v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _UNKNOWN **v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id obj;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v1 = a1;
  v42 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("intent.cd_saveToKnowledgeStore = YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    v9 = &off_1E26E0000;
    v31 = v1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v11, "intent", v31);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_className");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = *(_QWORD *)(v1 + 40);
        if (v13 && v14)
        {
          -[objc_class sharedInstance](getRESiriActionsDonationsWhitelistClass(), "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
            v17 = objc_msgSend(v15, "intentIsWhitelistedForBundleID:andTypeName:", *(_QWORD *)(v1 + 40), v13);
          else
            v17 = 0;

          v14 = *(_QWORD *)(v1 + 40);
        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(v9[357], "eventWithInteraction:bundleIdentifier:storeKeyImage:", v11, v14, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v19 = *(_QWORD *)(v1 + 40);
          objc_msgSend(v18, "UUID");
          v20 = v7;
          v21 = v9;
          v22 = v8;
          v23 = v5;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "performSelector:withObject:withObject:", sel_contextMetadataWithBundleIdentifier_eventUUID_, v19, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v25, v26);

          v5 = v23;
          v8 = v22;
          v9 = v21;
          v7 = v20;
          v1 = v31;
          objc_msgSend(v5, "addObject:", v18);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    _CDCollectDonationMetricsForEventsInDomain(v5, CFSTR("intents"));
    v27 = v5;
    v28 = *(_QWORD *)(v1 + 48);
    v29 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __84___CDSpotlightItemRecorder_addInteractions_bundleID_protectionClass_withCompletion___block_invoke_2;
    v34[3] = &unk_1E26E6E18;
    v35 = v32;
    v36 = *(id *)(v1 + 56);
    v30 = v28;
    v5 = v27;
    -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:](v30, v27, v29, 0, v34);

  }
}

uint64_t __90___CDSpotlightItemRecorder_saveRateLimitedEvents_donatorUid_responseQueue_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __90___CDSpotlightItemRecorder_saveRateLimitedEvents_donatorUid_responseQueue_withCompletion___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

void __84___CDSpotlightItemRecorder_addInteractions_bundleID_protectionClass_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  -[objc_class keyPathForIntentsDataDictionary](get_CDContextQueriesClass(), "keyPathForIntentsDataDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "UUID", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[objc_class userContext](get_CDClientContextClass(), "userContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v7);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, BOOL, id))(v17 + 16))(v17, v8 != 0, v6);

}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v2 = (void *)os_transaction_create();
  v3 = a1 + 32;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    v4 = (id *)(a1 + 40);
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__27;
      v16 = __Block_byref_object_dispose__27;
      v17 = 0;
      v6 = *(void **)v3;
      v7 = *(NSObject **)(*(_QWORD *)v3 + 24);
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_446;
      v9[3] = &unk_1E26E4A80;
      v10 = v6;
      v11 = &v12;
      dispatch_sync(v7, v9);
      WeakRetained = objc_loadWeakRetained(v4);
      -[_CDSpotlightItemRecorder runOperation:]((uint64_t)WeakRetained, (void *)v13[5]);

      _Block_object_dispose(&v12, 8);
    }
    while (objc_msgSend(*(id *)(*(_QWORD *)v3 + 32), "count"));
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)v3 + 32), "count")
    && *(_QWORD *)(*(_QWORD *)v3 + 40)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_cold_1(v3);
  }

}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_446(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _CDSpotlightItemRecorderOperation *v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  _QWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectAtIndex:", 0);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v7)
  {
    v9 = v7 + 16;
    v7 = *(_QWORD *)(v7 + 16);
    v8 = *(_QWORD *)(v9 + 8);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d AND bundleID == %@"), v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v12)
      v13 = *(void **)(v12 + 8);
    else
      v13 = 0;
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v19);
          if (v20)
            v21 = *(_QWORD *)(v20 + 8);
          else
            v21 = 0;
          objc_msgSend(v14, "addObjectsFromArray:", v21);
          ++v19;
        }
        while (v17 != v19);
        v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        v17 = v22;
      }
      while (v22);
    }

    v23 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
    v24 = (uint64_t)v23;
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v25)
    {
      v26 = *(_QWORD *)(v25 + 24);
      if (!v23)
      {
LABEL_20:
        if (v25)
          v27 = *(void **)(v25 + 16);
        else
          v27 = 0;
        -[_DKSyncWindow setStartDate:]((uint64_t)v23, v27);
        -[_DKPredictionTimeline setStartDate:](v24, v14);
        v28 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v10);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "filteredArrayUsingPredicate:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "mutableCopy");
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(void **)(v32 + 32);
        *(_QWORD *)(v32 + 32) = v31;

        v34 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v35 = *(void **)(v34 + 40);
        *(_QWORD *)(v34 + 40) = v24;

        goto LABEL_23;
      }
    }
    else
    {
      v26 = 0;
      if (!v23)
        goto LABEL_20;
    }
    v23->_type = v26;
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    goto LABEL_20;
  }
LABEL_23:
  v36 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v36)
    v36 = (_QWORD *)v36[1];
  v37 = v36;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) -= objc_msgSend(v37, "count");

}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_453(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_2;
    v6[3] = &unk_1E26E6D38;
    v7 = v3;
    v8 = 0;
    v5 = v3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectsForKeys:", 0);

  }
}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a3, "lastRecorded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  if (v8 > 30.0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

void __46___CDSpotlightItemRecorder__enqueueOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 48))
  {
    v3 = os_transaction_create();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD **)(a1 + 40);
  if (v6)
    v6 = (_QWORD *)v6[1];
  v7 = v6;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) += objc_msgSend(v7, "count");

  dispatch_source_merge_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8), 1uLL);
}

unint64_t __44___CDSpotlightItemRecorder_submitOperation___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  unint64_t result;
  uint64_t v7;

  v2 = a1[4];
  v3 = *(_QWORD *)(v2 + 40);
  v4 = objc_msgSend(*(id *)(v2 + 32), "count");
  v5 = (_QWORD *)a1[5];
  if (v5)
    v5 = (_QWORD *)v5[1];
  if (v3 <= v4)
    v3 = v4;
  result = objc_msgSend(v5, "count");
  if (result <= 1)
    v7 = 1;
  else
    v7 = result;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v7 + v3 > 0x19;
  return result;
}

void __44___CDSpotlightItemRecorder_submitOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_CDSpotlightItemRecorder runOperation:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

void __70___CDSpotlightItemRecorder__addOrUpdateCoreDuetInteractions_bundleID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = 50;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 50);
    do
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      --v4;
    }
    while (v4);
    if (objc_msgSend(v13, "count") == 10)
      objc_msgSend(v13, "removeAllObjects");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v6 >= 0x32)
    v7 = 50;
  else
    v7 = v6;
  objc_msgSend(v3, "removeObjectsInRange:", 0, v7);
  for (; v7; --v7)
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 48));
  v8 = *(void **)(a1 + 48);
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;

  v12 = v11 < 0.0 || v11 > 100.0;
  if (!v12 && (IOPSDrawingUnlimitedPower() & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

BOOL __70___CDSpotlightItemRecorder__addOrUpdateCoreDuetInteractions_bundleID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "timeIntervalSinceDate:", v3);
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", v6);
    v5 = v7;

  }
  return v5 < 300.0;
}

void __61___CDSpotlightItemRecorder_donateRelevantShortcuts_bundleID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61___CDSpotlightItemRecorder_donateRelevantShortcuts_bundleID___block_invoke_cold_1();

  }
}

BOOL __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = !v3 || (objc_msgSend(*(id *)(a1 + 32), "containsDomain:", v3) & 1) == 0;

  return v4;
}

void __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke_525(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        +[_DKEvent eventWithSearchableItem:bundleIdentifier:](_DKEvent, "eventWithSearchableItem:bundleIdentifier:", v8, *(_QWORD *)(a1 + 40));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v9 = objc_msgSend(v2, "addObject:", v9);
        v11 = (void *)MEMORY[0x193FEE914](v9);
        +[_DKEvent eventRepresentingUserActivityWithSearchableItem:bundleIdentifier:](_DKEvent, "eventRepresentingUserActivityWithSearchableItem:bundleIdentifier:", v8, *(_QWORD *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v2, "addObject:", v12);

        objc_autoreleasePoolPop(v11);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
  {
    v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke_2;
    v15[3] = &unk_1E26E3850;
    v14 = *(_QWORD *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:](v14, v2, v13, 0, v15);

  }
}

void __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v18 = a1;
  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v19 = a3;
  -[objc_class keyPathForUserActivityDataDictionary](get_CDContextQueriesClass(), "keyPathForUserActivityDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "metadata", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKApplicationActivityMetadataKey userActivityRequiredString](_DKApplicationActivityMetadataKey, "userActivityRequiredString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[objc_class userActivityRequiredString](get_CDContextQueriesClass(), "userActivityRequiredString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v14;
          v25 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[objc_class userContext](get_CDClientContextClass(), "userContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v5);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }

  v17 = *(_QWORD *)(v18 + 32);
  if (v17)
    (*(void (**)(uint64_t, BOOL, id))(v17 + 16))(v17, v6 != 0, v19);

}

void __66___CDSpotlightItemRecorder_addUserAction_withItem_withCompletion___block_invoke(uint64_t a1)
{
  _CDMultiLevelRateLimiter *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  _CDMultiLevelRateLimiter *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (_CDMultiLevelRateLimiter *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "stream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSystemEventStreams appLocationActivityStream](_DKSystemEventStreams, "appLocationActivityStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6);

    if (v7)
      v8 = 15;
    else
      v8 = 5;
    v9 = [_CDMultiLevelRateLimiter alloc];
    v15[0] = &unk_1E272B1D0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = &unk_1E272B1E8;
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[_CDMultiLevelRateLimiter initWithPeriodToCountMap:](v9, "initWithPeriodToCountMap:", v12);

    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    objc_msgSend(*(id *)(a1 + 56), "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v2, v14);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[_CDMultiLevelRateLimiter debited](v2, "debited");

}

void __66___CDSpotlightItemRecorder_addUserAction_withItem_withCompletion___block_invoke_532(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;

  v5 = a3;
  if (objc_msgSend(a2, "count"))
  {
    +[_CDSpotlightItemUtils contextDictionaryForSearchableItem:userAction:](_CDSpotlightItemUtils, "contextDictionaryForSearchableItem:userAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class keyPathForUserActivityDataDictionary](get_CDContextQueriesClass(), "keyPathForUserActivityDataDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class userContext](get_CDClientContextClass(), "userContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  }
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 2, v9, 1);

  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_cold_1();

  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, BOOL, id))(v11 + 16))(v11, a2 != 0, v5);

}

uint64_t __84___CDSpotlightItemRecorder__deleteUserActivitiesWithPersistentIdentifiers_bundleID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v4 = a2;
  +[_DKSource spotlightSourceID](_DKSource, "spotlightSourceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObjectForSourceID:bundleID:itemID:", v5, *(_QWORD *)(a1 + 40), v4);

  return v6;
}

uint64_t __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "computeHashesForString:reuse:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "getWithHashes:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_536(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = (void *)*((_QWORD *)WeakRetained + 17);
  else
    v4 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  v7 = v4;
  v8 = objc_msgSend(v7, "deleteInteractionsWithBundleId:domainIdentifiers:error:", v5, v6, &v11);
  v9 = v11;

  if (v9)
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_536_cold_1();

  }
  +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 1, *(void **)(a1 + 32), v8);

}

void __83___CDSpotlightItemRecorder_deleteSearchableItemsSinceDate_bundleID_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate >= CAST(%f,\"NSDate\")"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleId == %@"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v2;
  v14[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
    v9 = (void *)*((_QWORD *)WeakRetained + 17);
  else
    v9 = 0;
  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = v9;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:", CFSTR("deleteSearchableItemsSinceDate:%@ bundleID:%@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v13 = objc_msgSend(v11, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v6, MEMORY[0x1E0C9AA60], 0, v12, 0);

  +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 1, *(void **)(a1 + 40), v13);
}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v2 = 134217984;
  v3 = v1;
  _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "expected _pendingOperationsItemCount to be 0, but was %td", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __61___CDSpotlightItemRecorder_donateRelevantShortcuts_bundleID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error saving relevant shortcuts events to knowledge store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_536_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error encountered deleteSearchableItemsWithDomainIdentifiers:bundleID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
