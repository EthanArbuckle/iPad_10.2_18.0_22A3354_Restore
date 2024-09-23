@implementation HKQuantityDistributionChartPoint

- (HKQuantityDistributionChartPoint)initWithHistogramData:(id)a3 bucketDate:(id)a4 bucketIncrement:(double)a5 unit:(id)a6 displayType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKQuantityDistributionChartPoint *v16;
  HKQuantityDistributionChartPoint *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSNumber *minimumY;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSNumber *maximumY;
  void *v30;
  void *v31;
  double v32;
  uint64_t v33;
  NSArray *bucketCounts;
  HKGraphSeriesBlockCoordinateInfo *userInfo;
  objc_super v37;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v37.receiver = self;
  v37.super_class = (Class)HKQuantityDistributionChartPoint;
  v16 = -[HKQuantityDistributionChartPoint init](&v37, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_bucketDate, a4);
    objc_msgSend(v15, "presentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "minimumValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValueForUnit:", v14);
    objc_msgSend(v19, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "adjustedValueForDaemonValue:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    minimumY = v17->_minimumY;
    v17->_minimumY = (NSNumber *)v22;

    objc_msgSend(v15, "presentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "maximumValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValueForUnit:", v14);
    objc_msgSend(v25, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "adjustedValueForDaemonValue:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    maximumY = v17->_maximumY;
    v17->_maximumY = (NSNumber *)v28;

    objc_msgSend(v15, "presentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minimumBucketValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValueForUnit:", v14);
    objc_msgSend(v30, "adjustedDoubleForDaemonDouble:");
    v17->_minimumBucketValue = v32;

    v17->_bucketIncrement = a5;
    objc_msgSend(v12, "histogramCounts");
    v33 = objc_claimAutoreleasedReturnValue();
    bucketCounts = v17->_bucketCounts;
    v17->_bucketCounts = (NSArray *)v33;

    userInfo = v17->_userInfo;
    v17->_userInfo = 0;

  }
  return v17;
}

- (HKQuantityDistributionChartPoint)initWithHistogramData:(id)a3 bucketIncrement:(double)a4 unit:(id)a5 displayType:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HKQuantityDistributionChartPoint *v16;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIMidDate(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HKQuantityDistributionChartPoint initWithHistogramData:bucketDate:bucketIncrement:unit:displayType:](self, "initWithHistogramData:bucketDate:bucketIncrement:unit:displayType:", v12, v15, v11, v10, a4);
  return v16;
}

- (HKQuantityDistributionChartPoint)initWithHistogramData:(id)a3 unit:(id)a4 displayType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  HKQuantityDistributionChartPoint *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[HKQuantityDistributionDataSource bucketSizeForDisplayType:preferredUnit:](HKQuantityDistributionDataSource, "bucketSizeForDisplayType:preferredUnit:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIMidDate(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "floatValue");
  v16 = -[HKQuantityDistributionChartPoint initWithHistogramData:bucketDate:bucketIncrement:unit:displayType:](self, "initWithHistogramData:bucketDate:bucketIncrement:unit:displayType:", v10, v14, v9, v8, v15);

  return v16;
}

- (id)_quickDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("MM/dd/YYYY-HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  id v3;
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v3, "setNumberStyle:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_bucketCounts;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "stringFromNumber:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[HKQuantityDistributionChartPoint _quickDate:](self, "_quickDate:", self->_bucketDate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("chartpoint{%@ min %@ max %@ bfloor %lg bsize %lg [%@]}"), v13, self->_minimumY, self->_maximumY, *(_QWORD *)&self->_minimumBucketValue, *(_QWORD *)&self->_bucketIncrement, v11, (_QWORD)v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (id)xValueAsGenericType
{
  return self->_bucketDate;
}

- (id)minXValueAsGenericType
{
  return self->_bucketDate;
}

- (id)maxXValueAsGenericType
{
  return self->_bucketDate;
}

- (id)yValue
{
  return self->_minimumY;
}

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)allYValues
{
  NSNumber *maximumY;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  maximumY = self->_maximumY;
  v4[0] = self->_minimumY;
  v4[1] = maximumY;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)minYValue
{
  return self->_minimumY;
}

- (id)maxYValue
{
  return self->_maximumY;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (double)minimumBucketValue
{
  return self->_minimumBucketValue;
}

- (double)bucketIncrement
{
  return self->_bucketIncrement;
}

- (NSArray)bucketCounts
{
  return self->_bucketCounts;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSDate)bucketDate
{
  return self->_bucketDate;
}

- (NSNumber)minimumY
{
  return self->_minimumY;
}

- (NSNumber)maximumY
{
  return self->_maximumY;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumY, 0);
  objc_storeStrong((id *)&self->_minimumY, 0);
  objc_storeStrong((id *)&self->_bucketDate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_bucketCounts, 0);
}

@end
