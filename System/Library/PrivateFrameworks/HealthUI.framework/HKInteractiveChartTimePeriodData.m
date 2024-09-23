@implementation HKInteractiveChartTimePeriodData

- (double)timePeriod
{
  return self->_timePeriod;
}

- (void)setTimePeriod:(double)a3
{
  self->_timePeriod = a3;
}

- (NSString)timePeriodPrefix
{
  return self->_timePeriodPrefix;
}

- (void)setTimePeriodPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_timePeriodPrefix, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsInterval, a3);
}

- (int64_t)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(int64_t)a3
{
  self->_recordCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timePeriodPrefix, 0);
}

@end
