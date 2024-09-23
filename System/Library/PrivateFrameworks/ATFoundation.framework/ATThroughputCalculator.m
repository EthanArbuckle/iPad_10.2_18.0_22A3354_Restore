@implementation ATThroughputCalculator

- (ATThroughputCalculator)init
{
  ATThroughputCalculator *v2;
  ATThroughputCalculator *v3;
  ATMovingAverage *v4;
  ATMovingAverage *average;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATThroughputCalculator;
  v2 = -[ATThroughputCalculator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_suspended = 1;
    v4 = -[ATMovingAverage initWithWindow:]([ATMovingAverage alloc], "initWithWindow:", 5);
    average = v3->_average;
    v3->_average = v4;

  }
  return v3;
}

- (void)resume
{
  double Current;
  void *v5;

  if (!self->_suspended)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATThroughputCalculator.m"), 32, CFSTR("calculator is not suspended"));

  }
  Current = CFAbsoluteTimeGetCurrent();
  self->_lastUpdate = Current;
  self->_startTime = Current;
  self->_currentValue = 0.0;
  self->_suspended = 0;
}

- (void)suspend
{
  void *v4;

  if (self->_suspended)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATThroughputCalculator.m"), 41, CFSTR("calculator is suspended"));

  }
  self->_suspended = 1;
}

- (BOOL)update:(double)a3
{
  CFAbsoluteTime Current;
  double v6;
  double v7;
  void *v10;

  if (self->_suspended)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATThroughputCalculator.m"), 47, CFSTR("calculator is suspended"));

  }
  Current = CFAbsoluteTimeGetCurrent();
  v6 = Current - self->_lastUpdate;
  v7 = self->_currentValue + a3;
  self->_currentValue = v7;
  if (v6 >= 1.0)
  {
    -[ATMovingAverage update:](self->_average, "update:", v7 / v6);
    self->_lastUpdate = Current;
    self->_currentValue = 0.0;
  }
  return v6 >= 1.0;
}

- (double)throughput
{
  double result;

  if (CFAbsoluteTimeGetCurrent() - self->_startTime < 5.0)
    return -1.0;
  -[ATMovingAverage average](self->_average, "average");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_average, 0);
}

@end
