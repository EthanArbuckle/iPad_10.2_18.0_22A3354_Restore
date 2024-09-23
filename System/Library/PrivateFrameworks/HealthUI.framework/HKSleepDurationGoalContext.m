@implementation HKSleepDurationGoalContext

void __114___HKSleepDurationGoalContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_goalGivenChartPoints:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_durationContextItemWithGoal:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedItem:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

@end
