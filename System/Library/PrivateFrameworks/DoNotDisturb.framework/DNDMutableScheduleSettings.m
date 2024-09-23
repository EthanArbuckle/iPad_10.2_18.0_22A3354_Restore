@implementation DNDMutableScheduleSettings

- (void)setScheduleEnabledSetting:(unint64_t)a3
{
  self->super._scheduleEnabledSetting = a3;
}

- (void)setTimePeriod:(id)a3
{
  DNDScheduleTimePeriod *v4;
  DNDScheduleTimePeriod *timePeriod;

  if (a3)
    v4 = (DNDScheduleTimePeriod *)objc_msgSend(a3, "copy");
  else
    v4 = objc_alloc_init(DNDScheduleTimePeriod);
  timePeriod = self->super._timePeriod;
  self->super._timePeriod = v4;

}

- (void)setBedtimeBehaviorEnabledSetting:(unint64_t)a3
{
  self->super._bedtimeBehaviorEnabledSetting = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDScheduleSettings _initWithSettings:]([DNDScheduleSettings alloc], "_initWithSettings:", self);
}

@end
