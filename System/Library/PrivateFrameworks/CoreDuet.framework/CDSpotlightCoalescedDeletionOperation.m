@implementation CDSpotlightCoalescedDeletionOperation

void __93___CDSpotlightCoalescedDeletionOperation_enumerateDeletionPredicatesAndCompletionsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForSpotlightEventsWithItemIdentifiers:bundleID:]((uint64_t)_DKQuery, v6, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __93___CDSpotlightCoalescedDeletionOperation_enumerateDeletionPredicatesAndCompletionsWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a2;
  objc_msgSend(a3, "allDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForSpotlightEventsWithDomainIdentifiers:bundleID:]((uint64_t)_DKQuery, v7, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
