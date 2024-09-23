@implementation NTKKeylineFittedCircleView

void __45___NTKKeylineFittedCircleView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v4, "setBorderColor:", v6);
}

@end
