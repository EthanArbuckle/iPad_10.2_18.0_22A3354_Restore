@implementation DNDSMutableMetricsRecord

- (void)setMetricsByDay:(id)a3
{
  NSDictionary *v4;
  NSDictionary *metricsByDay;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  metricsByDay = self->super._metricsByDay;
  self->super._metricsByDay = v4;

}

- (void)setLastDailyHeartbeat:(id)a3
{
  NSDate *v4;
  NSDate *lastDailyHeartbeat;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  lastDailyHeartbeat = self->super._lastDailyHeartbeat;
  self->super._lastDailyHeartbeat = v4;

}

- (void)setMetricsByWeek:(id)a3
{
  NSDictionary *v4;
  NSDictionary *metricsByWeek;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  metricsByWeek = self->super._metricsByWeek;
  self->super._metricsByWeek = v4;

}

- (void)setLastWeeklyHeartbeat:(id)a3
{
  NSDate *v4;
  NSDate *lastWeeklyHeartbeat;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  lastWeeklyHeartbeat = self->super._lastWeeklyHeartbeat;
  self->super._lastWeeklyHeartbeat = v4;

}

- (void)setMetricsByMonth:(id)a3
{
  NSDictionary *v4;
  NSDictionary *metricsByMonth;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  metricsByMonth = self->super._metricsByMonth;
  self->super._metricsByMonth = v4;

}

- (void)setLastMonthlyHeartbeat:(id)a3
{
  NSDate *v4;
  NSDate *lastMonthlyHeartbeat;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  lastMonthlyHeartbeat = self->super._lastMonthlyHeartbeat;
  self->super._lastMonthlyHeartbeat = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSMetricsRecord _initWithRecord:]([DNDSMetricsRecord alloc], "_initWithRecord:", self);
}

@end
