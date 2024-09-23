@implementation EKOfficeHour

- (EKOfficeHour)initWithEnabled:(BOOL)a3 weekday:(int64_t)a4 startTime:(id)a5 endTime:(id)a6 timeZone:(id)a7
{
  id v13;
  id v14;
  id v15;
  EKOfficeHour *v16;
  EKOfficeHour *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)EKOfficeHour;
  v16 = -[EKOfficeHour init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_enabled = a3;
    v16->_weekday = a4;
    objc_storeStrong((id *)&v16->_startTime, a5);
    objc_storeStrong((id *)&v17->_endTime, a6);
    objc_storeStrong((id *)&v17->_timeZone, a7);
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[EKOfficeHour initWithEnabled:weekday:startTime:endTime:timeZone:]([EKOfficeHour alloc], "initWithEnabled:weekday:startTime:endTime:timeZone:", self->_enabled, self->_weekday, self->_startTime, self->_endTime, self->_timeZone);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)weekday
{
  return self->_weekday;
}

- (void)setWeekday:(int64_t)a3
{
  self->_weekday = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
