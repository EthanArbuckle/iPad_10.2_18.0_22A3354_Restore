@implementation DNDSMutableHeartbeatMetricsRecord

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

- (void)setManuallyEnabled:(BOOL)a3
{
  self->super._manuallyEnabled = a3;
}

- (void)setNumberOfSessions:(id)a3
{
  NSNumber *v4;
  NSNumber *numberOfSessions;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  numberOfSessions = self->super._numberOfSessions;
  self->super._numberOfSessions = v4;

}

- (void)setNumberOfManualSessions:(id)a3
{
  NSNumber *v4;
  NSNumber *numberOfManualSessions;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  numberOfManualSessions = self->super._numberOfManualSessions;
  self->super._numberOfManualSessions = v4;

}

- (void)setEnabledFromControlCenterPhone:(BOOL)a3
{
  self->super._enabledFromControlCenterPhone = a3;
}

- (void)setEnabledFromControlCenterWatch:(BOOL)a3
{
  self->super._enabledFromControlCenterWatch = a3;
}

- (void)setEnabledForOneHour:(BOOL)a3
{
  self->super._enabledForOneHour = a3;
}

- (void)setEnabledUntilEvening:(BOOL)a3
{
  self->super._enabledUntilEvening = a3;
}

- (void)setEnabledUntilMorning:(BOOL)a3
{
  self->super._enabledUntilMorning = a3;
}

- (void)setEnabledAtLocation:(BOOL)a3
{
  self->super._enabledAtLocation = a3;
}

- (void)setEnabledDuringEvent:(BOOL)a3
{
  self->super._enabledDuringEvent = a3;
}

- (void)setEnabledDrivingMode:(BOOL)a3
{
  self->super._enabledDrivingMode = a3;
}

- (void)setEnabledSleepMode:(BOOL)a3
{
  self->super._enabledSleepMode = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSHeartbeatMetricsRecord _initWithRecord:]([DNDSHeartbeatMetricsRecord alloc], "_initWithRecord:", self);
}

@end
