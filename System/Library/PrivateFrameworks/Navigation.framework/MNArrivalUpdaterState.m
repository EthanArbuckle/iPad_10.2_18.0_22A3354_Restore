@implementation MNArrivalUpdaterState

void __47___MNArrivalUpdaterState_Arrived_onEnterState___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "arrivalUpdater");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalUpdater:didTimeoutAtLegIndex:withReason:", v3, *(_QWORD *)(a1 + 40), 1);

    v5 = (void *)v6[4];
    v6[4] = 0;

    WeakRetained = v6;
  }

}

@end
