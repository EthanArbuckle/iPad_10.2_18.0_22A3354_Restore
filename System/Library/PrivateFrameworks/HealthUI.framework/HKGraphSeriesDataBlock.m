@implementation HKGraphSeriesDataBlock

- (void)setChartPoints:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *chartPoints;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  HKValueRange *v23;
  HKValueRange *yValueRange;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  chartPoints = self->_chartPoints;
  self->_chartPoints = v5;

  if (objc_msgSend(v4, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      v11 = 1.79769313e308;
      v12 = 2.22507386e-308;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v14, "minYValue", (_QWORD)v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v17 = v16;

          objc_msgSend(v14, "maxYValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValue");
          v20 = v19;

          if (v11 >= v17)
            v11 = v17;
          if (v12 < v20)
            v12 = v20;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 1.79769313e308;
      v12 = 2.22507386e-308;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v21, v22);
    v23 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
    yValueRange = self->_yValueRange;
    self->_yValueRange = v23;

  }
}

+ (id)emptyDataBlock
{
  HKGraphSeriesDataBlock *v2;

  v2 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v2, "setChartPoints:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (NSArray)chartPoints
{
  return self->_chartPoints;
}

- (HKValueRange)yValueRange
{
  return self->_yValueRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yValueRange, 0);
  objc_storeStrong((id *)&self->_chartPoints, 0);
}

@end
