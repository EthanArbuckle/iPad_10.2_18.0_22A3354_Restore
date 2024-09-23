@implementation HKSleepPeriodChartPoint

- (id)xValueAsGenericType
{
  return self->_xValue;
}

- (id)minXValueAsGenericType
{
  return self->_xValue;
}

- (id)maxXValueAsGenericType
{
  return self->_xValue;
}

- (id)minYValue
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  -[HKSleepPeriodChartPoint allYValues](self, "allYValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    if (v4 > 1.79769313e308)
      v4 = 1.79769313e308;
  }
  else
  {
    v4 = 1.79769313e308;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)maxYValue
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  -[HKSleepPeriodChartPoint allYValues](self, "allYValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = fmax(v4, -1.79769313e308);
  }
  else
  {
    v5 = -1.79769313e308;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allYValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", self->_inBedOffsets);
  objc_msgSend(v3, "addObjectsFromArray:", self->_asleepOffsets);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("value"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingDescriptors:", v5);

  objc_msgSend(v3, "hk_map:", &__block_literal_global_47);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __37__HKSleepPeriodChartPoint_allYValues__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HKSleepPeriodChartPoint_chartPointsForSummaries_context___block_invoke;
  v9[3] = &unk_1E9C43158;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "hk_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

HKSleepPeriodChartPoint *__59__HKSleepPeriodChartPoint_chartPointsForSummaries_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HKSleepPeriodChartPoint *v33;
  void *v34;
  void *v35;
  void *v36;
  HKSleepChartPointUserInfo *v37;
  uint64_t v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v39 = a1;
  v59 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v2, "periods");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v54;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(obj);
        v43 = v3;
        v4 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v3);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v4, "segments", v39);
        v45 = (id)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v48)
        {
          v47 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v50 != v47)
                objc_enumerationMutation(v45);
              v6 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
              objc_msgSend(v6, "dateInterval");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "startDate");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "dateInterval");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "startDate");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v8, "hk_isBeforeDate:", v10);

              objc_msgSend(v6, "dateInterval");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "endDate");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "dateInterval");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "endDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v13, "hk_isAfterDate:", v15);

              objc_msgSend(v2, "dateInterval");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "dateInterval");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "intersectionWithDateInterval:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "startDate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "dateInterval");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "startDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "timeIntervalSinceDate:", v22);
              v24 = v23;

              objc_msgSend(v19, "duration");
              v26 = v24 + v25;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:continuation:](HKSleepPeriodChartPointOffset, "chartPointOffsetWithValue:continuation:", v27, v11);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:continuation:](HKSleepPeriodChartPointOffset, "chartPointOffsetWithValue:continuation:", v29, v16);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v31 = objc_msgSend(v6, "category");
              if ((unint64_t)(v31 - 3) < 3)
                goto LABEL_14;
              v32 = v44;
              if (v31)
              {
                if (v31 != 1)
                  goto LABEL_16;
LABEL_14:
                v32 = v46;
              }
              objc_msgSend(v32, "addObject:", v28);
              objc_msgSend(v32, "addObject:", v30);
LABEL_16:

            }
            v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          }
          while (v48);
        }

        v3 = v43 + 1;
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v42);
  }

  v33 = objc_alloc_init(HKSleepPeriodChartPoint);
  -[HKSleepPeriodChartPoint setAsleepOffsets:](v33, "setAsleepOffsets:", v46);
  -[HKSleepPeriodChartPoint setInBedOffsets:](v33, "setInBedOffsets:", v44);
  +[HKSleepUtilities sleepDaySummaryNoonAlignedXValue:](HKSleepUtilities, "sleepDaySummaryNoonAlignedXValue:", v2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodChartPoint setXValue:](v33, "setXValue:", v34);

  -[HKSleepPeriodChartPoint setHighlighted:](v33, "setHighlighted:", 0);
  objc_msgSend(v2, "hk_bedtimeGoalValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodChartPoint setLowerGoal:](v33, "setLowerGoal:", v35);

  objc_msgSend(v2, "hk_wakeTimeGoalValue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodChartPoint setUpperGoal:](v33, "setUpperGoal:", v36);

  v37 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", objc_msgSend(*(id *)(v39 + 32), "chartType"), v2);
  -[HKSleepPeriodChartPoint setUserInfo:](v33, "setUserInfo:", v37);

  return v33;
}

- (NSArray)asleepOffsets
{
  return self->_asleepOffsets;
}

- (void)setAsleepOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_asleepOffsets, a3);
}

- (NSArray)inBedOffsets
{
  return self->_inBedOffsets;
}

- (void)setInBedOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_inBedOffsets, a3);
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)upperGoal
{
  return self->_upperGoal;
}

- (void)setUpperGoal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)lowerGoal
{
  return self->_lowerGoal;
}

- (void)setLowerGoal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (HKSleepChartPointUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lowerGoal, 0);
  objc_storeStrong((id *)&self->_upperGoal, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
  objc_storeStrong((id *)&self->_inBedOffsets, 0);
  objc_storeStrong((id *)&self->_asleepOffsets, 0);
}

@end
