@implementation MPCAudioSessionController

void __47___MPCAudioSessionController_setupObservations__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "snapshotSessionSettings");
    WeakRetained = v2;
  }

}

void __47___MPCAudioSessionController_setupObservations__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "restoreSessionSettingsFromSnapshot");
    WeakRetained = v2;
  }

}

@end
