@implementation EMActivityRegistryObserverWrapper

void __64___EMActivityRegistryObserverWrapper__startObservingIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addCancelable:", v6);
    if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "setActivities:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_resetWithCancelable:", *(_QWORD *)(a1 + 32));
  }

}

void __75___EMActivityRegistryObserverWrapper_initWithConnection_registry_observer___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetWithCancelable:", 0);

}

void __75___EMActivityRegistryObserverWrapper_initWithConnection_registry_observer___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_recover");

}

@end
