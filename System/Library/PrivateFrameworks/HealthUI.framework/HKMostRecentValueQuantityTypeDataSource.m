@implementation HKMostRecentValueQuantityTypeDataSource

- (HKMostRecentValueQuantityTypeDataSource)initWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 currentCalendar:(id)a6
{
  return -[HKMostRecentValueQuantityTypeDataSource initWithUnitController:displayType:healthStore:currentCalendar:attenuated:](self, "initWithUnitController:displayType:healthStore:currentCalendar:attenuated:", a3, a4, a5, a6, 0);
}

- (HKMostRecentValueQuantityTypeDataSource)initWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 currentCalendar:(id)a6 attenuated:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKMostRecentValueQuantityTypeDataSource *v17;
  objc_super v19;

  objc_storeStrong((id *)&self->_currentCalendar, a6);
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  self->_attenuated = a7;
  v19.receiver = self;
  v19.super_class = (Class)HKMostRecentValueQuantityTypeDataSource;
  v17 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:](&v19, sel_initWithUnitController_options_displayType_healthStore_, v16, 32, v15, v14);

  return v17;
}

- (id)queryDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKQuantityTypeDataSource quantityType](self, "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKMostRecentValueQuantity(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[5];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E9C42030;
  aBlock[4] = self;
  v8 = v7;
  v21 = v8;
  v9 = v6;
  v20 = v9;
  v10 = _Block_copy(aBlock);
  if (self->_attenuated
    && (-[HKQuantityTypeDataSource quantityType](self, "quantityType"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "identifier"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = (void *)*MEMORY[0x1E0CB5C78],
        v12,
        v11,
        v12 == v13))
  {
    objc_msgSend(MEMORY[0x1E0CB6780], "queryForMostRecentAttenuatedEAEQuantityWithHealthStore:completion:", self->super.super._healthStore, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB6780];
    -[HKQuantityTypeDataSource quantityType](self, "quantityType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queryForMostRecentQuantityOfType:healthStore:predicate:completion:", v15, self->super.super._healthStore, 0, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v16, "setDebugIdentifier:", CFSTR("charting (most recent)"));
  v22[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB5378];
    v13 = *MEMORY[0x1E0CB5378];
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v12);
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(a1, v12);
    }
    v23 = *(_QWORD *)(a1 + 48);
    if (v23)
      (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v10);
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(*(id *)(a1 + 40), "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithStartDate:endDate:", v15, v16);

    if ((objc_msgSend(v8, "intersectsDateInterval:", v17) & 1) != 0)
    {
      v18 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "statisticsInterval");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_dataSourceValueFromMostRecentQuantity:quantityDateInterval:statisticsInterval:", v7, v8, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = *(_QWORD *)(a1 + 48);
      if (v21)
      {
        v25[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v22, 0);

      }
    }
    else
    {
      v24 = *(_QWORD *)(a1 + 48);
      if (v24)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v24 + 16))(v24, MEMORY[0x1E0C9AA60], 0);
    }

  }
}

- (id)_dataSourceValueFromMostRecentQuantity:(id)a3 quantityDateInterval:(id)a4 statisticsInterval:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKQuantityTypeDataSourceValue *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(HKQuantityTypeDataSourceValue);
  -[HKQuantityTypeDataSource quantityType](self, "quantityType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityTypeDataSourceValue setQuantityType:](v11, "setQuantityType:", v12);

  if (v8)
  {
    objc_msgSend(v9, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMostRecentValueQuantityTypeDataSource _middleDateFromInterval:endDate:](self, "_middleDateFromInterval:endDate:", v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HKQuantityTypeDataSourceValue setStartDate:](v11, "setStartDate:", v14);
      -[HKQuantityTypeDataSourceValue setEndDate:](v11, "setEndDate:", v14);
    }
    else
    {
      objc_msgSend(v9, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setStartDate:](v11, "setStartDate:", v15);

      objc_msgSend(v9, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setEndDate:](v11, "setEndDate:", v16);

    }
    -[HKQuantityTypeDataSourceValue setMostRecentQuantity:](v11, "setMostRecentQuantity:", v8);

  }
  return v11;
}

