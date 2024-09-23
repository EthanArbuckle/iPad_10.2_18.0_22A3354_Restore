@implementation HKBloodPressureDataSource

- (id)queryDescription
{
  return CFSTR("HKBloodPressure");
}

- (unint64_t)queryStatisticsOption
{
  return 12;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[4];
  id v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = a4;
  v7 = (void *)MEMORY[0x1E0CB6A78];
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateForSamplesWithStartDate:endDate:options:", v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CB6C80]);
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKBloodPressureDataSource queryStatisticsOption](self, "queryStatisticsOption");
  objc_msgSend(v6, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statisticsInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v12, v10, v13, v14, v15);

  v17 = objc_alloc(MEMORY[0x1E0CB6C80]);
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HKBloodPressureDataSource queryStatisticsOption](self, "queryStatisticsOption");
  objc_msgSend(v6, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statisticsInterval");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v17, "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v18, v10, v19, v20, v21);

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__10;
  v54[4] = __Block_byref_object_dispose__10;
  v55 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__10;
  v52[4] = __Block_byref_object_dispose__10;
  v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__10;
  v50[4] = __Block_byref_object_dispose__10;
  v51 = 0;
  HKCreateSerialDispatchQueue();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB7028];
  v25 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke;
  v45[3] = &unk_1E9C42C38;
  v47 = v54;
  v48 = v52;
  v26 = v34;
  v46 = v26;
  v49 = v50;
  objc_msgSend(v24, "counterWithTargetCount:queue:completion:", 2, v23, v45);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v25;
  v40[1] = 3221225472;
  v40[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_2;
  v40[3] = &unk_1E9C42C88;
  v28 = v23;
  v41 = v28;
  v43 = v54;
  v44 = v50;
  v29 = v27;
  v42 = v29;
  objc_msgSend(v16, "setInitialResultsHandler:", v40);
  v35[0] = v25;
  v35[1] = 3221225472;
  v35[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_4;
  v35[3] = &unk_1E9C42C88;
  v30 = v28;
  v36 = v30;
  v38 = v52;
  v39 = v50;
  v31 = v29;
  v37 = v31;
  objc_msgSend(v22, "setInitialResultsHandler:", v35);
  objc_msgSend(v16, "setDebugIdentifier:", CFSTR("charting (bp systolic)"));
  objc_msgSend(v22, "setDebugIdentifier:", CFSTR("charting (bp diastolic)"));
  v56[0] = v16;
  v56[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(v54, 8);
  return v32;
}

void __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  HKCodableChartBloodPressureDataSourceQueryData *v4;

  v4 = objc_alloc_init(HKCodableChartBloodPressureDataSourceQueryData);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "codableCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartBloodPressureDataSourceQueryData setSystolicStatisticsCollection:](v4, "setSystolicStatisticsCollection:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "codableCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartBloodPressureDataSourceQueryData setDiastolicStatisticsCollection:](v4, "setDiastolicStatisticsCollection:", v3);

  (*(void (**)(void))(a1[4] + 16))();
}

void __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_3;
  block[3] = &unk_1E9C42C60;
  v17 = *(_QWORD *)(a1 + 56);
  v14 = v6;
  v15 = v7;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v16 = v12;
  v10 = v7;
  v11 = v6;
  dispatch_async(v8, block);

}

uint64_t __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (!v5)
    v4 = *(void **)(a1 + 40);
  objc_storeStrong(v3, v4);
  return objc_msgSend(*(id *)(a1 + 48), "decrementCounter");
}

void __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_5;
  block[3] = &unk_1E9C42C60;
  v17 = *(_QWORD *)(a1 + 56);
  v14 = v6;
  v15 = v7;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v16 = v12;
  v10 = v7;
  v11 = v6;
  dispatch_async(v8, block);

}

uint64_t __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (!v5)
    v4 = *(void **)(a1 + 40);
  objc_storeStrong(v3, v4);
  return objc_msgSend(*(id *)(a1 + 48), "decrementCounter");
}

