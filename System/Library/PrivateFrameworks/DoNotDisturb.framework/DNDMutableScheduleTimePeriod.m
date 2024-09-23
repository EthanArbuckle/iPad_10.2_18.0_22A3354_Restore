@implementation DNDMutableScheduleTimePeriod

- (void)setStartTime:(id)a3
{
  DNDScheduleTime *v4;
  DNDScheduleTime *startTime;

  if (a3)
  {
    v4 = (DNDScheduleTime *)objc_msgSend(a3, "copy");
  }
  else
  {
    +[DNDScheduleTime defaultStartTime](DNDScheduleTime, "defaultStartTime");
    v4 = (DNDScheduleTime *)objc_claimAutoreleasedReturnValue();
  }
  startTime = self->super._startTime;
  self->super._startTime = v4;

}

- (void)setEndTime:(id)a3
{
  DNDScheduleTime *v4;
  DNDScheduleTime *endTime;

  if (a3)
  {
    v4 = (DNDScheduleTime *)objc_msgSend(a3, "copy");
  }
  else
  {
    +[DNDScheduleTime defaultEndTime](DNDScheduleTime, "defaultEndTime");
    v4 = (DNDScheduleTime *)objc_claimAutoreleasedReturnValue();
  }
  endTime = self->super._endTime;
  self->super._endTime = v4;

}

- (void)setWeekdays:(unint64_t)a3
{
  self->super._weekdays = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDScheduleTimePeriod _initWithPeriod:]([DNDScheduleTimePeriod alloc], "_initWithPeriod:", self);
}

@end
