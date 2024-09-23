@implementation LPKSignpostEvent

- (double)duration
{
  return self->_duration;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
  -[LPKSignpostEvent _calculateDurationIfNeeded](self, "_calculateDurationIfNeeded");
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
  -[LPKSignpostEvent _calculateDurationIfNeeded](self, "_calculateDurationIfNeeded");
}

- (void)_calculateDurationIfNeeded
{
  NSDate *endDate;
  double v4;

  if (self->_startDate)
  {
    endDate = self->_endDate;
    if (endDate)
    {
      -[NSDate timeIntervalSinceDate:](endDate, "timeIntervalSinceDate:");
      self->_duration = v4;
    }
  }
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
