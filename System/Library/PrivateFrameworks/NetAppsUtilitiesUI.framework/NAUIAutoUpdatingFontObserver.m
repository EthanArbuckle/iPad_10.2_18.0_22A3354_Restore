@implementation NAUIAutoUpdatingFontObserver

void __48___NAUIAutoUpdatingFontObserver_initWithTarget___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateDyamicFontForCurrentContentSize");

}

@end
