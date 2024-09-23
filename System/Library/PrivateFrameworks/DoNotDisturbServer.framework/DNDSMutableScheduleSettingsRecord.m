@implementation DNDSMutableScheduleSettingsRecord

- (void)setLastUpdatedTimestamp:(id)a3
{
  NSNumber *v4;
  NSNumber *lastUpdatedTimestamp;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  lastUpdatedTimestamp = self->super._lastUpdatedTimestamp;
  self->super._lastUpdatedTimestamp = v4;

}

- (void)setScheduleEnabledSetting:(id)a3
{
  NSNumber *v4;
  NSNumber *scheduleEnabledSetting;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  scheduleEnabledSetting = self->super._scheduleEnabledSetting;
  self->super._scheduleEnabledSetting = v4;

}

- (void)setTimePeriodStartTimeHour:(id)a3
{
  NSNumber *v4;
  NSNumber *timePeriodStartTimeHour;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  timePeriodStartTimeHour = self->super._timePeriodStartTimeHour;
  self->super._timePeriodStartTimeHour = v4;

}

- (void)setTimePeriodStartTimeMinute:(id)a3
{
  NSNumber *v4;
  NSNumber *timePeriodStartTimeMinute;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  timePeriodStartTimeMinute = self->super._timePeriodStartTimeMinute;
  self->super._timePeriodStartTimeMinute = v4;

}

- (void)setTimePeriodEndTimeHour:(id)a3
{
  NSNumber *v4;
  NSNumber *timePeriodEndTimeHour;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  timePeriodEndTimeHour = self->super._timePeriodEndTimeHour;
  self->super._timePeriodEndTimeHour = v4;

}

- (void)setTimePeriodEndTimeMinute:(id)a3
{
  NSNumber *v4;
  NSNumber *timePeriodEndTimeMinute;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  timePeriodEndTimeMinute = self->super._timePeriodEndTimeMinute;
  self->super._timePeriodEndTimeMinute = v4;

}

- (void)setTimePeriodWeekdays:(id)a3
{
  NSNumber *v4;
  NSNumber *timePeriodWeekdays;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  timePeriodWeekdays = self->super._timePeriodWeekdays;
  self->super._timePeriodWeekdays = v4;

}

- (void)setBedtimeBehaviorEnabledSetting:(id)a3
{
  NSNumber *v4;
  NSNumber *bedtimeBehaviorEnabledSetting;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  bedtimeBehaviorEnabledSetting = self->super._bedtimeBehaviorEnabledSetting;
  self->super._bedtimeBehaviorEnabledSetting = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSScheduleSettingsRecord _initWithRecord:]([DNDSScheduleSettingsRecord alloc], "_initWithRecord:", self);
}

@end
