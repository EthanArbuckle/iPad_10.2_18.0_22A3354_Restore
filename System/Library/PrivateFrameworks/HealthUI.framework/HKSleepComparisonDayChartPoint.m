@implementation HKSleepComparisonDayChartPoint

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)minYValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
}

- (id)maxYValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 43200.0);
}

- (id)allYValues
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[HKSleepComparisonDayChartPoint minYValue](self, "minYValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[HKSleepComparisonDayChartPoint maxYValue](self, "maxYValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HKSleepComparisonDayChartPoint;
  -[HKSleepComparisonDayChartPoint description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { %@->%@ %@ }"), v4, self->_startDate, self->_endDate, self->_yValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  HKSleepComparisonDayChartPoint *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HKSleepChartPointUserInfo *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v5;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v43;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(obj);
        v28 = v7;
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v7);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v8, "periods");
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v31)
        {
          v30 = *(_QWORD *)v39;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v39 != v30)
                objc_enumerationMutation(v29);
              v32 = v9;
              v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              objc_msgSend(v10, "segments");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v35;
                do
                {
                  for (i = 0; i != v13; ++i)
                  {
                    if (*(_QWORD *)v35 != v14)
                      objc_enumerationMutation(v11);
                    v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                    if (objc_msgSend(v16, "category") != 2)
                    {
                      v17 = objc_alloc_init(HKSleepComparisonDayChartPoint);
                      objc_msgSend(v16, "dateInterval");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v18, "startDate");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HKSleepComparisonDayChartPoint setStartDate:](v17, "setStartDate:", v19);

                      objc_msgSend(v16, "dateInterval");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "endDate");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HKSleepComparisonDayChartPoint setEndDate:](v17, "setEndDate:", v21);

                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "category"));
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HKSleepComparisonDayChartPoint setYValue:](v17, "setYValue:", v22);

                      v23 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", objc_msgSend(v6, "chartType"), v8);
                      -[HKSleepComparisonDayChartPoint setUserInfo:](v17, "setUserInfo:", v23);

                      objc_msgSend(v33, "addObject:", v17);
                    }
                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
                }
                while (v13);
              }

              v9 = v32 + 1;
            }
            while (v32 + 1 != v31);
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v31);
        }

        v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v27);
  }

  return v33;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
  objc_storeStrong((id *)&self->_yValue, a3);
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
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
