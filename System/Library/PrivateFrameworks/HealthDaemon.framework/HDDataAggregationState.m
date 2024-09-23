@implementation HDDataAggregationState

- (HDDataAggregationState)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDataAggregationState)initWithRemainingSensorData:(id)a3
{
  return -[HDDataAggregationState initWithRemainingSensorData:currentSeries:](self, "initWithRemainingSensorData:currentSeries:", a3, 0);
}

- (HDDataAggregationState)initWithRemainingSensorData:(id)a3 currentSeries:(id)a4
{
  id v7;
  id v8;
  HDDataAggregationState *v9;
  HDDataAggregationState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDDataAggregationState;
  v9 = -[HDDataAggregationState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unaggregatedSensorData, a3);
    objc_storeStrong((id *)&v10->_openSeries, a4);
  }

  return v10;
}

- (NSMutableArray)unaggregatedSensorData
{
  return self->_unaggregatedSensorData;
}

- (HKSample)openSeries
{
  return self->_openSeries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openSeries, 0);
  objc_storeStrong((id *)&self->_unaggregatedSensorData, 0);
}

@end
