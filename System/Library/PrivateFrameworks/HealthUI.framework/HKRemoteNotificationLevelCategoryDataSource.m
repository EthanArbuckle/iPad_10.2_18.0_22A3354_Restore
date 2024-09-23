@implementation HKRemoteNotificationLevelCategoryDataSource

- (HKRemoteNotificationLevelCategoryDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  id v6;
  HKRemoteNotificationLevelCategoryDataSource *v7;
  HKRemoteNotificationLevelCategoryDataSource *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKRemoteNotificationLevelCategoryDataSource;
  v7 = -[HKHealthQueryChartCacheDataSource initWithDisplayType:healthStore:](&v13, sel_initWithDisplayType_healthStore_, v6, a4);
  v8 = v7;
  if (v7)
    -[HKLevelCategoryDataSource setUserInfoCreationBlock:](v7, "setUserInfoCreationBlock:", &__block_literal_global_88);
  objc_msgSend(v6, "objectType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "objectType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLevelCategoryDataSource setSampleType:](v8, "setSampleType:", v11);

  }
  return v8;
}

HKInteractiveChartCategoryValueData *__79__HKRemoteNotificationLevelCategoryDataSource_initWithDisplayType_healthStore___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  HKInteractiveChartCategoryValueData *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HKInteractiveChartCategoryValueData);
  -[HKInteractiveChartCategoryValueData setValue:](v8, "setValue:", a2);
  -[HKInteractiveChartCategoryValueData setStartDate:](v8, "setStartDate:", v7);

  -[HKInteractiveChartCategoryValueData setEndDate:](v8, "setEndDate:", v6);
  return v8;
}

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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
        objc_msgSend(v12, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hk_dateFromSourceTimeZone:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLevelCategoryChartPoint setStartDate:](v13, "setStartDate:", v15);

        objc_msgSend(v12, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hk_dateFromSourceTimeZone:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLevelCategoryChartPoint setEndDate:](v13, "setEndDate:", v17);

        v18 = objc_msgSend(v12, "hk_integerValue");
        -[HKLevelCategoryDataSource valueOrder](self, "valueOrder");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = *(void **)(v10 + 2024);
        if (v19)
        {
          -[HKLevelCategoryDataSource valueOrder](self, "valueOrder");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v10 + 2024), "numberWithInteger:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "indexOfObject:", v22));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKLevelCategoryChartPoint setYValue:](v13, "setYValue:", v23);

        }
        else
        {
          objc_msgSend(*(id *)(v10 + 2024), "numberWithInteger:", v18);
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
        ((void (**)(_QWORD, uint64_t, void *, void *, _QWORD))v26)[2](v26, v18, v27, v28, 0);
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

- (id)chartPointsFromNotificationQueryData:(id)a3 sourceTimeZoneFromModel:(id)a4
{
  id v6;
  id v7;
  HKCodableNotificationDataSourceQueryData *v8;
  void *v9;
  HKCodableNotificationDataSourceQueryData *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = [HKCodableNotificationDataSourceQueryData alloc];
  objc_msgSend(v7, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HKCodableNotificationDataSourceQueryData initWithData:](v8, "initWithData:", v9);
  -[HKCodableNotificationDataSourceQueryData samples](v10, "samples");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_map:", &__block_literal_global_191);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  -[HKRemoteNotificationLevelCategoryDataSource _chartPointsWithSamples:sourceTimeZone:](self, "_chartPointsWithSamples:sourceTimeZone:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __108__HKRemoteNotificationLevelCategoryDataSource_chartPointsFromNotificationQueryData_sourceTimeZoneFromModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6AD8], "createWithCodableNotificationSample:", a2);
}

@end
