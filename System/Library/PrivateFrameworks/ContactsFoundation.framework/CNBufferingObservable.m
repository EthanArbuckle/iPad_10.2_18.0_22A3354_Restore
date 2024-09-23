@implementation CNBufferingObservable

void __36___CNBufferingObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_addObject:orPlaceholder:", v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "strategy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buffer:didReceiveResults:forObserver:", v7, v8, *(_QWORD *)(a1 + 40));

}

uint64_t __36___CNBufferingObservable_subscribe___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "sendBufferedResultsToObserver:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
}

uint64_t __36___CNBufferingObservable_subscribe___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

@end
