@implementation RTTokenBucket

- (RTTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4 initialAllocation:(double)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  RTTokenBucket *v13;
  RTTokenBucket *v14;
  RTTokenBucket *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTTokenBucket initWithFillRate:capacity:initialAllocation:]";
      v20 = 1024;
      v21 = 64;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "Rate must be greater than 0. (in %s:%d)", buf, 0x12u);
    }

  }
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTTokenBucket initWithFillRate:capacity:initialAllocation:]";
      v20 = 1024;
      v21 = 65;
      _os_log_error_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_ERROR, "Capacity must be greater than 0. (in %s:%d)", buf, 0x12u);
    }

  }
  if (a5 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTTokenBucket initWithFillRate:capacity:initialAllocation:]";
      v20 = 1024;
      v21 = 66;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "Initial allocation must be greater than 0. (in %s:%d)", buf, 0x12u);
    }

  }
  if (a5 > a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTTokenBucket initWithFillRate:capacity:initialAllocation:]";
      v20 = 1024;
      v21 = 67;
      _os_log_error_impl(&dword_1A5E26000, v12, OS_LOG_TYPE_ERROR, "Initial allocation must be less than capacity. (in %s:%d)", buf, 0x12u);
    }

  }
  v13 = 0;
  if (a5 <= a4 && a3 > 0.0 && a4 > 0.0 && a5 >= 0.0)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTTokenBucket;
    v14 = -[RTTokenBucket init](&v17, sel_init);
    v15 = v14;
    if (v14)
    {
      v14->_tokenBucket = a5;
      v14->_fillRate = a3;
      v14->_capacity = a4;
      v14->_operationCost = 1.0;
      v14->_lastBucketFill = CFAbsoluteTimeGetCurrent();
      v15->_lastArrivalTime = -INFINITY;
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (BOOL)operationAllowed
{
  return -[RTTokenBucket operationAllowedWithCost:](self, "operationAllowedWithCost:", self->_operationCost);
}

- (BOOL)operationAllowedWithCost:(double)a3
{
  -[RTTokenBucket _replenishTokens](self, "_replenishTokens");
  return -[RTTokenBucket _consumeTokens:](self, "_consumeTokens:", (unint64_t)a3);
}

- (void)_replenishTokens
{
  CFAbsoluteTime Current;
  double tokenBucket;
  double capacity;
  double v6;
  double v7;
  double v8;

  Current = CFAbsoluteTimeGetCurrent();
  tokenBucket = self->_tokenBucket;
  capacity = self->_capacity;
  if (tokenBucket < capacity)
  {
    v6 = self->_fillRate * (Current - self->_lastBucketFill);
    v7 = self->_totalTokensGenerated + v6;
    v8 = tokenBucket + v6;
    self->_wastedTokens = self->_wastedTokens + vabdd_f64(v8, capacity);
    self->_totalTokensGenerated = v7;
    if (capacity >= v8)
      capacity = v8;
    self->_tokenBucket = capacity;
  }
  self->_lastBucketFill = Current;
}

- (BOOL)_consumeTokens:(unint64_t)a3
{
  NSObject *v5;
  CFAbsoluteTime Current;
  double tokenBucket;
  double lastArrivalTime;
  double v9;
  double v10;
  double v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[RTTokenBucket _consumeTokens:]";
      v15 = 1024;
      v16 = 106;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "Token count less than 1. (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

  }
  Current = CFAbsoluteTimeGetCurrent();
  tokenBucket = self->_tokenBucket;
  lastArrivalTime = self->_lastArrivalTime;
  v9 = Current - lastArrivalTime;
  if (lastArrivalTime == -INFINITY)
    v9 = 0.0;
  self->_interArrivalTime = v9;
  v10 = v9 + self->_totalInterArrivalTime;
  self->_lastArrivalTime = Current;
  self->_totalInterArrivalTime = v10;
  ++self->_totalOperations;
  v11 = (double)a3;
  if (tokenBucket >= (double)a3)
  {
    self->_tokenBucket = tokenBucket - v11;
    self->_totalTokensConsumed = self->_totalTokensConsumed + v11;
    ++self->_operationsAllowed;
  }
  return tokenBucket >= v11;
}

- (RTTokenBucket)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFillRate_capacity_initialAllocation_);
}

- (RTTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4
{
  return -[RTTokenBucket initWithFillRate:capacity:initialAllocation:](self, "initWithFillRate:capacity:initialAllocation:", a3, a4, a4);
}

- (double)timeIntervalUntilOperationAllowed
{
  double result;

  -[RTTokenBucket timeIntervalUntilOperationAllowedWithCost:](self, "timeIntervalUntilOperationAllowedWithCost:", self->_operationCost);
  return result;
}

- (double)timeIntervalUntilOperationAllowedWithCost:(double)a3
{
  double tokenBucket;
  double result;

  -[RTTokenBucket _replenishTokens](self, "_replenishTokens");
  tokenBucket = self->_tokenBucket;
  result = 0.0;
  if (tokenBucket < a3)
    return (a3 - tokenBucket) / self->_fillRate;
  return result;
}

- (unint64_t)countOfOperationsAllowed
{
  return -[RTTokenBucket countOfOperationsAllowedWithCost:](self, "countOfOperationsAllowedWithCost:", self->_operationCost);
}

- (unint64_t)countOfOperationsAllowedWithCost:(double)a3
{
  -[RTTokenBucket _replenishTokens](self, "_replenishTokens");
  return vcvtmd_u64_f64(self->_tokenBucket / a3);
}

- (void)reset
{
  self->_totalOperations = 0;
  self->_operationsAllowed = 0;
  self->_tokenBucket = self->_capacity;
  *(_OWORD *)&self->_lastArrivalTime = xmmword_1A5E6A1C0;
  self->_interArrivalTime = 0.0;
  self->_lastBucketFill = CFAbsoluteTimeGetCurrent();
  self->_totalTokensGenerated = 0.0;
  self->_totalTokensConsumed = 0.0;
  self->_wastedTokens = 0.0;
}

- (id)dumpStatistics
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Total operations, %ld, Allowed operations, %ld, Denied operations, %ld, Operation inter-arrival time, %f, Average inter-arrival time, %f, Wasted tokens, %f, Total tokens generated, %f, Total tokens consumed, %f"), self->_totalOperations, self->_operationsAllowed, self->_totalOperations - self->_operationsAllowed, *(_QWORD *)&self->_interArrivalTime, self->_totalInterArrivalTime / (double)self->_totalOperations, *(_QWORD *)&self->_wastedTokens, *(_QWORD *)&self->_totalTokensGenerated, *(_QWORD *)&self->_totalTokensConsumed);
}

- (double)interArrivalTime
{
  return self->_interArrivalTime;
}

- (void)setInterArrivalTime:(double)a3
{
  self->_interArrivalTime = a3;
}

- (double)lastBucketFill
{
  return self->_lastBucketFill;
}

- (void)setLastBucketFill:(double)a3
{
  self->_lastBucketFill = a3;
}

@end
