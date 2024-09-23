@implementation CDModeClassifier

void __48___CDModeClassifier__enableFocusModesIfPossible__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setModeClassifier:", v5);

}

@end
