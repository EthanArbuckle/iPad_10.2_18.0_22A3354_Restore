@implementation CDIntentSpotlightIndex

void __69___CDIntentSpotlightIndex_triggerIndexIncludingAdditions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  double v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;
  char v15;

  objc_msgSend(*(id *)(a1 + 32), "indexer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIndexing");

  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "delay");
    v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    objc_msgSend(*(id *)(a1 + 32), "activityQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __69___CDIntentSpotlightIndex_triggerIndexIncludingAdditions_completion___block_invoke_2;
    block[3] = &unk_1E26E4F50;
    v8 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    block[1] = 3221225472;
    v15 = *(_BYTE *)(a1 + 48);
    v14 = v8;
    dispatch_after(v6, v7, block);

  }
  else
  {
    v9 = v4;
    objc_sync_enter(v9);
    if (objc_msgSend(*(id *)(a1 + 32), "includeAdditions"))
      v10 = objc_msgSend(*(id *)(a1 + 32), "batchSize");
    else
      v10 = 0;
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setIncludeAdditions:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
    objc_sync_exit(v9);

    objc_msgSend(*(id *)(a1 + 32), "indexer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginIndexingWithBatchSize:completion:", v10, v12);

  }
}

uint64_t __69___CDIntentSpotlightIndex_triggerIndexIncludingAdditions_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerIndexIncludingAdditions:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

@end
