@implementation HFItemUpdateFutureWrapper

uint64_t __50___HFItemUpdateFutureWrapper_futuresFromWrappers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "future");
}

void __64___HFItemUpdateFutureWrapper_wrapperWithFuture_item_isInternal___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setOutcome:", v3);

}

@end
