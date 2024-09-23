@implementation HKScoredAssessmentDataSource

- (id)_chartPointsWithSamples:(id)a3 sourceTimeZone:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  HKLevelCategoryChartPoint *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t (**v25)(_QWORD, _QWORD);
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v27;
  void *v28;
  void *v29;
  HKGraphSeriesDataBlock *v30;
  id obj;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = v8;
    v33 = *(_QWORD *)v36;
    v10 = 0x1E0CB3000uLL;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
        v13 = objc_alloc_init(HKLevelCategoryChartPoint);
        v14 = objc_msgSend(v12, "hk_integerValue");
        objc_msgSend(v12, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hk_dateFromSourceTimeZone:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLevelCategoryChartPoint setStartDate:](v13, "setStartDate:", v16);

        objc_msgSend(v12, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hk_dateFromSourceTimeZone:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLevelCategoryChartPoint setEndDate:](v13, "setEndDate:", v18);

        -[HKLevelCategoryDataSource valueOrder](self, "valueOrder");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = *(void **)(v10 + 2024);
        if (v19)
        {
          -[HKLevelCategoryDataSource valueOrder](self, "valueOrder");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v10 + 2024), "numberWithInteger:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "indexOfObject:", v22));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKLevelCategoryChartPoint setYValue:](v13, "setYValue:", v23);

        }
        else
        {
          objc_msgSend(*(id *)(v10 + 2024), "numberWithInteger:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKLevelCategoryChartPoint setYValue:](v13, "setYValue:", v21);
        }

        -[HKLevelCategoryChartPoint setPointStyle:](v13, "setPointStyle:", 0);
        -[HKLevelCategoryDataSource pointStyleBlock](self, "pointStyleBlock");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          -[HKLevelCategoryDataSource pointStyleBlock](self, "pointStyleBlock");
          v25 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[HKLevelCategoryChartPoint setPointStyle:](v13, "setPointStyle:", ((uint64_t (**)(_QWORD, void *))v25)[2](v25, v12));

        }
        -[HKLevelCategoryDataSource userInfoCreationBlock](self, "userInfoCreationBlock");
        v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "endDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *, void *, _QWORD))v26)[2](v26, v14, v27, v28, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLevelCategoryChartPoint setUserInfo:](v13, "setUserInfo:", v29);

        objc_msgSend(v34, "addObject:", v13);
        ++v11;
        v10 = 0x1E0CB3000;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v9);
  }

  v30 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v30, "setChartPoints:", v34);

  return v30;
}

@end
