@implementation BCSExecutionTimer

- (BCSExecutionTimer)init
{
  BCSExecutionTimer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCSExecutionTimer;
  v2 = -[BCSExecutionTimer init](&v4, sel_init);
  if (v2)
    v2->_startTime = mach_absolute_time();
  return v2;
}

+ (unint64_t)timeExecutionOfBlock:(id)a3
{
  void (**v3)(_QWORD);
  BCSExecutionTimer *v4;
  unint64_t v5;

  v3 = (void (**)(_QWORD))a3;
  v4 = objc_alloc_init(BCSExecutionTimer);
  v3[2](v3);

  v5 = -[BCSExecutionTimer nanoseconds](v4, "nanoseconds");
  return v5;
}

- (unint64_t)nanoseconds
{
  uint64_t v3;
  uint64_t v4;
  mach_timebase_info info;

  v3 = mach_absolute_time();
  v4 = v3 - -[BCSExecutionTimer startTime](self, "startTime");
  info = 0;
  mach_timebase_info(&info);
  return v4 * info.numer / info.denom;
}

- (unint64_t)milliseconds
{
  return -[BCSExecutionTimer nanoseconds](self, "nanoseconds") / 0xF4240;
}

- (unint64_t)seconds
{
  return -[BCSExecutionTimer nanoseconds](self, "nanoseconds") / 0x3B9ACA00;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

@end
