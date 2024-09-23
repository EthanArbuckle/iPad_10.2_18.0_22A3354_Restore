@implementation CNObservableTakeUntilOperator

void __44___CNObservableTakeUntilOperator_subscribe___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

@end
