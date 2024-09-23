@implementation CNConcatenatingObservable

void __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v4);

}

void __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 56), "subscribeObserver:toObservables:unless:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), WeakRetained);

}

void __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", v4);

}

@end
