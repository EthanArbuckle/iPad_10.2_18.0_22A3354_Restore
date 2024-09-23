@implementation EFConcatenatingObservable

void __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", v3);

}

void __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    v2 = *(void **)(a1 + 56);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "ef_tail");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subscribeObserver:toObservables:unless:", v3);

  }
}

void __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", v3);

}

@end