- (id)_chartPointsWithSystolicResults:(id)a3 diastolicResults:(id)a4 blockStart:(id)a5 blockEnd:(id)a6 sourceTimeZone:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(void *, void *, id);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  HKBloodPressureChartPoint *v31;
  void *v32;
  HKHealthChartPoint *v33;
  void *v34;
  HKHealthChartPoint *v35;
  void *v36;
  void *v37;
  HKHealthChartPoint *v38;
  void *v39;
  HKHealthChartPoint *v40;
  void *v41;
  void (**userInfoCreationBlock)(id, void *, void *);
  void *v43;
  void *v44;
  void *v45;
  HKGraphSeriesDataBlock *v46;
  void (**v48)(void *, void *, id);
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  uint64_t v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD aBlock[4];
  id v63;
  id v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke;
  aBlock[3] = &unk_1E9C42D00;
  v18 = v14;
  v63 = v18;
  v19 = v15;
  v64 = v19;
  v20 = v17;
  v65 = v20;
  v21 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2](v21, v22, v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v12;
  objc_msgSend(v12, "enumerateStatisticsFromDate:toDate:withBlock:", v18, v19, v23);

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v21;
  v21[2](v21, v24, v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v18;
  v52 = v13;
  v50 = v19;
  objc_msgSend(v13, "enumerateStatisticsFromDate:toDate:withBlock:", v18, v19, v25);

  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mmHg"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v49 = v20;
  objc_msgSend(v20, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v27)
  {
    v28 = v27;
    v55 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v59 != v55)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v31 = objc_alloc_init(HKBloodPressureChartPoint);
        objc_msgSend(v30, "systolic");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v33 = [HKHealthChartPoint alloc];
          objc_msgSend(v30, "systolic");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[HKHealthChartPoint initWithStatistics:options:unit:displayType:sourceTimeZone:](v33, "initWithStatistics:options:unit:displayType:sourceTimeZone:", v34, -[HKBloodPressureDataSource queryStatisticsOption](self, "queryStatisticsOption"), v26, v57, v16);

          -[HKHealthChartPoint xValueAsGenericType](v35, "xValueAsGenericType");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKBloodPressureChartPoint setSystolicChartPoint:](v31, "setSystolicChartPoint:", v35);

        }
        else
        {
          v36 = 0;
        }
        objc_msgSend(v30, "diastolic");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v38 = [HKHealthChartPoint alloc];
          objc_msgSend(v30, "diastolic");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[HKHealthChartPoint initWithStatistics:options:unit:displayType:sourceTimeZone:](v38, "initWithStatistics:options:unit:displayType:sourceTimeZone:", v39, -[HKBloodPressureDataSource queryStatisticsOption](self, "queryStatisticsOption"), v26, v57, v16);

          if (!v36)
          {
            -[HKHealthChartPoint xValueAsGenericType](v40, "xValueAsGenericType");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[HKBloodPressureChartPoint setDiastolicChartPoint:](v31, "setDiastolicChartPoint:", v40);

        }
        objc_msgSend(v36, "hk_dateFromSourceTimeZone:", v16);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKBloodPressureChartPoint setDate:](v31, "setDate:", v41);

        userInfoCreationBlock = (void (**)(id, void *, void *))self->_userInfoCreationBlock;
        if (userInfoCreationBlock)
        {
          objc_msgSend(v30, "systolic");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "diastolic");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          userInfoCreationBlock[2](userInfoCreationBlock, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKBloodPressureChartPoint setUserInfo:](v31, "setUserInfo:", v45);

        }
        objc_msgSend(v56, "addObject:", v31);

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v28);
  }

  objc_msgSend(v56, "sortUsingComparator:", &__block_literal_global_42);
  v46 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v46, "setChartPoints:", v56);

  return v46;
}

