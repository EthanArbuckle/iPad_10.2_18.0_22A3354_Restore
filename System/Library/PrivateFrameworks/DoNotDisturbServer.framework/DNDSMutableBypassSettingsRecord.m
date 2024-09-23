@implementation DNDSMutableBypassSettingsRecord

- (void)setImmediateBypassEventSourceType:(id)a3
{
  NSNumber *v4;
  NSNumber *immediateBypassEventSourceType;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  immediateBypassEventSourceType = self->super._immediateBypassEventSourceType;
  self->super._immediateBypassEventSourceType = v4;

}

- (void)setImmediateBypassCNGroupIdentifier:(id)a3
{
  NSString *v4;
  NSString *immediateBypassCNGroupIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  immediateBypassCNGroupIdentifier = self->super._immediateBypassCNGroupIdentifier;
  self->super._immediateBypassCNGroupIdentifier = v4;

}

- (void)setRepeatEventSourceBehaviorEnabledSetting:(id)a3
{
  NSNumber *v4;
  NSNumber *repeatEventSourceBehaviorEnabledSetting;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  repeatEventSourceBehaviorEnabledSetting = self->super._repeatEventSourceBehaviorEnabledSetting;
  self->super._repeatEventSourceBehaviorEnabledSetting = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSBypassSettingsRecord _initWithRecord:]([DNDSBypassSettingsRecord alloc], "_initWithRecord:", self);
}

@end
