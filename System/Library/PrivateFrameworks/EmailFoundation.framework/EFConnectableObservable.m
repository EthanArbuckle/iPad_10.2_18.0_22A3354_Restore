@implementation EFConnectableObservable

void __35___EFConnectableObservable_connect__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_disconnect");

}

@end
