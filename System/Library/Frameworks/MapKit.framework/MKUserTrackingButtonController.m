@implementation MKUserTrackingButtonController

void __55___MKUserTrackingButtonController_setUserTrackingView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setInternallyEnabled:", *(_BYTE *)(a1 + 40) == 0);

}

void __55___MKUserTrackingButtonController_setUserTrackingView___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[5];
  char v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isLocationServicesRestricted");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55___MKUserTrackingButtonController_setUserTrackingView___block_invoke_2;
  v3[3] = &unk_1E20D8320;
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

@end
