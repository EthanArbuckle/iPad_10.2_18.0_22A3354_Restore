@implementation HKSleepDurationAverageContext

void __117___HKSleepDurationAverageContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateRangeDataWithChartPoints:useInBedAverage:isHighlighted:timeScope:", v5, 1, objc_msgSend(*(id *)(a1 + 32), "useInBedAverage"), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_updateRangeDataWithChartPoints:useInBedAverage:isHighlighted:timeScope:", v5, 0, objc_msgSend(*(id *)(a1 + 32), "useInBedAverage") ^ 1, *(_QWORD *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __106___HKSleepDurationAverageContext__updateRangeDataWithChartPoints_useInBedAverage_isHighlighted_timeScope___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepDaySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
