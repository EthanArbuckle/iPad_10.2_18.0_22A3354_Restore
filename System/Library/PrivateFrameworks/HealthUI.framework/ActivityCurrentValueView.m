@implementation ActivityCurrentValueView

void __102___ActivityCurrentValueView__computeMultiDayVisibleSummaryForGraphView_timeScope_filterDateIntervals___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a2, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "activitySummaryData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "_summaryOutsideRanges:summary:", *(_QWORD *)(a1 + 40), v5) & 1) == 0)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (v5 != *(void **)(v6 + 40))
      {
        objc_msgSend(*(id *)(a1 + 48), "combineWithActivitySummary:", v5);
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;
      v8 = v5;

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }

    v4 = v9;
  }

}

@end
