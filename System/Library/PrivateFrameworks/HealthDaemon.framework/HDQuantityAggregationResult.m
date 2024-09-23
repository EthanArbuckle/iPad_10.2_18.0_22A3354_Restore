@implementation HDQuantityAggregationResult

- (HDQuantityAggregationResult)initWithAggregatedSamples:(id)a3 consumedData:(id)a4 remainingData:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDQuantityAggregationResult *v11;
  uint64_t v12;
  NSArray *aggregatedSamples;
  uint64_t v14;
  NSArray *consumedSensorData;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDQuantityAggregationResult;
  v11 = -[HDQuantityAggregationResult init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    aggregatedSamples = v11->_aggregatedSamples;
    v11->_aggregatedSamples = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    consumedSensorData = v11->_consumedSensorData;
    v11->_consumedSensorData = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_remainingSensorData, a5);
  }

  return v11;
}

- (NSArray)aggregatedSamples
{
  return self->_aggregatedSamples;
}

- (NSArray)consumedSensorData
{
  return self->_consumedSensorData;
}

- (NSMutableArray)remainingSensorData
{
  return self->_remainingSensorData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingSensorData, 0);
  objc_storeStrong((id *)&self->_consumedSensorData, 0);
  objc_storeStrong((id *)&self->_aggregatedSamples, 0);
}

@end
