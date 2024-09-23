@implementation NTKKeylinePathView

uint64_t __53___NTKKeylinePathView_initWithPath_secondPath_scale___block_invoke(uint64_t a1, double a2, double a3)
{
  id *WeakRetained;
  id *v6;
  uint64_t v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = objc_msgSend(WeakRetained[54], "containsPoint:", a2, a3);
  else
    v7 = 0;

  return v7;
}

@end