id __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_2;
  aBlock[3] = &unk_1E9C42CD8;
  v12 = a1[4];
  v13 = a1[5];
  v14 = v6;
  v15 = a1[6];
  v16 = v5;
  v7 = v5;
  v8 = v6;
  v9 = _Block_copy(aBlock);

  return v9;
}

void __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_2(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(a1[4], "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(a1[5], "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend(a1[6], "statistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_3;
  v7[3] = &unk_1E9C42CB0;
  v10 = v3;
  v11 = v5;
  v8 = a1[7];
  v9 = a1[8];
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v13;
  _HKBloodPressureWrapper *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;
  v6 = *(double *)(a1 + 48);

  objc_msgSend(v15, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = *(double *)(a1 + 56);

  v11 = v15;
  if (v5 >= v6 && v9 <= v10)
  {
    objc_msgSend(v15, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
    v14 = (_HKBloodPressureWrapper *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v14 = objc_alloc_init(_HKBloodPressureWrapper);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v13);
    }
    if (objc_msgSend(*(id *)(a1 + 40), "code") == 16)
      -[_HKBloodPressureWrapper setSystolic:](v14, "setSystolic:", v15);
    else
      -[_HKBloodPressureWrapper setDiastolic:](v14, "setDiastolic:", v15);

    v11 = v15;
  }

}

uint64_t __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 1;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  HKBloodPressureDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C42D68;
  v28 = self;
  v29 = v10;
  v27 = v8;
  v12 = v10;
  v13 = v8;
  -[HKBloodPressureDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_224;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
        v12 = *MEMORY[0x1E0CB4AB8];
        objc_msgSend(v7, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412802;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v21, 0x20u);

      }
    }
    v14 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statisticsInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 3, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_224(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKCodableChartBloodPressureDataSourceQueryData *v9;
  void *v10;
  HKCodableChartBloodPressureDataSourceQueryData *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

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
  v9 = [HKCodableChartBloodPressureDataSourceQueryData alloc];
  objc_msgSend(v5, "queryDataObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKCodableChartBloodPressureDataSourceQueryData initWithData:](v9, "initWithData:", v10);

  v12 = (void *)MEMORY[0x1E0CB6C70];
  -[HKCodableChartBloodPressureDataSourceQueryData systolicStatisticsCollection](v11, "systolicStatisticsCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "statisticsCollectionWithCodableCollection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB6C70];
  -[HKCodableChartBloodPressureDataSourceQueryData diastolicStatisticsCollection](v11, "diastolicStatisticsCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "statisticsCollectionWithCodableCollection:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKBloodPressureDataSource _earliestDateForSystolicResults:diastolicResults:](self, "_earliestDateForSystolicResults:diastolicResults:", v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBloodPressureDataSource _latestDateForSystolicResults:diastolicResults:](self, "_latestDateForSystolicResults:diastolicResults:", v14, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBloodPressureDataSource _chartPointsWithSystolicResults:diastolicResults:blockStart:blockEnd:sourceTimeZone:](self, "_chartPointsWithSystolicResults:diastolicResults:blockStart:blockEnd:sourceTimeZone:", v14, v17, v18, v19, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_earliestDateForSystolicResults:(id)a3 diastolicResults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  objc_msgSend(a3, "statistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "statistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12 = v8;
    if (v11)
    {
      if (objc_msgSend(v8, "hk_isBeforeDate:", v11))
        v12 = v8;
      else
        v12 = v11;
    }
    v13 = v12;

    v11 = v13;
  }

  return v11;
}

- (id)_latestDateForSystolicResults:(id)a3 diastolicResults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  objc_msgSend(a3, "statistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "statistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12 = v8;
    if (v11)
    {
      if (objc_msgSend(v8, "hk_isBeforeDate:", v11))
        v12 = v11;
      else
        v12 = v8;
    }
    v13 = v12;

    v11 = v13;
  }

  return v11;
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
}

void __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
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
  v7 = *MEMORY[0x1E0CB4AB8];
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

@end
