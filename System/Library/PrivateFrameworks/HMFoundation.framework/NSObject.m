@implementation NSObject

void __81__NSObject_HMFKeyValueObserving__hmf_registerObserverForKeyPath_options_handler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = v2;
  if (v2)
    objc_setAssociatedObject(v2, *(const void **)(a1 + 48), 0, (void *)0x301);

}

@end
