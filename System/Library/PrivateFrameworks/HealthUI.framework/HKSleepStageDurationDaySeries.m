@implementation HKSleepStageDurationDaySeries

- (HKSleepStageDurationDaySeries)init
{
  HKSleepStageDurationDaySeries *v2;
  uint64_t v3;
  NSCalendar *currentCalendar;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSleepStageDurationDaySeries;
  v2 = -[HKSleepStageDurationSeries init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v2->_currentCalendar;
    v2->_currentCalendar = (NSCalendar *)v3;

  }
  return v2;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v25;
  id obj;
  uint64_t v27;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  int64_t resolution;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  objc_msgSend(a3, "chartPoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepStageDurationDaySeries.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  v25 = v9;
  objc_msgSend(v9, "transform");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transform");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v11;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v32)
  {
    v27 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[HKSleepStageDurationDaySeries currentCalendar](self, "currentCalendar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "xValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "startOfDayForDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "awakeValue");
        -[HKSleepStageDurationDaySeries _buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:](self, "_buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:", 2, 0, v16, v31, v30, v17);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v33);
        objc_msgSend(v13, "asleepRemValue");
        -[HKSleepStageDurationDaySeries _buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:](self, "_buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:", 5, 1, v16, v31, v30, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v18);
        objc_msgSend(v13, "asleepCoreValue");
        -[HKSleepStageDurationDaySeries _buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:](self, "_buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:", 3, 2, v16, v31, v30, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v19);
        objc_msgSend(v13, "asleepDeepValue");
        -[HKSleepStageDurationDaySeries _buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:](self, "_buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:", 4, 3, v16, v31, v30, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v20);

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v32);
  }

  v34 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v29, &v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3
{
  double v3;

  objc_msgSend(a3, "canonicalSize");
  return vcvtmd_s64_f64(v3 / fmax(v3 * 0.125, 1.0));
}

- (id)_buildSleepDurationCoordinateWithDurationValue:(double)a3 sleepValue:(int64_t)a4 barLocationIndex:(int64_t)a5 startOfCalendarDay:(id)a6 xAxisTransform:(id)a7 yAxisTransform:(id)a8 userInfo:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  HKSleepDurationCoordinate *v38;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  -[HKSleepStageDurationDaySeries currentCalendar](self, "currentCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKCategoricalDateAxis datePositionForCategoryIndex:categoryCount:startDate:calendar:](HKCategoricalDateAxis, "datePositionForCategoryIndex:categoryCount:startDate:calendar:", a5, 4, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "coordinateForValue:", v21);
  v23 = v22;

  objc_msgSend(v17, "coordinateForValue:", &unk_1E9CECF50);
  v25 = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "coordinateForValue:", v26);
  v28 = v27;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v23, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v29;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v23, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");

  -[HKSleepStageDurationSeries highlightedSleepStage](self, "highlightedSleepStage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (int)objc_msgSend(v33, "intValue");

  if (v34 != a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v23, v25);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "insertObject:atIndex:", v35, 1);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v16, "copyWithAnnotationOptions:", HKSleepChartPointFormatterOptionsForSleepAnalysis(v36));

  v38 = -[HKSleepDurationCoordinate initWithStackPoints:goalLineYValue:highlighted:userInfo:]([HKSleepDurationCoordinate alloc], "initWithStackPoints:goalLineYValue:highlighted:userInfo:", v32, 0, 0, v37);
  return v38;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
}

@end
