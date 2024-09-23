@implementation MPCAudioFailure

- (MPCAudioFailure)initWithType:(int64_t)a3 startTime:(double)a4 duration:(double)a5
{
  MPCAudioFailure *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPCAudioFailure;
  result = -[MPCAudioFailure init](&v9, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_startTime = a4;
    result->_duration = a5;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

+ (id)singleSampleFailure:(double)a3 duration:(double)a4
{
  return -[MPCAudioFailure initWithType:startTime:duration:]([MPCAudioFailure alloc], "initWithType:startTime:duration:", 0, a3, a4);
}

+ (id)multiSamplesFailure:(double)a3 duration:(double)a4
{
  return -[MPCAudioFailure initWithType:startTime:duration:]([MPCAudioFailure alloc], "initWithType:startTime:duration:", 1, a3, a4);
}

@end
