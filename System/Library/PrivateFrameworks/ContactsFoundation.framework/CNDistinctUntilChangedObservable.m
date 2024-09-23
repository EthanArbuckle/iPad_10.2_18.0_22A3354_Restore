@implementation CNDistinctUntilChangedObservable

void __47___CNDistinctUntilChangedObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "_resultIsDistinctFromLastResult:", v4))
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v4);

}

uint64_t __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

@end
