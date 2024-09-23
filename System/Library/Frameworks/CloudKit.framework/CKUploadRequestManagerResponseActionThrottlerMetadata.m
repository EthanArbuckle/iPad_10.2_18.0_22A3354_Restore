@implementation CKUploadRequestManagerResponseActionThrottlerMetadata

- (double)lastRunTime
{
  return self->_lastRunTime;
}

- (void)setLastRunTime:(double)a3
{
  self->_lastRunTime = a3;
}

- (int64_t)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(int64_t)a3
{
  self->_repeatCount = a3;
}

- (unint64_t)totalThrottleCount
{
  return self->_totalThrottleCount;
}

- (void)setTotalThrottleCount:(unint64_t)a3
{
  self->_totalThrottleCount = a3;
}

@end
