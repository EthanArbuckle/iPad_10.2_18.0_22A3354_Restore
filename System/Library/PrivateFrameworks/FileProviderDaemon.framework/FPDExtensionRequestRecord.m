@implementation FPDExtensionRequestRecord

void __46___FPDExtensionRequestRecord_monitorProgress___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  id v14;

  fpfs_adopt_log();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "finishObserving");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  if (*(_QWORD *)(a1 + 40))
  {
    location = 0;
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v4;

    objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", *(_QWORD *)(a1 + 40), "fractionCompleted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46___FPDExtensionRequestRecord_monitorProgress___block_invoke_2;
    v11[3] = &unk_1E8C782E8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "addObserverBlock:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 80);
    *(_QWORD *)(v9 + 80) = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  __fp_pop_log();

}

void __46___FPDExtensionRequestRecord_monitorProgress___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  double v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", v4[9]);
    if (v3 >= 5.0)
    {
      objc_storeStrong(v4 + 9, v2);
      objc_msgSend(v4, "_setupProgressTimer");
    }

    WeakRetained = v4;
  }

}

void __42___FPDExtensionRequestRecord__setupTimer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    fpfs_adopt_log();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "cancelTimeout");
    objc_msgSend(WeakRetained, "_handleTimeout");
    __fp_pop_log();

  }
}

void __49___FPDExtensionRequestRecord__setupProgressTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    fpfs_adopt_log();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "cancelTimeout");
    objc_msgSend(WeakRetained, "_handleTimeout");
    __fp_pop_log();

  }
}

@end
