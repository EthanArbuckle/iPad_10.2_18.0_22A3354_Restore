@implementation WFGetTravelTimeWithTripInfo

void __WFGetTravelTimeWithTripInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    v5 = objc_alloc(MEMORY[0x24BE19640]);
    objc_msgSend(v10, "routes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithMKRoute:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    WFLocalizedMapKitError(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v8);
  }

}

@end
