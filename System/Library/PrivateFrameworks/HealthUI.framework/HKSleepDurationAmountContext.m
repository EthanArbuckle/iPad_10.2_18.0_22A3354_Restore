@implementation HKSleepDurationAmountContext

void __116___HKSleepDurationAmountContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_daysWithSleepDataFromChartPoints:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_amountStringFromCounts:timeScope:", v6, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_contextItemWithAmountString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedItem:", v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

@end
