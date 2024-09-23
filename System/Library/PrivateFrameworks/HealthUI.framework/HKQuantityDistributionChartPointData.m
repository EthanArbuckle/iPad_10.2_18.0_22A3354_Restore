@implementation HKQuantityDistributionChartPointData

- (HKQuantityDistributionChartPointData)initWithDistributionData:(id)a3 unit:(id)a4 displayType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  float v12;
  HKQuantityDistributionChartPointData *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[HKQuantityDistributionDataSource bucketSizeForDisplayType:preferredUnit:](HKQuantityDistributionDataSource, "bucketSizeForDisplayType:preferredUnit:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = -[HKQuantityDistributionChartPointData initWithDistributionData:bucketIncrement:unit:displayType:](self, "initWithDistributionData:bucketIncrement:unit:displayType:", v10, v9, v8, v12);

  return v13;
}

- (HKQuantityDistributionChartPointData)initWithDistributionData:(id)a3 bucketIncrement:(double)a4 unit:(id)a5 displayType:(id)a6
{
  id v9;
  id v10;
  HKQuantityDistributionChartPointData *v11;
  uint64_t v12;
  NSDate *startDate;
  uint64_t v14;
  NSDate *endDate;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  uint64_t v27;
  NSArray *bucketCounts;
  uint64_t v29;
  NSArray *contextIdentifiers;
  objc_super v32;

  v9 = a3;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)HKQuantityDistributionChartPointData;
  v11 = -[HKQuantityDistributionChartPointData init](&v32, sel_init);
  if (v11)
  {
    objc_msgSend(v9, "startDate");
    v12 = objc_claimAutoreleasedReturnValue();
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    objc_msgSend(v9, "endDate");
    v14 = objc_claimAutoreleasedReturnValue();
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v14;

    objc_msgSend(v9, "minimumValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    v11->_minimumValue = _doubleValueIfCompatibleForQuantity(v16, v10, v17);

    objc_msgSend(v9, "maximumValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    v11->_maximumValue = _doubleValueIfCompatibleForQuantity(v18, v10, v19);

    objc_msgSend(v9, "minimumBucketValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    v11->_minimumBucketValue = _doubleValueIfCompatibleForQuantity(v20, v10, v21);

    objc_msgSend(v9, "averageValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    v11->_averageValue = _doubleValueIfCompatibleForQuantity(v22, v10, v23);

    objc_msgSend(v9, "duration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    v11->_duration = _doubleValueIfCompatibleForQuantity(v24, v25, v26);

    v11->_bucketIncrement = a4;
    objc_msgSend(v9, "histogramCounts");
    v27 = objc_claimAutoreleasedReturnValue();
    bucketCounts = v11->_bucketCounts;
    v11->_bucketCounts = (NSArray *)v27;

    objc_msgSend(v9, "contextIdentifiers");
    v29 = objc_claimAutoreleasedReturnValue();
    contextIdentifiers = v11->_contextIdentifiers;
    v11->_contextIdentifiers = (NSArray *)v29;

    objc_storeStrong((id *)&v11->_unit, a5);
  }

  return v11;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)averageValue
{
  return self->_averageValue;
}

- (double)duration
{
  return self->_duration;
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

- (NSArray)contextIdentifiers
{
  return self->_contextIdentifiers;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_contextIdentifiers, 0);
  objc_storeStrong((id *)&self->_bucketCounts, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
