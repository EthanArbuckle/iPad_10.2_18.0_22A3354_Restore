@implementation HKHRJulianDayTimeZoneState

- (HKHRJulianDayTimeZoneState)init
{
  HKHRJulianDayTimeZoneState *v2;
  HKHRJulianDayTimeZoneState *v3;
  uint64_t v4;
  NSDate *lastSampleDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKHRJulianDayTimeZoneState;
  v2 = -[HKHRJulianDayTimeZoneState init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_count = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = objc_claimAutoreleasedReturnValue();
    lastSampleDate = v3->_lastSampleDate;
    v3->_lastSampleDate = (NSDate *)v4;

  }
  return v3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSDate)lastSampleDate
{
  return self->_lastSampleDate;
}

- (void)setLastSampleDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSampleDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSampleDate, 0);
}

@end
