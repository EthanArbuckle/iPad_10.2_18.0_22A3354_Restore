@implementation _IMTimingInstance

- (void)stopUsingTime:(double)a3
{
  double v3;

  if (self->_isRunning)
  {
    v3 = self->_totalTime + a3 - self->_startTiming;
    self->_stopTiming = a3;
    self->_totalTime = v3;
  }
  self->_isRunning = 0;
}

- (void)startUsingTime:(double)a3
{
  self->_startTiming = a3;
  self->_stopTiming = a3;
  self->_isRunning = 1;
}

- (_IMTimingInstance)init
{
  _IMTimingInstance *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_IMTimingInstance;
  result = -[_IMTimingInstance init](&v3, sel_init);
  if (result)
  {
    result->_startTiming = 0.0;
    result->_stopTiming = 0.0;
    result->_isRunning = 0;
    result->_totalTime = 0.0;
  }
  return result;
}

+ (id)createTimingInstanceWithStartTime:(float)a3
{
  _IMTimingInstance *v4;

  v4 = objc_alloc_init(_IMTimingInstance);
  if (v4)
  {
    v4->_startTiming = a3;
    v4->_stopTiming = a3;
    v4->_totalTime = 0.0;
    v4->_isRunning = 0;
  }
  return v4;
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%f (%f)"), v2, self->_stopTiming - self->_startTiming, *(_QWORD *)&self->_totalTime);
}

- (double)totalTime
{
  return self->_totalTime;
}

- (void)setTotalTime:(double)a3
{
  self->_totalTime = a3;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

@end
