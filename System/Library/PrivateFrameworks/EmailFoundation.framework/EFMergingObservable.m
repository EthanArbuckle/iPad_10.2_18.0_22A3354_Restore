@implementation EFMergingObservable

uint64_t __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

void __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:");

}

uint64_t __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

uint64_t __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
    return objc_msgSend(*(id *)(a1 + 32), "cancel");
  }
  return result;
}

void __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", v3);
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  }

}

@end
