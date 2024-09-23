@implementation DNDSMutableDailyHeartbeatMetricsRecord

- (void)setEnabled:(BOOL)a3
{
  self->super.super._enabled = a3;
}

- (void)setManuallyEnabled:(BOOL)a3
{
  self->super.super._manuallyEnabled = a3;
}

- (void)setNumberOfSessions:(id)a3
{
  NSNumber *v4;
  NSNumber *numberOfSessions;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  numberOfSessions = self->super.super._numberOfSessions;
  self->super.super._numberOfSessions = v4;

}

- (void)setNumberOfManualSessions:(id)a3
{
  NSNumber *v4;
  NSNumber *numberOfManualSessions;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  numberOfManualSessions = self->super.super._numberOfManualSessions;
  self->super.super._numberOfManualSessions = v4;

}

- (void)setEnabledFromControlCenterPhone:(BOOL)a3
{
  self->super.super._enabledFromControlCenterPhone = a3;
}

- (void)setEnabledFromControlCenterWatch:(BOOL)a3
{
  self->super.super._enabledFromControlCenterWatch = a3;
}

- (void)setEnabledForOneHour:(BOOL)a3
{
  self->super.super._enabledForOneHour = a3;
}

- (void)setEnabledUntilEvening:(BOOL)a3
{
  self->super.super._enabledUntilEvening = a3;
}

- (void)setEnabledUntilMorning:(BOOL)a3
{
  self->super.super._enabledUntilMorning = a3;
}

- (void)setEnabledAtLocation:(BOOL)a3
{
  self->super.super._enabledAtLocation = a3;
}

- (void)setEnabledDuringEvent:(BOOL)a3
{
  self->super.super._enabledDuringEvent = a3;
}

- (void)setEnabledDrivingMode:(BOOL)a3
{
  self->super.super._enabledDrivingMode = a3;
}

- (void)setEnabledSleepMode:(BOOL)a3
{
  self->super.super._enabledSleepMode = a3;
}

- (void)setDayOfWeek:(id)a3
{
  NSNumber *v4;
  NSNumber *dayOfWeek;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  dayOfWeek = self->super._dayOfWeek;
  self->super._dayOfWeek = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSDailyHeartbeatMetricsRecord _initWithRecord:]([DNDSDailyHeartbeatMetricsRecord alloc], "_initWithRecord:", self);
}

@end
