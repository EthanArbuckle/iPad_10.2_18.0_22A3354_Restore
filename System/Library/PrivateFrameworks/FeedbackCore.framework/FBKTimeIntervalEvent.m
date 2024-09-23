@implementation FBKTimeIntervalEvent

- (FBKTimeIntervalEvent)initWithType:(unint64_t)a3
{
  FBKTimeIntervalEvent *v4;
  FBKTimeIntervalEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBKTimeIntervalEvent;
  v4 = -[FBKTimeIntervalEvent init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    v4->_startTimeInterval = CACurrentMediaTime();
  }
  return v5;
}

- (id)description
{
  unint64_t v2;

  v2 = -[FBKTimeIntervalEvent eventType](self, "eventType");
  if (v2 - 1 > 9)
    return CFSTR("Unknown");
  else
    return off_24E15AE28[v2 - 1];
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (double)startTimeInterval
{
  return self->_startTimeInterval;
}

- (void)setStartTimeInterval:(double)a3
{
  self->_startTimeInterval = a3;
}

- (double)endTimeInterval
{
  return self->_endTimeInterval;
}

- (void)setEndTimeInterval:(double)a3
{
  self->_endTimeInterval = a3;
}

@end
