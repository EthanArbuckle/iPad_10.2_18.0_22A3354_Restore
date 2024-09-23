@implementation HKBloodGlucosePercentInRangeDataSource

- (HKBloodGlucosePercentInRangeDataSource)initWithHealthStore:(id)a3 unitController:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HKBloodGlucosePercentInRangeDataSource *v14;
  objc_super v16;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB6A70];
  v9 = *MEMORY[0x1E0CB5A98];
  v10 = a3;
  objc_msgSend(v8, "quantityTypeForIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayTypeForObjectType:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HKBloodGlucosePercentInRangeDataSource;
  v14 = -[HKHealthQueryChartCacheDataSource initWithDisplayType:healthStore:](&v16, sel_initWithDisplayType_healthStore_, v13, v10);

  if (v14)
    objc_storeStrong((id *)&v14->_unitController, a4);

  return v14;
}

- (id)queryDescription
{
  return CFSTR("HKBloodGlucosePercentInRange");
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKUnitPreferenceController *unitController;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "statisticsInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v9, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCalendar:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A98]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB6A78];
  objc_msgSend(v6, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateForSamplesWithStartDate:endDate:options:", v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  unitController = self->_unitController;
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController unitForDisplayType:](unitController, "unitForDisplayType:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A38], "ATTDGlycemicRangesWithUnit:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0CB6D88]);
  objc_msgSend(v6, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __78__HKBloodGlucosePercentInRangeDataSource_queriesForRequest_completionHandler___block_invoke;
  v28[3] = &unk_1E9C455A8;
  v28[4] = self;
  v29 = v6;
  v30 = v7;
  v23 = v7;
  v24 = v6;
  v25 = (void *)objc_msgSend(v21, "initWithQuantityType:quantitySamplePredicate:anchorDate:intervalComponents:quantityRanges:resultsHandler:", v12, v16, v22, v9, v20, v28);

  objc_msgSend(v25, "setDebugIdentifier:", CFSTR("charting (glucose)"));
  v31[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

void __78__HKBloodGlucosePercentInRangeDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "statisticsInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "_requiredSampleCountForHistogramForStatisticsInterval:", v5);

    objc_msgSend(*(id *)(a1 + 32), "_dataBlockFromHistogramCollection:requiredSampleCountForHistogram:", v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)_dataBlockFromHistogramCollection:(id)a3 requiredSampleCountForHistogram:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  HKGraphSeriesDataBlock *v8;
  _QWORD v10[5];

  objc_msgSend(a3, "valueHistograms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__HKBloodGlucosePercentInRangeDataSource__dataBlockFromHistogramCollection_requiredSampleCountForHistogram___block_invoke;
  v10[3] = &__block_descriptor_40_e26_B16__0__HKValueHistogram_8l;
  v10[4] = a4;
  objc_msgSend(v5, "hk_filter:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hk_map:", &__block_literal_global_74);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v8, "setChartPoints:", v7);

  return v8;
}

BOOL __108__HKBloodGlucosePercentInRangeDataSource__dataBlockFromHistogramCollection_requiredSampleCountForHistogram___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "totalSampleCount") >= *(_QWORD *)(a1 + 32);
}

_HKBloodGlucosePercentInRangeChartPoint *__108__HKBloodGlucosePercentInRangeDataSource__dataBlockFromHistogramCollection_requiredSampleCountForHistogram___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HKInteractiveChartBloodGlucosePercentInRangeData *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _HKBloodGlucosePercentInRangeChartPoint *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _HKBloodGlucosePercentInRangeChartPoint *v17;

  v2 = a2;
  v3 = objc_alloc_init(HKInteractiveChartBloodGlucosePercentInRangeData);
  objc_msgSend(v2, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartBloodGlucosePercentInRangeData setCountInLevel2Hypoglycemia:](v3, "setCountInLevel2Hypoglycemia:", objc_msgSend(v5, "count"));

  objc_msgSend(v2, "segments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartBloodGlucosePercentInRangeData setCountInLevel1Hypoglycemia:](v3, "setCountInLevel1Hypoglycemia:", objc_msgSend(v7, "count"));

  objc_msgSend(v2, "segments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartBloodGlucosePercentInRangeData setCountInEuglycemia:](v3, "setCountInEuglycemia:", objc_msgSend(v9, "count"));

  objc_msgSend(v2, "segments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartBloodGlucosePercentInRangeData setCountInHyperglycemia:](v3, "setCountInHyperglycemia:", objc_msgSend(v11, "count"));

  v12 = [_HKBloodGlucosePercentInRangeChartPoint alloc];
  objc_msgSend(v2, "dateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_HKBloodGlucosePercentInRangeChartPoint initWithStartDate:endDate:userInfo:](v12, "initWithStartDate:endDate:userInfo:", v14, v16, v3);

  return v17;
}

- (int64_t)_requiredSampleCountForHistogramForStatisticsInterval:(id)a3
{
  double v3;

  objc_msgSend(a3, "hk_approximateDuration");
  if (v3 <= (double)(unint64_t)*MEMORY[0x1E0CB4790])
    return 9;
  else
    return 202;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
  objc_storeStrong((id *)&self->_unitController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
}

@end
