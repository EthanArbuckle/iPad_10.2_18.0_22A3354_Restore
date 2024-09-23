@implementation MAStatisticsElapsedTime

- (MAStatisticsElapsedTime)init
{
  MAStatisticsElapsedTime *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MAStatisticsElapsedTime;
  result = -[MAStatisticsElapsedTime init](&v3, sel_init);
  if (result)
  {
    result->_lastEndTransactionTime = 0.0;
    *(_OWORD *)&result->_elapsedCounter = 0u;
    *(_OWORD *)&result->_elapsedTime = 0u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MAStatisticsElapsedTime;
  -[MAStatisticsElapsedTime dealloc](&v2, sel_dealloc);
}

- (void)begin
{
  MAStatisticsElapsedTime *v2;
  int64_t elapsedCounter;
  CFAbsoluteTime Current;
  MAStatisticsElapsedTime *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  elapsedCounter = obj->_elapsedCounter;
  if (!elapsedCounter)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v2 = obj;
    obj->_lastBeginTransactionTime = Current;
    obj->_elapsedStart = Current;
    elapsedCounter = obj->_elapsedCounter;
  }
  v2->_elapsedCounter = elapsedCounter + 1;
  objc_sync_exit(v2);

}

- (void)end
{
  MAStatisticsElapsedTime *v2;
  uint64_t v3;
  CFAbsoluteTime Current;
  MAStatisticsElapsedTime *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  v3 = obj->_elapsedCounter - 1;
  obj->_elapsedCounter = v3;
  if (!v3)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v2 = obj;
    obj->_lastEndTransactionTime = Current;
    obj->_elapsedTime = obj->_elapsedTime + Current - obj->_elapsedStart;
    obj->_elapsedStart = 0.0;
  }
  objc_sync_exit(v2);

}

- (double)elapsedTime
{
  MAStatisticsElapsedTime *v2;
  double elapsedTime;

  v2 = self;
  objc_sync_enter(v2);
  elapsedTime = v2->_elapsedTime;
  if (v2->_elapsedCounter >= 1)
    elapsedTime = elapsedTime + CFAbsoluteTimeGetCurrent() - v2->_elapsedStart;
  objc_sync_exit(v2);

  return elapsedTime;
}

- (double)elapsedTimeSinceLastBeginTransaction
{
  MAStatisticsElapsedTime *v2;
  double v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = 0.0;
  if (v2->_lastBeginTransactionTime != 0.0)
    v3 = CFAbsoluteTimeGetCurrent() - v2->_lastBeginTransactionTime;
  objc_sync_exit(v2);

  return v3;
}

- (double)elapsedTimeSinceLastEndTransaction
{
  MAStatisticsElapsedTime *v2;
  double v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = 0.0;
  if (v2->_lastEndTransactionTime != 0.0)
    v3 = CFAbsoluteTimeGetCurrent() - v2->_lastEndTransactionTime;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTransactionPending
{
  MAStatisticsElapsedTime *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_elapsedCounter > 0;
  objc_sync_exit(v2);

  return v3;
}

@end
