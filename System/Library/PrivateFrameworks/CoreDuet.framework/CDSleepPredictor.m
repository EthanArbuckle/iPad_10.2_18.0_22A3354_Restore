@implementation CDSleepPredictor

void __51___CDSleepPredictor_array_reduce_withInitialValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __41___CDSleepPredictor_indexSetFromUnionOf___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addIndexes:", a2);
  return v4;
}

void __31___CDSleepPredictor_array_map___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

uint64_t __34___CDSleepPredictor_array_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78___CDSleepPredictor_mutableArray_replaceObjectsAtIndexes_withObjectFromBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "objectAtIndexedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replaceObjectAtIndex:withObject:", a2, v5);

}

unint64_t __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;

  objc_msgSend(a2, "cd_dateWithFloorForAlignment:", 900.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  v7 = *(_QWORD *)(a1 + 40) - 1;
  v8 = v6 / 900.0;
  if (v6 / 900.0 > (double)v7)
    v8 = (double)v7;
  return (unint64_t)fmax(v8, 0.0);
}

uint64_t __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "laterDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v7);

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "earlierDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v12);

  if (*(_QWORD *)(a1 + 48) - v8 >= (unint64_t)(v13 - v8 + 1))
    v14 = v13 - v8 + 1;
  else
    v14 = *(_QWORD *)(a1 + 48) - v8;
  return objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v8, v14);
}

uint64_t __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
}

uint64_t __83___CDSleepPredictor_fetchDeviceInUseDateIntervalsFromStore_whichIntersectInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __107___CDSleepPredictor_fetchFirstEventDateIntervalFromStore_forStream_sortDateAscending_intersectingInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(v2, "numberWithInt:", v3 > 0.5);
}

uint64_t __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "BOOLValue") ^ 1;
}

void __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "rangeValue");
  v6 = v5;
  objc_msgSend(v4, "rangeValue");
  v8 = v7;

  if (v6 > v8)
    return -1;
  else
    return v6 != v8;
}

id __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v3 = objc_msgSend(a2, "rangeValue");
  v5 = v4;
  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", (double)(unint64_t)(900 * v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithStartDate:duration:", v7, (double)(unint64_t)(900 * v5));

  return v8;
}

@end
