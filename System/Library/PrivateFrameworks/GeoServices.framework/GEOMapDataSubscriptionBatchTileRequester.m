@implementation GEOMapDataSubscriptionBatchTileRequester

void __166___GEOMapDataSubscriptionBatchTileRequester_initWithSubscription_diskCache_reason_auditToken_requestOptions_manifestManager_log_logPrefix_tileRequesterCreationBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  _BOOL8 v7;
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
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a2 == 4;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  v9 = a3;
  objc_msgSend(v8, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GEOTileKeyEnumeratorForRegion(v10, v9, v7);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);
  v11 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  }
  v17 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v20);

}

void __82___GEOMapDataSubscriptionBatchTileRequester_determineNextBatchWithQueue_callback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82___GEOMapDataSubscriptionBatchTileRequester_determineNextBatchWithQueue_callback___block_invoke_2;
  v3[3] = &unk_1E1C126C8;
  v7 = *(id *)(a1 + 64);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async(v2, v3);

}

uint64_t __82___GEOMapDataSubscriptionBatchTileRequester_determineNextBatchWithQueue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

unint64_t __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  unint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "addKey:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  *a3 = result >= *(_QWORD *)(a1 + 40);
  return result;
}

uint64_t __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke_26(uint64_t a1, uint64_t a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "completedUnitCount") + 1);
LABEL_7:
    objc_msgSend(*(id *)(a1 + 56), "addKey:", a2);
    goto LABEL_8;
  }
  if ((a4 & 1) == 0)
  {
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, a2);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v9, a2);
    }
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "completedUnitCount") + 1);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 184);
  objc_msgSend(*(id *)(v12 + 232), "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackSubscriptionAssociationForKey:subscriptionIdentifier:", a2, v14);

LABEL_8:
  return 1;
}

uint64_t __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 72))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_addMoreKeysToListIfNeeded:cachedETags:cachedData:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

@end
