@implementation HKRemoteCardioFitnessDataSource

- (HKRemoteCardioFitnessDataSource)initWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8;
  id v9;
  HKRemoteCardioFitnessDataSource *v10;
  HKRemoteCardioFitnessDataSource *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKRemoteCardioFitnessDataSource;
  v10 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:](&v14, sel_initWithUnitController_options_displayType_healthStore_, v8, 2, v9, a5);
  v11 = v10;
  if (v10)
  {
    -[HKRemoteCardioFitnessDataSource _userInfoBlockWithUnitController:displayType:](v10, "_userInfoBlockWithUnitController:displayType:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v11, "setUserInfoCreationBlock:", v12);

  }
  return v11;
}

- (id)_userInfoBlockWithUnitController:(id)a3 displayType:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__HKRemoteCardioFitnessDataSource__userInfoBlockWithUnitController_displayType___block_invoke;
  v11[3] = &unk_1E9C40520;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _Block_copy(v11);

  return v9;
}

HKInteractiveChartSinglePointData *__80__HKRemoteCardioFitnessDataSource__userInfoBlockWithUnitController_displayType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  HKInteractiveChartSinglePointData *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unitForDisplayType:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v4);
  v7 = v6;

  v8 = objc_msgSend(v3, "recordCount");
  v9 = objc_alloc_init(HKInteractiveChartSinglePointData);
  -[HKInteractiveChartSinglePointData setValue:](v9, "setValue:", v7);
  -[HKInteractiveChartSinglePointData setUnit:](v9, "setUnit:", v4);
  objc_msgSend(v3, "minQuantity");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v3, "maxQuantity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HKInteractiveChartSinglePointData setRepresentsRange:](v9, "setRepresentsRange:", 1);
      objc_msgSend(v3, "minQuantity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValueForUnit:", v4);
      -[HKInteractiveChartSinglePointData setMinValue:](v9, "setMinValue:");

      objc_msgSend(v3, "maxQuantity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValueForUnit:", v4);
      -[HKInteractiveChartSinglePointData setMaxValue:](v9, "setMaxValue:");

      v8 = objc_msgSend(v3, "recordCount");
    }
  }
  -[HKInteractiveChartSinglePointData setRecordCount:](v9, "setRecordCount:", v8);
  objc_msgSend(v3, "statisticsInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v9, "setStatisticsInterval:", v15);

  return v9;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  HKRemoteCardioFitnessDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E9C40EC8;
  v26 = v8;
  v29 = v10;
  v12 = v9;
  v27 = v12;
  v28 = self;
  v13 = v10;
  v14 = v8;
  -[HKQuantityTypeDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v14, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeQuery:", v16);

  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_194;
  v22[3] = &unk_1E9C3FC50;
  v23 = v12;
  v24 = v15;
  v17 = v15;
  v18 = v12;
  v19 = _Block_copy(v22);
  v20 = _Block_copy(v19);

  return v20;
}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HKCodableChartQuantityDataSourceQueryData *v15;
  HKCodableStatisticsCollection *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HKCodableChartQuantityDataSourceQueryData *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  HKCodableChartQuantityDataSourceQueryData *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_INFO))
      {
        v9 = *(void **)(a1 + 32);
        v10 = v8;
        HKStringForChartDataSourceQueryRequestAudience(objc_msgSend(v9, "audience"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *MEMORY[0x1E0CB5DA0];
        objc_msgSend(v7, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v11;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v13;
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", buf, 0x20u);

      }
    }
    objc_msgSend(v5, "hk_map:", &__block_literal_global_14);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(HKCodableChartQuantityDataSourceQueryData);
    v16 = objc_alloc_init(HKCodableStatisticsCollection);
    -[HKCodableChartQuantityDataSourceQueryData setStatisticsCollection:](v15, "setStatisticsCollection:", v16);

    v17 = (void *)objc_msgSend(v14, "mutableCopy");
    -[HKCodableChartQuantityDataSourceQueryData statisticsCollection](v15, "statisticsCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStatistics:", v17);

    v19 = objc_alloc(MEMORY[0x1E0CB6708]);
    v20 = (void *)objc_msgSend(v19, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x1E0CB5000], *(_QWORD *)(a1 + 40));
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
    v23[3] = &unk_1E9C40EA0;
    v24 = *(id *)(a1 + 40);
    v25 = v15;
    v26 = *(_QWORD *)(a1 + 48);
    v27 = *(id *)(a1 + 32);
    v28 = *(id *)(a1 + 56);
    v21 = v15;
    objc_msgSend(v20, "isCurrentOnboardingVersionCompletedWithCompletion:", v23);

  }
  else
  {
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v22, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_184(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableStatistics");
}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  HKCodableChartCardioFitnessQueryData *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2_cold_1((uint64_t)v6, v8);
    v7 = 0;
  }
  v9 = objc_alloc_init(HKCodableChartCardioFitnessQueryData);
  v10 = (void *)MEMORY[0x1E0CB6368];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cardioFitnessPropertiesForDate:healthStore:", v11, *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v12)
  {
    -[HKCodableChartCardioFitnessQueryData setCardioFitnessLevelEnabled:](v9, "setCardioFitnessLevelEnabled:", 1);
    -[HKCodableChartCardioFitnessQueryData setBiologicalSex:](v9, "setBiologicalSex:", objc_msgSend(v12, "biologicalSex"));
    v13 = objc_msgSend(v12, "age");
  }
  else
  {
    -[HKCodableChartCardioFitnessQueryData setCardioFitnessLevelEnabled:](v9, "setCardioFitnessLevelEnabled:", 0);
    -[HKCodableChartCardioFitnessQueryData setBiologicalSex:](v9, "setBiologicalSex:", 0);
    v13 = 0;
  }
  -[HKCodableChartCardioFitnessQueryData setAge:](v9, "setAge:", v13);
  -[HKCodableChartCardioFitnessQueryData setQuantityData:](v9, "setQuantityData:", *(_QWORD *)(a1 + 40));
  v14 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "statisticsInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartCardioFitnessQueryData data](v9, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 12, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_194(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopQuery:", v2);

}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKCodableChartCardioFitnessQueryData *v9;
  void *v10;
  HKCodableChartCardioFitnessQueryData *v11;
  void *v12;
  HKGraphSeriesDataBlock *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v5 = a3;
  if (objc_msgSend(v5, "hasTimeZoneName"))
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E80]);
    objc_msgSend(v5, "timeZoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithName:", v7);

  }
  else
  {
    v8 = 0;
  }
  v9 = [HKCodableChartCardioFitnessQueryData alloc];
  objc_msgSend(v5, "queryDataObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKCodableChartCardioFitnessQueryData initWithData:](v9, "initWithData:", v10);

  if (-[HKCodableChartCardioFitnessQueryData cardioFitnessLevelEnabled](v11, "cardioFitnessLevelEnabled"))
  {
    -[HKRemoteCardioFitnessDataSource _cardioFitnessUserInfoCreationBlockWithAge:biologicalSex:](self, "_cardioFitnessUserInfoCreationBlockWithAge:biologicalSex:", -[HKCodableChartCardioFitnessQueryData age](v11, "age"), -[HKCodableChartCardioFitnessQueryData biologicalSex](v11, "biologicalSex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSource setUserInfoCreationBlock:](self, "setUserInfoCreationBlock:", v12);

  }
  v13 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKCodableChartCardioFitnessQueryData quantityData](v11, "quantityData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "statisticsCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "statistics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__HKRemoteCardioFitnessDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke;
  v20[3] = &unk_1E9C40EF0;
  v21 = v8;
  v17 = v8;
  objc_msgSend(v16, "hk_map:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeriesDataBlock setChartPoints:](v13, "setChartPoints:", v18);

  return v13;
}

HKQuantityTypeDataSourceValue *__83__HKRemoteCardioFitnessDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQuantityTypeDataSourceValue quantityTypeDataSourceValueWithCodableStatistics:sourceTimeZone:](HKQuantityTypeDataSourceValue, "quantityTypeDataSourceValueWithCodableStatistics:sourceTimeZone:", a2, *(_QWORD *)(a1 + 32));
}

- (id)_cardioFitnessUserInfoCreationBlockWithAge:(int64_t)a3 biologicalSex:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  int64_t v12;
  int64_t v13;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ml/kg*min"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HKRemoteCardioFitnessDataSource__cardioFitnessUserInfoCreationBlockWithAge_biologicalSex___block_invoke;
  aBlock[3] = &unk_1E9C40F18;
  v11 = v6;
  v12 = a4;
  v13 = a3;
  v7 = v6;
  v8 = _Block_copy(aBlock);

  return v8;
}

