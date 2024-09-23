@implementation MKProgress

- (void)addTotalOperationCount:(unint64_t)a3
{
  self->_totalOperationCount += a3;
}

- (void)addCompletedOerationCount:(unint64_t)a3
{
  unint64_t completedOperationCount;
  double v6;

  completedOperationCount = self->_completedOperationCount;
  if (!completedOperationCount)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_startTime = v6;
    completedOperationCount = self->_completedOperationCount;
  }
  self->_completedOperationCount = completedOperationCount + a3;
}

- (unint64_t)completedOperationCount
{
  return self->_completedOperationCount;
}

- (unint64_t)totalOperationCount
{
  return self->_totalOperationCount;
}

- (float)progress:(unint64_t *)a3
{
  unint64_t totalOperationCount;
  unint64_t completedOperationCount;
  double v7;
  unint64_t v8;

  totalOperationCount = self->_totalOperationCount;
  completedOperationCount = self->_completedOperationCount;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  if (a3)
  {
    v8 = 60
       * vcvtad_u64_f64((double)(totalOperationCount - completedOperationCount)/ ((double)self->_completedOperationCount/ (v7 - self->_startTime))/ 60.0);
    if (v8 <= 0x3C)
      v8 = 60;
    *a3 = v8;
  }
  return fmin((double)completedOperationCount / (double)totalOperationCount, 1.0);
}

@end
