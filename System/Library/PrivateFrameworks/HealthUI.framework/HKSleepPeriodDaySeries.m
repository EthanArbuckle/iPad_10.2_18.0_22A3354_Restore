@implementation HKSleepPeriodDaySeries

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v22;
  __int128 v23;
  int64_t resolution;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "chartPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepPeriodDaySeries.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__HKSleepPeriodDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C453A8;
  v26 = v15;
  v27 = v14;
  v28 = v16;
  v17 = v16;
  v18 = v14;
  v19 = v15;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
  v23 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v17, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __68__HKSleepPeriodDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  HKSleepPeriodCoordinate *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HKSleepPeriodCoordinate *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  HKSleepPeriodCoordinate *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  HKSleepPeriodCoordinate *v34;
  id v35;

  v35 = a2;
  objc_msgSend(v35, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v35, "upperGoal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v35, "upperGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "coordinateForValue:", v7);
      objc_msgSend(v5, "numberWithDouble:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v35, "lowerGoal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v35, "lowerGoal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "coordinateForValue:", v11);
      objc_msgSend(v9, "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v35, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithAnnotationOptions:", 2);
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v35, "xValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateByAddingTimeInterval:", 21600.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinateForValue:", v16);
    v18 = v17;

    v19 = [HKSleepPeriodCoordinate alloc];
    objc_msgSend(v35, "asleepOffsets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "allYValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v35, "highlighted");
    v23 = -[HKSleepPeriodCoordinate initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:](v19, "initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:", v20, MEMORY[0x1E0C9AA60], v21, v4, v8, v22, v18, v13);

    v24 = (void *)objc_msgSend(v12, "copyWithAnnotationOptions:", 1);
    v25 = *(void **)(a1 + 40);
    objc_msgSend(v35, "xValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateByAddingTimeInterval:", -21600.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "coordinateForValue:", v27);
    v29 = v28;

    v30 = [HKSleepPeriodCoordinate alloc];
    objc_msgSend(v35, "inBedOffsets");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "allYValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v35, "highlighted");
    v34 = -[HKSleepPeriodCoordinate initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:](v30, "initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:", MEMORY[0x1E0C9AA60], v31, v32, v4, v8, v33, v29, v24);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v23);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v34);

  }
}

- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3
{
  double v3;

  objc_msgSend(a3, "canonicalSize");
  return vcvtmd_s64_f64(v3 / fmax(v3 * 0.25, 1.0));
}

- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5
{
  double v5;
  double v6;

  v5 = a4.size.width / (double)a3;
  v6 = v5 * 0.5;
  if (v5 * 0.5 <= a5)
    v6 = a5;
  return round(v5 - v6);
}

- (void)addGoalLinePathsToCoordinate:(id)a3 upperGoalLinePath:(id)a4 upperGoalMarkerPoints:(id)a5 previousUpperGoalLinePoint:(id)a6 lowerGoalLinePath:(id)a7 lowerGoalMarkerPoints:(id)a8 previousLowerGoalLinePoint:(id)a9 axisRect:(CGRect)a10
{
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  id v50;

  width = a10.size.width;
  v50 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = width * 0.25;
  objc_msgSend(v50, "upperGoalYValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v50, "startXValue");
    v22 = v21 - v19;
    objc_msgSend(v50, "upperGoalYValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(v15, "moveToPoint:", v22, v24);

    objc_msgSend(v50, "startXValue");
    v26 = v19 + v25;
    objc_msgSend(v50, "upperGoalYValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    objc_msgSend(v15, "addLineToPoint:", v26, v28);

    v29 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v50, "startXValue");
    v31 = v30;
    objc_msgSend(v50, "upperGoalYValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    objc_msgSend(v29, "valueWithCGPoint:", v31, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v34);

  }
  objc_msgSend(v50, "lowerGoalYValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v50, "startXValue");
    v37 = v36 - v19;
    objc_msgSend(v50, "lowerGoalYValue");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    objc_msgSend(v17, "moveToPoint:", v37, v39);

    objc_msgSend(v50, "startXValue");
    v41 = v19 + v40;
    objc_msgSend(v50, "lowerGoalYValue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    objc_msgSend(v17, "addLineToPoint:", v41, v43);

    v44 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v50, "startXValue");
    v46 = v45;
    objc_msgSend(v50, "lowerGoalYValue");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");
    objc_msgSend(v44, "valueWithCGPoint:", v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v49);

  }
}

@end
