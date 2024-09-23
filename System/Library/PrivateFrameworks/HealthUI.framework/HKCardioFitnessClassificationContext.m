@implementation HKCardioFitnessClassificationContext

void __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v9 = a4;
  if ((_DWORD)a3)
  {
    objc_msgSend(a2, "hk_map:", &__block_literal_global_21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKCardioFitnessUtilities cardioFitnessLevelDataForChartData:](HKCardioFitnessUtilities, "cardioFitnessLevelDataForChartData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3;
      v13[3] = &unk_1E9C3FC50;
      v13[4] = *(_QWORD *)(a1 + 32);
      v14 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], v13);

    }
  }
  (*(void (**)(_QWORD, uint64_t, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, v9, v7, v8);

}

id __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextDidUpdate:withCardioFitnessLevelData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
