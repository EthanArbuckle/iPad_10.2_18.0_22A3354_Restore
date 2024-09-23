@implementation DNDSMutableBehaviorSettingsRecord

- (void)setInterruptionBehaviorSetting:(id)a3
{
  NSNumber *v4;
  NSNumber *interruptionBehaviorSetting;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  interruptionBehaviorSetting = self->super._interruptionBehaviorSetting;
  self->super._interruptionBehaviorSetting = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSBehaviorSettingsRecord _initWithRecord:]([DNDSBehaviorSettingsRecord alloc], "_initWithRecord:", self);
}

@end
