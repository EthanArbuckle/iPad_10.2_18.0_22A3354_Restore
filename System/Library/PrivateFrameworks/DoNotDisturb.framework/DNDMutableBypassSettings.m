@implementation DNDMutableBypassSettings

- (void)setImmediateBypassEventSourceType:(unint64_t)a3
{
  self->super._immediateBypassEventSourceType = a3;
}

- (void)setImmediateBypassCNGroupIdentifier:(id)a3
{
  NSString *v4;
  NSString *immediateBypassCNGroupIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  immediateBypassCNGroupIdentifier = self->super._immediateBypassCNGroupIdentifier;
  self->super._immediateBypassCNGroupIdentifier = v4;

}

- (void)setRepeatEventSourceBehaviorEnabledSetting:(unint64_t)a3
{
  self->super._repeatEventSourceBehaviorEnabledSetting = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDBypassSettings _initWithSettings:]([DNDBypassSettings alloc], "_initWithSettings:", self);
}

@end
