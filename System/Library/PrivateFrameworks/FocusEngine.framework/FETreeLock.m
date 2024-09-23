@implementation FETreeLock

void __19___FETreeLock_init__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_validateLockedEnvironments");
  else
    objc_msgSend(v5, "invalidate");

}

void __35___FETreeLock_lockEnvironmentTree___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[1], "removeObjectForKey:", a2);
    WeakRetained = v4;
  }

}

@end
