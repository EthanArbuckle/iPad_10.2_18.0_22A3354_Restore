@implementation SFDownloadsIconView

void __29___SFDownloadsIconView_pulse__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishedPulsing");

}

@end
