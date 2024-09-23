@implementation FMTokenBucket

- (FMTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4
{
  return -[FMTokenBucket initWithFillRate:capacity:initialAllocation:](self, "initWithFillRate:capacity:initialAllocation:", a3, a4, a4);
}

- (FMTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4 initialAllocation:(double)a5
{
  FMTokenBucket *v5;
  FMTokenBucket *v9;
  FMTokenBucket *v10;
  objc_super v12;

  v5 = 0;
  if (a5 <= a4 && a3 > 0.0 && a4 > 0.0 && a5 >= 0.0)
  {
    v12.receiver = self;
    v12.super_class = (Class)FMTokenBucket;
    v9 = -[FMTokenBucket init](&v12, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_tokenBucket = a5;
      v9->_fillRate = a3;
      v9->_capacity = a4;
      v9->_operationCost = 1.0;
      v9->_lastBucketFill = CFAbsoluteTimeGetCurrent();
      v10->_lastArrivalTime = -INFINITY;
    }
    self = v10;
    v5 = self;
  }

  return v5;
}

- (void)_replenishTokens
{
  double Current;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  Current = CFAbsoluteTimeGetCurrent();
  -[FMTokenBucket tokenBucket](self, "tokenBucket");
  v5 = v4;
  -[FMTokenBucket capacity](self, "capacity");
  if (v5 < v6)
  {
    -[FMTokenBucket fillRate](self, "fillRate");
    v8 = v7;
    -[FMTokenBucket lastBucketFill](self, "lastBucketFill");
    v10 = v8 * (Current - v9);
    -[FMTokenBucket totalTokensGenerated](self, "totalTokensGenerated");
    -[FMTokenBucket setTotalTokensGenerated:](self, "setTotalTokensGenerated:", v11 + v10);
    -[FMTokenBucket tokenBucket](self, "tokenBucket");
    v13 = v10 + v12;
    -[FMTokenBucket capacity](self, "capacity");
    v15 = vabdd_f64(v13, v14);
    -[FMTokenBucket wastedTokens](self, "wastedTokens");
    -[FMTokenBucket setWastedTokens:](self, "setWastedTokens:", v16 + v15);
    -[FMTokenBucket capacity](self, "capacity");
    v18 = v17;
    -[FMTokenBucket tokenBucket](self, "tokenBucket");
    v20 = v10 + v19;
    if (v18 < v20)
      v20 = v18;
    -[FMTokenBucket setTokenBucket:](self, "setTokenBucket:", v20);
  }
  -[FMTokenBucket setLastBucketFill:](self, "setLastBucketFill:", Current);
}

- (BOOL)_consumeTokens:(int64_t)a3
{
  double Current;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  Current = CFAbsoluteTimeGetCurrent();
  -[FMTokenBucket lastArrivalTime](self, "lastArrivalTime");
  v7 = v6;
  v8 = 0.0;
  if (v7 != -INFINITY)
  {
    -[FMTokenBucket lastArrivalTime](self, "lastArrivalTime", 0.0);
    v8 = Current - v9;
  }
  -[FMTokenBucket setInterArrivalTime:](self, "setInterArrivalTime:", v8);
  -[FMTokenBucket interArrivalTime](self, "interArrivalTime");
  v11 = v10;
  -[FMTokenBucket totalInterArrivalTime](self, "totalInterArrivalTime");
  -[FMTokenBucket setTotalInterArrivalTime:](self, "setTotalInterArrivalTime:", v11 + v12);
  -[FMTokenBucket setLastArrivalTime:](self, "setLastArrivalTime:", Current);
  -[FMTokenBucket setTotalOperations:](self, "setTotalOperations:", -[FMTokenBucket totalOperations](self, "totalOperations") + 1);
  v13 = (double)a3;
  -[FMTokenBucket tokenBucket](self, "tokenBucket");
  v15 = v14;
  if (v14 >= (double)a3)
  {
    -[FMTokenBucket tokenBucket](self, "tokenBucket");
    -[FMTokenBucket setTokenBucket:](self, "setTokenBucket:", v16 - v13);
    -[FMTokenBucket totalTokensConsumed](self, "totalTokensConsumed");
    -[FMTokenBucket setTotalTokensConsumed:](self, "setTotalTokensConsumed:", v17 + v13);
    -[FMTokenBucket setOperationsAllowed:](self, "setOperationsAllowed:", -[FMTokenBucket operationsAllowed](self, "operationsAllowed") + 1);
  }
  return v15 >= v13;
}

- (BOOL)operationAllowedWithCost:(double)a3
{
  -[FMTokenBucket _replenishTokens](self, "_replenishTokens");
  return -[FMTokenBucket _consumeTokens:](self, "_consumeTokens:", (uint64_t)a3);
}

- (BOOL)operationAllowed
{
  -[FMTokenBucket operationCost](self, "operationCost");
  return -[FMTokenBucket operationAllowedWithCost:](self, "operationAllowedWithCost:");
}

- (double)timeIntervalUntilOperationAllowed
{
  double result;

  -[FMTokenBucket operationCost](self, "operationCost");
  -[FMTokenBucket timeIntervalUntilOperationAllowedWithCost:](self, "timeIntervalUntilOperationAllowedWithCost:");
  return result;
}

- (double)timeIntervalUntilOperationAllowedWithCost:(double)a3
{
  double v5;
  double v6;
  double result;
  double v8;
  double v9;
  double v10;

  -[FMTokenBucket _replenishTokens](self, "_replenishTokens");
  -[FMTokenBucket tokenBucket](self, "tokenBucket");
  v6 = v5;
  result = 0.0;
  if (v6 < a3)
  {
    -[FMTokenBucket tokenBucket](self, "tokenBucket", 0.0);
    v9 = a3 - v8;
    -[FMTokenBucket fillRate](self, "fillRate");
    return v9 / v10;
  }
  return result;
}

- (int64_t)countOfOperationsAllowed
{
  -[FMTokenBucket operationCost](self, "operationCost");
  return -[FMTokenBucket countOfOperationsAllowedWithCost:](self, "countOfOperationsAllowedWithCost:");
}

- (int64_t)countOfOperationsAllowedWithCost:(double)a3
{
  double v5;

  -[FMTokenBucket _replenishTokens](self, "_replenishTokens");
  -[FMTokenBucket tokenBucket](self, "tokenBucket");
  return vcvtmd_s64_f64(v5 / a3);
}

- (void)reset
{
  -[FMTokenBucket setOperationsAllowed:](self, "setOperationsAllowed:", 0);
  -[FMTokenBucket setTotalOperations:](self, "setTotalOperations:", 0);
  -[FMTokenBucket setTotalInterArrivalTime:](self, "setTotalInterArrivalTime:", 0.0);
  -[FMTokenBucket setTokenBucket:](self, "setTokenBucket:", self->_capacity);
  -[FMTokenBucket setLastArrivalTime:](self, "setLastArrivalTime:", -INFINITY);
  -[FMTokenBucket setInterArrivalTime:](self, "setInterArrivalTime:", 0.0);
  -[FMTokenBucket setLastBucketFill:](self, "setLastBucketFill:", CFAbsoluteTimeGetCurrent());
  -[FMTokenBucket setWastedTokens:](self, "setWastedTokens:", 0.0);
  -[FMTokenBucket setTotalTokensGenerated:](self, "setTotalTokensGenerated:", 0.0);
  -[FMTokenBucket setTotalTokensConsumed:](self, "setTotalTokensConsumed:", 0.0);
}

- (id)dumpStatistics
{
  void *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[FMTokenBucket totalOperations](self, "totalOperations");
  v5 = -[FMTokenBucket operationsAllowed](self, "operationsAllowed");
  v6 = -[FMTokenBucket totalOperations](self, "totalOperations");
  v7 = v6 - -[FMTokenBucket operationsAllowed](self, "operationsAllowed");
  -[FMTokenBucket interArrivalTime](self, "interArrivalTime");
  v9 = v8;
  -[FMTokenBucket totalInterArrivalTime](self, "totalInterArrivalTime");
  v11 = v10 / (double)-[FMTokenBucket totalOperations](self, "totalOperations");
  -[FMTokenBucket wastedTokens](self, "wastedTokens");
  v13 = v12;
  -[FMTokenBucket totalTokensGenerated](self, "totalTokensGenerated");
  v15 = v14;
  -[FMTokenBucket totalTokensConsumed](self, "totalTokensConsumed");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Total operations, %ld, Allowed operations, %ld, Denied operations, %ld, Operation inter-arrival time, %f, Average inter-arrival time, %f, Wasted tokens, %f, Total tokens generated, %f, Total tokens consumed, %f"), v4, v5, v7, v9, *(_QWORD *)&v11, v13, v15, v16);
}

- (double)interArrivalTime
{
  return self->_interArrivalTime;
}

- (void)setInterArrivalTime:(double)a3
{
  self->_interArrivalTime = a3;
}

- (double)fillRate
{
  return self->_fillRate;
}

- (void)setFillRate:(double)a3
{
  self->_fillRate = a3;
}

- (double)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(double)a3
{
  self->_capacity = a3;
}

- (double)operationCost
{
  return self->_operationCost;
}

- (void)setOperationCost:(double)a3
{
  self->_operationCost = a3;
}

- (double)tokenBucket
{
  return self->_tokenBucket;
}

- (void)setTokenBucket:(double)a3
{
  self->_tokenBucket = a3;
}

- (double)lastArrivalTime
{
  return self->_lastArrivalTime;
}

- (void)setLastArrivalTime:(double)a3
{
  self->_lastArrivalTime = a3;
}

- (double)totalInterArrivalTime
{
  return self->_totalInterArrivalTime;
}

- (void)setTotalInterArrivalTime:(double)a3
{
  self->_totalInterArrivalTime = a3;
}

- (double)wastedTokens
{
  return self->_wastedTokens;
}

- (void)setWastedTokens:(double)a3
{
  self->_wastedTokens = a3;
}

- (double)totalTokensGenerated
{
  return self->_totalTokensGenerated;
}

- (void)setTotalTokensGenerated:(double)a3
{
  self->_totalTokensGenerated = a3;
}

- (double)totalTokensConsumed
{
  return self->_totalTokensConsumed;
}

- (void)setTotalTokensConsumed:(double)a3
{
  self->_totalTokensConsumed = a3;
}

- (int64_t)totalOperations
{
  return self->_totalOperations;
}

- (void)setTotalOperations:(int64_t)a3
{
  self->_totalOperations = a3;
}

- (int64_t)operationsAllowed
{
  return self->_operationsAllowed;
}

- (void)setOperationsAllowed:(int64_t)a3
{
  self->_operationsAllowed = a3;
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
