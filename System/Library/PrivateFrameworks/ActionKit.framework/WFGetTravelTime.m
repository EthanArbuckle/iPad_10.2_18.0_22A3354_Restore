@implementation WFGetTravelTime

void __WFGetTravelTime_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a2;
  v12 = v5;
  if (v5)
  {
    objc_msgSend(v5, "expectedTravelTime");
    objc_msgSend(v12, "distance");
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 40);
    WFTimeIntervalFromExpectedTravelTime();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, double))(v8 + 16))(v8, v9, 0, v7);

    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    WFLocalizedMapKitError(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, double))(v10 + 16))(v10, 0, v11, 0.0);

  }
}

@end
