@implementation FEFocusItemFrameReporter

void __58___FEFocusItemFrameReporter__scheduleRepeatingFrameUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportFocusFrameForCurrentlyFocusedItem");

}

@end
