@implementation DNDSMutableSettingsRecord

- (void)setBehaviorSettings:(id)a3
{
  DNDSBehaviorSettingsRecord *v4;
  DNDSBehaviorSettingsRecord *behaviorSettings;

  v4 = (DNDSBehaviorSettingsRecord *)objc_msgSend(a3, "copy");
  behaviorSettings = self->super._behaviorSettings;
  self->super._behaviorSettings = v4;

}

- (void)setPhoneCallBypassSettings:(id)a3
{
  DNDSBypassSettingsRecord *v4;
  DNDSBypassSettingsRecord *phoneCallBypassSettings;

  v4 = (DNDSBypassSettingsRecord *)objc_msgSend(a3, "copy");
  phoneCallBypassSettings = self->super._phoneCallBypassSettings;
  self->super._phoneCallBypassSettings = v4;

}

- (void)setScheduleSettings:(id)a3
{
  DNDSScheduleSettingsRecord *v4;
  DNDSScheduleSettingsRecord *scheduleSettings;

  v4 = (DNDSScheduleSettingsRecord *)objc_msgSend(a3, "copy");
  scheduleSettings = self->super._scheduleSettings;
  self->super._scheduleSettings = v4;

}

- (void)setConfigurations:(id)a3
{
  DNDSConfigurationsRecord *v4;
  DNDSConfigurationsRecord *configurations;

  v4 = (DNDSConfigurationsRecord *)objc_msgSend(a3, "copy");
  configurations = self->super._configurations;
  self->super._configurations = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSSettingsRecord _initWithRecord:]([DNDSSettingsRecord alloc], "_initWithRecord:", self);
}

@end