- (id)_middleDateFromInterval:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;

  v7 = a3;
  v8 = a4;
  -[HKMostRecentValueQuantityTypeDataSource _intervalFromZoomLevel:](self, "_intervalFromZoomLevel:", 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMostRecentValueQuantityTypeDataSource _intervalFromZoomLevel:](self, "_intervalFromZoomLevel:", 6);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMostRecentValueQuantityTypeDataSource _intervalFromZoomLevel:resolution:](self, "_intervalFromZoomLevel:resolution:", 5, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMostRecentValueQuantityTypeDataSource _intervalFromZoomLevel:resolution:](self, "_intervalFromZoomLevel:resolution:", 5, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMostRecentValueQuantityTypeDataSource _intervalFromZoomLevel:](self, "_intervalFromZoomLevel:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMostRecentValueQuantityTypeDataSource _intervalFromZoomLevel:](self, "_intervalFromZoomLevel:", 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMostRecentValueQuantityTypeDataSource _intervalFromZoomLevel:](self, "_intervalFromZoomLevel:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMostRecentValueQuantityTypeDataSource _intervalFromZoomLevel:](self, "_intervalFromZoomLevel:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMostRecentValueQuantityTypeDataSource currentCalendar](self, "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKMostRecentValueQuantityTypeDataSource _interval:isEqualToInterval:](self, "_interval:isEqualToInterval:", v7, v9))
  {
    objc_msgSend(v14, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v8, objc_msgSend(v9, "minute"), 0);
    v60 = v7;
    v15 = v12;
    v16 = v10;
    v17 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v8, objc_msgSend(v9, "minute"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIMidDate(v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v17;
    v10 = v16;
    v12 = v15;
    v7 = v60;
LABEL_3:
    v21 = v14;
    goto LABEL_17;
  }
  v61 = v14;
  if (-[HKMostRecentValueQuantityTypeDataSource _interval:isEqualToInterval:](self, "_interval:isEqualToInterval:", v7, v64))
  {
    objc_msgSend(v14, "hk_startOfHourForDate:addingHours:", v8, 0);
    v57 = v13;
    v22 = v8;
    v23 = v9;
    v24 = v7;
    v25 = v12;
    v26 = v10;
    v27 = v11;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_startOfHourForDate:addingHours:", v22, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v35 = v29;
    HKUIMidDate(v28, v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v14;
    v11 = v27;
    v10 = v26;
    v12 = v25;
    v7 = v24;
    v9 = v23;
    v8 = v22;
    v13 = v57;
    goto LABEL_17;
  }
  if (-[HKMostRecentValueQuantityTypeDataSource _interval:isEqualToInterval:](self, "_interval:isEqualToInterval:", v7, v63))
  {
    goto LABEL_15;
  }
  if (-[HKMostRecentValueQuantityTypeDataSource _interval:isEqualToInterval:](self, "_interval:isEqualToInterval:", v7, v10))
  {
    v56 = v12;
    v58 = v11;
    v67 = 0uLL;
    v68 = 0;
    HKGraphSeriesDataBlockPathContainingDate(v8, 5, 1, &v67);
    v65 = v67;
    v66 = v68;
    HKGraphSeriesDataBlockPathMinimumX((uint64_t *)&v65);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "hk_dateBeforeDateForCalendar:rangeUnit:", v14, 16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "hk_isBeforeOrEqualToDate:", v8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMostRecentValueQuantityTypeDataSource.m"), 158, CFSTR("HKMostRecentValueQuantityTypeDataSource: anchor date must be before end date"));

    }
    v31 = v30;
    v32 = v31;
    v33 = v31;
    if (objc_msgSend(v31, "hk_isBeforeDate:", v8))
    {
      v33 = v31;
      v34 = v31;
      do
      {
        v32 = v33;

        objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v10, v32, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v32;
      }
      while ((objc_msgSend(v33, "hk_isBeforeDate:", v8) & 1) != 0);
    }
    HKUIMidDate(v32, v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v56;
    v11 = v58;
    goto LABEL_3;
  }
  if (-[HKMostRecentValueQuantityTypeDataSource _interval:isEqualToInterval:](self, "_interval:isEqualToInterval:", v7, v11))
  {
LABEL_15:
    objc_msgSend(v14, "hk_startOfDateByAddingDays:toDate:", 0, v8);
    v57 = v13;
    v22 = v8;
    v23 = v9;
    v24 = v7;
    v25 = v12;
    v26 = v10;
    v27 = v11;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_startOfDateByAddingDays:toDate:", 1, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v21 = v14;
  if (-[HKMostRecentValueQuantityTypeDataSource _interval:isEqualToInterval:](self, "_interval:isEqualToInterval:", v7, v62))
  {
    objc_msgSend(v14, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v14, "firstWeekday"), v8, 0);
    v59 = v9;
    v37 = v7;
    v38 = v12;
    v39 = v10;
    v40 = v11;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v14, "firstWeekday"), v8, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIMidDate(v41, v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v14;
    v11 = v40;
    v10 = v39;
    v12 = v38;
    v7 = v37;
    v9 = v59;
  }
  else
  {
    if (-[HKMostRecentValueQuantityTypeDataSource _interval:isEqualToInterval:](self, "_interval:isEqualToInterval:", v7, v12))
    {
      objc_msgSend(v14, "hk_startOfMonthForDate:", v8);
      v43 = v13;
      v44 = v8;
      v45 = v9;
      v46 = v7;
      v47 = v12;
      v48 = v10;
      v49 = v11;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hk_startOfMonthForDate:addingMonths:", v44, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[HKMostRecentValueQuantityTypeDataSource _interval:isEqualToInterval:](self, "_interval:isEqualToInterval:", v7, v13))
      {
        v20 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v14, "hk_startOfYearForDate:addingYears:", v8, 0);
      v43 = v13;
      v44 = v8;
      v45 = v9;
      v46 = v7;
      v47 = v12;
      v48 = v10;
      v49 = v11;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hk_startOfYearForDate:addingYears:", v44, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v52 = v51;
    HKUIMidDate(v50, v51);
    v53 = objc_claimAutoreleasedReturnValue();

    v21 = v61;
    v11 = v49;
    v10 = v48;
    v12 = v47;
    v7 = v46;
    v9 = v45;
    v8 = v44;
    v13 = v43;
    v20 = (void *)v53;
  }
LABEL_17:

  return v20;
}

- (id)_intervalFromZoomLevel:(int64_t)a3
{
  return -[HKMostRecentValueQuantityTypeDataSource _intervalFromZoomLevel:resolution:](self, "_intervalFromZoomLevel:resolution:", a3, 0);
}

- (id)_intervalFromZoomLevel:(int64_t)a3 resolution:(int64_t)a4
{
  void *v5;
  void *v6;

  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seriesPointIntervalComponentsAtResolution:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_interval:(id)a3 isEqualToInterval:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(a3, "hk_approximateDuration");
  v7 = v6;
  objc_msgSend(v5, "hk_approximateDuration");
  v9 = v8;

  return v7 == v9;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (BOOL)attenuated
{
  return self->_attenuated;
}

- (void)setAttenuated:(BOOL)a3
{
  self->_attenuated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
}

void __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v2, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEBUG, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

void __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v2, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1D7813000, v3, OS_LOG_TYPE_ERROR, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

@end
