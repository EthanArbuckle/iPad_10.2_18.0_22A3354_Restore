@implementation HKSleepDurationDaySeries

- (HKSleepDurationDaySeries)init
{
  HKSleepDurationDaySeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  NSNumber *highlightedSleepValueStorage;
  uint64_t v6;
  NSCalendar *currentCalendar;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSleepDurationDaySeries;
  v2 = -[HKSleepDurationSeries init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKSleepDurationDaySeriesLock"));
    highlightedSleepValueStorage = v2->_highlightedSleepValueStorage;
    v2->_highlightedSleepValueStorage = 0;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v2->_currentCalendar;
    v2->_currentCalendar = (NSCalendar *)v6;

  }
  return v2;
}

- (NSNumber)highlightedSleepValue
{
  void *v3;
  NSNumber *v4;
  void *v5;

  -[HKSleepDurationDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_highlightedSleepValueStorage;
  -[HKSleepDurationDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setHighlightedSleepValue:(id)a3
{
  NSNumber *v4;
  void *v5;
  NSNumber *highlightedSleepValueStorage;
  void *v7;

  v4 = (NSNumber *)a3;
  -[HKSleepDurationDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  highlightedSleepValueStorage = self->_highlightedSleepValueStorage;
  self->_highlightedSleepValueStorage = v4;

  -[HKSleepDurationDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  -[HKSleepDurationDaySeries _rebuildFillStyles](self, "_rebuildFillStyles");
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  HKSleepDurationCoordinate *v46;
  void *v47;
  void *v49;
  void *v51;
  id obj;
  uint64_t v53;
  HKSleepDurationDaySeries *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  HKSleepDurationCoordinate *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  int64_t resolution;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "chartPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepDurationDaySeries.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  v51 = v10;
  objc_msgSend(v10, "transform");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transform");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v12;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v58)
  {
    v53 = *(_QWORD *)v69;
    v54 = self;
    v55 = v11;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v69 != v53)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v13);
        -[HKSleepDurationDaySeries currentCalendar](self, "currentCalendar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "xValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startOfDayForDate:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v65, "coordinateForValue:", &unk_1E9CEB5B8);
        v19 = v18;
        objc_msgSend(v14, "goalValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = v13;
        if (v20)
        {
          v21 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v14, "goalValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "coordinateForValue:", v22);
          objc_msgSend(v21, "numberWithDouble:");
          v64 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v64 = 0;
        }
        objc_msgSend(v14, "userInfo");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSleepDurationDaySeries currentCalendar](self, "currentCalendar");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKCategoricalDateAxis datePositionForCategoryIndex:categoryCount:startDate:calendar:](HKCategoricalDateAxis, "datePositionForCategoryIndex:categoryCount:startDate:calendar:", 0, 2, v17, v23);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "coordinateForValue:", v63);
        v25 = v24;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v25, v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v27);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v25, v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v28);

        v29 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v14, "inBedValue");
        objc_msgSend(v29, "numberWithDouble:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "coordinateForValue:", v30);
        v32 = v31;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v25, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v33);

        v62 = (void *)objc_msgSend(v59, "copyWithAnnotationOptions:", 1);
        v60 = -[HKSleepDurationCoordinate initWithStackPoints:goalLineYValue:highlighted:userInfo:]([HKSleepDurationCoordinate alloc], "initWithStackPoints:goalLineYValue:highlighted:userInfo:", v26, 0, objc_msgSend(v14, "highlighted"), v62);
        -[HKSleepDurationDaySeries currentCalendar](self, "currentCalendar");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKCategoricalDateAxis datePositionForCategoryIndex:categoryCount:startDate:calendar:](HKCategoricalDateAxis, "datePositionForCategoryIndex:categoryCount:startDate:calendar:", 1, 2, v17, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "coordinateForValue:", v35);
        v37 = v36;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v37, v19);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v39);

        v40 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v14, "asleepValue");
        objc_msgSend(v40, "numberWithDouble:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "coordinateForValue:", v41);
        v43 = v42;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v37, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v44);

        v45 = (void *)objc_msgSend(v59, "copyWithAnnotationOptions:", 2);
        v46 = -[HKSleepDurationCoordinate initWithStackPoints:goalLineYValue:highlighted:userInfo:]([HKSleepDurationCoordinate alloc], "initWithStackPoints:goalLineYValue:highlighted:userInfo:", v38, v64, objc_msgSend(v14, "highlighted"), v45);
        objc_msgSend(v56, "addObject:", v60);
        objc_msgSend(v56, "addObject:", v46);

        self = v54;
        ++v13;
        v11 = v55;
      }
      while (v58 != v61 + 1);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    }
    while (v58);
  }

  v66 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v56, &v66);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
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

- (void)addGoalLinePathsToCoordinate:(id)a3 goalLinePath:(id)a4 goalLineMarkerPoints:(id)a5 previousCoordinateGoal:(id)a6 axisRect:(CGRect)a7
{
  double width;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  id v19;

  width = a7.size.width;
  v19 = a3;
  v9 = a4;
  objc_msgSend(v19, "goalLineYValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v19, "startXValue");
    v12 = v11 + width * -0.75;
    objc_msgSend(v19, "goalLineYValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v9, "moveToPoint:", v12, v14);

    objc_msgSend(v19, "startXValue");
    v16 = v15 + width * 0.25;
    objc_msgSend(v19, "goalLineYValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(v9, "addLineToPoint:", v16, v18);

  }
}

- (BOOL)hideInBedData
{
  return 0;
}

- (BOOL)hideAsleepData
{
  return 0;
}

- (void)_rebuildFillStyles
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[HKSleepDurationDaySeries highlightedSleepValue](self, "highlightedSleepValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v3)
  {
    v5 = v4 == 0;
    v6 = v4 == _HKCategoryValueSleepAnalysisDefaultAsleepValue();
  }
  else
  {
    v5 = 1;
    v6 = 1;
  }
  +[HKSleepUtilities fillStyleForSleepCategoryValue:isActive:](HKSleepUtilities, "fillStyleForSleepCategoryValue:isActive:", _HKCategoryValueSleepAnalysisDefaultAsleepValue(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  +[HKSleepUtilities fillStyleForSleepCategoryValue:isActive:](HKSleepUtilities, "fillStyleForSleepCategoryValue:isActive:", 0, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSleepDurationSeries setInactiveFillStyles:](self, "setInactiveFillStyles:", v9);
  -[HKSleepDurationSeries setHighlightedFillStyles:](self, "setHighlightedFillStyles:", v9);
  -[HKSleepDurationSeries setDefaultFillStyles:](self, "setDefaultFillStyles:", v9);

}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (NSNumber)highlightedSleepValueStorage
{
  return self->_highlightedSleepValueStorage;
}

- (void)setHighlightedSleepValueStorage:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedSleepValueStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedSleepValueStorage, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