HKInteractiveChartCardioFitnessData *__92__HKRemoteCardioFitnessDataSource__cardioFitnessUserInfoCreationBlockWithAge_biologicalSex___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  HKInteractiveChartCardioFitnessData *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  v3 = a2;
  v4 = objc_alloc_init(HKInteractiveChartCardioFitnessData);
  objc_msgSend(v3, "averageQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", a1[4]);
  v7 = v6;

  -[HKInteractiveChartSinglePointData setValue:](v4, "setValue:", v7);
  -[HKInteractiveChartSinglePointData setUnit:](v4, "setUnit:", a1[4]);
  objc_msgSend(v3, "minQuantity");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v3, "maxQuantity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HKInteractiveChartSinglePointData setRepresentsRange:](v4, "setRepresentsRange:", 1);
      objc_msgSend(v3, "minQuantity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValueForUnit:", a1[4]);
      -[HKInteractiveChartSinglePointData setMinValue:](v4, "setMinValue:");

      objc_msgSend(v3, "maxQuantity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValueForUnit:", a1[4]);
      -[HKInteractiveChartSinglePointData setMaxValue:](v4, "setMaxValue:");

    }
  }
  -[HKInteractiveChartSinglePointData setRecordCount:](v4, "setRecordCount:", objc_msgSend(v3, "recordCount"));
  objc_msgSend(v3, "statisticsInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v4, "setStatisticsInterval:", v13);

  v14 = +[HKCardioFitnessUtilities cardioFitnessLevelForVO2Max:biologicalSex:age:](HKCardioFitnessUtilities, "cardioFitnessLevelForVO2Max:biologicalSex:age:", a1[5], a1[6], v7);
  -[HKInteractiveChartCardioFitnessData setBiologicalSex:](v4, "setBiologicalSex:", a1[5]);
  -[HKInteractiveChartCardioFitnessData setAge:](v4, "setAge:", a1[6]);
  -[HKInteractiveChartCardioFitnessData setClassification:](v4, "setClassification:", v14);
  -[HKInteractiveChartCardioFitnessData setSampleCount:](v4, "setSampleCount:", objc_msgSend(v3, "recordCount"));

  return v4;
}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  HKStringForChartDataSourceQueryRequestAudience(objc_msgSend(v4, "audience"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB5DA0];
  objc_msgSend(a3, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_1D7813000, v5, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v9, 0x20u);

}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Error determining onboarding status for Cardio Fitness: %@", (uint8_t *)&v2, 0xCu);
}

@end
